import { NextRequest, NextResponse } from "next/server";
import { writeFile, mkdir } from "fs/promises";
import path from "path";
import { getClientIP, checkRateLimit, bookingLimiter } from "@/lib/security";
import { verifyToken, CUSTOMER_TOKEN_NAME } from "@/lib/auth/jwt";
import { cookies } from "next/headers";

const UPLOAD_DIR = path.join(process.cwd(), "public", "uploads", "payments");
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

    // Require customer auth for upload
    const cookieStore = await cookies();
    const token = cookieStore.get(CUSTOMER_TOKEN_NAME)?.value;
    const session = token ? await verifyToken(token) : null;
    if (!session) {
      return NextResponse.json({ error: "Unauthorized" }, { status: 401 });
    }

    const formData = await request.formData();
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
