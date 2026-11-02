<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('event_villages', function (Blueprint $table) {
            $table->id();
            $table->string('nama_event');
            $table->text('deskripsi');
            $table->date('tanggal');
            $table->string('poster')->nullable();
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('event_villages');
    }
};