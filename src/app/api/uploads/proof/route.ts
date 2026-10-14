import { NextRequest, NextResponse } from "next/server";
import { writeFile, mkdir } from "fs/promises";
import path from "path";
import { getClientIP, checkRateLimit, bookingLimiter } from "@/lib/security";
import { verifyToken, CUSTOMER_TOKEN_NAME } from "@/lib/auth/jwt";
import { cookies } from "next/headers";
import { BookingService } from "@/lib/services/booking-service";
import { getDatabaseAdapter } from "@/lib/adapters";

// ponytail: di luar public/ (jangan ke-serve static tanpa auth) — served via /uploads/payments/[filename] signed route
const UPLOAD_DIR = process.env.UPLOAD_DIR || path.join(process.cwd(), "uploads", "payments");
const MAX_SIZE = 5 * 1024 * 1024; // 5MB
const ALLOWED = ["image/jpeg", "image/png", "image/webp", "image/gif", "application/pdf"];
const ALLOWED_EXT = new Set(["jpg", "jpeg", "png", "webp", "gif", "pdf"]);

function isValidMagic(buffer: Buffer, mime: string): boolean {
  const h = buffer.subarray(0, 4).toString("hex");
  if (mime === "image/jpeg") return h.startsWith("ffd8ff");
  if (mime === "image/png") return h.startsWith("89504e47");
  if (mime === "image/webp") return buffer.subarray(0, 4).toString() === "RIFF";
  if (mime === "image/gif") return buffer.subarray(0, 3).toString() === "GIF";
  if (mime === "application/pdf") return h.startsWith("25504446");
  return false;
}

export async function POST(request: NextRequest) {
  try {
    const ip = getClientIP(request);
    const rateLimited = await checkRateLimit(bookingLimiter, ip);
    if (rateLimited) {
      return NextResponse.json(
        { error: `Terlalu banyak request. Coba lagi dalam ${rateLimited.retryAfter} detik.` },
        { status: 429 },
      );
    }

    // Auth: customer session, ATAU guest dengan bookingCode+phone yang cocok
    // ponytail: guest tier pakai pola lookup /api/bookings/[id] — upload tanpa login
    //           dilarang; bug sebelumnya 401 untuk guest booking (checkout terlihat 500).
    const cookieStore = await cookies();
    const token = cookieStore.get(CUSTOMER_TOKEN_NAME)?.value;
    const session = token ? await verifyToken(token) : null;

    const formData = await request.formData();

    if (!session) {
      const bookingCode = String(formData.get("bookingCode") || "").slice(0, 20);
      const phone = String(formData.get("phone") || "").replace(/[^0-9+]/g, "").slice(0, 20);
      if (!bookingCode || !phone) {
        return NextResponse.json({ error: "Login diperlukan, atau sertakan kode booking + nomor telepon." }, { status: 401 });
      }
      const adapter = getDatabaseAdapter();
      const service = new BookingService(adapter);
      const booking = await service.getBookingByCode(bookingCode);
      if (!booking) {
        return NextResponse.json({ error: "Booking tidak ditemukan." }, { status: 404 });
      }
      const normalize = (p: string) => p.replace(/[^0-9]/g, "");
      const inputPhone = normalize(phone);
      const storedPhone = normalize(booking.customerPhone);
      const match =
        inputPhone === storedPhone ||
        inputPhone === "62" + storedPhone.replace(/^0/, "") ||
        "62" + inputPhone.replace(/^0/, "") === storedPhone;
      if (!match) {
        return NextResponse.json({ error: "Verifikasi nomor telepon gagal." }, { status: 403 });
      }
    }

    const file = formData.get("file") as File | null;

    if (!file) {
      return NextResponse.json({ error: "File diperlukan" }, { status: 400 });
    }

    if (file.size > MAX_SIZE) {
      return NextResponse.json({ error: "File maksimal 5MB" }, { status: 400 });
    }

    if (!ALLOWED.includes(file.type)) {
      return NextResponse.json(
        { error: "Format tidak didukung. Gunakan JPG, PNG, WebP, GIF, atau PDF" },
        { status: 400 },
      );
    }

    const buffer = Buffer.from(await file.arrayBuffer());
    if (!isValidMagic(buffer, file.type)) {
      return NextResponse.json({ error: "File tidak valid (magic bytes mismatch)" }, { status: 400 });
    }

    await mkdir(UPLOAD_DIR, { recursive: true });

    const rawExt = (file.name.split(".").pop() || "").toLowerCase();
    const ext = ALLOWED_EXT.has(rawExt) ? rawExt : file.type === "application/pdf" ? "pdf" : "jpg";
    const filename = `${Date.now()}-${Math.random().toString(36).slice(2, 8)}.${ext}`;
    const filepath = path.join(UPLOAD_DIR, filename);

    await writeFile(filepath, buffer);

    const url = `/uploads/payments/${filename}`;

    return NextResponse.json({ success: true, url, filename, size: file.size });
  } catch (error) {
    console.error("Upload error:", error);
    return NextResponse.json({ error: "Gagal upload file" }, { status: 500 });
  }
}
