@extends('frontend.frrontend_app')

@section('content')

    @php
        $productName = $product->name ?? 'Product';
        $categoryName = optional($product->category)->name ?? 'Uncategorized';
        $categorySlug = optional($product->category)->slug;
        $brandName = optional($product->brand)->name;
        $sku = optional($product->inventory)->sku ?? ($product->sku ?? 'N/A');
        $unit = optional($product->inventory)->unit ?? 'pc';
        $description = $product->description ?? '';
        $shortDescription = $product->short_description ?? '';

        $mainImage = $thumbnail ?? null;
        if (!$mainImage && !empty($product->thumbnail)) {
            $mainImage = uploaded_asset($product->thumbnail);
        }

        $images = collect();
        if ($mainImage) {
            $images->push($mainImage);
        }
        foreach ($galleryImages ?? [] as $galleryImage) {
            if ($galleryImage && !$images->contains($galleryImage)) {
                $images->push($galleryImage);
            }
        }

        $displayRegularPrice = (float) ($regularPrice ?? 0);
        $displaySalePrice = (float) ($currentPrice ?? $displayRegularPrice);
        $displayDiscount = (float) ($savingAmount ?? 0);
        $displayDiscountPercentage = (int) ($discountPercentage ?? 0);

        $productStock = (int) ($stock ?? 0);
        $productInStock = $inStock ?? $productStock > 0;

        $productReviews = $reviews ?? collect();
        $productReviewCount = (int) ($reviewCount ?? $productReviews->count());
        $productAverageRating = (float) ($averageRating ?? 0);

        $productVariants = $variants ?? [];

        $youtubeId = null;
        if (!empty($product->video_link)) {
            $videoUrl = $product->video_link;
            if (
                preg_match(
                    '/(?:youtube\.com\/(?:[^\/]+\/.+\/|(?:v|e(?:mbed)?)\/|.*[?&]v=)|youtu\.be\/)([^"&?\/\s]{11})/',
                    $videoUrl,
                    $matches,
                )
            ) {
                $youtubeId = $matches[1];
            } else {
                $youtubeId = $product->yt_video_id ?? null;
            }
        }
    @endphp

    {{-- ============================================================
         BREADCRUMB
    ============================================================ --}}
    <section class="container-fluid pt-6">
        <nav class="text-sm text-slate-500 flex items-center gap-1.5 flex-wrap" aria-label="Breadcrumb">
            <a href="{{ route('frontend.home') }}" class="hover:text-brand-600">Home</a>
            <span class="text-slate-300">/</span>
            <a href="{{ route('frontend.all-products') }}" class="hover:text-brand-600">Shop</a>
            <span class="text-slate-300">/</span>
            @if ($categorySlug)
                <a href="{{ url('/category/' . $categorySlug) }}" class="hover:text-brand-600">{{ $categoryName }}</a>
            @else
                <span>{{ $categoryName }}</span>
            @endif
            <span class="text-slate-300">/</span>
            <span class="text-slate-800 font-medium">{{ $productName }}</span>
        </nav>
    </section>

    {{-- ============================================================
         PRODUCT MAIN
    ============================================================ --}}
    <section class="container-fluid mt-6 grid lg:grid-cols-2 gap-10">

        {{-- ========================================================
             PRODUCT GALLERY
        ========================================================= --}}
        <div>
            <div data-main class="card aspect-square overflow-hidden bg-slate-100">
                @if ($mainImage)
                    <img src="{{ $mainImage }}" alt="{{ $productName }}" width="800" height="800"
                        class="w-full h-full object-cover">
                @else
                    <div class="w-full h-full grid place-items-center text-slate-400">No Image</div>
                @endif
            </div>

            @if ($images->count())
                <div class="grid grid-cols-4 gap-3 mt-3">
                    @foreach ($images->take(4) as $image)
                        <button type="button" data-thumb data-image="{{ $image }}"
                            class="aspect-square rounded-xl overflow-hidden border border-slate-200 hover:border-brand-600 transition {{ $loop->first ? 'border-brand-600' : '' }}"
                            aria-label="Product view">
                            <img src="{{ $image }}" alt="{{ $productName }}" width="400" height="400"
                                loading="lazy" class="w-full h-full object-cover">
                        </button>
                    @endforeach
                </div>
            @endif
        </div>

        {{-- ========================================================
             PRODUCT INFORMATION
        ========================================================= --}}
        <div>

            @if ($displayDiscountPercentage > 0)
                <span class="inline-block bg-[#e5383b] text-white text-xs font-semibold px-2.5 py-1 rounded-md">
                    -{{ $displayDiscountPercentage }}% OFF
                </span>
            @endif

            <h1 class="text-2xl md:text-3xl font-bold text-slate-900 mt-3 leading-tight">{{ $productName }}</h1>

            <div class="flex items-center gap-3 mt-3 text-sm">
                <span class="inline-flex text-star">
                    @for ($i = 1; $i <= 5; $i++)
                        <svg class="w-4 h-4" viewBox="0 0 24 24"
                            fill="{{ $i <= round($productAverageRating) ? 'currentColor' : 'none' }}" stroke="currentColor"
                            stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round">
                            <polygon
                                points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2" />
                        </svg>
                    @endfor
                </span>
                <b>{{ number_format($productAverageRating, 1) }}</b>
                <a href="#reviews" class="text-slate-500 hover:text-brand-600">({{ $productReviewCount }} reviews)</a>
                <span class="text-slate-300">|</span>
                @if ($productInStock)
                    <span class="text-brand-600 font-medium flex items-center gap-1">
                        <svg class="w-4 h-4" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8">
                            <path d="M20 6 9 17l-5-5" />
                        </svg>
                        In stock
                    </span>
                @else
                    <span class="text-red-500 font-medium">Out of stock</span>
                @endif
            </div>

            {{-- PRICE --}}
            <div class="flex items-baseline gap-3 mt-5">
                <span class="product-price-display text-3xl font-bold text-brand-700">
                    ৳{{ number_format($displaySalePrice, 0) }}
                </span>
                <span class="product-regular-price text-lg text-slate-400 line-through"
                    style="{{ $displayRegularPrice > $displaySalePrice ? '' : 'display:none' }}">
                    ৳{{ number_format($displayRegularPrice, 0) }}
                </span>
                <span class="product-save-badge text-sm text-[#e5383b] font-medium"
                    style="{{ $displayRegularPrice > $displaySalePrice ? '' : 'display:none' }}">
                    You save ৳{{ number_format($displayDiscount, 0) }}
                </span>
            </div>

            @if ($shortDescription)
                <p class="text-[14px] text-slate-600 leading-relaxed mt-4 max-w-lg">
                    {!! nl2br(e(strip_tags($shortDescription))) !!}
                </p>
            @elseif($description)
                <p class="text-[14px] text-slate-600 leading-relaxed mt-4 max-w-lg">
                    {!! nl2br(e(Str::limit(strip_tags($description), 300))) !!}
                </p>
            @endif

            {{-- ====================================================
                 VARIANTS
            ===================================================== --}}
            @if (count($productVariants))
                <div class="mt-6">
                    <p class="label mb-2">Available Options</p>
                    <div class="flex flex-wrap gap-2" id="variantContainer">

                        @foreach ($productVariants as $variant)
                            <button type="button" data-variant data-variant-id="{{ $variant['id'] }}"
                                data-price="{{ $variant['price'] }}" data-stock="{{ $variant['stock'] }}"
                                class="variant-btn px-4 py-2 rounded-lg border border-slate-200 text-[13px] font-medium hover:border-brand-600 transition {{ $loop->first ? 'active-variant border-brand-600 bg-brand-50 text-brand-700' : '' }}"
                                data-default="{{ $loop->first ? 'true' : 'false' }}">

                                {{ $variant['label'] }}

                                <span class="text-xs text-slate-400 ml-1">
                                    ৳{{ number_format($variant['price'], 0) }}
                                </span>
                            </button>
                        @endforeach

                    </div>
                </div>
            @endif

            {{-- ====================================================
                 QUANTITY / ACTIONS
            ===================================================== --}}
            <div class="mt-6 flex flex-wrap items-center gap-3">

                <div class="qty flex items-center border border-slate-200 rounded-[10px]">
                    <button type="button" data-q="-1" class="w-11 h-11 grid place-items-center" aria-label="Decrease">
                        <svg class="w-4 h-4" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8">
                            <path d="M5 12h14" />
                        </svg>
                    </button>
                    <input id="pQty" value="1" min="1" max="{{ max(1, $productStock) }}"
                        inputmode="numeric" aria-label="Quantity"
                        class="w-10 text-center text-sm font-semibold outline-none">
                    <button type="button" data-q="1" class="w-11 h-11 grid place-items-center" aria-label="Increase">
                        <svg class="w-4 h-4" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8">
                            <path d="M5 12h14" />
                            <path d="M12 5v14" />
                        </svg>
                    </button>
                </div>

                <button type="button" data-add data-id="{{ $product->id }}" data-name="{{ $productName }}"
                    data-price="{{ $displaySalePrice }}" data-qty-src="#pQty"
                    class="btn btn-primary !py-3 flex-1 sm:flex-none sm:px-8 {{ !$productInStock ? 'opacity-50 cursor-not-allowed' : '' }}"
                    {{ !$productInStock ? 'disabled' : '' }}>
                    <svg class="w-4 h-4" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8">
                        <path d="M6 2 3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4Z" />
                        <path d="M3 6h18" />
                        <path d="M16 10a4 4 0 0 1-8 0" />
                    </svg>
                    {{ $productInStock ? 'Add to Cart' : 'Out of Stock' }}
                </button>

                @if ($productInStock)
                    <a href="{{ url('/checkout') }}" data-add data-buy data-id="{{ $product->id }}"
                        data-name="{{ $productName }}" data-price="{{ $displaySalePrice }}" data-qty-src="#pQty"
                        class="btn btn-dark !py-3 flex-1 sm:flex-none sm:px-8">
                        Buy Now
                    </a>
                @endif

                <button type="button"
                    class="wish w-12 h-12 rounded-[10px] border border-slate-200 grid place-items-center text-slate-500"
                    aria-label="Add to wishlist">
                    <svg class="w-5 h-5" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8">
                        <path
                            d="M19 14c1.49-1.46 3-3.21 3-5.5A5.5 5.5 0 0 0 16.5 3c-1.76 0-3 .5-4.5 2-1.5-1.5-2.74-2-4.5-2A5.5 5.5 0 0 0 2 8.5c0 2.3 1.5 4.05 3 5.5l7 7Z" />
                    </svg>
                </button>

            </div>

            {{-- ====================================================
                 BENEFITS
            ===================================================== --}}
            <div class="mt-7 grid sm:grid-cols-3 gap-3 text-[12px]">
                <div class="flex items-center gap-2.5 bg-brand-50 rounded-xl p-3">
                    <span class="text-brand-600">
                        <svg class="w-5 h-5" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                            stroke-width="1.8">
                            <path d="M14 18V6a2 2 0 0 0-2-2H4a2 2 0 0 0-2 2v11a1 1 0 0 0 1 1h2" />
                            <path d="M15 18H9" />
                            <path d="M19 18h2a1 1 0 0 0 1-1v-3.65a1 1 0 0 0-.22-.624l-3.48-4.35A1 1 0 0 0 17.52 8H14" />
                            <circle cx="17" cy="18" r="2" />
                            <circle cx="7" cy="18" r="2" />
                        </svg>
                    </span>
                    <span>
                        <b class="block text-slate-800">Free Delivery</b>
                        <span class="text-slate-500">Dhaka 1–2 days</span>
                    </span>
                </div>
                <div class="flex items-center gap-2.5 bg-brand-50 rounded-xl p-3">
                    <span class="text-brand-600">
                        <svg class="w-5 h-5" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                            stroke-width="1.8">
                            <rect width="20" height="12" x="2" y="6" rx="2" />
                            <circle cx="12" cy="12" r="2" />
                            <path d="M6 12h.01M18 12h.01" />
                        </svg>
                    </span>
                    <span>
                        <b class="block text-slate-800">Cash on Delivery</b>
                        <span class="text-slate-500">Pay after receive</span>
                    </span>
                </div>
                <div class="flex items-center gap-2.5 bg-brand-50 rounded-xl p-3">
                    <span class="text-brand-600">
                        <svg class="w-5 h-5" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                            stroke-width="1.8">
                            <path d="M3 12a9 9 0 1 0 9-9 9.75 9.75 0 0 0-6.74 2.74L3 8" />
                            <path d="M3 3v5h5" />
                        </svg>
                    </span>
                    <span>
                        <b class="block text-slate-800">7-Day Return</b>
                        <span class="text-slate-500">Easy returns</span>
                    </span>
                </div>
            </div>

            {{-- SKU / Category / Brand --}}
            <p class="text-xs text-slate-500 mt-5">
                SKU: <b>{{ $sku }}</b> &nbsp;•&nbsp;
                Category:
                @if ($categorySlug)
                    <a href="{{ url('/category/' . $categorySlug) }}" class="text-brand-600">{{ $categoryName }}</a>
                @else
                    <span>{{ $categoryName }}</span>
                @endif
                @if ($brandName)
                    &nbsp;•&nbsp; Brand: <b class="text-slate-700">{{ $brandName }}</b>
                @endif
            </p>

        </div>
    </section>

    {{-- ============================================================
         DESCRIPTION / SPECIFICATIONS / REVIEWS
    ============================================================ --}}
    <section id="reviews" class="container-fluid mt-14">

        <div data-tabs="ptabs">
            <div class="flex gap-6 sm:gap-8 border-b border-slate-200 overflow-x-auto no-scrollbar">
                <button type="button" data-tab="d" class="tab-line active">Description</button>
                <button type="button" data-tab="s" class="tab-line">Specifications</button>
                <button type="button" data-tab="r" class="tab-line">Reviews ({{ $productReviewCount }})</button>
            </div>
        </div>

        <div id="ptabs" class="pt-6 max-w-3xl">

            {{-- DESCRIPTION --}}
            <div data-panel="d" class="active text-[14px] text-slate-600 leading-[1.85]">
                @if ($description)
                    <div>{!! $description !!}</div>
                @elseif($shortDescription)
                    <p>{!! nl2br(e($shortDescription)) !!}</p>
                @else
                    <p class="text-slate-400">No description available for this product.</p>
                @endif

                @if ($youtubeId)
                    <div class="mt-6 aspect-video rounded-xl overflow-hidden">
                        <iframe class="w-full h-full" src="https://www.youtube.com/embed/{{ $youtubeId }}"
                            title="{{ $productName }}" frameborder="0" allowfullscreen></iframe>
                    </div>
                @endif
            </div>

            {{-- SPECIFICATIONS --}}
            <div data-panel="s">
                <table class="w-full text-[14px]">
                    <tbody>
                        <tr class="border-b border-slate-100">
                            <td class="py-3 pr-6 w-48 text-slate-500">Product</td>
                            <td class="py-3 font-medium text-slate-800">{{ $productName }}</td>
                        </tr>
                        <tr class="border-b border-slate-100">
                            <td class="py-3 pr-6 text-slate-500">SKU</td>
                            <td class="py-3 font-medium text-slate-800">{{ $sku }}</td>
                        </tr>
                        <tr class="border-b border-slate-100">
                            <td class="py-3 pr-6 text-slate-500">Category</td>
                            <td class="py-3 font-medium text-slate-800">{{ $categoryName }}</td>
                        </tr>
                        @if ($brandName)
                            <tr class="border-b border-slate-100">
                                <td class="py-3 pr-6 text-slate-500">Brand</td>
                                <td class="py-3 font-medium text-slate-800">{{ $brandName }}</td>
                            </tr>
                        @endif
                        <tr class="border-b border-slate-100">
                            <td class="py-3 pr-6 text-slate-500">Unit</td>
                            <td class="py-3 font-medium text-slate-800">{{ $unit }}</td>
                        </tr>
                        <tr class="border-b border-slate-100">
                            <td class="py-3 pr-6 text-slate-500">Availability</td>
                            <td class="py-3 font-medium">
                                @if ($productInStock)
                                    <span class="text-brand-600">In Stock</span>
                                @else
                                    <span class="text-red-500">Out of Stock</span>
                                @endif
                            </td>
                        </tr>
                        @if ($productStock > 0)
                            <tr class="border-b border-slate-100">
                                <td class="py-3 pr-6 text-slate-500">Stock</td>
                                <td class="py-3 font-medium text-slate-800">{{ $productStock }} {{ $unit }}</td>
                            </tr>
                        @endif
                        @if ($product->is_variant && count($productVariants))
                            <tr class="border-b border-slate-100">
                                <td class="py-3 pr-6 text-slate-500">Variants</td>
                                <td class="py-3 font-medium text-slate-800">{{ count($productVariants) }} available</td>
                            </tr>
                        @endif
                    </tbody>
                </table>
            </div>

            {{-- REVIEWS --}}
            <div data-panel="r">
                @if ($productReviewCount > 0)
                    @foreach ($productReviews as $review)
                        @php
                            $reviewUser = $review->user ?? null;
                            $reviewName = optional($reviewUser)->name ?? ($review->name ?? 'Customer');
                            $reviewRating = (int) ($review->rating ?? 0);
                            $reviewComment = $review->comment ?? ($review->review ?? '');
                            $reviewDate = $review->created_at ? $review->created_at->format('d M Y') : '';
                        @endphp
                        <div class="py-5 border-b border-slate-100 flex gap-4">
                            @if (optional($reviewUser)->avatar)
                                <img src="{{ uploaded_asset($reviewUser->avatar) }}" alt="{{ $reviewName }}"
                                    class="w-11 h-11 rounded-full object-cover shrink-0">
                            @else
                                <span
                                    class="w-11 h-11 rounded-full bg-brand-100 grid place-items-center text-sm font-semibold text-brand-700 shrink-0">
                                    {{ strtoupper(substr($reviewName, 0, 1)) }}
                                </span>
                            @endif
                            <div class="min-w-0">
                                <div class="flex items-center gap-3 flex-wrap">
                                    <b class="text-sm text-slate-900">{{ $reviewName }}</b>
                                    <span class="inline-flex text-star">
                                        @for ($i = 1; $i <= 5; $i++)
                                            <svg class="w-3.5 h-3.5" viewBox="0 0 24 24"
                                                fill="{{ $i <= $reviewRating ? 'currentColor' : 'none' }}"
                                                stroke="currentColor" stroke-width="1.8">
                                                <polygon
                                                    points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2" />
                                            </svg>
                                        @endfor
                                    </span>
                                    @if ($reviewDate)
                                        <span class="text-xs text-slate-400">{{ $reviewDate }}</span>
                                    @endif
                                </div>
                                @if ($reviewComment)
                                    <p class="text-[13px] text-slate-600 mt-1.5 leading-relaxed">{{ $reviewComment }}</p>
                                @endif
                            </div>
                        </div>
                    @endforeach
                @else
                    <div class="py-10 text-center">
                        <p class="text-slate-500">No reviews yet.</p>
                    </div>
                @endif
            </div>

        </div>
    </section>

    {{-- ============================================================
         RELATED PRODUCTS
    ============================================================ --}}
    @if (isset($relatedProducts) && $relatedProducts->count())
        <section class="container-fluid mt-14">
            <h2 class="section-title mb-5">You may also like</h2>

            <div class="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-4">
                @foreach ($relatedProducts as $related)
                    @php
                        $relatedImage =
                            $related->thumbnail_url ??
                            ($related->thumbnail ? uploaded_asset($related->thumbnail) : null);
                        $relatedPrice = (float) ($related->display_price ?? 0);
                        $relatedRegularPrice = (float) ($related->display_regular_price ?? 0);
                        $relatedDiscount = (int) ($related->discount_percentage ?? 0);
                        $relatedRating = (float) ($related->average_rating ?? 0);
                        $relatedReviewCount = (int) ($related->review_count ?? 0);
                        $relatedCategory = optional($related->category)->name ?? 'Product';
                    @endphp

                    <article class="card pcard overflow-hidden flex flex-col">
                        <div class="relative pimg aspect-square overflow-hidden bg-slate-100">
                            <a href="{{ route('frontend.product-details', $related->slug) }}"
                                class="block w-full h-full">
                                @if ($relatedImage)
                                    <img src="{{ $relatedImage }}" alt="{{ $related->name }}" width="400"
                                        height="400" loading="lazy" class="w-full h-full object-cover">
                                @else
                                    <div class="w-full h-full grid place-items-center text-slate-400">No Image</div>
                                @endif
                            </a>

                            @if ($relatedDiscount > 0)
                                <span
                                    class="absolute left-2.5 top-2.5 z-10 bg-[#e5383b] text-white text-[11px] font-semibold px-2 py-0.5 rounded-md">
                                    -{{ $relatedDiscount }}%
                                </span>
                            @endif

                            <button type="button"
                                class="wish absolute right-2.5 top-2.5 z-10 w-8 h-8 rounded-full bg-white/90 grid place-items-center text-slate-500 hover:text-[#e5383b]"
                                aria-label="Add to wishlist">
                                <svg class="w-4 h-4" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                    stroke-width="1.8">
                                    <path
                                        d="M19 14c1.49-1.46 3-3.21 3-5.5A5.5 5.5 0 0 0 16.5 3c-1.76 0-3 .5-4.5 2-1.5-1.5-2.74-2-4.5-2A5.5 5.5 0 0 0 2 8.5c0 2.3 1.5 4.05 3 5.5l7 7Z" />
                                </svg>
                            </button>
                        </div>

                        <div class="p-3.5 flex flex-col flex-1">
                            <p class="text-[11px] text-slate-400 mb-1">{{ $relatedCategory }}</p>
                            <h3 class="text-[13px] font-medium text-slate-800 leading-snug min-h-[2.4em]">
                                <a href="{{ route('frontend.product-details', $related->slug) }}"
                                    class="hover:text-brand-600">
                                    {{ $related->name }}
                                </a>
                            </h3>

                            <div class="mt-1.5 flex items-baseline gap-2">
                                <span class="font-bold text-brand-700">৳{{ number_format($relatedPrice, 0) }}</span>
                                @if ($relatedRegularPrice > $relatedPrice)
                                    <span
                                        class="text-xs text-slate-400 line-through">৳{{ number_format($relatedRegularPrice, 0) }}</span>
                                @endif
                            </div>

                            <div class="mt-1 flex items-center gap-1.5 text-[11px] text-slate-500">
                                <span class="inline-flex text-star">
                                    @for ($i = 1; $i <= 5; $i++)
                                        <svg class="w-3.5 h-3.5" viewBox="0 0 24 24"
                                            fill="{{ $i <= round($relatedRating) ? 'currentColor' : 'none' }}"
                                            stroke="currentColor" stroke-width="1.8">
                                            <polygon
                                                points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2" />
                                        </svg>
                                    @endfor
                                </span>
                                <b class="text-slate-700">{{ number_format($relatedRating, 1) }}</b>
                                ({{ $relatedReviewCount }})
                            </div>

                            <button type="button" data-add data-id="{{ $related->id }}"
                                data-name="{{ $related->name }}" data-price="{{ $relatedPrice }}"
                                class="btn btn-primary btn-sm w-full mt-3">
                                <svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                    stroke-width="1.8">
                                    <path d="M6 2 3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4Z" />
                                    <path d="M3 6h18" />
                                    <path d="M16 10a4 4 0 0 1-8 0" />
                                </svg>
                                Add to Cart
                            </button>
                        </div>
                    </article>
                @endforeach
            </div>
        </section>
    @endif

    {{-- ============================================================
         PAGE JAVASCRIPT
    ============================================================ --}}
    @push('scripts')
        <script>
            document.addEventListener('DOMContentLoaded', function() {

                /* Product Gallery */
                const mainImage = document.querySelector('[data-main] img');
                document.querySelectorAll('[data-thumb]').forEach(function(thumb) {
                    thumb.addEventListener('click', function() {
                        const image = this.dataset.image;
                        if (mainImage && image) mainImage.src = image;
                        document.querySelectorAll('[data-thumb]').forEach(function(item) {
                            item.classList.remove('border-brand-600');
                            item.classList.add('border-slate-200');
                        });
                        this.classList.remove('border-slate-200');
                        this.classList.add('border-brand-600');
                    });
                });

                /* Quantity */
                const qtyInput = document.getElementById('pQty');
                document.querySelectorAll('[data-q]').forEach(function(button) {
                    button.addEventListener('click', function() {
                        if (!qtyInput) return;
                        let quantity = parseInt(qtyInput.value || 1);
                        quantity += parseInt(this.dataset.q);
                        const max = parseInt(qtyInput.max || 999999);
                        if (quantity < 1) quantity = 1;
                        if (max > 0 && quantity > max) quantity = max;
                        qtyInput.value = quantity;
                    });
                });
                if (qtyInput) {
                    qtyInput.addEventListener('input', function() {
                        let quantity = parseInt(this.value || 1);
                        const max = parseInt(this.max || 999999);
                        if (quantity < 1) quantity = 1;
                        if (max > 0 && quantity > max) quantity = max;
                        this.value = quantity;
                    });
                }

                /* ==========================================================
                   VARIANT SELECTION
                   ========================================================== */
                const variantButtons = document.querySelectorAll('[data-variant]');
                const priceDisplay = document.querySelector('.product-price-display');
                const regularPriceDisplay = document.querySelector('.product-regular-price');
                const saveBadge = document.querySelector('.product-save-badge');

                const PRODUCT_REGULAR_PRICE = {{ (float) $displayRegularPrice }};

                function clearVariantActive() {
                    variantButtons.forEach(function(btn) {
                        btn.classList.remove('border-brand-600', 'bg-brand-50', 'text-brand-700',
                            'active-variant');
                        btn.classList.add('border-slate-200');
                    });
                }

                function setVariantActive(btn) {
                    clearVariantActive();
                    btn.classList.remove('border-slate-200');
                    btn.classList.add('border-brand-600', 'bg-brand-50', 'text-brand-700', 'active-variant');
                }

                function updateDisplayedPrice(price) {
                    const numericPrice = parseFloat(price);

                    if (isNaN(numericPrice)) return;

                    if (priceDisplay) {
                        priceDisplay.textContent = '৳' + numericPrice.toLocaleString('en-US');
                    }

                    if (numericPrice < PRODUCT_REGULAR_PRICE && PRODUCT_REGULAR_PRICE > 0) {
                        if (regularPriceDisplay) {
                            regularPriceDisplay.textContent = '৳' + PRODUCT_REGULAR_PRICE.toLocaleString('en-US');
                            regularPriceDisplay.style.display = '';
                        }
                        if (saveBadge) {
                            const save = PRODUCT_REGULAR_PRICE - numericPrice;
                            saveBadge.textContent = 'You save ৳' + save.toLocaleString('en-US');
                            saveBadge.style.display = '';
                        }
                    } else {
                        if (regularPriceDisplay) regularPriceDisplay.style.display = 'none';
                        if (saveBadge) saveBadge.style.display = 'none';
                    }

                    document.querySelectorAll('[data-add][data-id="{{ $product->id }}"]').forEach(function(el) {
                        el.dataset.price = numericPrice;
                    });
                }

                if (variantButtons.length > 0) {
                    let defaultVariant = Array.from(variantButtons).find(function(btn) {
                        return btn.dataset.default === 'true';
                    }) || variantButtons[0];

                    setVariantActive(defaultVariant);

                    const defaultPrice = defaultVariant.dataset.price;
                    if (defaultPrice) updateDisplayedPrice(defaultPrice);
                }

                variantButtons.forEach(function(btn) {
                    btn.addEventListener('click', function(e) {
                        e.preventDefault();
                        setVariantActive(this);
                        const variantPrice = this.dataset.price;
                        if (variantPrice) updateDisplayedPrice(variantPrice);
                    });
                });

                /* Tabs */
                const tabs = document.querySelectorAll('[data-tab]');
                const panels = document.querySelectorAll('[data-panel]');
                tabs.forEach(function(tab) {
                    tab.addEventListener('click', function() {
                        const target = this.dataset.tab;
                        tabs.forEach(function(item) {
                            item.classList.remove('active');
                        });
                        panels.forEach(function(panel) {
                            panel.classList.remove('active');
                        });
                        this.classList.add('active');
                        const targetPanel = document.querySelector('[data-panel="' + target + '"]');
                        if (targetPanel) targetPanel.classList.add('active');
                    });
                });

                /* Wishlist */
                document.querySelectorAll('.wish').forEach(function(button) {
                    button.addEventListener('click', function() {
                        this.classList.toggle('text-[#e5383b]');
                        this.classList.toggle('text-slate-500');
                    });
                });

            });
        </script>

        <style>
            [data-panel] {
                display: none;
            }

            [data-panel].active {
                display: block;
            }

            .tab-line {
                position: relative;
                padding-bottom: 12px;
                font-size: 14px;
                font-weight: 500;
                color: #64748b;
                white-space: nowrap;
            }

            .tab-line:hover {
                color: #334155;
            }

            .tab-line.active {
                color: #15803d;
            }

            .tab-line.active::after {
                content: "";
                position: absolute;
                left: 0;
                right: 0;
                bottom: -1px;
                height: 2px;
                background: currentColor;
                border-radius: 999px;
            }

            .text-star {
                color: #f59e0b;
            }

            .variant-btn.active-variant {
                border-color: #15803d !important;
                background-color: #f0fdf4 !important;
                color: #15803d !important;
            }
        </style>
    @endpush

@endsection
