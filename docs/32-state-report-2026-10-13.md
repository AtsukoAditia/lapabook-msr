# 32 — State Report & Redevelop Baseline (2026-10-13)

Konteks: Redevelop Lapabook dimulai. Dokumen ini baseline state sebelum P0-P3.

## 1. Status Proyek
| | |
|---|---|
| Path | `/home/ubuntu/projects/lapabook-msr` |
| Stack | Next.js 16 + TS + Tailwind + PostgreSQL 16 |
| Branch aktif | `main` |
| Branch lokal mati | 25 branch fitur/fix (merged, belum di-delete) |
| Rebrand | Lapangin → Lapabook — **hero masih render "Lapangin"** |
| Last merge | `88986df` chore(design-system): MASTER.md |

## 2. Fitur — Inventaris

### Public (12 route) ✅
Homepage, cari sports/court, booking flow (multi-slot, recurring, payment), invoice, login/register, about/kontak/kebijakan/syarat/offline/support chat.

### Customer (9 route) ✅
Profile hub, bookings + detail, reviews, edit, favorites, gamification/achievements, referral, notification prefs.

### Admin (14 route) ✅
Dashboard, bookings, customers, analytics (Line/Pie/Heatmap pure SVG), courts, owners, pricing, notifications, commission, review moderation, support, venue approval, SEO, CMS.

### Owner (7 route) ✅
Dashboard, analytics, pricing mgmt, rain discount config, venue list, 3-step venue wizard, photo mgmt.

### API (55+)
Auth (6), public (11), booking (5), customer (14), owner (7), admin (18), Midtrans (3), uploads/photos (4), reviews (2).

### Advanced (sprint 6–11) ✅
Review+rating, revenue analytics, WhatsApp notif, dynamic pricing, referral + gamification, smart group booking (voting + auto-split bill).

## 3. Problem Saat Ini

### Bug / Inconsistency
1. **Rebrand incomplete** — `src/app/page.tsx:81` masih render `<h1>Lapang<span>in</span></h1>` + copy "Lapangin"
2. **25 branch lokal** merged tapi belum di-delete — clutter
3. **128 lint warnings** (turun dari 190) — no-unused-vars, no-unused-expressions

### Tech Debt (dari audit 31)
- `GET /api/owner/bookings` load-all + filter in-memory → N+1 di scale
- `GET /api/payments/status/[bookingId]` IDOR — belum cek `booking.userId === session.userId`
- Cookie `maxAge` 30d vs JWT 24h mismatch
- `public/uploads/payments` enumerable (bisa di-guess URL-nya)
- E2E belum cover: expiry countdown, 409 conflict, payment proof lifecycle, loyalty award

### Konfigurasi Belum Set
- `MIDTRANS_SERVER_KEY` + `NEXT_PUBLIC_MIDTRANS_CLIENT_KEY`
- `NEXT_PUBLIC_FCM_VAPID_KEY`
- `SENTRY_DSN`
- GH Actions secrets: `VPS_HOST/USER/SSH_KEY`

## 4. UI/UX Audit (ui-ux-pro-max)

### Design Token Saat Ini
- Primary `#1e40af`/`#1e3a8a` ✅ match rekomendasi
- Accent `#f97316` → rekomendasi adjust `#ea580c`
- Background aktual `#f0f4f8` vs rekomendasi `#eff6ff`
- Typography: belum konsisten — rekomendasi Atkinson Hyperlegible

### Anti-patterns
1. Emoji as icon (⚽ 🏸 🎾 🏀 🏓 🏟️ 🎯 di homepage) — harus lucide-react SVG
2. Brand bocor: "Lapangin" di hero padahal rebrand
3. Gradient emerald di hero, tapi tailwind config pakai blue — tidak konsisten dengan token sendiri
4. `hover:scale-105` tanpa `prefers-reduced-motion` fallback
5. Raw hex (`text-emerald-700`, `bg-yellow-300`) bukan semantic token

### Pre-delivery Checklist Status
- [ ] ❌ Emoji → lucide-react
- [ ] ⚠️ cursor-pointer cek ulang semua clickable
- [ ] ✅ Hover transition 150-300ms (mostly ada)
- [ ] ⚠️ Light mode contrast 4.5:1 — `text-emerald-100` di hero perlu cek
- [ ] ⚠️ Focus visible — perlu audit
- [ ] ❌ `prefers-reduced-motion` — belum
- [ ] ⚠️ Responsive 375/768/1024/1440 — perlu verify

## 5. Design System MASTER (baru)
- **Path:** `design-system/lapabook/MASTER.md` (commit `88986df`)
- **Pattern:** Funnel 3-Step Conversion
- **Style:** Minimalism & Swiss
- **Color:** primary `#1E3A8A`, accent `#EA580C`, bg `#EFF6FF`
- **Typography:** Atkinson Hyperlegible
- **Motion:** Stagger List (GSAP, back.out(1.4), 300-450ms)

Overrides per-page masuk `design-system/lapabook/pages/<name>.md` (generate via `--page`).

## 6. Redevelop Prioritas

### P0 — Cleanup (1 hari)
1. Delete 25 branch lokal merged
2. Fix rebrand leftover (hero "Lapangin" → "Lapabook", emoji → lucide)
3. Align design tokens (emerald hero → blue/orange)
4. Branch: `fix/rebrand-cleanup`

### P1 — UX Hardening (2-3 hari)
5. Audit contrast + focus states public pages
6. `prefers-reduced-motion` di semua animate-*
7. Semantic color migration (raw hex → token)
8. Typography: Atkinson Hyperlegible

### P2 — Security & Perf
9. IDOR fix `/api/payments/status/[bookingId]`
10. Pindah `public/uploads/payments` keluar public + signed route
11. Owner bookings → DB-side filter (`WHERE venue.owner_id`)
12. Cookie maxAge 30d → 24h

### P3 — Fitur Baru (dari doc 30)
13. Live Court Condition Feed (high impact, no blocker)
14. Tournament & League (high impact, 4-6 minggu)
15. AI Skill Matching (high retention)

---
Generated: 13 Okt 2026 22:38 WIB
