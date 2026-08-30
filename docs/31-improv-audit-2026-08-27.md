# 31 — Improv Audit 2026-08-27 (Multi-Agent)

## Ringkasan
Audit paralel 6 agent (Backend, Frontend, Security, Data, QA, UI) + implementasi quick wins minimal diff. Build + type-check lolos.

## Temuan Prioritas & Fix

### 1. Double-booking expiry race (Backend/Data) — FIXED
- `hasBookingConflict` tidak filter `waiting_payment` expired → hold basi blokir slot baru.
- Fix: `src/lib/services/availability-service.ts` — tambah `expiresAt > now` filter.
- Fix: `src/lib/services/booking-service.ts` — `expireBookings()` sebelum conflict check.
- Fix: `src/lib/adapters/google-sheets-adapter.ts` — samakan status `waiting_payment` + `expiresAt`, filter expired, tambah `waiting_verification` ke activeStatuses.
- Fix: `db/postgres/schema.sql` — index `bookings_expires_idx` untuk scan expiry.

### 2. Rate limiting disabled di non-prod (Security) — FIXED
- `checkRateLimit` bypass jika `NODE_ENV !== production` atau `VERCEL_ENV !== production` → preview/staging tanpa limit.
- Fix: `src/lib/security/rate-limiter.ts` — bypass hanya `IS_TESTING_ENV`.

### 3. Admin secret fallback bocor (Security) — FIXED
- `middleware.ts` fallback `5b08d37a8d376d3f97ec3972` + matcher `isHexSecret` melebar attack surface.
- Fix: `src/middleware.ts` — fail closed di production, hapus `isHexSecret`, rewrite pakai `effectiveSecret` exact match.

### 4. Loyalty duplicate award + race (Backend/Data) — FIXED
- `confirmBooking` bypass `LoyaltyService`, `addLoyaltyPoints` tanpa transaksi → lost update / double award.
- Fix: `src/lib/services/booking-service.ts` — pakai `LoyaltyService.awardBookingPoints`.
- Fix: `src/lib/adapters/postgres-adapter.ts` — `addLoyaltyPoints` pakai `BEGIN/COMMIT`, cek existing `earned` per booking, rollback on error.

### 5. Owner scoping pricing (Security) — FIXED
- `POST /api/owner/pricing` tidak verifikasi `courtId` milik owner.
- Fix: `src/app/api/owner/pricing/route.ts` — cek `getVenuesByOwner(ownerId)` + `getCourtById`, 403 jika bukan milik.

### 6. Payment proof upload (Security) — FIXED
- `POST /api/uploads/proof` tanpa auth, cek MIME client saja, ext dari `file.name`.
- Fix: `src/app/api/uploads/proof/route.ts` — require `customer_token`, validasi magic bytes (jpg/png/webp/gif/pdf), whitelist ext.
- Fix: `src/app/api/payments/proof/route.ts` — hapus fallback `bookingId`, wajib `bookingCode`.

### 7. Expiry lazy-only tanpa cron (Data) — FIXED
- `expireBookings` hanya di `GET /api/availability` & `GET /api/bookings/[code]` → hold basi jika tanpa traffic.
- Fix: `src/app/api/cron/expire-bookings/route.ts` — endpoint cron (Bearer `CRON_SECRET` optional), panggil `adapter.expireBookings()`.

### 8. SlotSelector a11y + touch target (Frontend/UI) — FIXED
- Date pills <44px, slot buttons tanpa `aria-pressed/disabled`, live indicator tanpa `aria-live`.
- Fix: `src/components/booking/SlotSelector.tsx` — `min-h-[44px]`, `snap-x`, `aria-pressed`, `aria-disabled`, `aria-label`, `aria-live="polite"`.

## Verifikasi
- `npm run type-check` — 0 errors
- `npm run lint` — warnings pre-existing saja
- `npm run build` — success (semua route ter-generate)

## Sisa Backlog (tidak di-fix di batch ini — tambah saat butuh)
- Owner `GET /api/owner/bookings` masih load-all + filter in-memory → ganti `getBookingsByOwner(ownerId)` dengan `WHERE venue.owner_id`.
- `GET /api/payments/status/[bookingId]` IDOR — butuh cek `booking.userId === session.userId` untuk customer.
- Cookie `maxAge` 30d vs JWT 24h mismatch → samakan `maxAge: 86400`.
- `public/uploads/payments` masih di `public` (enumerable) → pindah ke storage luar `public` + serve via signed route.
- QA: e2e belum cover expiry countdown, 409 conflict, payment proof lifecycle, loyalty award — tambah `e2e/*.api.spec.ts`.
- UI: emoji → `lucide-react`, Navbar dropdown keyboard, form `htmlFor`/`aria-invalid`, empty/loading `aria-busy`.

## Cara Test Manual
1. Booking slot → cek `expires_at` ~15 menit, slot terblokir.
2. Tunggu 15 menit atau `GET /api/cron/expire-bookings` → booking jadi `expired`, slot kembali tersedia.
3. Double-booking slot sama → 409.
4. Upload proof tanpa login → 401; upload file fake mime → 400.
5. Owner A coba `POST /api/owner/pricing` dengan `courtId` milik Owner B → 403.
