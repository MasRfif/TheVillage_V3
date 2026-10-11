<?php

namespace Database\Seeders;

use App\Models\Kategori;
use Illuminate\Database\Seeder;

class KategoriSeeder extends Seeder
{
    /** Data referensi kategori acara desa (10 baris) */
    public function run(): void
    {
        $data = [
            ['nama' => 'Pengajian',        'icon' => 'landmark'],
            ['nama' => 'Acara 17 Agustus', 'icon' => 'flag'],
            ['nama' => 'Kerja Bakti',      'icon' => 'sparkles'],
            ['nama' => 'Posyandu',         'icon' => 'stethoscope'],
            ['nama' => 'Bazar UMKM',       'icon' => 'shopping-cart'],
            ['nama' => 'Rapat RT/RW',      'icon' => 'message-circle'],
            ['nama' => 'Musyawarah Desa',  'icon' => 'handshake'],
            ['nama' => 'Lomba Desa',       'icon' => 'trophy'],
            ['nama' => 'Karang Taruna',    'icon' => 'users'],
            ['nama' => 'Festival Desa',    'icon' => 'party-popper'],
        ];

        foreach ($data as $row) {
            Kategori::create($row);
        }
    }
}
