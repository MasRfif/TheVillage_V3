<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('acara', function (Blueprint $table) {
            $table->id();
            $table->foreignId('kategori_id')->constrained('kategori')->cascadeOnDelete();
            $table->string('nama_event');
            $table->text('deskripsi');
            $table->date('tanggal_mulai');
            $table->date('tanggal_selesai');
            $table->string('jenis_event', 20)->default('GRATIS');       // GRATIS / BERBAYAR
            $table->string('status_event', 20)->default('PENDING');     // PENDING / PUBLISHED / REJECTED
            $table->integer('max_peserta');
            $table->string('nama_tempat');
            $table->string('nama_desa');
            $table->string('kabupaten');
            $table->string('map_popup_desc')->nullable();
            $table->string('image')->nullable();
            $table->string('organizer_name');
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('acara');
    }
};
