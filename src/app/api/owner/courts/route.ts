import { NextResponse } from "next/server";
import { cookies } from "next/headers";
import { verifyToken, OWNER_TOKEN_NAME } from "@/lib/auth/jwt";
import { getDatabaseAdapter } from "@/lib/adapters";

export async function GET() {
  try {
    const cookieStore = await cookies();
    const token = cookieStore.get(OWNER_TOKEN_NAME)?.value;
    if (!token) return NextResponse.json({ error: "Unauthorized" }, { status: 401 });

    const session = await verifyToken(token);
    if (!session || session.role !== "owner" || !session.ownerId) {
      return NextResponse.json({ error: "Unauthorized" }, { status: 401 });
    }

    const adapter = getDatabaseAdapter();

    // Get owner's venues
    const venues = await adapter.getVenuesByOwner(session.ownerId);
    const venueIds = new Set(venues.map(v => v.id));

    // Get all courts and filter by owner's venues
    const allCourts = await adapter.getAllCourts();
    const ownerCourts = allCourts.filter(c => venueIds.has(c.venueId));

    return NextResponse.json({ courts: ownerCourts });
  } catch (error) {
    console.error("Owner courts GET error:", error);
    return NextResponse.json({ error: "Gagal memuat data lapangan" }, { status: 500 });
  }
}

export async function PATCH(request: Request) {
  try {
    const cookieStore = await cookies();
    const token = cookieStore.get(OWNER_TOKEN_NAME)?.value;
    if (!token) return NextResponse.json({ error: "Unauthorized" }, { status: 401 });

    const session = await verifyToken(token);
    if (!session || session.role !== "owner" || !session.ownerId) {
      return NextResponse.json({ error: "Unauthorized" }, { status: 401 });
    }

    const body = await request.json();
    const { courtId, isActive } = body;

    if (!courtId || typeof isActive !== "boolean") {
      return NextResponse.json({ error: "Data tidak valid" }, { status: 400 });
    }

    const adapter = getDatabaseAdapter();

    // Verify court belongs to owner
    const venues = await adapter.getVenuesByOwner(session.ownerId);
    const venueIds = new Set(venues.map(v => v.id));

    const allCourts = await adapter.getAllCourts();
    const court = allCourts.find(c => c.id === courtId);

    if (!court || !venueIds.has(court.venueId)) {
      return NextResponse.json({ error: "Lapangan tidak ditemukan" }, { status: 404 });
    }

    // Update court
    const updatedCourt = await adapter.updateCourt(courtId, { isActive });

    return NextResponse.json({ court: updatedCourt });
  } catch (error) {
    console.error("Owner courts PATCH error:", error);
    return NextResponse.json({ error: "Gagal mengupdate lapangan" }, { status: 500 });
  }
}
