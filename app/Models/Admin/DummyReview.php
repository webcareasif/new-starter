<?php

namespace App\Models\Admin;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DummyReview extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'avatar',
        'rating',
        'comment',
        'status',
        'sort_order',
    ];

    protected $casts = [
        'status' => 'boolean',
        'rating' => 'integer',
        'sort_order' => 'integer',
    ];

    public function products()
    {
        return $this->belongsToMany(Product::class, 'reviews', 'dummy_review_id', 'product_id');
    }

    /**
     * Real review rows created from this template
     */
    public function reviews()
    {
        return $this->hasMany(Review::class, 'dummy_review_id');
    }

    /**
     * Make the product's admin-created reviews match $ids: selected ones become
     * real approved reviews (no login / purchase checks), unselected ones are removed.
     */
    public static function syncToProduct($productId, array $ids)
    {
        $ids = static::whereIn('id', $ids)->pluck('id')->all();

        Review::where('product_id', $productId)
            ->whereNotNull('dummy_review_id')
            ->whereNotIn('dummy_review_id', $ids)
            ->delete();

        $existing = Review::where('product_id', $productId)
            ->whereIn('dummy_review_id', $ids)
            ->pluck('dummy_review_id')
            ->all();

        foreach (static::whereIn('id', array_diff($ids, $existing))->get() as $dummy) {
            Review::create([
                'product_id'      => $productId,
                'user_id'         => null,
                'dummy_review_id' => $dummy->id,
                'rating'          => $dummy->rating,
                'comment'         => $dummy->comment,
                'status'          => true,
                'is_read'         => true,
            ]);
        }
    }

    public function scopeActive($query)
    {
        return $query->where('status', 1);
    }

    public function getRatingStarsAttribute()
    {
        $stars = '';
        for ($i = 1; $i <= 5; $i++) {
            $stars .= $i <= $this->rating
                ? '<i class="las la-star text-warning"></i>'
                : '<i class="lar la-star text-muted"></i>';
        }
        return $stars;
    }
}
