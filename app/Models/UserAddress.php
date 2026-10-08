<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class UserAddress extends Model
{
    protected $fillable = [
        'user_id',
        'label',
        'name',
        'phone',
        'address',
        'area',
        'city',
        'postcode',
        'is_active',
        'is_default',
    ];

    protected $casts = [
        'is_active'  => 'boolean',
        'is_default' => 'boolean',
    ];

    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class);
    }

    /* ---------- Scopes ---------- */

    public function scopeActive($q)
    {
        return $q->where('is_active', true);
    }

    public function scopeForUser($q, int $userId)
    {
        return $q->where('user_id', $userId);
    }

    /* ---------- Helpers ---------- */

    public function setAsDefault(): void
    {
        static::forUser($this->user_id)->update(['is_default' => false]);

        $this->update([
            'is_default' => true,
            'is_active'  => true, // default must always be active
        ]);
    }
}
