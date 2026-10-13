import { NextResponse } from "next/server";
import { cookies } from "next/headers";
import { verifyToken, ADMIN_TOKEN_NAME } from "@/lib/auth/jwt";
import { getDatabaseAdapter } from "@/lib/adapters";
import { Pool } from "pg";

const globalForPg = globalThis as unknown as { __pgPoolAdminBookings?: Pool };
const pool = globalForPg.__pgPoolAdminBookings ?? new Pool({ connectionString: process.env.DATABASE_URL });
if (!globalForPg.__pgPoolAdminBookings) globalForPg.__pgPoolAdminBookings = pool;

export async function GET() {
  try {
    const cookieStore = await cookies();
    const token = cookieStore.get(ADMIN_TOKEN_NAME)?.value;
    if (!token) return NextResponse.json({ error: "Unauthorized" }, { status: 401 });
    const session = await verifyToken(token);
    if (!session || !["admin", "super_admin"].includes(session.role)) {
      return NextResponse.json({ error: "Forbidden" }, { status: 403 });
    }

    // ponytail: raw SQL — adapter getBookings() full-scan semua rows; skip sampai
    //           DatabaseAdapter expose `getBookingsPaged(filter, limit, offset)`.
    if (process.env.DATABASE_PROVIDER === "postgres") {
      const { rows } = await pool.query(
        `SELECT id, booking_code AS "bookingCode", customer_name AS "customerName",
                customer_phone AS "customerPhone", customer_email AS "customerEmail",
                venue_id AS "venueId", court_id AS "courtId", sport_id AS "sportId",
                booking_date AS "bookingDate", start_time AS "startTime", end_time AS "endTime",
                duration_minutes AS "durationMinutes", total_price AS "totalPrice",
                booking_status AS "bookingStatus", payment_status AS "paymentStatus",
                expires_at AS "expiresAt", payment_proof_url AS "paymentProofUrl",
                payment_submitted_at AS "paymentSubmittedAt", payment_verified_at AS "paymentVerifiedAt",
                payment_rejected_at AS "paymentRejectedAt", voucher_code AS "voucherCode",
                created_at AS "createdAt"
         FROM bookings ORDER BY created_at DESC LIMIT 500`);
      return NextResponse.json({ bookings: rows });
    }

    const adapter = getDatabaseAdapter();
    const bookings = await adapter.getBookings();
    return NextResponse.json({ bookings });
  } catch (error) {
    console.error("Error fetching bookings:", error);
    return NextResponse.json({ error: "Gagal mengambil data booking" }, { status: 500 });
  }
}
