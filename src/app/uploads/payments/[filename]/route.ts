import { NextRequest, NextResponse } from "next/server";
import { cookies } from "next/headers";
import { readFile } from "fs/promises";
import path from "path";
import {
  verifyToken,
  CUSTOMER_TOKEN_NAME,
  ADMIN_TOKEN_NAME,
  OWNER_TOKEN_NAME,
} from "@/lib/auth/jwt";
import { getDatabaseAdapter } from "@/lib/adapters";

// Signed route: payment proof hanya bisa diakses pemilik booking / admin / owner venue-nya.
// URL di DB ("/uploads/payments/<file>") resolve ke route ini — same path, sekarang protected.
const UPLOAD_DIR = process.env.UPLOAD_DIR || path.join(process.cwd(), "uploads", "payments");

const MIME: Record<string, string> = {
  jpg: "image/jpeg",
  jpeg: "image/jpeg",
  png: "image/png",
  webp: "image/webp",
  gif: "image/gif",
  pdf: "application/pdf",
};

export async function GET(
  _request: NextRequest,
  { params }: { params: Promise<{ filename: string }> },
) {
  try {
    const { filename } = await params;

    // Anti path traversal: nama file hanya alnum + dash + ext
    if (!/^[a-z0-9-]+\.(jpg|jpeg|png|webp|gif|pdf)$/i.test(filename)) {
      return NextResponse.json({ error: "Not found" }, { status: 404 });
    }

    // Auth: coba semua token role
    const cookieStore = await cookies();
    const customerToken = cookieStore.get(CUSTOMER_TOKEN_NAME)?.value;
    const adminToken = cookieStore.get(ADMIN_TOKEN_NAME)?.value;
    const ownerToken = cookieStore.get(OWNER_TOKEN_NAME)?.value;

    const customer = customerToken ? await verifyToken(customerToken) : null;
    const admin = adminToken ? await verifyToken(adminToken) : null;
    const owner = ownerToken ? await verifyToken(ownerToken) : null;

    if (!customer && !admin && !owner) {
      return NextResponse.json({ error: "Unauthorized" }, { status: 401 });
    }

    // Admin/super_admin: full access
    const isAdmin =
      admin && (admin.role === "admin" || admin.role === "super_admin");

    if (!isAdmin) {
      // Cari booking yang punya proof ini
      const adapter = getDatabaseAdapter();
      const bookings = await adapter.getBookings();
      const booking = bookings.find(
        (b) => b.paymentProofUrl && b.paymentProofUrl.endsWith(`/${filename}`),
      );
      if (!booking) {
        // File yatim (proof ada, booking sudah terhapus/URL beda) → hanya admin
        return NextResponse.json({ error: "Forbidden" }, { status: 403 });
      }

      if (customer) {
        // Customer: hanya booking miliknya (guest booking tanpa userId → 403)
        if (!booking.userId || booking.userId !== customer.userId) {
          return NextResponse.json({ error: "Forbidden" }, { status: 403 });
        }
      } else if (owner && owner.ownerId) {
        // Owner: hanya booking di venue miliknya
        const venues = await adapter.getVenuesByOwner(owner.ownerId);
        if (!venues.some((v) => v.id === booking.venueId)) {
          return NextResponse.json({ error: "Forbidden" }, { status: 403 });
        }
      } else {
        return NextResponse.json({ error: "Forbidden" }, { status: 403 });
      }
    }

    const filepath = path.join(UPLOAD_DIR, filename);
    const buffer = await readFile(filepath);
    const ext = filename.split(".").pop()!.toLowerCase();

    return new NextResponse(new Uint8Array(buffer), {
      headers: {
        "Content-Type": MIME[ext] || "application/octet-stream",
        "Cache-Control": "private, max-age=3600",
        "X-Content-Type-Options": "nosniff",
        "Content-Disposition": `inline; filename="${filename}"`,
      },
    });
  } catch (error) {
    if ((error as NodeJS.ErrnoException).code === "ENOENT") {
      return NextResponse.json({ error: "Not found" }, { status: 404 });
    }
    console.error("Signed proof GET error:", error);
    return NextResponse.json({ error: "Server error" }, { status: 500 });
  }
}
