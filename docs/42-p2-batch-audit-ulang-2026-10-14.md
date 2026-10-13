# 42 — P2 Batch + Audit Ulang Semua Alur (2026-10-14)

## A. Yang dieksekusi

### P2 Admin completion (`feature/p2-admin` → `1e88d3d`)
- **Settings page REAL**: `/api/admin/settings` GET+PUT → tabel `platform_settings` (migration 2026-10-14-platform-settings.sql, 3 keys: `platform_fee_default=10`, `settlement_cutoff_hour=23`, `app_name=Lapabook`). Tombol Reset palsu dihapus. PUT pakai logAudit.
- **Customer ban/unban**: PATCH `/api/admin/customers/[id]` → `is_active` flip. Tombol per row.
- **Export CSV bookings**: tombol di admin bookings → unduh client-side dari list terfilter.

### P2 Customer features (`feature/p2-customer-2` → `b950d2d`)
- **Voucher checkout**: migration vouchers (kode LAPABOOK10 10% min 50k; GRATISMAIN Rp25k fixed min 100k) + `bookings.voucher_code`. POST `/api/vouchers/redeem`. UI Apply→diskon hijau→total update. Increment atomic `used_count` (UPDATE...RETURNING guard).
- **ICS calendar**: tombol di success page → Blob `.ics` client-side, no dep.
- **WA confirm link**: `notification-service.ts` generate link → insert `notification_logs` saat payment confirm (best-effort, fire-and-forget).

### Fix audit bugs (`fix/audit-bugs` → `19dbf47`)
- **Venue slug → 308** canonical id (`getVenueBySlug` ke 3 adapter; konflik merge resolved ke versi tanpa filter status).
- **`/admin/payments` page** baru: list `waiting_confirmation` + Confirm/Reject + link bukti + nav item.

## B. Audit ulang (subagent `audit-all-flows`)

| Temuan | Status |
|---|---|
| `/venue/{slug}` 404 | ✅ DIFIX (308 → canonical) |
| `/admin/payments` missing | ✅ DIFIX (page baru) |
| `/admin/settings` fake | ✅ DIFIX (real API) |
| `/api/bookings/[id]` IDOR | ✅ sudah tiered 3-level (session/phone/403) |
| `profile/bookings` parse | ✅ fallback multi-shape |
| `getBookings()` full-scan (owner/stats, admin bookings/commission/analytics) | ⚠️ OPEN — ponytail perf next |
| Emoji residual ~84 di dashboard+admin+profile | ⚠️ OPEN — kosmetik, funnel publik sudah 0 |
| `profile/referral` `data?.stats` vs API shape | ⚠️ RISIKO — verify saat dipakai |
| CMS/SEO JSON file volatile | ⚠️ OPEN — migrate ke DB |
| Admin list tanpa pagination server-side | ⚠️ OPEN |

## C. Verifikasi live

| Check | Hasil |
|---|---|
| `/venue/greenfield-sports-club` | **308 → `/venue/venue-greenfield` → 200** ✅ |
| `/venue/venue-greenfield` | 200 ✅ |
| `/admin/payments` unauth | 307 (middleware) ✅ |
| POST redeem LAPABOOK10/150000 | 200 `discountAmount:15000` ✅ |
| POST redeem SALAH123 | 400 `tidak ditemukan` ✅ |
| SET vouchers | LAPABOOK10, GRATISMAIN, used_count=0 ✅ |
| platform_settings | 3 keys persist ✅ |
| Build l | `EXIT_CODE=0`; proofs persist via volume ✅ |

## D. Sisa backlog final

**Perf**: scoped COUNT di owner/stats (+3 endpoint admin). **Stabilitas**: CMS/SEO ke DB, admin pagination server-side, audit referrals shape. **Kosmetik**: emoji batch 3 (~84 dashboard/admin), font Atkinson. **Fitur P3**: mabar UI (API ready), split-bill UI (API ready), DP, reschedule, waitlist, refund, owner settlement, multi-staff, rate-limit login.

---
Generated: 14 Okt 2026 07:10 WIB
