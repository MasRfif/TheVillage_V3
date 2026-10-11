<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Kategori extends Model
{
    protected $table = 'kategori';

    protected $fillable = ['nama', 'icon'];

    public function acara(): HasMany
    {
        return $this->hasMany(Acara::class, 'kategori_id');
    }
}
