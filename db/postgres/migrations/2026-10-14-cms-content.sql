CREATE TABLE IF NOT EXISTS cms_content (
  key TEXT PRIMARY KEY,
  title TEXT NOT NULL DEFAULT '',
  body TEXT NOT NULL DEFAULT '',
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_by TEXT
);

INSERT INTO cms_content (key, title, body) VALUES ('tentang', 'Tentang Lapabook', '# Tentang Lapabook

**Lapabook** adalah platform booking lapangan olahraga online yang menghubungkan pemain dengan pemilik lapangan di seluruh Indonesia.

## Misi Kami

Membuat akses ke fasilitas olahraga semudah memesan makanan. Kami percaya bahwa berolahraga harusnya simple — cari, booking, main.

## Apa yang Kami Tawarkan

- **Ribuan lapangan** — futsal, badminton, basket, tenis, padel, mini soccer
- **Filter lokasi** — cari berdasarkan area/kota/kelurahan
- **Harga transparan** — lihat harga real-time sebelum booking
- **Booking instan** — pilih jam, bayar, langsung main
- **Gamifikasi** — kumpulkan poin, tukar reward, naik level
- **Adaptif cuaca** — diskon otomatis untuk lapangan outdoor saat hujan

## Untuk Pemilik Lapangan

Daftarkan venue Anda dan dapatkan:
- Dashboard kelola booking real-time
- Manajemen lapangan dan harga fleksibel
- Statistik dan analitik performa
- Notifikasi otomatis ke pelanggan

## Teknologi

- Next.js 16 + TypeScript
- PostgreSQL 16
- Real-time availability
- PWA support (install di HP)
- HTTPS + security hardening

## Kontak

Hubungi kami di [kontak@lapabook.id](mailto:kontak@lapabook.id) atau kunjungi halaman [Kontak](/kontak).') ON CONFLICT (key) DO NOTHING;
INSERT INTO cms_content (key, title, body) VALUES ('syarat', 'Syarat & Ketentuan', '# Syarat & Ketentuan

Terakhir diperbarui: 12 Juli 2026

## Ketentuan Umum

Dengan menggunakan Lapabook, Anda menyetujui syarat dan ketentuan berikut.

## Untuk Pemain (Customer)

### Pendaftaran
- Usia minimal 17 tahun atau memiliki izin orang tua
- Data yang diberikan harus benar dan dapat diverifikasi
- Satu akun per orang — dilarang membuat akun ganda
- Password harus kuat (minimal 8 karakter, kombinasi huruf dan angka)

### Booking
- Booking bersifat sementara hingga pembayaran dikonfirmasi
- Booking yang tidak dibayar dalam 15 menit akan otomatis kadaluarsa
- Bukti pembayaran harus diupload setelah melakukan transfer
- Booking yang sudah dikonfirmasi tidak dapat dibatalkan tanpa penalti

### Pembayaran
- Pembayaran dilakukan via transfer bank, e-wallet, atau QRIS
- Bukti pembayaran yang diupload harus jelas dan asli
- Manipulasi bukti pembayaran = banned permanen

### Loyalty & Reward
- Poin hanya diberikan setelah booking dikonfirmasi
- Poin dapat ditukar dengan reward yang tersedia
- Poin yang sudah kadaluarsa tidak dapat diklaim kembali
- Lapabook berhak menyesuaikan poin jika terjadi kesalahan

### Referral
- Kode referral bersifat unik per akun
- Poin referral diberikan setelah referral pertama berhasil
- Dilarang menyalahgunakan sistem referral (fake accounts, dll)

### Kewajiban Pemain
- Datang tepat waktu sesuai jadwal booking
- Menjaga kebersihan dan fasilitas venue
- Menghormati pemilik lapangan dan pemain lain
- Tidak melakukan vandalisme atau tindakan merusak

## Untuk Pemilik Lapangan (Owner)

### Pendaftaran
- Harus memiliki usaha venue olahraga yang valid
- Data bisnis harus benar dan dapat diverifikasi
- Pendaftaran akan diverifikasi oleh tim Lapabook (1-3 hari kerja)
- Status akun: pending → active (setelah disetujui)

### Pengelolaan Venue
- Informasi venue harus akurat (alamat, foto, harga, jam operasional)
- Harga yang tercantum adalah harga final (tidak boleh ada biaya tersembunyi)
- Ketersediaan slot harus selalu diperbarui
- Venue yang tidak aktif dalam 90 hari dapat ditandai suspend

### Booking & Pembayaran
- Owner wajib mengkonfirmasi booking yang sudah dibayar
- Pembayaran dari customer akan diteruskan ke owner (setelah dipotong platform fee)
- Owner dapat menolak booking dengan alasan yang valid
- Rekening tujuan pembayaran harus atas nama bisnis yang terdaftar

### Data & Kontak
- Owner bertanggung jawab atas data customer yang diterima
- Dilarang menyebarkan data customer ke pihak lain
- Kontak customer hanya untuk keperluan booking

## Untuk Semua Pengguna

### Larangan
- Menggunakan platform untuk aktivitas ilegal
- Manipulasi data, bukti pembayaran, atau review
- Spam, abuse, atau harassment terhadap pengguna lain
- Menggunakan bot atau script otomatis
- Reverse engineering atau exploitasi celah keamanan

### Hak Lapabook
- Menangguhkan atau menghapus akun yang melanggar
- Mengubah syarat dan ketentuan sewaktu-waktu
- Menolak atau membatalkan booking yang mencurigakan
- Mengambil tindakan hukum untuk pelanggaran serius

### Batasan Tanggung Jawab
- Lapabook adalah platform perantara, bukan penyedia venue
- Kualitas venue adalah tanggung jawab owner
- Sengketa antara pemain dan owner harus diselesaikan secara musyawarah
- Lapabook akan memediasi jika diperlukan

### Ganti Rugi
- Maksimal ganti rugi = nilai booking yang bersangkutan
- Lapabook tidak bertanggung jawab atas kerugian tidak langsung
- Force majeure (bencana alam, pandemi, dll) dikecualikan

## Hukum yang Berlaku

Syarat dan ketentuan ini tunduk pada hukum Republik Indonesia.
Sengketa akan diselesaikan di pengadilan Jakarta Selatan.

## Kontak

Pertanyaan tentang syarat & ketentuan: [legal@lapabook.id](mailto:legal@lapabook.id)') ON CONFLICT (key) DO NOTHING;
INSERT INTO cms_content (key, title, body) VALUES ('kontak', 'Kontak', '# Kontak Kami

Kami siap membantu Anda! Hubungi kami melalui channel berikut.

## Email
- **Umum:** info@lapabook.id
- **Support:** support@lapabook.id
- **Kerjasama:** partnership@lapabook.id
- **Privasi:** privacy@lapabook.id
- **Legal:** legal@lapabook.id

## Media Sosial
- **Instagram:** @lapabook.id
- **Twitter/X:** @lapabook_id
- **TikTok:** @lapabook.id
- **Facebook:** Lapabook Indonesia

## WhatsApp
+62 812-3456-7890 (Chat only, Senin-Jumat 09:00-17:00 WIB)

## Alamat
Lapabook Indonesia
Jakarta Selatan, DKI Jakarta
Indonesia

## Jam Operasional Support
Senin - Jumat: 09:00 - 17:00 WIB
Sabtu: 09:00 - 14:00 WIB
Minggu & Hari Libur: Tutup

## FAQ Cepat

**Q: Booking saya belum dikonfirmasi?**
A: Hubungi owner venue via WhatsApp yang tertera di halaman venue. Atau hubungi support kami.

**Q: Bukti pembayaran ditolak?**
A: Upload ulang bukti yang lebih jelas. Pastikan nominal, nama, dan tanggal terlihat.

**Q: Ingin daftarkan venue saya?**
A: Kunjungi /dashboard/register atau hubungi partnership@lapabook.id

**Q: Ada bug atau error?**
A: Laporkan ke support@lapabook.id dengan screenshot dan langkah reproduksi.') ON CONFLICT (key) DO NOTHING;
INSERT INTO cms_content (key, title, body) VALUES ('kebijakan', 'Kebijakan & Privasi', '# Kebijakan & Privasi

Terakhir diperbarui: 12 Juli 2026

## 1. Data yang Kami Kumpulkan

**Data Pendaftaran:**
- Nama lengkap
- Email
- Nomor telepon
- Password (dienkripsi, tidak pernah disimpan plain text)

**Data Booking:**
- Riwayat booking (venue, jam, tanggal)
- Bukti pembayaran yang diupload
- Review dan rating yang diberikan

**Data Teknis:**
- Alamat IP
- Tipe browser dan device
- Halaman yang dikunjungi

## 2. Cara Kami Menggunakan Data

- Memproses booking dan pembayaran
- Mengirim notifikasi booking (WhatsApp, email, push)
- Mengelola akun dan loyalty points
- Meningkatkan layanan dan pengalaman pengguna
- Mencegah fraud dan penyalahgunaan

## 3. Data Sharing

Kami TIDAK menjual data Anda kepada pihak ketiga.

Data dibagikan hanya dengan:
- **Pemilik venue** — nama dan kontak untuk keperluan booking
- **Payment gateway** — data transaksi untuk proses pembayaran
- **Layanan notifikasi** — nomor telepon/email untuk notifikasi

## 4. Keamanan Data

- Semua komunikasi dienkripsi HTTPS
- Password di-hash dengan bcrypt
- JWT token untuk autentikasi session
- Rate limiting untuk mencegah brute force
- Audit log untuk semua aksi penting

## 5. Hak Anda

- **Akses:** Minta salinan data Anda
- **Koreksi:** Perbaiki data yang salah
- **Hapus:** Minta penghapusan akun dan data
- **Export:** Download data Anda dalam format umum

## 6. Retensi Data

- Data akun: disimpan selama akun aktif
- Data booking: disimpan 2 tahun setelah transaksi
- Log teknis: dihapus otomatis setelah 90 hari

## 7. Cookie

Kami menggunakan cookie untuk:
- Autentikasi session (httpOnly cookie)
- Preferensi pengguna (theme, bahasa)
- Analytics (anonymized)

## 8. Kontak

Untuk pertanyaan tentang privasi: [privacy@lapabook.id](mailto:privacy@lapabook.id)

## 9. Perubahan Kebijakan

Kebijakan ini dapat berubah sewaktu-waktu. Perubahan signifikan akan diinformasikan via email atau notifikasi in-app.') ON CONFLICT (key) DO NOTHING;
