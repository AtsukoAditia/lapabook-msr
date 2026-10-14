# Doc 45 — Reschedule + Refund/WA + Settlement (2026-10-15)

## Merge
- `34d52a6` reschedule (`6e0daa7`, 6 files +195)
- `8f90819` refund-wa (`004706f` cherry-pick dari `eb64531`, 12 files +358)
- `80c2ca7` settlement (`b26e973`, 7 files +398)
- Main `80c2ca7`, tsc 0, pushed `8d333fa..80c2ca7`, build v EXIT 0, app Up.

## 1. Reschedule
- Migration `2026-10-15-reschedule.sql` applied live: `rescheduled_from JSONB`, `reschedule_count INT 0`, index partial.
- `PATCH /api/bookings/[id]/reschedule` — session customer, milik user, status confirmed/paid/waiting_*, H-3 dari jam main lama, count<1, cek konflik SQL court+date+overlap exclude self + blocked_slots. Fallback 42703 bila kolom belum ada.
- UI: `profile/bookings/[id]` form + badge, `dashboard/bookings` badge.
- Insiden: commit refund nyangkut di branch reschedule → reset ke `6e0daa7`, refund cherry-pick ke `feature/refund-wa`.

## 2. Refund + WA
- Migration `2026-10-15-refund.sql` applied live: `refund_reason`, `refund_requested_at`, CHECK tambah `refund_requested`.
- `POST /api/bookings/[id]/refund-request` (customer session, paid/dp_paid) → `requestRefund`.
- `POST /api/admin/payments/[id]` extend `refund-approve`/`refund-reject`.
- WA existing `src/lib/whatsapp/client.ts` + `notification-service.ts` (`WWEBJS_API_URL/KEY`, fallback wa.me), best-effort try/catch: confirm/reject/refund_requested/approved/rejected.

## 3. Settlement
- Migration `2026-10-15-settlement.sql` applied live: tabel `payouts` + 2 index.
- `GET/POST /api/owner/payouts` — saldo SUM owner_payout paid+confirmed/completed minus payouts approved/paid.
- `GET/POST /api/admin/payouts` — list + approve/reject/paid (one-step dari requested).
- UI: `dashboard/payouts`, `admin/payouts` + nav. Guard live: unauth 401 dua-duanya.

## Verify live
`/:200 /cari:200 /mabar:200 /tentang:200 /admin/login:200 /dashboard/login:200 /profile:307 /admin/payouts:307 /dashboard/payouts:307`
