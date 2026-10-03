<?php

namespace App\Data;

use Carbon\Carbon;

/**
 * Data contoh The Village (diambil dari the_village.sql).
 * Dipakai sebagai pengganti database supaya fokus tugas ke Blade.
 */
class VillageData
{
    public static function rupiah($nilai): string
    {
        return ((float) $nilai) == 0 ? 'GRATIS' : 'Rp ' . number_format((float) $nilai, 0, ',', '.');
    }

    public static function tanggal($tgl, string $format = 'l, j F Y'): string
    {
        return $tgl ? Carbon::parse($tgl)->locale('id')->translatedFormat($format) : '';
    }

    public static function categories(): array
    {
        return [
            ['id' => 1, 'nama' => 'Pengajian', 'icon' => 'landmark'],
            ['id' => 2, 'nama' => 'Acara 17 Agustus', 'icon' => 'flag'],
            ['id' => 3, 'nama' => 'Kerja Bakti', 'icon' => 'sparkles'],
            ['id' => 4, 'nama' => 'Posyandu', 'icon' => 'stethoscope'],
            ['id' => 5, 'nama' => 'Bazar UMKM', 'icon' => 'shopping-cart'],
            ['id' => 6, 'nama' => 'Rapat RT/RW', 'icon' => 'message-circle'],
            ['id' => 7, 'nama' => 'Musyawarah Desa', 'icon' => 'handshake'],
            ['id' => 8, 'nama' => 'Lomba Desa', 'icon' => 'trophy'],
            ['id' => 9, 'nama' => 'Karang Taruna', 'icon' => 'users'],
            ['id' => 10, 'nama' => 'Festival Desa', 'icon' => 'party-popper'],
        ];
    }

    public static function cities(): array
    {
        return ['Bandung', 'Bekasi'];
    }

    public static function events(array $filter = []): array
    {
        $semua = [
            [
                'id' => 1, 'nama_event' => 'Festival 17 Agustus Desa', 'nama_category' => 'Acara 17 Agustus',
                'deskripsi' => 'Perayaan kemerdekaan dengan lomba warga, bazar UMKM, dan panggung hiburan.',
                'tanggal_mulai' => '2026-08-17', 'tanggal_selesai' => '2026-08-17',
                'jenis_event' => 'BERBAYAR', 'status_event' => 'PUBLISHED', 'max_peserta' => 500,
                'nama_tempat' => 'Lapangan Desa Sukamaju', 'nama_desa' => 'Desa Sukamaju', 'kabupaten' => 'Bandung',
                'map_popup_desc' => 'Kegiatan utama berada di area lapangan desa.',
                'image' => '17 agus.jpg', 'organizer_name' => 'Rafi Organizer',
                'tickets' => [
                    ['id' => 1, 'nama_tiket' => 'Reguler Festival', 'nama_kategori' => 'Reguler', 'harga' => 25000, 'qty' => 250],
                    ['id' => 2, 'nama_tiket' => 'VIP Festival', 'nama_kategori' => 'VIP', 'harga' => 75000, 'qty' => 49],
                ],
            ],
            [
                'id' => 2, 'nama_event' => 'Pengajian Akbar Jumat Berkah', 'nama_category' => 'Pengajian',
                'deskripsi' => 'Pengajian warga desa dengan penceramah lokal dan konsumsi bersama.',
                'tanggal_mulai' => '2026-06-14', 'tanggal_selesai' => '2026-06-14',
                'jenis_event' => 'GRATIS', 'status_event' => 'PUBLISHED', 'max_peserta' => 300,
                'nama_tempat' => 'Balai Desa Sukamaju', 'nama_desa' => 'Desa Sukamaju', 'kabupaten' => 'Bandung',
                'map_popup_desc' => 'Lokasi acara administratif dan musyawarah.',
                'image' => 'pengajian.avif', 'organizer_name' => 'Rafi Organizer',
                'tickets' => [
                    ['id' => 3, 'nama_tiket' => 'Tiket Pengajian Gratis', 'nama_kategori' => 'Umum', 'harga' => 0, 'qty' => 300],
                ],
            ],
            [
                'id' => 3, 'nama_event' => 'Kerja Bakti RW 02', 'nama_category' => 'Kerja Bakti',
                'deskripsi' => 'Kegiatan bersih lingkungan dan penataan taman warga.',
                'tanggal_mulai' => '2026-06-21', 'tanggal_selesai' => '2026-06-21',
                'jenis_event' => 'GRATIS', 'status_event' => 'PUBLISHED', 'max_peserta' => 200,
                'nama_tempat' => 'Aula RW 02', 'nama_desa' => 'Desa Sukamaju', 'kabupaten' => 'Bandung',
                'map_popup_desc' => 'Lokasi acara warga RW 02.',
                'image' => 'gotong royong.jpg', 'organizer_name' => 'Rafi Organizer',
                'tickets' => [
                    ['id' => 4, 'nama_tiket' => 'Tiket Kerja Bakti', 'nama_kategori' => 'Umum', 'harga' => 0, 'qty' => 199],
                ],
            ],
            [
                'id' => 4, 'nama_event' => 'Bazar UMKM Desa', 'nama_category' => 'Bazar UMKM',
                'deskripsi' => 'Bazar produk makanan, pakaian, dan kerajinan warga.',
                'tanggal_mulai' => '2026-07-05', 'tanggal_selesai' => '2026-07-05',
                'jenis_event' => 'BERBAYAR', 'status_event' => 'PUBLISHED', 'max_peserta' => 400,
                'nama_tempat' => 'Lapangan Desa Sukamaju', 'nama_desa' => 'Desa Sukamaju', 'kabupaten' => 'Bandung',
                'map_popup_desc' => 'Kegiatan utama berada di area lapangan desa.',
                'image' => 'jalan sehat.jpg', 'organizer_name' => 'Rafi Organizer',
                'tickets' => [
                    ['id' => 5, 'nama_tiket' => 'Tiket Bazar Umum', 'nama_kategori' => 'Umum', 'harga' => 10000, 'qty' => 397],
                ],
            ],
            // Dua event tambahan (contoh) supaya filter kota/kategori terlihat bekerja
            [
                'id' => 5, 'nama_event' => 'Lomba Dangdut Warga', 'nama_category' => 'Lomba Desa',
                'deskripsi' => 'Lomba menyanyi dangdut antarwarga dengan hadiah menarik.',
                'tanggal_mulai' => '2026-09-12', 'tanggal_selesai' => '2026-09-12',
                'jenis_event' => 'BERBAYAR', 'status_event' => 'PUBLISHED', 'max_peserta' => 250,
                'nama_tempat' => 'Balai Desa Citrajaya', 'nama_desa' => 'Desa Citrajaya', 'kabupaten' => 'Bekasi',
                'map_popup_desc' => 'Panggung terbuka di depan balai desa.',
                'image' => 'dangdut.jpg', 'organizer_name' => 'Rafi Organizer',
                'tickets' => [
                    ['id' => 6, 'nama_tiket' => 'Tiket Penonton', 'nama_kategori' => 'Umum', 'harga' => 15000, 'qty' => 120],
                ],
            ],
            [
                'id' => 6, 'nama_event' => 'Posyandu Balita Ceria', 'nama_category' => 'Posyandu',
                'deskripsi' => 'Pemeriksaan kesehatan balita dan penyuluhan gizi untuk orang tua.',
                'tanggal_mulai' => '2026-10-20', 'tanggal_selesai' => '2026-10-20',
                'jenis_event' => 'GRATIS', 'status_event' => 'PENDING', 'max_peserta' => 80,
                'nama_tempat' => 'Balai Desa Mekarsari', 'nama_desa' => 'Desa Mekarsari', 'kabupaten' => 'Bandung',
                'map_popup_desc' => 'Ruang pertemuan lantai satu.',
                'image' => 'image.png', 'organizer_name' => 'Rafi Organizer',
                'tickets' => [],
            ],
        ];

        $hasil = array_values(array_filter($semua, function ($e) use ($filter) {
            if (!empty($filter['published']) && $e['status_event'] !== 'PUBLISHED') return false;
            if (!empty($filter['tag']) && $filter['tag'] !== 'Semua' && $e['nama_category'] !== $filter['tag']) return false;
            if (!empty($filter['city']) && $filter['city'] !== 'Semua Kota' && $e['kabupaten'] !== $filter['city']) return false;
            if (!empty($filter['q'])) {
                $q = mb_strtolower($filter['q']);
                $gabung = mb_strtolower($e['nama_event'] . ' ' . $e['nama_tempat'] . ' ' . $e['nama_desa'] . ' ' . $e['kabupaten']);
                if (!str_contains($gabung, $q)) return false;
            }
            return true;
        }));

        return $hasil;
    }

    public static function event(int $id): ?array
    {
        foreach (self::events() as $e) {
            if ($e['id'] === $id) return $e;
        }
        return null;
    }

    /** Cari tiket + event pemiliknya */
    public static function ticket(int $ticketId): ?array
    {
        foreach (self::events() as $e) {
            foreach ($e['tickets'] as $t) {
                if ($t['id'] === $ticketId) return ['event' => $e, 'ticket' => $t];
            }
        }
        return null;
    }

    public static function faqs(): array
    {
        return [
            ['pertanyaan' => 'Apakah bisa bayar di tempat?', 'jawaban' => 'Bisa, pilih metode Bayar di Tempat saat checkout.'],
            ['pertanyaan' => 'Apakah event gratis tetap punya tiket?', 'jawaban' => 'Ya, event gratis tetap menerbitkan tiket dengan harga 0.'],
            ['pertanyaan' => 'Siapa yang memverifikasi event?', 'jawaban' => 'Event diverifikasi Admin BG atau dapat divalidasi otomatis oleh sistem.'],
        ];
    }

    public static function paymentMethods(): array
    {
        return [
            ['id' => 1, 'nama' => 'QRIS', 'tipe' => 'QRIS', 'icon' => 'wallet', 'ket' => 'QR mockup'],
            ['id' => 2, 'nama' => 'BCA Mobile Banking', 'tipe' => 'MBANKING', 'icon' => 'credit-card', 'ket' => 'Instruksi transfer'],
            ['id' => 3, 'nama' => 'Bayar di Tempat', 'tipe' => 'COD', 'icon' => 'banknote', 'ket' => 'Bayar di lokasi'],
            ['id' => 4, 'nama' => 'Mandiri Mobile Banking', 'tipe' => 'MBANKING', 'icon' => 'credit-card', 'ket' => 'Instruksi transfer'],
        ];
    }

    public static function paymentMethod(int $id): ?array
    {
        foreach (self::paymentMethods() as $m) {
            if ($m['id'] === $id) return $m;
        }
        return null;
    }

    public static function testimonials(): array
    {
        return [
            ['nama' => 'Naufal User', 'event' => 'Festival 17 Agustus Desa', 'rating' => 5, 'teks' => 'Eventnya menarik dan informasinya jelas.'],
            ['nama' => 'Naufal User', 'event' => 'Pengajian Akbar Jumat Berkah', 'rating' => 5, 'teks' => 'Pengajian mudah ditemukan lewat map.'],
        ];
    }

    public static function users(): array
    {
        // Password semua akun demo: "password"
        return [
            'user@village.test' => ['nama_awal' => 'Naufal', 'nama_akhir' => 'User', 'email' => 'user@village.test', 'nama_role' => 'USER'],
            'organizer@village.test' => ['nama_awal' => 'Rafi', 'nama_akhir' => 'Organizer', 'email' => 'organizer@village.test', 'nama_role' => 'PENYELENGGARA'],
            'admin@village.test' => ['nama_awal' => 'Admin', 'nama_akhir' => 'BG', 'email' => 'admin@village.test', 'nama_role' => 'ADMIN_BG'],
        ];
    }

    public static function myTickets(): array
    {
        return [
            ['nama_event' => 'Kerja Bakti RW 02', 'nama_tiket' => 'Tiket Kerja Bakti', 'kode_tiket' => 'TV-08AE1484-1', 'tanggal' => '2026-06-02', 'status' => 'VALID'],
            ['nama_event' => 'Bazar UMKM Desa', 'nama_tiket' => 'Tiket Bazar Umum', 'kode_tiket' => 'TV-1871675C-1', 'tanggal' => '2026-06-02', 'status' => 'BELUM_BAYAR'],
        ];
    }

    public static function transactions(): array
    {
        return [
            ['id' => 3, 'tanggal' => '2026-06-02 18:29:09', 'status' => 'GRATIS', 'total' => 0, 'nama_event' => 'Kerja Bakti RW 02', 'nama_tiket' => 'Tiket Kerja Bakti', 'jumlah' => 1, 'metode' => 3, 'kode' => 'PAY-0003'],
            ['id' => 2, 'tanggal' => '2026-06-02 18:22:06', 'status' => 'PENDING', 'total' => 20000, 'nama_event' => 'Bazar UMKM Desa', 'nama_tiket' => 'Tiket Bazar Umum', 'jumlah' => 2, 'metode' => 1, 'kode' => 'PAY-0002'],
        ];
    }

    public static function dashboardStats(): array
    {
        return [
            ['label' => 'Total Acara', 'nilai' => '6', 'sub' => '5 tayang, 1 menunggu'],
            ['label' => 'Tiket Terjual', 'nilai' => '1.130', 'sub' => 'semua acara'],
            ['label' => 'Pendapatan', 'nilai' => 'Rp 9,4 jt', 'sub' => 'estimasi'],
            ['label' => 'Pengguna', 'nilai' => '8', 'sub' => 'terdaftar'],
        ];
    }
}
