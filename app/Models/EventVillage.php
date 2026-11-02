<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class EventVillage extends Model
{
    protected $fillable = [
        'nama_event',
        'deskripsi',
        'tanggal',
        'poster',
    ];

    protected function casts(): array
    {
        return [
            'tanggal' => 'date',
        ];
    }
}