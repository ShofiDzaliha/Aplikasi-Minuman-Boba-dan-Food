Nama Mahasiswa Pembuat: Muhammad Jefry Al Buchory
NPM: 14022400069
Mata Kuliah: Pemrograman Mobile

----
Nama Aplikasi = Aplikasi Minuman Boba dan Food

Deskripsi Singkat = Aplikasi ini adalah Aplikasi Pemesanan Minuman Boba & Makanan Cepat Saji berbasis Flutter .
Pengguna dapat melihat daftar menu minuman (Boba Vanilla, Stroberi, Coklat) dan makanan (Burger, Pizza, Kentang Goreng), melihat detail produk, menambahkan ke keranjang, serta melakukan checkout. Aplikasi dibuat sederhana namun lengkap dan sudah terdiri dari 5 halaman dalam satu file main.dart.

Fitur-fitur : 
1. Halaman Home
Menampilkan Perayaan awal, Menampilkan jumlah item di keranjang, Tombol menuju halaman menu, Daftar produk populer (scroll horizontal)
2. Halaman Menu
Menampilkan seluruh daftar makanan & minuman, Bisa pilih salah satu untuk melihat detail
3. Halaman Detail Produk
Menampilkan icon, nama, harga, Pengaturan jumlah (qty ±), Menambahkan catatan (opsional), Tombol Tambah ke Keranjang
4. Halaman Keranjang
Menampilkan daftar pesanan, Menghapus item dari keranjang, Menampilkan total harga otomatis, Tombol Pembayaran
5. Halaman Checkout
Menampilkan total pembayaran, Animasi icon sukses, Tombol Kembali ke Home

Cara Menjalankan = Pastikan flutter SDK sudah terinstall, lalu buka folder project menggunakan vscode dan jalankan perintah "flutter run" di terminal. Setelah proses dan ada pilihan di terminal klik angka 2 atau 3 untuk menampilan output program di chrome atau edge.

Screenshoot halaman utama : 
<img width="1913" height="879" alt="image" src="https://github.com/user-attachments/assets/1169e3d9-bb9f-47ad-b0e8-7d245188683e" />

Rencana Pengembangan fitur :
1️⃣ Sistem Login & Akun Pengguna
Tujuan : menyimpan riwayat pesanan per pengguna.
Pengembangan: Registrasi (email / nomor HP), Login, Lupa password, Halaman profil pengguna, Keluar
2️⃣ Sistem Pembayaran Digital
Tujuan: memudahkan transaksi langsung di aplikasi.
Pengembangan: Integrasi QRIS, Integrasi e-wallet (Dana, OVO, GoPay), Simulasi pembayaran dummy, Status pembayaran (Tertunda → Berhasil)
3️⃣ Manajemen Pesanan (Pelacakan Pesanan)
Tujuan : memudahkan pengguna melihat status pesanan.
Fitur yang ditambahkan: Status pesanan (Diterima, Diproses, Selesai), Riwayat pesanan, Detail order lengkap
4️⃣ Fitur Custom Topping
Tujuan: membuat pesanan lebih fleksibel seperti toko minuman asli.
Contoh pilihan: Topping boba ekstra, Gula 0% / 50% / 100%, Es sedikit / normal, Ukuran (M / L)
5️⃣ Penambahan Gambar Produk
Tujuan: tampilannya lebih menarik & informatif.
Pengembangan: Upload gambar asli minuman dan makanan, Penggeser korsel, Foto resolusi HD dari penyimpanan atau aset
6️⃣ Sistem Promo & Voucher
Tujuan: menarik lebih banyak pelanggan.
Fitur: Kode voucher (DISKON10), Beli 1 Gratis 1, Promo ongkir, Happy hour (diskon jam tertentu)
7️⃣ Basis Data & Backend (Firestore / MySQL + API)
Saat ini data masih “statik” di satu file.
Pengembangan berikutnya: Data produk dari database, Keranjang tersimpan di server, Pesanan terkirim ke backend, Admin bisa update harga & stok
8️⃣ Mode Admin untuk Pengelola Toko
Tujuan: pemilik usaha bisa mengelola aplikasi.
Fitur admin: Produk CRUD (Menu Tambah/Edit/Hapus), Lihat semua pesanan masuk, Ubah status pesanan, Laporan penjualan harian/bulanan, Ekspor ke Excel / PDF
9️⃣ Mode Gelap
Tema gelap agar lebih nyaman di malam hari.
Fitur: Beralih mode gelap/terang, Simpan tema preferensi di penyimpanan lokal
🔟 Notifikasi
Agar pengguna mengetahui jika pesanan berubah status.
Contoh: “Pesan kamu sedang diproses!”, “Pesanan telah selesai.”
1️⃣1️⃣ Google Maps (Pilihan Lokasi Pengiriman)
Tujuan: jika ingin menambah fitur pengiriman. User pilih titik lokasi, Perhitungan ongkir otomatis berdasarkan jarak, Simpan alamat favorit
1️⃣2️⃣ Multi Bahasa
Menambah bahasa Inggris / Indonesia.
1️⃣3️⃣ UI/UX Material Modern Anda
Biar terlihat aplikasi premium: Animasi halus, Bilah navigasi bawah, Kartu 3D, Desain lebih profesional
KESIMPULAN RENCANA PENGEMBANGAN
Aplikasi ini masih dalam tahap pemesanan dasar , namun memiliki potensi untuk dikembangkan menjadi aplikasi pemesanan profesional dengan fitur:
✔ Backend dan database
✔ Sistem pembayaran
✔ Manajemen pesanan lengkap
✔ Mode admin
✔ Custom topping
✔ Notifikasi & peta
