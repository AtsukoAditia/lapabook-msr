# 34 — Booking Flow Recommendation (2026-10-13)

Konteks: Request Bro Dit — "buat alur lebih simpel, user mudah pakai dari awal sampai booking".

## 1. Flow Saat Ini (audit)

Dua jalur booking yang **overlap**:

### Jalur A — `/booking` (wizard)
1. `/booking` — pilih area + sport
2. `/booking/[sport]` — pilih venue
3. `/booking/[sport]/[venue]` — (implicit) pilih court
4. `/booking/[sport]/[venue]/[court]` — pilih tanggal + jam (SlotSelector)
5. `/booking/form?courtId&date&startTime&endTime` — isi nama/phone + bayar
6. `/booking/success` — hasil
7. `/booking/invoice/[id]` — invoice

### Jalur B — `/cari` (marketplace)
1. `/cari` — redirect `/cari/futsal`
2. `/cari/[sport]` — list venues + filter
3. `/cari/[sport]/[courtId]` — detail court (ada CTA "Booking Sekarang" → /booking/form?...)

**Problem:**
- 7 page untuk 1 booking — drop-off tinggi
- Jalur A dan B saling silang: user bisa masuk dari /booking tapi nyasar ke /cari, atau sebaliknya (page.tsx venue card di homepage link-nya hardcode `/cari/futsal`)
- `BookingSteps` 6 langkah pakai emoji (🏆 🏟️ ⏰ 👤 💳 ✅) — tidak match MASTER
- Form pakai query string manual (courtId, date, startTime, endTime) — user bisa reload = data hilang
- Belum ada pilihan "guest checkout" — harus login/register dulu?
- Belum ada cart/hold summary — user pilih banyak slot, lalu langsung form (info tersebar)

## 2. Rekomendasi Flow Baru (3 langkah inti)

```
[ Discovery ] → [ Pilih Slot ] → [ Checkout ]
```

| Step | Route tujuan | Aksi user | Data yang disimpan |
|------|-----------|-----------|-------------------|
| 1 | `/` atau `/cari` | Cari venue (sport + area + tanggal opsional) | — |
| 2 | `/venue/[id]` atau `/cari/[sport]/[courtId]` | Pilih court + tanggal + jam (multi-slot) di satu halaman | pending slot di session |
| 3 | `/checkout` | Review + nama/phone + bayar (Midtrans Snap langsung di page ini) | booking create |

### Yang berubah

1. **Merge Jalur A dan B** → satu: `/venue/[venueId]` page
   - Isi: gallery foto, nama, alamat, peta mini, sport indicators (lucide icons), list courts di bawahnya, SlotSelector embedded.
   - User pilih court → langsung tampil kalender 7 hari + slot jam (tidak pindah halaman).
   - CTA "Lanjut Bayar" → sticky bar di bawah dengan total harga + slot terpilih.

2. **Hapus `/booking` wizard** → ganti `/cari` sebagai homepage discovery default (hero CTA langsung ke `/cari`).
   - `/booking` redirect → `/cari`
   - `/booking/[sport]` redirect → `/cari/[sport]`
   - `/booking/[sport]/[venue]` redirect → `/venue/[venueId]?sport=[sport]`
   - `/booking/[sport]/[venue]/[court]` redirect → `/venue/[venueId]?court=[courtId]`
   - `/booking/form` redirect → `/checkout`
   - `/booking/recurring` tetap (advanced, tapi link masuk dari venue detail)
   - `/booking/success` → `/checkout/success`
   - `/booking/invoice/[id]` → `/invoice/[id]`

3. **Sticky bottom bar** di `/venue/[id]`
   - "3 jam dipilih • Rp 240.000" + CTA "Lanjut Bayar"
   - Auto-scroll ke form kalau klik (anchor), bukan page baru

4. **Checkout jadi 1 halaman** `/checkout`
   - Kiri (desktop) / atas (mobile): ringkasan slot (court, tanggal, jam, subtotal, service fee, total)
   - Kanan: form nama + phone + email (no password buat guest), payment selector (Midtrans Snap langsung di page, tidak popup eksternal redirect)
   - "Booking sebagai tamu" default → optional "buat akun untuk kumpulkan poin" prompt setelah booking sukses (merge poin by phone/email)

5. **Query string → session-backed draft**
   - `SlotSelector` simpan ke `localStorage` + POST `/api/booking-drafts` (server-side hold 15 menit seperti sekarang)
   - Kalau reload / ganti device, draft ikut session_token (bukan query string rapuh)

6. **BookingSteps baru (3 langkah)**
   - Pakai lucide icon: `Search` → `MapPin` (atau `Calendar`) → `CreditCard`
   - Background blue-900, text active orange-400 (match MASTER)
   - Hidden di mobile <sm (screen kecil: progress bar mini di atas aja)

7. **Homepage CTA search bar**
   - Sekarang: search bar → pindah ke `/cari/[sport]?q=...` (Jalur B)
   - Rekomendasi: tetap **beda**, tapi venue card di homepage link ke `/venue/[venueId]` (bukan hardcode `/cari/futsal`)

## 3. Struktur Route Target

```
/                                   ← Homepage (hero + discovery search)
/cari                               ← List semua sports + filter area (default page)
/cari/[sport]                       ← List venues by sport
/venue/[venueId]                    ← Venue detail + court + slot selector (NEW)
/checkout                           ← Review + guest form + Midtrans (NEW, replaces /booking/form)
/checkout/success                   ← Success page
/invoice/[bookingId]                ← Invoice print
/profile/...                        ← (tetap)
/dashboard/...                      ← (tetap)
/admin/...                          ← (tetap)
```

**Legacy redirects** di `next.config.ts` untuk SEO + deep-link lama:
```
/booking → /cari                              301
/booking/:sport → /cari/:sport                301
/booking/:sport/:venue → /venue/:venueId      301 (resolve via sport+venue slug → id)
/booking/:sport/:venue/:court → /venue/:venueId?court=:court 301
/booking/form → /checkout                     301
/booking/success → /checkout/success          301
/booking/invoice/:id → /invoice/:id           301
```

## 4. Komponen Baru yang Dibutuhkan

| Komponen | Fungsi | Lokasi |
|----------|--------|--------|
| `StickyCheckoutBar` | Sticky bottom summary + CTA | `src/components/booking/StickyCheckoutBar.tsx` |
| `VenueSlotSelector` | SlotSelector refactored untuk inline di venue page (court switcher + calendar + confirm) | `src/components/booking/VenueSlotSelector.tsx` |
| `CheckoutSummary` | Card kiri: daftar slot + total | `src/components/booking/CheckoutSummary.tsx` |
| `GuestCheckoutForm` | Form nama/phone/email + payment | `src/components/booking/GuestCheckoutForm.tsx` |
| `SportBadge` | Icon + label sport (pakai getSportVisual) | `src/components/ui/SportBadge.tsx` |

## 5. DB/API Tambahan Minimal

- Table `booking_drafts` (atau reuse `bookings` dengan status `draft` — tapi lebih bersih tabel sendiri):
  ```sql
  CREATE TABLE booking_drafts (
    id TEXT PRIMARY KEY,
    session_id TEXT NOT NULL,
    venue_id TEXT NOT NULL,
    court_id TEXT NOT NULL,
    slots JSONB NOT NULL,  -- [{date, startTime, endTime, price}]
    expires_at TIMESTAMPTZ NOT NULL,  -- 15 min
    created_at TIMESTAMPTZ DEFAULT now()
  );
  CREATE INDEX booking_drafts_session ON booking_drafts(session_id);
  CREATE INDEX booking_drafts_expires ON booking_drafts(expires_at);
  ```
- API:
  - `POST /api/drafts` — create/update draft
  - `GET /api/drafts/:sessionId` — retrieve active draft
  - `POST /api/checkout` — konversi draft → booking (status `waiting_payment`)
  - Cron cleanup expired drafts (reuse existing expire pattern)

## 6. Metrics yang Harus Membaik

- Drop-off from homepage → success page: target <30% (sekarang estimasi 60%+ karena 7 page)
- Time to complete booking: target <90 detik
- Mobile completion rate: target >70% (sticky bar + 1-page checkout)
- Guest vs logged-in: tracking start

## 7. Implementasi Order (sprint saran)

1. **Sprint A (1 minggu) — Venue detail page**
   - `/venue/[id]` page + StickyCheckoutBar + VenueSlotSelector embed
   - BookingSteps 3 langkah dengan lucide icon
   - Legacy redirects 301 via next.config
   - Update homepage: venue card link → `/venue/[id]`; hero CTA → `/cari`

2. **Sprint B (1 minggu) — Checkout satu halaman + draft API**
   - Booking_drafts table + migration + API
   - `/checkout` page (CheckoutSummary + GuestCheckoutForm + MidtransSnap embedded)
   - Session token via cookie (`lapabook_session`)
   - Success + invoice pages moved

3. **Sprint C (3 hari) — Cleanup + polish**
   - Hapus halaman lama wizard (atau biar redirect permanent)
   - BookingSteps 6-step legacy component → mark deprecated
   - Analytics hooks (page view / drop-off per step)
   - A11y pass + reduced-motion verify
   - Update tests

## 8. Trade-off / Risiko

- SEO: URL `/booking/[sport]` → `/cari/[sport]` berubah — mitigasi 301 + sitemap.xml update + canonical tag
- Direct link lama yang dishare user — mitigasi 301 tetap berlaku
- Venue detail jadi "long page" — mitigasi: sticky nav internal (info / courts / availability), lazy-load section
- Guest checkout vs points — mitigasi: post-booking "klaim poin dengan daftar" modal (merge by phone)

---
Generated: 13 Okt 2026 22:47 WIB
