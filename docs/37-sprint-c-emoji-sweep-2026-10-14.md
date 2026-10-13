# 37 — Sprint C: Emoji Sweep Batch 2 + Footer Rebrand (2026-10-14)

Konteks: lanjutan emoji purge dari batch 1 (homepage + Navbar di doc 33). Target: booking funnel 100% lucide.

## Hasil

### ✅ Emoji sweep — booking funnel (45 emoji, 6 file)
| File | Emoji | Diganti |
|------|-------|---------|
| `success/page.tsx` | 21 | Status card icon string → `LucideIcon` component (Hourglass/Search/CheckCircle2/PartyPopper/AlarmClock/XCircle/Ban/Pin); BookingSteps dipangkas 6→4 step match flow baru; 💡💳⚠️📤💬🏠📅 → lucide; link "Booking Lagi" → `/cari` |
| `cari/[sport]/page.tsx` | 7 | `sportEmoji` map → `getSportVisual` `SportIcon`; indoor badge Home/Sun/TentTree; favorite `Heart` (fill red aktif); chips MapPin/Users/Clock; empty state `Search` |
| `cari/[sport]/[courtId]/page.tsx` | 14 | `sportEmojiMap` lokal dihapus → `getSportVisual`; semua header section lucide; 3 CTA "Booking Sekarang" → `Trophy`; 😢 → `SearchX` |
| `recurring/page.tsx` | 2 | ✅ → `CheckCircle2`; 🔄 → `Repeat` |
| `support/page.tsx` | 1 | 💬 empty state → `MessageCircle` |

### ✅ Footer rebrand (root cause emoji di SEMUA page)
Diagnosa: 4 emoji `♥⚡✓🔒` muncul di home DAN cari = shared component. Navbar udah bersih, Footer terlewat batch 1&2.
- `⚡` logo text → `Zap` icon + logo box emerald → blue gradient
- **`Lapang<span>in</span>` → `Lapa<span>book</span>`** (rebrand leftover kedua, sama seperti hero di batch 1)
- `🔒`/`✓` trust badges → `ShieldCheck`/`Check`
- `Made with ♥` → "Dibuat untuk olahraga Indonesia"
- CTA "Daftarkan Venue" emerald → orange
- Link "Booking" `/booking` → `/cari` (wizard legacy)

### ✅ Verifikasi
- `npx tsc --noEmit` clean
- Grep emoji unicode range di 6 file: **0 hits**
- Origin rendered HTML (`--resolve ... 10.11.17.196`): **0 emoji**, brand `Lapabook ×10`, `Lapangin ×0`
- Public: home 200, `/cari/futsal` 200, `/venue/venue-greenfield` 200, `/checkout` 200

### Deploy
- Commits: `f788301` (sweep) + `2b2f6e5` (footer) → merges `87021d7`, `fc35f61` pushed
- Deploy: stop app → `docker compose build` via `systemd-run` (dengan `cd` eksplisit — unit tanpa cd gagal "no configuration file", trap ke-2) → `up -d`. Downtime ±2 menit.

## Sisa emoji di luar booking funnel (backlog, bukan blocker)
30 file terdeteksi di awal sweep; funnel selesai. Sisa: dashboard owner (12 file), profile customer (8 file), auth login/register, static pages (tentang/kontak/syarat/kebijakan), `BookingSteps` komponen (default steps masih emoji — sudah tidak dirender di flow baru setelah success page pakai 4-step custom, recurring masih pakai default).
- Admin pages: sengaja di-skip (internal panel, bukan user-facing funnel).

## Pola deploy stabil (ter-verifikasi 3x)
1. `git checkout -b feature/x` → kerja → `npx tsc --noEmit` → commit → merge `--no-ff` → push
2. `docker stop lapabook-app` (bebas RAM, hindari OOM kill)
3. `sudo systemd-run --unit=X --collect bash -c "cd /home/ubuntu/projects/lapabook-msr && docker compose build app > /tmp/X.log 2>&1; echo EXIT_CODE=\$? >> /tmp/X.log"` — daemon-side, survive gateway restart; **`cd` wajib** (unit tanpa working dir)
4. Poll `grep EXIT_CODE /tmp/X.log` → 0 → `docker compose up -d app`
5. Verify: origin `--resolve ...:443:10.11.17.196` → public edge ≥2x

---
Generated: 14 Okt 2026 00:42 WIB
