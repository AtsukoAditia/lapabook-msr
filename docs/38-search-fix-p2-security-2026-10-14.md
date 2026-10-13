# 38 — Fix /cari Semua Sport + P2 Security (2026-10-14)

## A. Root cause "cuma ada Bandung"

Laporan user: data daerah detail + banyak lapangan tapi yang tampil cuma Bandung.

Verifikasi DB: **7 kota** di `areas` (Bandung×2, Denpasar, Jakarta Selatan, Medan, Semarang, Surabaya, Yogyakarta), **3 venue aktif** (Bandung×2, Jakarta Selatan×1), **16 courts** lintas 6 sport.

Dua bug aplikasi:
1. `/cari/page.tsx` hardcode `redirect("/cari/futsal")` — futsal cuma ada di Bandung → venue Jakarta (`rahasian-badminton`) tidak pernah terlihat
2. API `GET /api/search/courts` **wajib** `sport` param; tanpa → `{"courts":[],"total":0}`

## B. Perbaikan (merge `51493f2`)

### API — `src/app/api/search/courts/route.ts`
- `sport` jadi **optional**: tanpa param list semua court aktif dari semua sport
- Inject `sportSlug` per court result (link `/cari/[sport]/[courtId]` butuh sport di path)

### Page — `src/app/cari/page.tsx`
- Ganti redirect → **listing semua lapangan** (client page): filter teks/olahraga/lokasi, pagination, kartu court (SportIcon + rating + lokasi), empty state

### Build fixes
1. `force-dynamic` — **tidak cukup**: Next tetap prerender client page ber-`useSearchParams` → build error "Error occurred prerendering page /cari" (`36574e4`)
2. Fix bener: wrap `<Suspense>` — extract konten ke `CariContent()`, default export wrap (`c8c5765`)

## C. P2 Security (merge `8ff9742`, commit `106c45c`)

| Temuan (audit 31) | Fix |
|---|---|
| **IDOR** `GET /api/payments/status/[bookingId]` — user login bisa cek status payment booking siapapun lewat ID | Customer hanya boleh miliknya: `!booking.userId \|\| booking.userId !== session.userId` → 403. Admin/super_admin bypass |
| Cookie customer maxAge **30 hari** vs JWT expiry **24h** (zombie session) | login + register `maxAge: 60*60*24` |
| Owner bookings `SELECT * FROM bookings` lalu filter in-memory | `getBookingsByVenueIds(venueIds)` → `WHERE venue_id = ANY($1)`; stub di mock + sheets adapter |

## D. Verifikasi live

- Origin: API tanpa param return semua courts — `rahasian-badminton` (Jakarta) hadir ✅
- Public: `/cari` 200, home 200, `/venue/venue-rahasian` 200, API publik mengandung `rahasian` ✅
- TSC clean tiap commit

**Deploy note:** build gagal sekali (`usr_merge` cache + prerender) sebelum Suspense fix; pola systemd-run stabil (unit f, `EXIT_CODE=0`).

## Backlog sisa P2
- `public/uploads/payments/` signed route (file proof masih public static)
- Rate-limit login endpoints
- `GET /api/search/courts/[courtId]` masih ada — overlap dengan listing; pertimbangkan konsolidasi

---
Generated: 14 Okt 2026 01:05 WIB
