<?php

namespace Database\Seeders;

use App\Models\Acara;
use App\Models\Kategori;
use Carbon\Carbon;
use Faker\Factory as Faker;
use Illuminate\Database\Seeder;

class AcaraSeeder extends Seeder
{
    /** Membuat 15 acara dummy dengan Faker (locale id_ID) */
    public function run(): void
    {
        $faker = Faker::create('id_ID');

        $kategoriIds = Kategori::pluck('id')->all();

        $jenisAcara = ['Festival', 'Lomba', 'Bazar', 'Pengajian Akbar', 'Kerja Bakti', 'Posyandu', 'Musyawarah', 'Karnaval', 'Turnamen', 'Senam Sehat'];
        $sebutan    = ['Desa', 'Warga', 'RW 02', 'RT 05', 'Karang Taruna', 'Kampung'];
        $deskripsi  = [
            'Kegiatan rutin warga untuk mempererat kebersamaan dan gotong royong.',
            'Acara terbuka bagi seluruh warga dengan berbagai hiburan dan hadiah menarik.',
            'Pelaksanaan kegiatan dipandu panitia desa dan didukung para relawan.',
            'Warga diharapkan hadir tepat waktu dan membawa perlengkapan masing-masing.',
            'Kesempatan memperkenalkan produk lokal dan potensi desa kepada pengunjung.',
        ];
        $tempat   = ['Balai Desa', 'Lapangan Desa', 'Aula RW', 'Masjid Al-Ikhlas', 'Gedung Serbaguna', 'Pendopo Kecamatan'];
        $desa     = ['Sukamaju', 'Citrajaya', 'Mekarsari', 'Sukaresmi', 'Cibiru Wetan'];
        // Gambar lokal (public/assets). Acara bernomor ganjil memakai gambar dari internet (Picsum).
        // Kalau gambar internet gagal dimuat (offline), tampilan otomatis memakai public/assets/placeholder.svg
        $gambarLokal = ['17 agus.jpg', 'pengajian.avif', 'gotong royong.jpg', 'jalan sehat.jpg', 'dangdut.jpg', 'image.png'];

        for ($i = 0; $i < 15; $i++) {
            $mulai   = Carbon::instance($faker->dateTimeBetween('now', '+4 months'));
            $selesai = $mulai->copy()->addDays($faker->numberBetween(0, 2));
            $namaDesa = $faker->randomElement($desa);

            Acara::create([
                'kategori_id'     => $faker->randomElement($kategoriIds),
                'nama_event'      => $faker->randomElement($jenisAcara) . ' ' . $faker->randomElement($sebutan) . ' ' . $namaDesa,
                'deskripsi'       => $faker->randomElement($deskripsi),
                'tanggal_mulai'   => $mulai->format('Y-m-d'),
                'tanggal_selesai' => $selesai->format('Y-m-d'),
                'jenis_event'     => $faker->randomElement(['GRATIS', 'BERBAYAR']),
                // 12 acara pertama tayang, sisanya menunggu / ditolak
                'status_event'    => $i < 12 ? 'PUBLISHED' : $faker->randomElement(['PENDING', 'REJECTED']),
                'max_peserta'     => $faker->numberBetween(50, 500),
                'nama_tempat'     => $faker->randomElement($tempat) . ' ' . $namaDesa,
                'nama_desa'       => 'Desa ' . $namaDesa,
                'kabupaten'       => $faker->randomElement(['Bandung', 'Bekasi']),
                'map_popup_desc'  => $faker->streetAddress,
                'image'           => $i % 2 === 0
                    ? $gambarLokal[($i / 2) % count($gambarLokal)]
                    : 'https://picsum.photos/seed/village-' . ($i + 1) . '/800/500',
                'organizer_name'  => $faker->name,
            ]);
        }
    }
}
