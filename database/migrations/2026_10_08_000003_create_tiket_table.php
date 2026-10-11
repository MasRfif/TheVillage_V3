<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('tiket', function (Blueprint $table) {
            $table->id();
            $table->foreignId('acara_id')->constrained('acara')->cascadeOnDelete();
            $table->string('nama_tiket');
            $table->string('nama_kategori', 50);            // Reguler / VIP / Umum
            $table->unsignedInteger('harga')->default(0);   // 0 = gratis
            $table->integer('qty');                         // sisa kuota
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('tiket');
    }
};
