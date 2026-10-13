# 35 — Sprint A: Venue Booking Page + Deploy lapabook.my.id (2026-10-13)

Konteks: Eksekusi rekomendasi doc 34 — merge wizard `/booking` ke venue detail page. Live di https://lapabook.my.id.

## Hasil

### ✅ Venue page baru
- **`/venue/[venueId]`** (server, dynamic route): header (nama, alamat, jam, telp, maps, rating, mulai-harga) + `VenueBookingClient` + SEO `generateMetadata`.
- **`VenueBookingClient`**: court switcher pills (tablist+aria-selected), court meta (surface/indoor/capacity chip via lucide), embed `SlotSelector` per court (reset on court switch), spacer biar sticky bar ga nutup konten.
- **`StickyCheckoutBar`**: fixed bottom z-40 — ringkas "court • N jam | tanggal • range • estimasi harga" + CTA orange "Lanjut Bayar" → `/booking/form?courtId&date&startTime&endTime&sport&venue&court&duration` (param identik wizard lama → form tidak diubah, aman).
- Contoh live: https://lapabook.my.id/venue/venue-greenfield

### ✅ SlotSelector upgrade (backwards-compatible)
- Prop baru opsional `onSelectionChange({ date, slots })` dan `hideContinue`. Wizard lama tetap pakai default (tombol continue bawaan + push ke form).
- Tombol continue emerald → **orange-600** + `cursor-pointer` (match MASTER).
- Estimasi harga dihitung parent (`court.basePrice × jumlah slot`) — TimeSlot API tidak kirim price, jadi estimasi konservatif (bisa deviasi peak/weekend; final price divalidasi server di form/checkout).

### ✅ Legacy wizard → redirect
- `/booking` → 301 ke `/cari`
- `/booking/[sport]` → 301 ke `/cari/[sport]`
- `/booking/[sport]/[venue]/[court]` → page jadi shim server: resolve `venueSlug` via adapter → `redirect("/venue/<venueId>?court=<courtSlug>")`
- `/booking/form`, `/booking/success`, `/booking/invoice/[id]`, `/booking/recurring` tetap jalan (deprecated — Sprint B ganti `/checkout` + draft API).

### ✅ Homepage fix
- Venue card di homepage: hardcode `/cari/futsal` → **`/venue/${v.id}`** beneran.

### ✅ Deploy
- Branch `feature/venue-page-sprint-a` → commit `2242459` → merge `8596c7f` → push ke origin/main, lalu `ea3d529` (chore docker: external volume + .dockerignore).
- Build verify: `npx tsc --noEmit` clean; `npm run build` success — route `/venue/[venueId]` ke-generate (ƒ dynamic).
- Docker rebuild via `systemd-run` transient unit `lapabook-rebuild.service` (survive gateway restart; percobaan `setsid+disown` mati 3x karena gateway restart di 2 CPU box — skill rule "detach-first" ternyata masih mati bareng gateway, systemd-run jadi solusi).
- Container `lapabook-app` recreate dengan image baru + old external volume `lapangin-msr_postgres_data` tetap.

## Public verification (23:52 WIB)

| Check | Result |
|-------|--------|
| `https://lapabook.my.id/` | 200, title "Lapabook — Booking Lapangan Olahraga" |
| `https://lapabook.my.id/venue/venue-greenfield` | 200, title venue bener |
| `https://lapabook.my.id/booking` | 307 → `/cari` |
| `https://lapabook.my.id/cari/futsal` | 200 |
| `https://lapabook.my.id/booking/futsal` | 307 → `/cari/futsal` |

## Insiden CF 522 (resolved by owner)

- ~23:40–23:52 public 522, origin langsung 200 via `--resolve ...:443:10.11.17.196`.
- tcpdump SYN di eth0: **CF tidak pernah kirim paket ke origin** saat hit lapabook (tapi kirim saat hit toeflyuk yang 200). Static domains OK, app-proxy domains (lapabook, akuundang) 522.
- Diagnosa sementara: A record DNS di CF dashboard untuk domain-domain app-proxy menunjuk IP publik lama `43.157.207.183` (retired per skill). Owner update manual → `lapabook.my.id` pulih 23:52.
- Yang masih 522: `akuundang.my.id` (app-proxy port 20130) — pola sama, fix oleh owner kapan nyaman.

## Skipped / next (Sprint B + C)
- `/checkout` 1-halaman + `booking_drafts` tabel + session token ganti query-string rapuh (doc 34, Sprint B).
- BookingSteps legacy (6 step emoji) deprecated — hapus setelah wizard lama benar-benar turun.
- Emoji sweep batch 2: `(public)/booking/*`, `cari/*`, `cari/[sport]/[courtId]` (masih `sportEmoji` map).
- Font: Inter → Atkinson Hyperlegible (MASTER).
- Tailwind alias `bg-accent-*` biar ga inline `bg-orange-*`.
- P2 security: IDOR `/api/payments/status/[bookingId]`, `public/uploads/payments` signed route, cookie maxAge 30d → 24h, owner bookings SQL filter.
- Secret store workflow: token `CLOUDFLARE_API_TOKEN` stored via `secrets` tapi sentinel env kosong saat exec (bug host-policy), perlu cek gateway proxy injection.

## Catatan teknis
- **Route param mismatch check**: awal sempat `initialCourtId` vs `?court=slug` confusion — fixed dengan resolve slug→id di server page pakai `activeCourts.find(c => c.slug === courtSlug)`.
- **Tenant isolation**: page `/venue/[id]` ambil data via `getVenueById` + `getCourtsByVenue` (DB-side), bukan load-all lalu filter — beda dengan wizard lama yang `Promise.all([sports, venues, courts])` (N+1 risk).
- **No `PORT` conflict**: docker app tetap di `:3000` (vhost nginx lapabook.my.id proksi ke sana). Port 3002 dev-only, sudah mati.

---
Generated: 13 Okt 2026 23:55 WIB
