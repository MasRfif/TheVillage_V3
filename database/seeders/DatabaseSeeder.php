<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * php artisan db:seed  atau  php artisan migrate:fresh --seed
     * Urutan penting: kategori -> acara -> tiket & testimoni (karena foreign key).
     */
    public function run(): void
    {
        $this->call([
            UserSeeder::class,
            KategoriSeeder::class,
            AcaraSeeder::class,
            TiketSeeder::class,
            TestimoniSeeder::class,
        ]);
    }
}
