# 41 — Roadmap Audit 3 Role + Batch Sprint Eksekusi (2026-10-14)

## A. Audit 3 role (via 3 subagent paralel)

Temuan lengkap (Customer/Owner/Admin) — 📄 audit detail tersimpan di chat. Ringkasan:

| Role | 🔴 Parah | 🟠 Sedang | ✅ Berfungsi |
|---|---|---|---|
| Customer | Envelope key mismatch → riwayat SELALU kosong; IDOR booking detail publik | Gamification placeholder, upload bukti dead-end, notifikasi "bohong" | Discovery, checkout guest, recurring, loyalty, referral, favorites, support chat |
| Owner | **Tidak bisa tambah court** (fatal onboarding), edit venue dead-end, IDOR rain-config/photos, `userId` vs `ownerId` salah pakai | magsUrl/sports wizard tidak disimpan, tidak ada approval pembayaran manual | Dashboard stats, analytics chart, pricing rules, foto court, rain discount |
| Admin/Staff | **Settings page 100% FAKE**, RBAC staff bisa mutasi semua, **secret path hardcoded di repo**, 0 audit log, CMS JSON volatile | Venue reject tanpa alasan, analytics OOM, no pagination, CSRF terbuka | Booking status+loyalty, payment confirm, venue approval, review moderation, komisi (super_admin) |

## B. Sprint dieksekusi (4 subagent + 1 manual)

1. **P0 hotfix** (`feature/p0-hotfix` → merged `2d4cb2e`): envelope parsing riwayat (bookings/reviews), gamification session nyata, `ownerId` scoping di pricing & rain-config (GET+PUT ownership).
2. **P1 owner unblock** (`feature/owner-unblock` → merged `362b60c`): **court creation API** POST `/api/owner/courts` (ownership verified) + **modal tambah lapangan** di dashboard courts + **venue edit** `?edit=` pre-fill + PUT + **wizard menyimpan** mapsUrl & sports (auto-create 1 court per sport → no more buntu).
3. **P2 customer UX** (`feature/customer-ux` → merged `c097f9e`): **IDOR harden** `/api/bookings/[id]` (tiered: owner session → full; `?phone=` match → redacted; else 403; rate-limit), **upload bukti dead-end** → link ke `/checkout/success?code=***&ph`, **foto di ReviewForm** (upload `/api/uploads`, max 3) — ReviewList render.
4. **P1 admin-security (manual)** (`feature/admin-security-v2` → merged `f8b5eb0` + schema fix `b9c76a8`): **hapus secret path hardcoded** di middleware+session (dev fallback `dev-only-do-not-deploy`), **RBAC staff read-only** di mutasi admin sensitif (payments, venues, pricing, bookings, owners, commission, reviews), **audit log** `audit_logs` table wired ke booking status, venue approval, payment confirm/reject, owner status change via `logAudit`.

## C. Catatan jalannya

- 1 subagent (admin-security) `error: failed` tanpa output → gue kerjakan manual.
- Git branch churn saat paralel (komplain subagent): diselesaikan dengan branch baru `feature/admin-security-v2` dari main bersih.
- ~~`docs/41`~~ → audit ini.

## D. Verifikasi live

| Check | Hasil |
|---|---|
| home | 200 ✅ |
| `/cari` | 200 ✅ |
| `/api/bookings/BK-NOTREAL1` no phone | 404 (bukan bocor) ✅ |
| `/api/bookings/BK-SOME-CODE` publik | 404 ✅ |
| `/profile` publik | 307 → login ✅ (middleware) |
| Deploy | systemd-run unit k, `EXIT_CODE=0` ✅ |

Audit live check pending (butuh aksi admin: konfirmasi payment / approve venue / suspend owner) → `SELECT * FROM audit_logs ORDER BY timestamp DESC LIMIT 10;`.

## E. Sisa backlog (post-batch)

**P2 Sisa:** notification H-1 automation (WA/email), `Add to Google Calendar` (.ics), voucher code input, CMS/SEO ke DB (bukan file), admin list pagination server-side, export CSV, manajemen customer (ban/refund), UI admin-user CRUD.
**P3:** mabar/pickup-game UI (API ready), team wallet/split bill UI (API ready), DP/partial payment, reschedule, waitlist, refund flow, owner settlement/payout, owner multi-staff, owner-initiated promo, photo venue (bukan court), fasilitas filter, near-me geolocation.

---
Generated: 14 Okt 2026 03:10 WIB
