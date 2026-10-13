# 40 — Payment Proof Signed Route (2026-10-14)

Konteks: utang P2 security dari audit 31 — `public/uploads/payments/*` ke-serve Next.js static **tanpa auth**. Siapapun dengan URL bisa lihat bukti transfer (PII: nama rekening, nominal, bank).

## Masalah ganda yang ditemukan

1. **No auth**: static file serve bypass semua middleware — URL bocor = data bocor.
2. **Data loss tiap rebuild**: `public/uploads/` di-COPY ke image; `docker compose build` baru = proofs baru hilang. DB punya 5+ `payment_proof_url` yatim (file fisik sudah lenyap) karena ini.

## Solusi (merge `0b2f7c1`, commit `52171c4`)

- **Upload POST** (`/api/uploads/proof`): simpan ke `./uploads/payments` (di luar `public/`). `UPLOAD_DIR` env override.
- **GET signed**: app route `/uploads/payments/[filename]` — path identik dengan URL lama di DB → **zero DB migration, zero reader changes** (admin bookings page, profile page langsung protected).
  - Auth salah satu role: customer / owner / admin (3 cookie dicek)
  - Ownership: customer → `booking.userId === session.userId`; owner → booking di venue miliknya; admin/super_admin → bebas. Guest booking (userId null) → 403.
  - Anti path-traversal: whitelist regex `^[a-z0-9-]+\.(jpg|jpeg|png|webp|gif|pdf)$`
  - Headers: `Cache-Control: private, max-age=3600`, `nosniff`, `Content-Disposition: inline`
- **docker-compose**: volume `uploads_data` → `/app/uploads` — proof persist antar rebuild.
- `public/uploads/` dihapus (3 file lama dimigrasi: `docker cp` + `cp` ke volume).

## Verifikasi live

| Check | Hasil |
|---|---|
| GET proof tanpa cookie | **401** ✅ (sebelumnya 200 gambar) |
| GET `..%2F..%2Fserver.js` (traversal) | 404 ✅ |
| GET file tidak ada (dengan cookie kosong) | 401 ✅ |
| home/checkout/cari publik | 200 ✅ (tidak ada regresi) |
| Volume `uploads_data` | ke-populate 3 file lama ✅ |
| `npx tsc --noEmit` | clean |
| Deploy | systemd-run unit j, `EXIT_CODE=0` |

## Sisa / catatan

- Ownership lookup pakai `adapter.getBookings()` full-scan lalu find — ponytail: tambah `getBookingByProofUrl()` (`SELECT ... WHERE payment_proof_url LIKE '%'||$1`) kalau bookings >10K.
- File yatim (proof ada tapi booking tak ketemu) → 403 kecuali admin. Cleanup yatim = job terpisah.
- DB masih punya ~5 URL yatim pra-fix (file hilang oleh rebuild lama) — tidak bisa dipulihkan; customer upload ulang jika diminta.

---
Generated: 14 Okt 2026 02:00 WIB
