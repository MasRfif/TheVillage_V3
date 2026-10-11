<?php

namespace Database\Seeders;

use App\Models\Acara;
use App\Models\Tiket;
use Faker\Factory as Faker;
use Illuminate\Database\Seeder;

class TiketSeeder extends Seeder
{
    /** Membuat tiket untuk setiap acara (acara gratis 1 tiket, berbayar 1-3 tiket) */
    public function run(): void
    {
        $faker = Faker::create('id_ID');

        foreach (Acara::all() as $acara) {
            if ($acara->jenis_event === 'GRATIS') {
                Tiket::create([
                    'acara_id'      => $acara->id,
                    'nama_tiket'    => 'Tiket ' . $acara->nama_event,
                    'nama_kategori' => 'Umum',
                    'harga'         => 0,
                    'qty'           => $faker->numberBetween(30, $acara->max_peserta),
                ]);
                continue;
            }

            $jenis = $faker->randomElements(['Reguler', 'VIP', 'Early Bird'], $faker->numberBetween(1, 3));
            foreach ($jenis as $nama) {
                Tiket::create([
                    'acara_id'      => $acara->id,
                    'nama_tiket'    => $nama . ' ' . $acara->nama_event,
                    'nama_kategori' => $nama,
                    'harga'         => $faker->randomElement([10000, 15000, 25000, 50000, 75000, 100000]),
                    'qty'           => $faker->numberBetween(20, 300),
                ]);
            }
        }
    }
}
