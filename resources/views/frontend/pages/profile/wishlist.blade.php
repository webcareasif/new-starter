@extends('frontend.frrontend_app')

@section('content')
    <section class="container-fluid py-8">
        <div class="flex items-center justify-between mb-6">
            <div>
                <h1 class="text-2xl font-bold text-slate-900">My Wishlist</h1>
                <p class="text-sm text-slate-500 mt-1">
                    {{ $products->count() }} item{{ $products->count() === 1 ? '' : 's' }} saved
                </p>
            </div>

            @if ($products->count())
                <button id="clearWishlist" type="button" class="text-sm text-red-600 hover:underline">
                    Clear all
                </button>
            @endif
        </div>

        <div class="grid lg:grid-cols-[260px_1fr] gap-6">
            @auth
                @include('frontend.pages.profile._sidebar')
            @endauth

            <div class="{{ auth()->check() ? '' : 'lg:col-span-2' }}">
                @if ($products->isEmpty())
                    <div class="card p-10 text-center">
                        <svg class="w-14 h-14 mx-auto text-slate-300" viewBox="0 0 24 24" fill="none"
                            stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
                            <path
                                d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z" />
                        </svg>
                        <p class="text-slate-500 mt-4">Your wishlist is empty.</p>
                        <a href="{{ route('frontend.all-products') }}" class="btn btn-primary inline-block mt-5">Browse
                            products</a>
                    </div>
                @else
                    <div id="wishlistGrid" class="grid grid-cols-2 md:grid-cols-3 xl:grid-cols-5 gap-4">
                        @foreach ($products as $p)
                            @php
                                /* ---------- Base price ---------- */
                                $regularPrice = (float) ($p->price->regular_price ?? 0);
                                $salePriceRaw = $p->price->sale_price ?? null;
                                $salePrice =
                                    $salePriceRaw !== null && (float) $salePriceRaw < $regularPrice
                                        ? (float) $salePriceRaw
                                        : $regularPrice;

                                /* ---------- Product fields ---------- */
                                $productName = $p->name ?? 'Product';
                                $productSlug = $p->slug ?? '#';
                                $productCat = $p->category->category_name ?? ($p->category->name ?? 'Uncategorized');
                                $productImage = $p->thumbnail ? uploaded_asset($p->thumbnail) : null;

                                /* ---------- Variants ---------- */
                                $hasVariants = $p->variants && $p->variants->count() > 0;

                                $variantsJson = $hasVariants
                                    ? $p->variants
                                        ->map(function ($v) {
                                            $label = '';
                                            if (!empty($v->attribute_value)) {
                                                $decoded = json_decode($v->attribute_value, true);
                                                $label = is_array($decoded)
                                                    ? implode(' / ', array_values($decoded))
                                                    : (string) $v->attribute_value;
                                            }
                                            if (empty($label)) {
                                                $label = optional($v->attributeRel)->name ?? 'Option';
                                            }
                                            return [
                                                'id' => $v->id,
                                                'label' => $label,
                                                'price' => (float) $v->price,
                                                'stock' => (int) $v->quantity,
                                                'sku' => $v->sku,
                                                'image' => !empty($v->image) ? uploaded_asset($v->image) : null,
                                            ];
                                        })
                                        ->values()
                                        ->toArray()
                                    : [];

                                /* ---------- Price (variant aware) ---------- */
                                if ($hasVariants && count($variantsJson)) {
                                    $variantPrices = array_filter(
                                        array_column($variantsJson, 'price'),
                                        fn($x) => $x > 0,
                                    );
                                    if (count($variantPrices)) {
                                        $displayPrice = min($variantPrices);
                                        $displayPriceMax = max($variantPrices);
                                        $hasPriceRange = $displayPriceMax > $displayPrice;
                                    } else {
                                        $displayPrice = $salePrice;
                                        $displayPriceMax = $salePrice;
                                        $hasPriceRange = false;
                                    }
                                } else {
                                    $displayPrice = $salePrice;
                                    $displayPriceMax = $salePrice;
                                    $hasPriceRange = false;
                                }

                                /* ---------- Stock ---------- */
                                $productStock = (int) ($p->inventory->stock ?? 0);
                                $productInStock = $hasVariants
                                    ? collect($variantsJson)->sum('stock') > 0
                                    : $productStock > 0;

                                /* ---------- Discount % ---------- */
                                $discountPercentage = 0;
                                if ($regularPrice > 0 && $regularPrice > $displayPrice) {
                                    $discountPercentage = round(
                                        (($regularPrice - $displayPrice) / $regularPrice) * 100,
                                    );
                                }
                            @endphp

                            <article class="card pcard overflow-hidden flex flex-col" data-product-id="{{ $p->id }}">

                                {{-- image --}}
                                <div class="relative pimg aspect-square overflow-hidden bg-slate-100">
                                    <a href="{{ route('frontend.product-details', $productSlug) }}"
                                        class="block w-full h-full">
                                        @if ($productImage)
                                            <img src="{{ $productImage }}" alt="{{ $productName }}" width="400"
                                                height="400" loading="lazy" decoding="async"
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

                                    {{-- remove from wishlist --}}
                                    <button type="button"
                                        class="js-remove-wish absolute right-2.5 top-2.5 z-10 w-8 h-8 rounded-full bg-white/90 grid place-items-center text-[#e5383b] hover:bg-white transition"
                                        data-id="{{ $p->id }}" aria-label="Remove from wishlist"
                                        title="Remove from wishlist">
                                        <svg class="w-4 h-4" viewBox="0 0 24 24" fill="currentColor" stroke="currentColor"
                                            stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round">
                                            <path
                                                d="M19 14c1.49-1.46 3-3.21 3-5.5A5.5 5.5 0 0 0 16.5 3c-1.76 0-3 .5-4.5 2-1.5-1.5-2.74-2-4.5-2A5.5 5.5 0 0 0 2 8.5c0 2.3 1.5 4.05 3 5.5l7 7Z" />
                                        </svg>
                                    </button>
                                </div>

                                {{-- info --}}
                                <div class="p-3.5 flex flex-col flex-1">
                                    <p class="text-[11px] text-slate-400 mb-1">{{ $productCat }}</p>

                                    <h3 class="text-[13px] font-medium text-slate-800 leading-snug min-h-[2.4em]">
                                        <a href="{{ route('frontend.product-details', $productSlug) }}"
                                            class="hover:text-brand-600 transition">{{ $productName }}</a>
                                    </h3>

                                    <div class="mt-1.5 flex items-baseline gap-2 flex-wrap">
                                        @if ($hasPriceRange)
                                            <span class="font-bold text-brand-700">
                                                ৳{{ number_format($displayPrice, 0) }}–৳{{ number_format($displayPriceMax, 0) }}
                                            </span>
                                        @else
                                            <span class="font-bold text-brand-700">
                                                ৳{{ number_format($displayPrice, 0) }}
                                            </span>
                                        @endif

                                        @if ($regularPrice > $displayPrice)
                                            <span class="text-xs text-slate-400 line-through">
                                                ৳{{ number_format($regularPrice, 0) }}
                                            </span>
                                        @endif
                                    </div>

                                    @if ($hasVariants)
                                        <p class="text-[10px] text-slate-400 mt-0.5">
                                            {{ count($variantsJson) }} options available
                                        </p>
                                    @endif

                                    {{-- ✅ SAME attributes as product grid → global cart JS picks it up --}}
                                    <button type="button" data-add data-id="{{ $p->id }}"
                                        data-name="{{ $productName }}" data-price="{{ $displayPrice }}"
                                        data-image="{{ $productImage }}"
                                        data-has-variants="{{ $hasVariants ? '1' : '0' }}"
                                        data-variants='@json($variantsJson)'
                                        data-detail-url="{{ route('frontend.product-details', $productSlug) }}"
                                        class="btn btn-primary btn-sm w-full mt-3 {{ !$productInStock ? 'opacity-50 cursor-not-allowed' : '' }}"
                                        {{ !$productInStock ? 'disabled' : '' }}>
                                        <svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                            stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round">
                                            <path d="M6 2 3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4Z" />
                                            <path d="M3 6h18" />
                                            <path d="M16 10a4 4 0 0 1-8 0" />
                                        </svg>
                                        {{ !$productInStock ? 'Out of Stock' : ($hasVariants ? 'Select Options' : 'Add to Cart') }}
                                    </button>
                                </div>
                            </article>
                        @endforeach
                    </div>
                @endif
            </div>
        </div>
    </section>

    @push('scripts')
        <script>
            (function() {
                const CSRF = document.querySelector('meta[name="csrf-token"]')?.content;
                if (!CSRF) return;

                const REMOVE_URL = @json(route('frontend.wishlist.remove'));
                const CLEAR_URL = @json(route('frontend.wishlist.clear'));

                function updateHeaderCount(count) {
                    document.querySelectorAll('.js-wish-count').forEach(el => {
                        el.textContent = count;
                        el.classList.toggle('hidden', count <= 0);
                    });
                }

                /* remove single item */
                document.addEventListener('click', async function(e) {
                    const btn = e.target.closest('.js-remove-wish');
                    if (!btn || btn.disabled) return;

                    e.preventDefault();
                    btn.disabled = true;

                    try {
                        const res = await fetch(REMOVE_URL, {
                            method: 'POST',
                            headers: {
                                'Content-Type': 'application/json',
                                'Accept': 'application/json',
                                'X-CSRF-TOKEN': CSRF,
                            },
                            body: JSON.stringify({
                                product_id: btn.dataset.id
                            }),
                        });
                        const d = await res.json();

                        if (d.success) {
                            updateHeaderCount(d.count);
                            btn.closest('[data-product-id]')?.remove();

                            if (!document.querySelector('#wishlistGrid [data-product-id]')) {
                                location.reload();
                            }
                        } else {
                            btn.disabled = false;
                        }
                    } catch (err) {
                        console.error(err);
                        btn.disabled = false;
                    }
                });

                /* clear all */
                document.getElementById('clearWishlist')?.addEventListener('click', async function() {
                    if (!confirm('Remove all items from your wishlist?')) return;

                    try {
                        const res = await fetch(CLEAR_URL, {
                            method: 'POST',
                            headers: {
                                'Accept': 'application/json',
                                'X-CSRF-TOKEN': CSRF,
                            },
                        });
                        const d = await res.json();
                        if (d.success) {
                            updateHeaderCount(0);
                            location.reload();
                        }
                    } catch (err) {
                        console.error(err);
                    }
                });
            })();
        </script>
    @endpush
@endsection
