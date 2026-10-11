<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Testimoni extends Model
{
    protected $table = 'testimoni';

    protected $fillable = ['acara_id', 'nama', 'rating', 'teks'];

    public function acara(): BelongsTo
    {
        return $this->belongsTo(Acara::class, 'acara_id');
    }
}
