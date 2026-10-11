<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Tiket extends Model
{
    protected $table = 'tiket';

    protected $fillable = ['acara_id', 'nama_tiket', 'nama_kategori', 'harga', 'qty'];

    public function acara(): BelongsTo
    {
        return $this->belongsTo(Acara::class, 'acara_id');
    }
}
