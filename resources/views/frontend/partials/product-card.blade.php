@php
    /* ---------- Price ---------- */
    $regularPrice = (float) optional($product->price)->regular_price;
    $saleRaw = optional($product->price)->sale_price;
    $salePrice =
        $saleRaw !== null && (float) $saleRaw > 0 && (float) $saleRaw < $regularPrice
            ? (float) $saleRaw
            : $regularPrice;

    /* ---------- Basics ---------- */
    $productName = $product->name ?? 'Product';
    $productUrl = route('frontend.product-details', $product->slug);
    $productCat = optional($product->category)->category_name ?? 'Product';
    $productImage = $product->thumbnail ? uploaded_asset($product->thumbnail) : null;

    /* ---------- Variants ---------- */
    $hasVariants = $product->variants && $product->variants->count() > 0;

    $variantsJson = $hasVariants
        ? $product->variants
            ->map(function ($v) {
                $decoded = is_array($v->attribute_value)
                    ? $v->attribute_value
                    : (!empty($v->attribute_value)
                        ? json_decode($v->attribute_value, true)
                        : null);

                $label = is_array($decoded)
                    ? implode(' / ', array_values($decoded))
                    : optional($v->attributeRel)->name ?? 'Option';

                return [
                    'id' => $v->id,
                    'label' => $label,
                    'price' => (float) $v->price,
                    'stock' => (int) $v->quantity,
                    'sku' => $v->sku,
                    'image' => !empty($v->image) ? uploaded_asset($v->image) : null,
                    'attributes' => is_array($decoded) ? $decoded : [],
                ];
            })
            ->values()
            ->toArray()
        : [];

    /* ---------- Display price (variant range) ---------- */
    $displayPrice = $salePrice;
    $displayPriceMax = $salePrice;
    $hasPriceRange = false;

    if ($hasVariants) {
        $vp = array_filter(array_column($variantsJson, 'price'), fn($p) => $p > 0);
        if (count($vp)) {
            $displayPrice = min($vp);
            $displayPriceMax = max($vp);
            $hasPriceRange = $displayPriceMax > $displayPrice;
        }
    }

    $showStrikePrice = $regularPrice > 0 && $regularPrice > $displayPrice;
    $discountPercentage = $showStrikePrice ? round((($regularPrice - $displayPrice) / $regularPrice) * 100) : 0;

    /* ---------- Stock ---------- */
    $productInStock = $hasVariants
        ? collect($variantsJson)->sum('stock') > 0
        : (int) optional($product->inventory)->stock > 0;

    /* ---------- Reviews ---------- */
    $reviewCount = $product->reviews ? $product->reviews->count() : 0;
    $averageRating = $reviewCount > 0 ? round((float) $product->reviews->avg('rating'), 1) : 0;
@endphp

<article class="card pcard overflow-hidden flex flex-col {{ $cardClass ?? '' }}">

    {{-- Image --}}
    <div class="relative pimg aspect-square overflow-hidden bg-slate-100">
        <a href="{{ $productUrl }}" class="block w-full h-full">
            @if ($productImage)
                <img src="{{ $productImage }}" alt="{{ $productName }}" width="400" height="400" loading="lazy"
                    class="w-full h-full object-cover">
            @else
                <div class="w-full h-full grid place-items-center text-slate-400">No Image</div>
            @endif
        </a>

        @if ($discountPercentage > 0)
            <span
                class="absolute left-2.5 top-2.5 z-10 bg-[#e5383b] text-white text-[11px] font-semibold px-2 py-0.5 rounded-md">
                -{{ $discountPercentage }}%
            </span>
        @endif

        <button type="button"
            class="wish absolute right-2.5 top-2.5 z-10 w-8 h-8 rounded-full bg-white/90 grid place-items-center text-slate-500 hover:text-[#e5383b]"
            aria-label="Add to wishlist">
            <svg class="w-4 h-4" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"
                stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                <path
                    d="M19 14c1.49-1.46 3-3.21 3-5.5A5.5 5.5 0 0 0 16.5 3c-1.76 0-3 .5-4.5 2-1.5-1.5-2.74-2-4.5-2A5.5 5.5 0 0 0 2 8.5c0 2.3 1.5 4.05 3 5.5l7 7Z" />
            </svg>
        </button>
    </div>

    {{-- Info --}}
    <div class="p-3.5 flex flex-col flex-1">
        <p class="text-[11px] text-slate-400 mb-1">{{ $productCat }}</p>

        <h3 class="text-[13px] font-medium text-slate-800 leading-snug min-h-[2.4em]">
            <a href="{{ $productUrl }}" class="hover:text-brand-600">{{ $productName }}</a>
        </h3>

        {{-- Price --}}
        <div class="mt-1.5 flex items-baseline gap-2 flex-wrap">
            <span class="font-bold text-brand-700">
                @if ($hasPriceRange)
                    ৳{{ number_format($displayPrice, 0) }}–৳{{ number_format($displayPriceMax, 0) }}
                @else
                    ৳{{ number_format($displayPrice, 0) }}
                @endif
            </span>
            @if ($showStrikePrice)
                <span class="text-xs text-slate-400 line-through">৳{{ number_format($regularPrice, 0) }}</span>
            @endif
        </div>

        {{-- Rating --}}
        <div class="mt-1 flex items-center gap-1.5 text-[11px] text-slate-500">
            <span class="inline-flex text-star">
                @for ($i = 1; $i <= 5; $i++)
                    <svg class="w-3.5 h-3.5" viewBox="0 0 24 24"
                        fill="{{ $i <= round($averageRating) ? 'currentColor' : 'none' }}" stroke="currentColor"
                        stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                        <polygon
                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2" />
                    </svg>
                @endfor
            </span>
            <b class="text-slate-700">{{ number_format($averageRating, 1) }}</b>
            <span>({{ $reviewCount }})</span>
        </div>

        {{-- Add to cart / Select options --}}
        <button type="button" data-add data-id="{{ $product->id }}" data-name="{{ $productName }}"
            data-price="{{ $displayPrice }}" data-image="{{ $productImage }}"
            data-has-variants="{{ $hasVariants ? '1' : '0' }}" data-variants='@json($variantsJson)'
            data-detail-url="{{ $productUrl }}"
            class="btn btn-primary btn-sm w-full mt-3 {{ !$productInStock ? 'opacity-50 cursor-not-allowed' : '' }}"
            {{ !$productInStock ? 'disabled' : '' }}>
            <svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"
                stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                <path d="M6 2 3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4Z" />
                <path d="M3 6h18" />
                <path d="M16 10a4 4 0 0 1-8 0" />
            </svg>
            {{ !$productInStock ? 'Out of Stock' : ($hasVariants ? 'Select Options' : 'Add to Cart') }}
        </button>
    </div>
</article>
