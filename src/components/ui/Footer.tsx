import Link from "next/link";

export default function Footer() {
  return (
    <footer className="bg-slate-900 text-slate-300">
      <div className="mx-auto max-w-6xl px-4 py-12 sm:px-6">
        <div className="grid gap-8 sm:grid-cols-2 lg:grid-cols-4">
          <div>
            <div className="flex items-center gap-2 mb-3">
              <div className="w-8 h-8 bg-gradient-to-br from-emerald-500 to-teal-600 rounded-lg flex items-center justify-center">
                <span className="text-white font-bold">⚡</span>
              </div>
              <span className="text-lg font-black text-white">Lapang<span className="text-emerald-400">in</span></span>
            </div>
            <p className="text-sm text-slate-400 leading-relaxed">
              Booking lapangan olahraga jadi mudah, cepat, dan praktis. Futsal, badminton, padel, tenis, basket, minisoccer.
            </p>
            <div className="mt-4 flex gap-2 text-xs">
              <span className="rounded-full bg-white/10 px-3 py-1">🔒 Pembayaran Aman</span>
              <span className="rounded-full bg-white/10 px-3 py-1">✓ Venue Terverifikasi</span>
            </div>
          </div>
          <div>
            <h4 className="font-bold text-white mb-3 text-sm">Jelajahi</h4>
            <ul className="space-y-2 text-sm">
              <li><Link href="/booking" className="hover:text-white">Booking</Link></li>
              <li><Link href="/cari/futsal" className="hover:text-white">Cari Lapangan</Link></li>
              <li><Link href="/tentang" className="hover:text-white">Tentang Kami</Link></li>
              <li><Link href="/kontak" className="hover:text-white">Kontak</Link></li>
            </ul>
          </div>
          <div>
            <h4 className="font-bold text-white mb-3 text-sm">Bantuan</h4>
            <ul className="space-y-2 text-sm">
              <li><Link href="/syarat" className="hover:text-white">Syarat & Ketentuan</Link></li>
              <li><Link href="/kebijakan" className="hover:text-white">Kebijakan Privasi</Link></li>
              <li><Link href="/kontak" className="hover:text-white">Bantuan / CS</Link></li>
              <li><span className="text-slate-400">CS: 08:00-22:00 WIB</span></li>
            </ul>
          </div>
          <div>
            <h4 className="font-bold text-white mb-3 text-sm">Untuk Pemilik Venue</h4>
            <p className="text-sm text-slate-400 mb-3">Punya lapangan? Daftarkan venue dan kelola booking otomatis.</p>
            <Link href="/dashboard/register" className="inline-flex rounded-xl bg-emerald-600 px-5 py-2.5 text-sm font-bold text-white hover:bg-emerald-500">Daftarkan Venue</Link>
          </div>
        </div>
        <div className="mt-10 border-t border-white/10 pt-6 flex flex-col sm:flex-row justify-between gap-3 text-xs text-slate-500">
          <span>© 2026 Lapangin. All rights reserved.</span>
          <span>Made with ♥ untuk olahraga Indonesia</span>
        </div>
      </div>
    </footer>
  );
}
