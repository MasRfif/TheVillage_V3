<?php

namespace Database\Seeders;

use App\Models\Acara;
use App\Models\Testimoni;
use Faker\Factory as Faker;
use Illuminate\Database\Seeder;

class TestimoniSeeder extends Seeder
{
    /** Membuat 20 testimoni dummy untuk acara yang sudah tayang */
    public function run(): void
    {
        $faker = Faker::create('id_ID');

        $acaraIds = Acara::where('status_event', 'PUBLISHED')->pluck('id')->all();

        $teks = [
            'Eventnya menarik dan informasinya jelas.',
            'Acaranya meriah, panitia ramah dan sigap.',
            'Mudah ditemukan lewat peta, lokasinya nyaman.',
            'Pendaftaran dan tiketnya praktis, tidak ribet.',
            'Seru banget, semoga rutin diadakan setiap bulan.',
        ];

        for ($i = 0; $i < 20; $i++) {
            Testimoni::create([
                'acara_id' => $faker->randomElement($acaraIds),
                'nama'     => $faker->name,
                'rating'   => $faker->numberBetween(3, 5),
                'teks'     => $faker->randomElement($teks),
            ]);
        }
    }
}
