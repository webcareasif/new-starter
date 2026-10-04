@extends('frontend.frrontend_app')

@section('content')

    <section class="hero-bg border-b border-brand-100">
        <div class="container-fluid py-9 md:py-12">
            <h1 class="text-2xl md:text-3xl font-bold text-brand-900">All Products</h1>
            <p class="text-sm text-slate-600 mt-1.5 max-w-xl">Browse our full collection and find something you will love.
            </p>
            <div class="mt-3">
                <nav class="text-sm text-slate-500 flex items-center gap-1.5 flex-wrap" aria-label="Breadcrumb">
                    <a href="{{ route('frontend.home') }}" class="hover:text-brand-600">Home</a>
                    <span class="text-slate-300">/</span>
                    <span class="text-slate-800 font-medium">Products</span>
                </nav>
            </div>
        </div>
    </section>

    <section class="container-fluid pt-8 grid lg:grid-cols-[250px_1fr] gap-7">

        {{-- Mobile filter toggle --}}
        <div class="lg:hidden">
            <button type="button" data-toggle="#filters" aria-expanded="false" aria-controls="filters"
                class="btn btn-outline w-full">
                <svg class="w-4 h-4" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"
                    stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                    <line x1="21" x2="14" y1="4" y2="4" />
                    <line x1="10" x2="3" y1="4" y2="4" />
                    <line x1="21" x2="12" y1="12" y2="12" />
                    <line x1="8" x2="3" y1="12" y2="12" />
                    <line x1="21" x2="16" y1="20" y2="20" />
                    <line x1="12" x2="3" y1="20" y2="20" />
                    <line x1="14" x2="14" y1="2" y2="6" />
                    <line x1="8" x2="8" y1="10" y2="14" />
                    <line x1="16" x2="16" y1="18" y2="22" />
                </svg> Filters &amp; Categories
            </button>
        </div>

        {{-- Sidebar Filters --}}
        <aside id="filters" class="hidden lg:block space-y-4 lg:sticky lg:top-[150px] self-start">
            <div class="card p-5">
                <h3 class="font-semibold text-slate-900 mb-2 text-sm">Categories</h3>
                <label class="flex items-center justify-between text-[13px] py-1.5 cursor-pointer">
                    <span class="flex items-center gap-2.5"><input type="checkbox" checked> All Products</span>
                    <span class="text-xs text-slate-400">248</span>
                </label>
                <label class="flex items-center justify-between text-[13px] py-1.5 cursor-pointer">
                    <span class="flex items-center gap-2.5"><input type="checkbox"> Fashion</span>
                    <span class="text-xs text-slate-400">72</span>
                </label>
                <label class="flex items-center justify-between text-[13px] py-1.5 cursor-pointer">
                    <span class="flex items-center gap-2.5"><input type="checkbox"> Electronics</span>
                    <span class="text-xs text-slate-400">54</span>
                </label>
                <label class="flex items-center justify-between text-[13px] py-1.5 cursor-pointer">
                    <span class="flex items-center gap-2.5"><input type="checkbox"> Home &amp; Living</span>
                    <span class="text-xs text-slate-400">46</span>
                </label>
                <label class="flex items-center justify-between text-[13px] py-1.5 cursor-pointer">
                    <span class="flex items-center gap-2.5"><input type="checkbox"> Beauty &amp; Care</span>
                    <span class="text-xs text-slate-400">31</span>
                </label>
                <label class="flex items-center justify-between text-[13px] py-1.5 cursor-pointer">
                    <span class="flex items-center gap-2.5"><input type="checkbox"> Kids Zone</span>
                    <span class="text-xs text-slate-400">27</span>
                </label>
                <label class="flex items-center justify-between text-[13px] py-1.5 cursor-pointer">
                    <span class="flex items-center gap-2.5"><input type="checkbox"> Sports &amp; Fitness</span>
                    <span class="text-xs text-slate-400">18</span>
                </label>
            </div>

            <div class="card p-5">
                <h3 class="font-semibold text-slate-900 mb-3 text-sm">Max Price</h3>
                <input id="priceRange" type="range" min="200" max="10000" step="100" value="5000"
                    aria-label="Maximum price">
                <div class="flex justify-between text-xs text-slate-500 mt-1">
                    <span>৳200</span>
                    <b id="priceOut" class="text-brand-700">৳5,000</b>
                </div>
            </div>

            <div class="card p-5">
                <h3 class="font-semibold text-slate-900 mb-2 text-sm">Rating</h3>
                <label class="flex items-center gap-2.5 py-1.5 text-[13px] cursor-pointer">
                    <input type="radio" name="rt">
                    <span class="inline-flex text-star">
                        @for ($i = 0; $i < 5; $i++)
                            <svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="currentColor" stroke="currentColor"
                                stroke-width="1.8">
                                <polygon
                                    points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2" />
                            </svg>
                        @endfor
                    </span>
                    <span class="text-xs text-slate-400">&amp; up</span>
                </label>
                <label class="flex items-center gap-2.5 py-1.5 text-[13px] cursor-pointer">
                    <input type="radio" name="rt">
                    <span class="inline-flex text-star">
                        @for ($i = 0; $i < 4; $i++)
                            <svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="currentColor" stroke="currentColor"
                                stroke-width="1.8">
                                <polygon
                                    points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2" />
                            </svg>
                        @endfor
                    </span>
                    <span class="text-xs text-slate-400">&amp; up</span>
                </label>
                <label class="flex items-center gap-2.5 py-1.5 text-[13px] cursor-pointer">
                    <input type="radio" name="rt">
                    <span class="inline-flex text-star">
                        @for ($i = 0; $i < 3; $i++)
                            <svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="currentColor" stroke="currentColor"
                                stroke-width="1.8">
                                <polygon
                                    points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2" />
                            </svg>
                        @endfor
                    </span>
                    <span class="text-xs text-slate-400">&amp; up</span>
                </label>
            </div>

            <div class="card p-5">
                <h3 class="font-semibold text-slate-900 mb-2 text-sm">Availability</h3>
                <label class="flex items-center justify-between text-[13px] py-1.5 cursor-pointer">
                    <span class="flex items-center gap-2.5"><input type="checkbox" checked> In Stock</span>
                    <span class="text-xs text-slate-400">231</span>
                </label>
                <label class="flex items-center justify-between text-[13px] py-1.5 cursor-pointer">
                    <span class="flex items-center gap-2.5"><input type="checkbox"> On Sale</span>
                    <span class="text-xs text-slate-400">86</span>
                </label>
                <label class="flex items-center justify-between text-[13px] py-1.5 cursor-pointer">
                    <span class="flex items-center gap-2.5"><input type="checkbox"> Free Delivery</span>
                    <span class="text-xs text-slate-400">190</span>
                </label>
            </div>

            <button class="btn btn-primary w-full">Apply Filters</button>
        </aside>

        {{-- Product Listing --}}
        <div>
            <div class="flex flex-wrap items-center justify-between gap-3 mb-5">
                <p class="text-sm text-slate-500">
                    Showing <b
                        class="text-slate-800">{{ $products->firstItem() ?? 0 }}–{{ $products->lastItem() ?? 0 }}</b>
                    of {{ $products->total() }} products
                </p>
                <div class="flex items-center gap-3">
                    <label class="sr-only" for="sort">Sort</label>
                    <select id="sort" class="field !w-auto !py-2 !text-[13px]">
                        <option>Sort: Featured</option>
                        <option>Price: Low to High</option>
                        <option>Price: High to Low</option>
                        <option>Top Rated</option>
                        <option>Newest</option>
                    </select>
                </div>
            </div>

            @if ($products->count())
                <div id="productGrid" class="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-4 xl:grid-cols-5 gap-4">

                    @foreach ($products as $product)
                        @php
                            // Price computation
                            $regularPrice = (float) ($product->price->regular_price ?? 0);
                            $salePriceRaw = $product->price->sale_price ?? null;
                            $salePrice =
                                $salePriceRaw !== null && (float) $salePriceRaw < $regularPrice
                                    ? (float) $salePriceRaw
                                    : $regularPrice;

                            $discountPercentage =
                                $regularPrice > 0 && $salePrice < $regularPrice
                                    ? round((($regularPrice - $salePrice) / $regularPrice) * 100)
                                    : 0;

                            // Safe product fields
                            $productName = $product->name ?? 'Product';
                            $productSlug = $product->slug ?? '#';
                            $productCat =
                                $product->category->category_name ?? ($product->category->name ?? 'Uncategorized');
                            $productImage = $product->thumbnail ? uploaded_asset($product->thumbnail) : null;

                            // Stock check (inventory relation)
                            $productStock = (int) ($product->inventory->stock ?? 0);
                            $productInStock = $productStock > 0;
                        @endphp

                        <article class="card pcard overflow-hidden flex flex-col">

                            {{-- Product Image --}}
                            <div class="relative pimg aspect-square overflow-hidden bg-slate-100">
                                <a href="{{ route('frontend.product-details', $productSlug) }}"
                                    class="block w-full h-full">
                                    @if ($productImage)
                                        <img src="{{ $productImage }}" alt="{{ $productName }}" width="400"
                                            height="400" loading="lazy"
                                            class="w-full h-full object-cover transition duration-300 hover:scale-105">
                                    @else
                                        <div class="w-full h-full flex items-center justify-center bg-slate-100">
                                            <svg class="w-12 h-12 text-slate-300" viewBox="0 0 24 24" fill="none"
                                                stroke="currentColor" stroke-width="1.5">
                                                <rect x="3" y="3" width="18" height="18" rx="2" />
                                                <circle cx="8.5" cy="8.5" r="1.5" />
                                                <path d="m21 15-5-5L5 21" />
                                            </svg>
                                        </div>
                                    @endif
                                </a>

                                @if ($discountPercentage > 0)
                                    <span
                                        class="absolute left-2.5 top-2.5 z-10 bg-[#e5383b] text-white text-[11px] font-semibold px-2 py-0.5 rounded-md">
                                        -{{ $discountPercentage }}%
                                    </span>
                                @endif

                                <button type="button"
                                    class="wish absolute right-2.5 top-2.5 z-10 w-8 h-8 rounded-full bg-white/90 grid place-items-center text-slate-500 hover:text-[#e5383b] transition"
                                    aria-label="Add to wishlist">
                                    <svg class="w-4 h-4" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                        stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"
                                        aria-hidden="true">
                                        <path
                                            d="M19 14c1.49-1.46 3-3.21 3-5.5A5.5 5.5 0 0 0 16.5 3c-1.76 0-3 .5-4.5 2-1.5-1.5-2.74-2-4.5-2A5.5 5.5 0 0 0 2 8.5c0 2.3 1.5 4.05 3 5.5l7 7Z" />
                                    </svg>
                                </button>
                            </div>

                            {{-- Product Info --}}
                            <div class="p-3.5 flex flex-col flex-1">
                                <p class="text-[11px] text-slate-400 mb-1">{{ $productCat }}</p>

                                <h3 class="text-[13px] font-medium text-slate-800 leading-snug min-h-[2.4em]">
                                    <a href="{{ route('frontend.product-details', $productSlug) }}"
                                        class="hover:text-brand-600 transition">
                                        {{ $productName }}
                                    </a>
                                </h3>

                                <div class="mt-1.5 flex items-baseline gap-2">
                                    <span class="font-bold text-brand-700">৳{{ number_format($salePrice, 0) }}</span>
                                    @if ($discountPercentage > 0)
                                        <span class="text-xs text-slate-400 line-through">
                                            ৳{{ number_format($regularPrice, 0) }}
                                        </span>
                                    @endif
                                </div>

                                <div class="mt-1 flex items-center gap-1.5 text-[11px] text-slate-500">
                                    <span class="inline-flex text-star">
                                        @for ($i = 1; $i <= 5; $i++)
                                            <svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="currentColor"
                                                stroke="currentColor" stroke-width="1.8">
                                                <polygon
                                                    points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2" />
                                            </svg>
                                        @endfor
                                    </span>
                                    <b class="text-slate-700">5.0</b>
                                    <span>(0)</span>
                                </div>

                                {{-- Add to Cart --}}
                                <button type="button" data-add data-id="{{ $product->id }}"
                                    data-name="{{ $productName }}" data-price="{{ $salePrice }}"
                                    data-image="{{ $productImage }}"
                                    class="btn btn-primary btn-sm w-full mt-3 {{ !$productInStock ? 'opacity-50 cursor-not-allowed' : '' }}"
                                    {{ !$productInStock ? 'disabled' : '' }}>
                                    <svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                        stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"
                                        aria-hidden="true">
                                        <path d="M6 2 3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4Z" />
                                        <path d="M3 6h18" />
                                        <path d="M16 10a4 4 0 0 1-8 0" />
                                    </svg>
                                    {{ $productInStock ? 'Add to Cart' : 'Out of Stock' }}
                                </button>
                            </div>
                        </article>
                    @endforeach

                </div>

                {{-- Pagination --}}
                <div class="flex justify-center mt-10">
                    {{ $products->links() }}
                </div>
            @else
                <div class="py-20 text-center">
                    <p class="text-slate-500">No products found.</p>
                </div>
            @endif
        </div>
    </section>

@endsection
