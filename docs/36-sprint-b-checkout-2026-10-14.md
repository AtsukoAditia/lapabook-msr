# 36 — Sprint B: /checkout 1-Halaman (2026-10-14)

Konteks: lanjutan doc 34 (Sprint B). Form booking lama `/booking/form` diganti checkout 1-halaman.

## Hasil

### ✅ `/checkout` (NEW, client page)
- **Layout**: mobile — summary di atas, form penuh, sticky CTA bawah (total + Manual/Online); desktop — form kiri (col-span-3), summary sticky kanan (col-span-2).
- **Header slim** blue-900: back ke `/venue/[venueId]` + "Langkah terakhir — isi data & bayar."
- **Data diri**: nama* + phone (+62 prefix)* + email opsional + notes — guest checkout tanpa akun (API `createBooking` memang sudah support, `user_id` nullable di schema).
- **Dual CTA**: Bayar Manual (orange, langsung → `/booking/success`) dan Bayar Online (blue outline → create booking → `/api/payments/create` → Midtrans Snap embedded via `snapToken` state).
- **Pricing**: fetch `/api/pricing/calculate` — tampil base strikethrough, multipliers list (peak/weekend/demand), savings/surcharge.
- **Error state**: banner merah + tombol "Pilih Jam Lain" → back `/venue/[venueId]` saat 409 conflict.
- **Emoji purge**: semua diganti lucide (Trophy/Calendar/Clock/Hourglass/Banknote/CreditCard/ArrowLeft/Loader2/TriangleAlert). Token warna blue/orange per MASTER.
- **A11y**: htmlFor di semua field, aria-hidden icon, min-h-44px CTA mobile, cursor-pointer, autoComplete name/tel/email.
- **Fallback**: court fetch pakai `/api/courts` list + find by id (endpoint `/api/courts/[id]` belum ada — dicatat backlog).

### ✅ Redirect & caller updates
- `/booking/form` → shim 307 preserve query string → `/checkout`.
- `VenueBookingClient`, `SlotSelector` (continue bawaan), `profile/bookings/[id]` link → semua push ke `/checkout`.
- `/booking/success` + `/booking/invoice/[id]` tetap (dok 34 target: pindah Sprint C kalau perlu — tidak mengganggu funnel utama).

## Verifikasi
- `npx tsc --noEmit` clean.
- Host `npm run build` via systemd-run sempat stuck/OOM (next build + app container lama bareng di 7.4GB) → solusi: **stop `lapabook-app`, build image daemon-side via `docker compose build app` di systemd-run (survive restart, EXIT 0), lalu `docker compose up -d app`**.
- Origin: `/checkout` 200, `/booking/form` 307 → `/checkout`.
- Public: `lapabook.my.id/checkout` 200, `/booking/form` 307, home 200.

## Commits
- `7449865` feat(checkout): Sprint B — /checkout 1-halaman + legacy redirect
- `ce49b8e` merge ke main (pushed)
- Deploy: image `lapabook-msr-app:latest` rebuilt + container recreated.

## Skipped (dari rencana doc 34)
- **`booking_drafts` table + session token** — tidak dibangun. Alasan: query-string flow sudah stabil end-to-end (sticky bar → checkout → booking), dan guest flow tidak butuh session untuk konversi. ponytail: tambah draft persistence saat ada data drop-off reload-device atau user minta "lanjutkan booking" cross-device.
- **Merge akun post-booking** ("klaim poin dengan daftar") — belum; perlu desain merge-by-phone di loyalty service.

## Backlog terbuka (Sprint C + sisa P1/P2)
- Emoji sweep batch 2: `(public)/booking/recurring`, `cari/[sport]`, `cari/[sport]/[courtId]`, `BookingSteps` legacy (masih dipakai page recurring).
- Endpoint `GET /api/courts/[id]` (hindari list+find di client).
- Font Atkinson Hyperlegible (MASTER) atau tetap Inter + enforce 16px.
- Tailwind alias `accent-*` konsisten dengan `#EA580C` MASTER.
- P2 security: IDOR `/api/payments/status/[bookingId]`, `public/uploads/payments` signed route, cookie maxAge 30d→24h, owner bookings SQL filter.
- E2E tambahan: expiry countdown, 409 conflict, payment proof lifecycle, loyalty award.

---
Generated: 14 Okt 2026 00:30 WIB
