# 39 — Sprint B Sisa: /checkout/success + /invoice/[id] Canonical (2026-10-14)

Konteks: doc 36 (Sprint B) rencanakan pindah `/booking/success` → `/checkout/success` dan `/booking/invoice/[id]` → `/invoice/[id]`. Eksekusi sekarang.

## Perubahan (merge `12594da`, commit `306914d`)

- `src/app/(public)/booking/success/page.tsx` → `src/app/checkout/success/page.tsx`
- `src/app/(public)/booking/invoice/[id]/page.tsx` → `src/app/invoice/[id]/page.tsx`
- Path lama jadi shim `permanentRedirect` (308):
  - `/booking/success?code=X` → `/checkout/success?code=X` (query preserved)
  - `/booking/invoice/[id]` → `/invoice/[id]`
- Refs diupdate (5): `src/app/checkout/page.tsx` (4 router.push Midtrans callbacks) + `src/lib/services/payment-service.ts` (finish redirect URL)

## Keputusan

- **308 bukan 307**: canonical pindah permanen — search engine alihkan ranking ke URL baru. (Form submit callback pakai router.push client-side, GET-only, jadi 308 aman.)
- Query `?code=` dipreserve manual di shim success (URLSearchParams loop) — `redirect()` Next tidak otomatis bawa query.

## Verifikasi

| Check | Hasil |
|---|---|
| `/checkout/success?code=TEST` | 200 ✅ |
| `/booking/success?code=TEST` | 308 → `/checkout/success?code=TEST` 200 ✅ |
| `/booking/invoice/TEST123` | 308 → `/invoice/TEST123` 200 ✅ |
| Publik (CF) | sama ✅ |
| `npx tsc --noEmit` | clean |
| Deploy | systemd-run unit i, `EXIT_CODE=0` |

## Slip note

Sed replace `redirect(` gagal karena backtick di template literal — TS2304 muncul di type-check sebelum commit, di-fix manual. Lesson: sed bukan alat buat refactor kode TS; type-check selalu sebelum commit menangkap ini.

---
Generated: 14 Okt 2026 01:45 WIB
