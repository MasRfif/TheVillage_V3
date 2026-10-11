<?php

namespace App\Data;

use Carbon\Carbon;

/**
 * Data statis pendukung The Village (FAQ, metode pembayaran, akun demo, contoh tiket/transaksi).
 * Data acara, kategori, tiket, dan testimoni kini berasal dari database lewat model Eloquent.
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
}
