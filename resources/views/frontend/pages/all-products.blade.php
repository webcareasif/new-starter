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
                <h3 class="font-semibold text-slate-900 mb-3 text-sm">Max Price</h3>
                <input id="priceRange" name="max_price" type="range" min="200" max="15000" step="100"
                    value="{{ request('max_price', 15000) }}" class="filter-input" aria-label="Maximum price">
                <div class="flex justify-between text-xs text-slate-500 mt-1">
                    <span>৳200</span>
                    <b id="priceOut" class="text-brand-700">৳{{ number_format(request('max_price', 5000)) }}</b>
                </div>
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
    <script>
        (function() {
            const sortSelect = document.getElementById('sort');
            const priceRange = document.getElementById('priceRange');
            const priceOut = document.getElementById('priceOut');
            const resetBtn = document.getElementById('resetFilters');
            const applyBtn = document.getElementById('applyFilters');
            const baseUrl = "{{ route('frontend.all-products') }}";

            let debounceTimer = null;

            function collectParams() {
                const params = new URLSearchParams();

                const cat = document.querySelector('input[name="category"]:checked');
                if (cat && cat.value) params.set('category', cat.value);

                if (priceRange) params.set('max_price', priceRange.value);

                const rating = document.querySelector('input[name="rating"]:checked');
                if (rating) params.set('rating', rating.value);

                const inStock = document.querySelector('input[name="in_stock"]');
                if (inStock && inStock.checked) params.set('in_stock', '1');

                const onSale = document.querySelector('input[name="on_sale"]');
                if (onSale && onSale.checked) params.set('on_sale', '1');

                if (sortSelect && sortSelect.value) params.set('sort', sortSelect.value);

                return params;
            }

            function loadProducts(pushState = true) {
                const params = collectParams();
                const url = baseUrl + '?' + params.toString();

                // Re-query every time (innerHTML may have replaced the node)
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
                        // Guard: only replace if we actually got HTML
                        if (typeof data.html === 'string' && data.html.length > 0) {
                            box.innerHTML = data.html;
                        } else {
                            console.warn('AJAX returned no html — controller may not be returning JSON.');
                        }
                        box.style.opacity = '1';
                        box.style.pointerEvents = 'auto';

                        if (pushState) history.pushState({}, '', url);
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

            /* ---------- Bind filter events ---------- */
            document.querySelectorAll('.filter-input').forEach(el => {
                const evt = (el.type === 'range' || el.type === 'text') ? 'input' : 'change';
                el.addEventListener(evt, () => {
                    if (el.type === 'range') {
                        loadProductsDebounced();
                    } else {
                        loadProducts();
                    }
                });
            });

            if (sortSelect) {
                sortSelect.addEventListener('change', () => loadProducts());
            }

            if (priceRange && priceOut) {
                priceRange.addEventListener('input', () => {
                    priceOut.textContent = '৳' + Number(priceRange.value).toLocaleString();
                });
            }

            if (applyBtn) {
                applyBtn.addEventListener('click', () => loadProducts());
            }

            if (resetBtn) {
                resetBtn.addEventListener('click', () => {
                    document.querySelectorAll('.filter-input').forEach(el => {
                        if (el.type === 'radio' || el.type === 'checkbox') el.checked = false;
                    });

                    const allCat = document.querySelector('input[name="category"][value=""]');
                    if (allCat) allCat.checked = true;

                    if (priceRange) {
                        priceRange.value = 5000;
                        priceOut.textContent = '৳5,000';
                    }

                    if (sortSelect) sortSelect.value = '';

                    loadProducts();
                });
            }

            window.addEventListener('popstate', () => window.location.reload());

            /* ---------- Pagination via AJAX ---------- */
            document.addEventListener('click', function(e) {
                // Laravel's default pagination renders <a> inside <nav>
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
                    })
                    .catch(err => {
                        console.error(err);
                        box.style.opacity = '1';
                    });
            });
        })();
    </script>

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
        }, true); // capture phase = runs before other handlers
    </script>
@endpush
