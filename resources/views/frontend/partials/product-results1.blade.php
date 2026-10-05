<div class="flex flex-wrap items-center justify-between gap-3 mb-5">
    <p class="text-sm text-slate-500">
        Showing <b class="text-slate-800">{{ $products->firstItem() ?? 0 }}–{{ $products->lastItem() ?? 0 }}</b>
        of {{ $products->total() }} products
    </p>
</div>

@if ($products->count())
    <div id="productGrid" class="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-4 xl:grid-cols-5 gap-4">

        @foreach ($products as $product)
            @php
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

                $productName = $product->name ?? 'Product';
                $productSlug = $product->slug ?? '#';
                $productCat = $product->category->category_name ?? ($product->category->name ?? 'Uncategorized');
                $productImage = $product->thumbnail ? uploaded_asset($product->thumbnail) : null;

                $productStock = (int) ($product->inventory->stock ?? 0);
                $productInStock = $productStock > 0;
            @endphp

            <article class="card pcard overflow-hidden flex flex-col">

                {{-- Product Image --}}
                <div class="relative pimg aspect-square overflow-hidden bg-slate-100">
                    <a href="{{ route('frontend.product-details', $productSlug) }}" class="block w-full h-full">
                        @if ($productImage)
                            <img src="{{ $productImage }}" alt="{{ $productName }}" width="400" height="400"
                                loading="lazy"
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
                        <svg class="w-4 h-4" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"
                            stroke-linecap="round" stroke-linejoin="round">
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
                                <svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="currentColor" stroke="currentColor"
                                    stroke-width="1.8">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2" />
                                </svg>
                            @endfor
                        </span>
                        <b class="text-slate-700">5.0</b>
                        <span>(0)</span>
                    </div>

                    <button type="button" data-add data-id="{{ $product->id }}" data-name="{{ $productName }}"
                        data-price="{{ $salePrice }}" data-image="{{ $productImage }}"
                        class="btn btn-primary btn-sm w-full mt-3 {{ !$productInStock ? 'opacity-50 cursor-not-allowed' : '' }}"
                        {{ !$productInStock ? 'disabled' : '' }}>
                        <svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                            stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round">
                            <path d="M6 2 3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4Z" />
                            <path d="M3 6h18" />
                            <path d="M16 10a4 4 0 0 1-8 0" />
                        </svg>
                        {{ $productInStock ? 'Add to Cart1' : 'Out of Stock' }}
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
