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
                    stroke-linecap="round" stroke-linejoin="round">
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

            {{-- Categories --}}
            <div class="card p-5">
                <h3 class="font-semibold text-slate-900 mb-2 text-sm">Categories</h3>

                <label class="flex items-center justify-between text-[13px] py-1.5 cursor-pointer">
                    <span class="flex items-center gap-2.5">
                        <input type="radio" name="category" value="" class="filter-input"
                            {{ !request('category') ? 'checked' : '' }}>
                        All Products
                    </span>
                    <span class="text-xs text-slate-400">
                        {{ $categories->sum('products_count') }}
                    </span>
                </label>

                @foreach ($categories as $cat)
                    <label class="flex items-center justify-between text-[13px] py-1.5 cursor-pointer">
                        <span class="flex items-center gap-2.5">
                            <input type="radio" name="category" value="{{ $cat->slug }}" class="filter-input"
                                {{ request('category') === $cat->slug ? 'checked' : '' }}>
                            {{ $cat->category_name }}
                        </span>
                        <span class="text-xs text-slate-400">{{ $cat->products_count }}</span>
                    </label>
                @endforeach
            </div>

            {{-- Max Price --}}
            <div class="card p-5">
                <h3 class="font-semibold text-slate-900 mb-3 text-sm">Price Range</h3>

                <div id="priceSlider" class="mt-2 mb-3"></div>

                <div class="flex justify-between text-xs text-slate-500">
                    <span>Min: <b id="priceMinOut"
                            class="text-brand-700">৳{{ number_format((float) request('min_price', 0)) }}</b></span>
                    <span>Max: <b id="priceMaxOut"
                            class="text-brand-700">৳{{ number_format((float) request('max_price', 15000)) }}</b></span>
                </div>

                {{-- hidden inputs — filter form এগুলো submit করবে --}}
                <input type="hidden" name="min_price" id="minPriceInput" value="{{ request('min_price', 0) }}">
                <input type="hidden" name="max_price" id="maxPriceInput" value="{{ request('max_price', 15000) }}">
            </div>

            {{-- Rating --}}
            <div class="card p-5">
                <h3 class="font-semibold text-slate-900 mb-2 text-sm">Rating</h3>
                @foreach ([5, 4, 3] as $r)
                    <label class="flex items-center gap-2.5 py-1.5 text-[13px] cursor-pointer">
                        <input type="radio" name="rating" value="{{ $r }}" class="filter-input"
                            {{ request('rating') == $r ? 'checked' : '' }}>
                        <span class="inline-flex text-star">
                            @for ($i = 0; $i < $r; $i++)
                                <svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="currentColor" stroke="currentColor"
                                    stroke-width="1.8">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2" />
                                </svg>
                            @endfor
                        </span>
                        <span class="text-xs text-slate-400">&amp; up</span>
                    </label>
                @endforeach
            </div>

            {{-- Availability --}}
            <div class="card p-5">
                <h3 class="font-semibold text-slate-900 mb-2 text-sm">Availability</h3>
                <label class="flex items-center justify-between text-[13px] py-1.5 cursor-pointer">
                    <span class="flex items-center gap-2.5">
                        <input type="checkbox" name="in_stock" value="1" class="filter-input"
                            {{ request('in_stock') ? 'checked' : '' }}>
                        In Stock
                    </span>
                </label>
                <label class="flex items-center justify-between text-[13px] py-1.5 cursor-pointer">
                    <span class="flex items-center gap-2.5">
                        <input type="checkbox" name="on_sale" value="1" class="filter-input"
                            {{ request('on_sale') ? 'checked' : '' }}>
                        On Sale
                    </span>
                </label>
            </div>

            <button type="button" id="applyFilters" class="btn btn-primary w-full">Apply Filters</button>
            <button type="button" id="resetFilters" class="btn btn-outline w-full mt-2">Reset</button>
        </aside>

        {{-- Product Listing --}}
        <div>
            <div id="productResults">
                {{-- Sort Bar --}}
                <div class="flex flex-wrap items-center justify-end gap-3 mb-5">
                    <label class="sr-only" for="sort">Sort</label>
                    <select id="sort" name="sort" class="field !w-auto !py-2 !text-[13px]">
                        <option value="" {{ request('sort') === null ? 'selected' : '' }}>Sort: Featured</option>
                        <option value="price_low" {{ request('sort') === 'price_low' ? 'selected' : '' }}>Price: Low to
                            High</option>
                        <option value="price_high" {{ request('sort') === 'price_high' ? 'selected' : '' }}>Price: High to
                            Low</option>
                        <option value="top_rated" {{ request('sort') === 'top_rated' ? 'selected' : '' }}>Top Rated
                        </option>
                        <option value="newest" {{ request('sort') === 'newest' ? 'selected' : '' }}>Newest</option>
                    </select>
                </div>

                @include('frontend.partials.product-results', ['products' => $products])
            </div>
        </div>
    </section>
@endsection

@push('scripts')
    {{-- noUiSlider CDN --}}
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/nouislider@15.7.1/dist/nouislider.min.css">
    <script src="https://cdn.jsdelivr.net/npm/nouislider@15.7.1/dist/nouislider.min.js"></script>

    <script>
        (function() {
            const sortSelect = document.getElementById('sort');
            const resetBtn = document.getElementById('resetFilters');
            const applyBtn = document.getElementById('applyFilters');
            const baseUrl = "{{ route('frontend.all-products') }}";

            const minPriceInput = document.getElementById('minPriceInput');
            const maxPriceInput = document.getElementById('maxPriceInput');
            const priceMinOut = document.getElementById('priceMinOut');
            const priceMaxOut = document.getElementById('priceMaxOut');
            const sliderEl = document.getElementById('priceSlider');

            let debounceTimer = null;

            /* ==============================================================
             | Slider bounds — server থেকে render করা window.PRICE_BOUNDS
             |==============================================================*/
            const BOUNDS = window.PRICE_BOUNDS || {
                min: 0,
                max: 15000,
                step: 100,
                currentMin: parseInt(minPriceInput?.value || 0, 10),
                currentMax: parseInt(maxPriceInput?.value || 15000, 10),
            };

            const money = n => '৳' + Number(n).toLocaleString('en-US');

            /* ==============================================================
             | Collect params for AJAX request
             |==============================================================*/
            function collectParams() {
                const params = new URLSearchParams();

                const cat = document.querySelector('input[name="category"]:checked');
                if (cat && cat.value) params.set('category', cat.value);

                // min / max — hidden inputs থেকে
                if (minPriceInput && minPriceInput.value !== '') {
                    params.set('min_price', minPriceInput.value);
                }
                if (maxPriceInput && maxPriceInput.value !== '') {
                    params.set('max_price', maxPriceInput.value);
                }

                const rating = document.querySelector('input[name="rating"]:checked');
                if (rating) params.set('rating', rating.value);

                const inStock = document.querySelector('input[name="in_stock"]');
                if (inStock && inStock.checked) params.set('in_stock', '1');

                const onSale = document.querySelector('input[name="on_sale"]');
                if (onSale && onSale.checked) params.set('on_sale', '1');

                if (sortSelect && sortSelect.value) params.set('sort', sortSelect.value);

                return params;
            }

            /* ==============================================================
             | Load products via AJAX
             |==============================================================*/
            function loadProducts(pushState = true) {
                const params = collectParams();
                const url = baseUrl + '?' + params.toString();

                const box = document.getElementById('productResults');
                if (!box) return;

                box.style.opacity = '0.5';
                box.style.pointerEvents = 'none';

                fetch(url, {
                        headers: {
                            'X-Requested-With': 'XMLHttpRequest',
                            'Accept': 'application/json',
                        }
                    })
                    .then(res => res.json())
                    .then(data => {
                        if (typeof data.html === 'string' && data.html.length > 0) {
                            box.innerHTML = data.html;
                        } else {
                            console.warn('AJAX returned no html — controller may not be returning JSON.');
                        }
                        box.style.opacity = '1';
                        box.style.pointerEvents = 'auto';

                        if (pushState) history.pushState({}, '', url);

                        // let wishlist hearts re-sync
                        window.dispatchEvent(new Event('products:loaded'));
                    })
                    .catch(err => {
                        console.error(err);
                        box.style.opacity = '1';
                        box.style.pointerEvents = 'auto';
                    });
            }

            function loadProductsDebounced() {
                clearTimeout(debounceTimer);
                debounceTimer = setTimeout(() => loadProducts(), 400);
            }

            /* ==============================================================
             | noUiSlider — double handle
             |==============================================================*/
            let sliderInstance = null;

            if (sliderEl && typeof noUiSlider !== 'undefined') {
                // Safety clamp
                const startMin = Math.max(BOUNDS.min, Math.min(BOUNDS.currentMin, BOUNDS.max));
                const startMax = Math.max(startMin, Math.min(BOUNDS.currentMax, BOUNDS.max));

                noUiSlider.create(sliderEl, {
                    start: [startMin, startMax],
                    connect: true,
                    step: BOUNDS.step,
                    range: {
                        min: BOUNDS.min,
                        max: BOUNDS.max
                    },
                    format: {
                        to: v => Math.round(v),
                        from: v => Number(v),
                    },
                });

                sliderInstance = sliderEl.noUiSlider;

                let userInteracted = false;
                sliderEl.addEventListener('pointerdown', () => {
                    userInteracted = true;
                });
                sliderEl.addEventListener('touchstart', () => {
                    userInteracted = true;
                }, {
                    passive: true
                });

                sliderInstance.on('update', function(values) {
                    const [min, max] = values.map(Number);

                    if (priceMinOut) priceMinOut.textContent = money(min);
                    if (priceMaxOut) priceMaxOut.textContent = money(max);

                    if (minPriceInput) minPriceInput.value = min;
                    if (maxPriceInput) maxPriceInput.value = max;
                });

                sliderInstance.on('change', function() {
                    if (!userInteracted) return;
                    loadProductsDebounced();
                });
            }

            /* ==============================================================
             | Other filter inputs (radio, checkbox, text, sort)
             |==============================================================*/
            document.querySelectorAll('.filter-input').forEach(el => {
                // skip slider related inputs — they're handled above
                if (el === minPriceInput || el === maxPriceInput) return;

                const evt = (el.type === 'range' || el.type === 'text') ? 'input' : 'change';
                el.addEventListener(evt, () => {
                    if (el.type === 'range' || el.type === 'text') {
                        loadProductsDebounced();
                    } else {
                        loadProducts();
                    }
                });
            });

            if (sortSelect) {
                sortSelect.addEventListener('change', () => loadProducts());
            }

            if (applyBtn) {
                applyBtn.addEventListener('click', () => loadProducts());
            }

            /* ==============================================================
             | Reset filters
             |==============================================================*/
            if (resetBtn) {
                resetBtn.addEventListener('click', () => {
                    // radios / checkboxes
                    document.querySelectorAll('.filter-input').forEach(el => {
                        if (el.type === 'radio' || el.type === 'checkbox') el.checked = false;
                    });

                    const allCat = document.querySelector('input[name="category"][value=""]');
                    if (allCat) allCat.checked = true;

                    // reset slider to full range
                    if (sliderInstance) {
                        sliderInstance.set([BOUNDS.min, BOUNDS.max]);
                    } else {
                        if (minPriceInput) minPriceInput.value = BOUNDS.min;
                        if (maxPriceInput) maxPriceInput.value = BOUNDS.max;
                        if (priceMinOut) priceMinOut.textContent = money(BOUNDS.min);
                        if (priceMaxOut) priceMaxOut.textContent = money(BOUNDS.max);
                    }

                    if (sortSelect) sortSelect.value = '';

                    loadProducts();
                });
            }

            window.addEventListener('popstate', () => window.location.reload());

            /* ==============================================================
             | Pagination via AJAX
             |==============================================================*/
            document.addEventListener('click', function(e) {
                const link = e.target.closest('#productResults nav a');
                if (!link || !link.href) return;

                e.preventDefault();

                const box = document.getElementById('productResults');
                if (!box) return;

                box.style.opacity = '0.5';

                fetch(link.href, {
                        headers: {
                            'X-Requested-With': 'XMLHttpRequest',
                            'Accept': 'application/json'
                        }
                    })
                    .then(res => res.json())
                    .then(data => {
                        if (typeof data.html === 'string' && data.html.length > 0) {
                            box.innerHTML = data.html;
                        }
                        box.style.opacity = '1';
                        history.pushState({}, '', link.href);
                        box.scrollIntoView({
                            behavior: 'smooth',
                            block: 'start'
                        });

                        window.dispatchEvent(new Event('products:loaded'));
                    })
                    .catch(err => {
                        console.error(err);
                        box.style.opacity = '1';
                    });
            });
        })();
    </script>

    {{-- Variant product redirect --}}
    <script>
        document.addEventListener('click', function(e) {
            const btn = e.target.closest('[data-add]');
            if (!btn || btn.disabled) return;
            if (btn.dataset.hasVariants !== '1') return;

            e.preventDefault();
            e.stopPropagation();
            e.stopImmediatePropagation();

            const url = btn.dataset.detailUrl;
            if (url) window.location.href = url;
        }, true);
    </script>

    {{-- Slider CSS --}}
    <style>
        #priceSlider {
            height: 6px;
            margin: 1rem 0 1.25rem;
        }

        #priceSlider .noUi-connect {
            background: #0A6530;
            z-index: 10;
        }

        #priceSlider .noUi-handle {
            width: 18px;
            height: 18px;
            border-radius: 50%;
            background: #fff;
            border: 2px solid #0A6530;
            box-shadow: 0 1px 3px rgba(0, 0, 0, .15);
            top: -7px;
            cursor: grab;
            z-index: 10;
        }

        #priceSlider .noUi-handle:active {
            cursor: grabbing;
        }

        #priceSlider .noUi-handle::before,
        #priceSlider .noUi-handle::after {
            display: none;
        }

        #priceSlider .noUi-touch-area {
            cursor: grab;
        }
    </style>
@endpush
