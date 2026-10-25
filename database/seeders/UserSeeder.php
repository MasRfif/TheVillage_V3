<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class UserSeeder extends Seeder
{
    public function run(): void
    {
        User::updateOrCreate(
            ['email' => 'admin@village.test'],
            ['name' => 'Admin BG', 'password' => Hash::make('password'), 'role' => 'ADMIN_BG']
        );

        User::updateOrCreate(
            ['email' => 'organizer@village.test'],
            ['name' => 'Rafi Organizer', 'password' => Hash::make('password'), 'role' => 'PENYELENGGARA']
        );

        User::updateOrCreate(
            ['email' => 'user@village.test'],
            ['name' => 'Naufal User', 'password' => Hash::make('password'), 'role' => 'USER']
        );

        User::factory()->count(5)->create(['role' => 'USER']);
    }
}