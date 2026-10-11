<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Acara extends Model
{
    protected $table = 'acara';

    protected $fillable = [
        'kategori_id', 'nama_event', 'deskripsi',
        'tanggal_mulai', 'tanggal_selesai',
        'jenis_event', 'status_event', 'max_peserta',
        'nama_tempat', 'nama_desa', 'kabupaten', 'map_popup_desc',
        'image', 'organizer_name',
    ];

    /** Satu acara dimiliki satu kategori */
    public function kategori(): BelongsTo
    {
        return $this->belongsTo(Kategori::class, 'kategori_id');
    }

    /** Satu acara punya banyak jenis tiket */
    public function tickets(): HasMany
    {
        return $this->hasMany(Tiket::class, 'acara_id');
    }

    public function testimoni(): HasMany
    {
        return $this->hasMany(Testimoni::class, 'acara_id');
    }

    /** Dipakai view sebagai $event['nama_category'] */
    public function getNamaCategoryAttribute(): ?string
    {
        return $this->kategori?->nama;
    }
}
