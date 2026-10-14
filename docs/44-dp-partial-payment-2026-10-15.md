# Doc 44 — DP/Partial Payment + E2E Live (2026-10-14/15)

## Fitur
DP50: customer bayar `ceil(total/2)` di muka, sisa dilunasi nanti.
Reuse `payment_status='dp_paid'` existing (sudah di CHECK). Tanpa nilai status baru.

## Flow
1. Checkout radio Full / DP50 → `POST /api/bookings {downPaymentType:'dp50'}` → `down_payment_amount=ceil(total/2)`, `paid_amount=0`
2. Upload + submit proof → `waiting_verification` / `waiting_confirmation`
3. Admin confirm → `dp_paid`, `paid_amount=DP`, slot `confirmed`
4. Submit pelunasan (`isSettlement:true`) → slot tetap `confirmed`, payment `waiting_confirmation`
5. Admin confirm → `paid`, `paid_amount=total`

## File (12, merge 20a5b7c)
- `db/postgres/migrations/2026-10-14-dp-payment.sql` — 2 kolom, idempotent, applied live
- `postgres-adapter.ts` — DP math create/confirm/submit-aware proof
- `booking-service.ts` — settlement guard (`confirmed`+`dp_paid`)
- Routes: `bookings`, `bookings/[id]`, `payments/proof`, `payments/status/[bookingId]` — expose down/paid/remaining
- UI: `checkout/page.tsx` radio, `checkout/success/page.tsx` sisa+pelunasan, `dashboard/bookings` badge
- Types: `domain.ts`, `database-adapter.ts`

## E2E live (15 Okt, test lalu hapus)
`BK-261014-0FFD` total 130578 → DP 65289 → `dp_paid/paidAmount:65289` → settlement remaining 65289 → `paid`. Semua 200.

## Keputusan
- Komisi/owner_payout dari total, unchanged. Midtrans untouched (manual only). Mock/sheets tanpa DP math (dev path).
