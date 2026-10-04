<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Models\Admin\Product;
use Illuminate\Support\Str;
use Auth;
use Illuminate\Http\Request;

class FrontendController extends Controller
{
    public function home()
    {
        return view('frontend.pages.home');
    }

    public function allProducts()
    {
        $products = Product::with([
            'price',
            'category',
            'inventory',
            'brand',
        ])
            ->where('is_published', 1)
            ->latest()
            ->paginate(20);

        foreach ($products as $product) {

            $regular = (float) ($product->price->regular_price ?? 0);

            $sale = $product->price->sale_price !== null
                ? (float) $product->price->sale_price
                : null;

            $current = ($sale !== null && $sale < $regular)
                ? $sale
                : $regular;

            $product->display_price = $current;
            $product->display_regular_price = $regular;

            $product->discount_percentage = (
                $regular > 0 && $current < $regular
            )
                ? round((($regular - $current) / $regular) * 100)
                : 0;

            $product->thumbnail_url = $product->thumbnail
                ? uploaded_asset($product->thumbnail)
                : null;

            $product->stock = (int) ($product->inventory->stock ?? 0);
            $product->in_stock = $product->stock > 0;
        }

        return view('frontend.pages.all-products', compact('products')); // productImage
    }

    public function productDetail($slug)
    {
        $product = Product::with([
            'price',
            'category',
            'subcategory',
            'brand',
            'inventory',
            'shipping',
            'seo',
            'taxes',
            'variants.attributeRel',
            'reviews.user',
            'reviews.dummyReview',
        ])
            ->where('slug', $slug)
            ->where('is_published', 1)
            ->firstOrFail();

        $photoIds = [];

        if (!empty($product->photos)) {
            $photoIds = is_array($product->photos)
                ? $product->photos
                : json_decode($product->photos, true);

            $photoIds = is_array($photoIds) ? $photoIds : [];
        }

        $thumbnail = $product->thumbnail
            ? uploaded_asset($product->thumbnail)
            : null;

        $galleryImages = [];

        foreach ($photoIds as $photoId) {
            if (!$photoId) {
                continue;
            }

            if ((string) $photoId === (string) $product->thumbnail) {
                continue;
            }

            $image = uploaded_asset($photoId);

            if ($image) {
                $galleryImages[] = $image;
            }
        }

        $regularPrice = (float) ($product->price->regular_price ?? 0);

        $salePrice = $product->price->sale_price !== null
            ? (float) $product->price->sale_price
            : null;

        $currentPrice = ($salePrice !== null && $salePrice < $regularPrice)
            ? $salePrice
            : $regularPrice;

        $discountPercentage = 0;

        if ($regularPrice > 0 && $currentPrice < $regularPrice) {
            $discountPercentage = round(
                (($regularPrice - $currentPrice) / $regularPrice) * 100
            );
        }

        $savingAmount = max(0, $regularPrice - $currentPrice);

        $stock = (int) ($product->inventory->stock ?? 0);

        $inStock = $stock > 0;

        $reviews = $product->reviews ?? collect();

        $reviewCount = $reviews->count();

        $averageRating = $reviewCount > 0
            ? round((float) $reviews->avg('rating'), 1)
            : 0;

        $variants = $product->variants->map(function ($variant) {
            $label = '';

            if (!empty($variant->attribute_value)) {
                $decoded = json_decode($variant->attribute_value, true);

                if (is_array($decoded)) {
                    $label = implode(' / ', array_values($decoded));
                } else {
                    $label = (string) $variant->attribute_value;
                }
            }

            if (empty($label)) {
                $label = optional($variant->attributeRel)->name ?? 'Option';
            }

            return [
                'id'    => $variant->id,
                'label' => $label,
                'price' => (float) $variant->price,
                'stock' => (int) $variant->quantity,
                'sku'   => $variant->sku,
            ];
        });

        $relatedProducts = Product::with([
            'price',
            'category',
            'inventory',
            'brand',
            'reviews',
        ])
            ->where('is_published', 1)
            ->where('id', '!=', $product->id)
            ->where('category_id', $product->category_id)
            ->latest()
            ->take(8)
            ->get();

        foreach ($relatedProducts as $relatedProduct) {
            $relatedRegular = (float) ($relatedProduct->price->regular_price ?? 0);

            $relatedSale = $relatedProduct->price->sale_price !== null
                ? (float) $relatedProduct->price->sale_price
                : null;

            $relatedCurrent = ($relatedSale !== null && $relatedSale < $relatedRegular)
                ? $relatedSale
                : $relatedRegular;

            $relatedProduct->display_price = $relatedCurrent;
            $relatedProduct->display_regular_price = $relatedRegular;

            $relatedProduct->discount_percentage = (
                $relatedRegular > 0 && $relatedCurrent < $relatedRegular
            )
                ? round((($relatedRegular - $relatedCurrent) / $relatedRegular) * 100)
                : 0;

            $relatedProduct->average_rating = $relatedProduct->reviews->count()
                ? round((float) $relatedProduct->reviews->avg('rating'), 1)
                : 0;

            $relatedProduct->review_count = $relatedProduct->reviews->count();

            $relatedProduct->thumbnail_url = $relatedProduct->thumbnail
                ? uploaded_asset($relatedProduct->thumbnail)
                : null;
        }

        return view(
            'frontend.pages.product-detail',
            compact(
                'product',
                'thumbnail',
                'galleryImages',
                'regularPrice',
                'salePrice',
                'currentPrice',
                'discountPercentage',
                'savingAmount',
                'stock',
                'inStock',
                'reviews',
                'reviewCount',
                'averageRating',
                'variants',
                'relatedProducts'
            )
        );
    }
}
