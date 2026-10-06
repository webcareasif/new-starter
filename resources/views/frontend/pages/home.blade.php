@extends('frontend.frrontend_app')
@section('content')

    {{-- ============================================================
         HERO: category sidebar + slider
    ============================================================ --}}
    <section class="container-fluid pt-4">
        <div class="grid lg:grid-cols-[272px_minmax(0,1fr)] gap-5">

            {{-- ---------- Category sidebar ---------- --}}
            <aside class="cat-side hidden lg:flex flex-col relative card !rounded-2xl h-[470px]" aria-label="All categories">
                <div
                    class="flex items-center gap-2.5 px-5 py-3.5 bg-brand-600 text-white rounded-t-2xl font-semibold text-sm">
                    <svg class="w-4 h-4" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"
                        stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                        <rect width="7" height="7" x="3" y="3" rx="1" />
                        <rect width="7" height="7" x="14" y="3" rx="1" />
                        <rect width="7" height="7" x="14" y="14" rx="1" />
                        <rect width="7" height="7" x="3" y="14" rx="1" />
                    </svg>
                    {{ __('All Categories') }}
                </div>
                <ul class="flex-1 flex flex-col justify-evenly py-1">
                    @foreach ($categories as $category)
                        <li class="relative group">
                            <a href="{{ route('frontend.all-products', ['category' => $category->slug]) }}"
                                class="cat-link flex items-center gap-3 px-5 py-[9px] text-[13.5px] font-medium text-slate-700">
                                <span class="w-7 h-7 flex items-center justify-center text-center shrink-0">
                                    @if ($category->category_image)
                                        <img src="{{ uploaded_asset($category->category_image) }}"
                                            alt="{{ $category->category_name }}" class="w-7 h-7 object-cover rounded-md">
                                    @else
                                        <span class="text-xl">🛍️</span>
                                    @endif
                                </span>
                                <span class="flex-1">{{ $category->category_name }}</span>
                                @if (($category->products_count ?? 0) > 0)
                                    <span class="text-[11px] text-slate-400 mr-1">{{ $category->products_count }}</span>
                                @endif
                            </a>
                        </li>
                    @endforeach
                </ul>
                <a href="{{ route('frontend.all-products') }}"
                    class="border-t border-slate-100 px-5 py-3 text-[13px] font-semibold text-brand-600 hover:bg-brand-50 rounded-b-2xl flex items-center justify-between">
                    View all products
                    <svg class="w-4 h-4" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"
                        stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                        <path d="M5 12h14" />
                        <path d="m12 5 7 7-7 7" />
                    </svg>
                </a>
            </aside>

            {{-- ---------- Slider ---------- --}}
            @if (!empty($sliders) && count($sliders))
                <div class="hero-slider relative rounded-2xl overflow-hidden" aria-roledescription="carousel"
                    aria-label="Featured offers" data-hero>
                    <div class="hero-track relative">
                        @foreach ($sliders as $index => $slider)
                            @php
                                $isFirst = $index === 0;
                                $sliderImage = !empty($slider['photos']) ? uploaded_asset($slider['photos']) : null;
                                $starCount = (int) ($slider['star_count'] ?? 0);
                                $overlayClass =
                                    $index % 2 === 0
                                        ? 'bg-gradient-to-r from-green/70 via-green/50 to-green/20'
                                        : 'bg-gradient-to-r from-green/75 via-green/55 to-green/25';
                            @endphp

                            <div class="hero-slide {{ $isFirst ? 'is-active' : '' }}" role="group"
                                aria-roledescription="slide" aria-label="{{ $index + 1 }} of {{ count($sliders) }}"
                                @if (!$isFirst) aria-hidden="true" @endif>
                                <div class="relative w-full h-full">

                                    @if ($sliderImage)
                                        <img src="{{ $sliderImage }}" alt="{{ $slider['title'] ?? 'Slide' }}"
                                            class="absolute inset-0 w-full h-full object-cover object-center"
                                            loading="{{ $isFirst ? 'eager' : 'lazy' }}">
                                    @else
                                        <div class="absolute inset-0 bg-gradient-to-br from-brand-700 to-brand-900"></div>
                                    @endif

                                    <div class="absolute inset-0 {{ $overlayClass }}"></div>

                                    <div class="relative z-10 h-full flex items-center">
                                        <div
                                            class="w-full px-6 sm:px-10 lg:px-14 py-10 lg:py-16 grid lg:grid-cols-2 items-center gap-6">
                                            <div class="hero-copy text-center lg:text-left max-w-xl mx-auto lg:mx-0">
                                                @if (!empty($slider['customer_review']) || $starCount > 0)
                                                    <div
                                                        class="mt-4 flex items-center gap-2 justify-center lg:justify-start">
                                                        @if ($starCount > 0)
                                                            <span class="inline-flex text-star">
                                                                @for ($i = 1; $i <= 5; $i++)
                                                                    <svg class="w-4 h-4" viewBox="0 0 24 24"
                                                                        fill="{{ $i <= $starCount ? 'currentColor' : 'none' }}"
                                                                        stroke="currentColor" stroke-width="1.8">
                                                                        <polygon
                                                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2" />
                                                                    </svg>
                                                                @endfor
                                                            </span>
                                                        @endif
                                                        @if (!empty($slider['customer_review']))
                                                            <p class="text-xs text-white/80 italic">
                                                                “{{ $slider['customer_review'] }}”
                                                            </p>
                                                        @endif
                                                    </div>
                                                @endif
                                            </div>
                                            <div class="hidden lg:block"></div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        @endforeach

                        {{-- Controls --}}
                        <div class="hero-ctrl absolute left-0 right-0 bottom-4 z-20 pointer-events-none">
                            <div class="px-6 sm:px-10 flex items-center justify-center lg:justify-between gap-4">
                                <div class="flex items-center gap-2 pointer-events-auto" role="tablist">
                                    @foreach ($sliders as $index => $slider)
                                        <button class="hero-dot {{ $index === 0 ? 'is-active' : '' }}"
                                            data-hero-dot="{{ $index }}"
                                            aria-label="Go to slide {{ $index + 1 }}"><i></i></button>
                                    @endforeach
                                </div>

                                @if (count($sliders) > 1)
                                    <div class="hidden md:flex items-center gap-2 pointer-events-auto">
                                        <button class="hero-arrow" data-hero-prev aria-label="Previous slide">
                                            <svg class="w-5 h-5 rotate-180" viewBox="0 0 24 24" fill="none"
                                                stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                                stroke-linejoin="round" aria-hidden="true">
                                                <path d="m9 18 6-6-6-6" />
                                            </svg>
                                        </button>
                                        <button class="hero-arrow" data-hero-next aria-label="Next slide">
                                            <svg class="w-5 h-5" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                                stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"
                                                aria-hidden="true">
                                                <path d="m9 18 6-6-6-6" />
                                            </svg>
                                        </button>
                                    </div>
                                @endif
                            </div>
                        </div>
                    </div>
                </div>
            @endif
        </div>
    </section>

    {{-- ============================================================
         TRUST BADGES
    ============================================================ --}}
    <section class="container-fluid mt-5">
        <div class="grid grid-cols-2 lg:grid-cols-4 gap-3">
            <div class="flex items-center gap-3 rounded-2xl border border-brand-100 bg-brand-50/60 px-4 py-3.5">
                <span class="text-brand-600"><svg class="w-7 h-7" viewBox="0 0 24 24" fill="none"
                        stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"
                        aria-hidden="true">
                        <path d="M14 18V6a2 2 0 0 0-2-2H4a2 2 0 0 0-2 2v11a1 1 0 0 0 1 1h2" />
                        <path d="M15 18H9" />
                        <path d="M19 18h2a1 1 0 0 0 1-1v-3.65a1 1 0 0 0-.22-.624l-3.48-4.35A1 1 0 0 0 17.52 8H14" />
                        <circle cx="17" cy="18" r="2" />
                        <circle cx="7" cy="18" r="2" />
                    </svg></span>
                <div>
                    <p class="text-[13px] font-semibold text-slate-800">Free Delivery</p>
                    <p class="text-[11px] text-slate-500">All Over Bangladesh</p>
                </div>
            </div>
            <div class="flex items-center gap-3 rounded-2xl border border-brand-100 bg-brand-50/60 px-4 py-3.5">
                <span class="text-brand-600"><svg class="w-7 h-7" viewBox="0 0 24 24" fill="none"
                        stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"
                        aria-hidden="true">
                        <rect width="20" height="12" x="2" y="6" rx="2" />
                        <circle cx="12" cy="12" r="2" />
                        <path d="M6 12h.01M18 12h.01" />
                    </svg></span>
                <div>
                    <p class="text-[13px] font-semibold text-slate-800">Cash on Delivery</p>
                    <p class="text-[11px] text-slate-500">Pay After Receive</p>
                </div>
            </div>
            <div class="flex items-center gap-3 rounded-2xl border border-brand-100 bg-brand-50/60 px-4 py-3.5">
                <span class="text-brand-600"><svg class="w-7 h-7" viewBox="0 0 24 24" fill="none"
                        stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"
                        aria-hidden="true">
                        <path d="M3 12a9 9 0 1 0 9-9 9.75 9.75 0 0 0-6.74 2.74L3 8" />
                        <path d="M3 3v5h5" />
                    </svg></span>
                <div>
                    <p class="text-[13px] font-semibold text-slate-800">Easy Return</p>
                    <p class="text-[11px] text-slate-500">Within 7 Days</p>
                </div>
            </div>
            <div class="flex items-center gap-3 rounded-2xl border border-brand-100 bg-brand-50/60 px-4 py-3.5">
                <span class="text-brand-600"><svg class="w-7 h-7" viewBox="0 0 24 24" fill="none"
                        stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"
                        aria-hidden="true">
                        <path
                            d="M20 13c0 5-3.5 7.5-7.66 8.95a1 1 0 0 1-.67-.01C7.5 20.5 4 18 4 13V6a1 1 0 0 1 1-1c2 0 4.5-1.2 6.24-2.72a1.17 1.17 0 0 1 1.52 0C14.51 3.81 17 5 19 5a1 1 0 0 1 1 1z" />
                        <path d="m9 12 2 2 4-4" />
                    </svg></span>
                <div>
                    <p class="text-[13px] font-semibold text-slate-800">100% Genuine</p>
                    <p class="text-[11px] text-slate-500">Quality Products</p>
                </div>
            </div>
        </div>
    </section>

    {{-- ============================================================
         MOBILE CATEGORY CIRCLES (dynamic)
    ============================================================ --}}
    @if ($categories->count())
        <section class="container-fluid pt-8 pb-2 lg:hidden">
            <div class="flex gap-5 overflow-x-auto snap-x pb-2 -mx-4 px-4 no-scrollbar">
                @foreach ($categories as $category)
                    <a href="{{ route('frontend.all-products', ['category' => $category->slug]) }}"
                        class="cat-item flex flex-col items-center gap-2 w-[96px] shrink-0 snap-start">
                        <span
                            class="cat-circle w-[88px] h-[88px] rounded-full border border-slate-200 grid place-items-center overflow-hidden bg-brand-50">
                            @if ($category->category_image)
                                <img src="{{ uploaded_asset($category->category_image) }}"
                                    alt="{{ $category->category_name }}" class="w-full h-full object-cover"
                                    loading="lazy">
                            @else
                                <span class="text-4xl">🛍️</span>
                            @endif
                        </span>
                        <span class="text-[13px] font-medium text-slate-800 text-center leading-tight">
                            {{ $category->category_name }}
                        </span>
                        <span class="text-[11px] text-slate-400 -mt-1.5">{{ $category->products_count }} items</span>
                    </a>
                @endforeach
            </div>
        </section>
    @endif

    {{-- ============================================================
         FLASH SALE (products with a real discount)
    ============================================================ --}}
    @if ($flashProducts->count())
        <section id="flash" class="container-fluid pt-8 lg:pt-12">
            <div class="flex items-end justify-between gap-4 flex-wrap mb-5">
                <div class="flex items-center gap-3">
                    <span class="text-[#e5383b]"><svg class="w-7 h-7" viewBox="0 0 24 24" fill="none"
                            stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"
                            aria-hidden="true">
                            <path
                                d="M4 14a1 1 0 0 1-.78-1.63l9.9-10.2a.5.5 0 0 1 .86.46l-1.92 6.02A1 1 0 0 0 13 10h7a1 1 0 0 1 .78 1.63l-9.9 10.2a.5.5 0 0 1-.86-.46l1.92-6.02A1 1 0 0 0 11 14z"
                                fill="currentColor" />
                        </svg></span>
                    <div>
                        <h2 class="section-title">Flash Sale</h2>
                        <p class="text-xs text-slate-500 mt-0.5">Limited Time Offer</p>
                    </div>
                </div>
                <div class="flex flex-wrap items-center gap-2 sm:gap-3" data-countdown>
                    <div class="cd-box"><b data-cd="d">00</b><small>Days</small></div>
                    <div class="cd-box"><b data-cd="h">00</b><small>Hours</small></div>
                    <div class="cd-box"><b data-cd="m">00</b><small>Minutes</small></div>
                    <div class="cd-box"><b data-cd="s">00</b><small>Seconds</small></div>
                    <a href="{{ route('frontend.all-products', ['on_sale' => 1]) }}"
                        class="btn btn-primary btn-sm sm:ml-2">View All
                        <svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                            stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                            <path d="M5 12h14" />
                            <path d="m12 5 7 7-7 7" />
                        </svg>
                    </a>
                </div>
            </div>

            <div
                class="flex gap-4 overflow-x-auto snap-x snap-mandatory -mx-4 px-4 pb-2 no-scrollbar md:mx-0 md:px-0 md:overflow-visible md:grid md:grid-cols-3 lg:grid-cols-5">
                @foreach ($flashProducts as $product)
                    @include('frontend.partials.product-card', [
                        'product' => $product,
                        'cardClass' => 'min-w-[62%] sm:min-w-[40%] snap-start md:min-w-0',
                    ])
                @endforeach
            </div>
        </section>
    @endif


    <section class="container-fluid mt-10 grid md:grid-cols-2 gap-5">
        <a href="shop.html"
            class="relative overflow-hidden rounded-2xl p-7 min-h-[200px] flex flex-col justify-center text-white"
            style="background:linear-gradient(110deg,#2b6a3d,#4c8a58)">
            <p class="text-sm opacity-90">New Arrivals</p>
            <h3 class="text-2xl font-bold mt-1 leading-tight">Stylish Collection<br>For Everyone</h3><span
                class="btn btn-dark btn-sm mt-5 self-start">Shop Now <svg class="w-3.5 h-3.5" viewBox="0 0 24 24"
                    fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                    stroke-linejoin="round" aria-hidden="true">
                    <path d="M5 12h14"></path>
                    <path d="m12 5 7 7-7 7"></path>
                </svg></span>
            <span class="absolute right-6 bottom-0 text-[9rem] leading-none opacity-95">🧔</span>
        </a>
        <a href="shop.html"
            class="relative overflow-hidden rounded-2xl p-7 min-h-[200px] flex flex-col justify-center text-white"
            style="background:linear-gradient(110deg,#1f5e33,#3f8350)">
            <p class="text-sm opacity-90">Home &amp; Living</p>
            <h3 class="text-2xl font-bold mt-1 leading-tight">Make Your Home<br>More Beautiful</h3><span
                class="btn btn-dark btn-sm mt-5 self-start">Shop Now <svg class="w-3.5 h-3.5" viewBox="0 0 24 24"
                    fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                    stroke-linejoin="round" aria-hidden="true">
                    <path d="M5 12h14"></path>
                    <path d="m12 5 7 7-7 7"></path>
                </svg></span>
            <span class="absolute right-6 bottom-2 text-[8rem] leading-none opacity-95">🛋️</span>
        </a>
    </section>

    {{-- ============================================================
         BEST SELLING (tabs by category)
    ============================================================ --}}
    @if ($bestSelling->count())
        <section class="container-fluid mt-12" id="best">
            <div class="flex items-end justify-between gap-4 flex-wrap mb-5">
                <div class="flex items-center gap-3">
                    <span class="text-star"><svg class="w-7 h-7" viewBox="0 0 24 24" fill="none"
                            stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"
                            aria-hidden="true">
                            <path d="m2 4 3 12h14l3-12-6 7-4-7-4 7-6-7zm3 16h14" fill="currentColor" />
                        </svg></span>
                    <div>
                        <h2 class="section-title">Best Selling Products</h2>
                        <p class="text-xs text-slate-500 mt-0.5">Our customers love these products</p>
                    </div>
                </div>

                @if ($bestTabs->count())
                    <div class="flex gap-1 overflow-x-auto no-scrollbar max-w-full -mx-1 px-1" data-tabs="best">
                        <button data-tab="all" class="tab-btn active">All</button>
                        @foreach ($bestTabs as $tab)
                            <button data-tab="{{ $tab['slug'] }}" class="tab-btn">{{ $tab['name'] }}</button>
                        @endforeach
                    </div>
                @endif
            </div>

            {{-- All --}}
            <div data-panel="all" class="active">
                <div class="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-5 gap-4">
                    @foreach ($bestSelling as $product)
                        @include('frontend.partials.product-card', ['product' => $product])
                    @endforeach
                </div>
            </div>

            {{-- One panel per category --}}
            @foreach ($bestTabs as $tab)
                <div data-panel="{{ $tab['slug'] }}" class="">
                    <div class="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-5 gap-4">
                        @foreach ($tab['products'] as $product)
                            @include('frontend.partials.product-card', ['product' => $product])
                        @endforeach
                    </div>
                </div>
            @endforeach
        </section>
    @endif

    {{-- ============================================================
         "POPULAR IN {CATEGORY}" SECTIONS (full width, no side panel)
    ============================================================ --}}
    @foreach ($categorySections as $section)
        @php($cat = $section['category'])

        <section class="container-fluid mt-14" aria-labelledby="cs-{{ $cat->id }}">
            <div class="flex items-center justify-between mb-4">
                <h2 id="cs-{{ $cat->id }}" class="section-title">Popular in {{ $cat->category_name }}</h2>
                <a href="{{ route('frontend.all-products', ['category' => $cat->slug]) }}"
                    class="text-sm font-medium text-brand-600 hover:text-brand-800 inline-flex items-center gap-1.5">
                    View all
                    <svg class="w-4 h-4" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"
                        stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                        <path d="M5 12h14" />
                        <path d="m12 5 7 7-7 7" />
                    </svg>
                </a>
            </div>

            <div class="cat-grid grid grid-cols-2 md:grid-cols-3 lg:grid-cols-5 gap-4">
                @foreach ($section['products'] as $product)
                    @include('frontend.partials.product-card', ['product' => $product])
                @endforeach
            </div>
        </section>
    @endforeach

    {{-- ============================================================
         WHY CHOOSE US
    ============================================================ --}}
    <section class="container-fluid mt-16 text-center">
        <h2 class="section-title">Why Choose NexioMart?</h2>
        <p class="text-xs text-slate-500 mt-1">We are committed to giving you the best shopping experience.</p>
        <div class="mt-8 grid grid-cols-2 lg:grid-cols-4 gap-y-8 lg:divide-x divide-slate-200">
            <div class="flex flex-col items-center text-center px-4">
                <span class="w-16 h-16 rounded-full bg-brand-50 text-brand-600 grid place-items-center mb-3">
                    <svg class="w-8 h-8" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"
                        stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                        <path d="M14 18V6a2 2 0 0 0-2-2H4a2 2 0 0 0-2 2v11a1 1 0 0 0 1 1h2" />
                        <path d="M15 18H9" />
                        <path d="M19 18h2a1 1 0 0 0 1-1v-3.65a1 1 0 0 0-.22-.624l-3.48-4.35A1 1 0 0 0 17.52 8H14" />
                        <circle cx="17" cy="18" r="2" />
                        <circle cx="7" cy="18" r="2" />
                    </svg>
                </span>
                <h3 class="font-semibold text-slate-900 text-sm">First Delivery</h3>
                <p class="text-xs text-slate-500 mt-1">All Over Bangladesh</p>
            </div>
            <div class="flex flex-col items-center text-center px-4">
                <span class="w-16 h-16 rounded-full bg-brand-50 text-brand-600 grid place-items-center mb-3">
                    <svg class="w-8 h-8" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"
                        stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                        <path
                            d="M20 13c0 5-3.5 7.5-7.66 8.95a1 1 0 0 1-.67-.01C7.5 20.5 4 18 4 13V6a1 1 0 0 1 1-1c2 0 4.5-1.2 6.24-2.72a1.17 1.17 0 0 1 1.52 0C14.51 3.81 17 5 19 5a1 1 0 0 1 1 1z" />
                        <path d="m9 12 2 2 4-4" />
                    </svg>
                </span>
                <h3 class="font-semibold text-slate-900 text-sm">Secure Payment</h3>
                <p class="text-xs text-slate-500 mt-1">100% Safe & Secure</p>
            </div>
            <div class="flex flex-col items-center text-center px-4">
                <span class="w-16 h-16 rounded-full bg-brand-50 text-brand-600 grid place-items-center mb-3">
                    <svg class="w-8 h-8" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"
                        stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                        <path
                            d="M21 8a2 2 0 0 0-1-1.73l-7-4a2 2 0 0 0-2 0l-7 4A2 2 0 0 0 3 8v8a2 2 0 0 0 1 1.73l7 4a2 2 0 0 0 2 0l7-4A2 2 0 0 0 21 16Z" />
                        <path d="m3.3 7 8.7 5 8.7-5" />
                        <path d="M12 22V12" />
                    </svg>
                </span>
                <h3 class="font-semibold text-slate-900 text-sm">Easy Return</h3>
                <p class="text-xs text-slate-500 mt-1">Within 7 Days</p>
            </div>
            <div class="flex flex-col items-center text-center px-4">
                <span class="w-16 h-16 rounded-full bg-brand-50 text-brand-600 grid place-items-center mb-3">
                    <svg class="w-8 h-8" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"
                        stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                        <path
                            d="M3 11h3a2 2 0 0 1 2 2v3a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-5Zm0 0a9 9 0 1 1 18 0m0 0v5a2 2 0 0 1-2 2h-1a2 2 0 0 1-2-2v-3a2 2 0 0 1 2-2h3Z" />
                        <path d="M21 16v2a4 4 0 0 1-4 4h-5" />
                    </svg>
                </span>
                <h3 class="font-semibold text-slate-900 text-sm">24/7 Support</h3>
                <p class="text-xs text-slate-500 mt-1">Always Here for You</p>
            </div>
        </div>
    </section>


    {{-- ============================================================
         NEWSLETTER
    ============================================================ --}}
    <section class="container-fluid mt-14 mb-14">
        <div class="nl-bg rounded-2xl px-7 py-9 md:px-12 flex flex-col lg:flex-row lg:items-center gap-6 text-white">
            <div class="flex items-center gap-5 flex-1">
                <span class="hidden sm:block text-brand-100">
                    <svg class="w-14 h-14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"
                        stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                        <rect width="20" height="16" x="2" y="4" rx="2" />
                        <path d="m22 7-8.97 5.7a1.94 1.94 0 0 1-2.06 0L2 7" />
                    </svg>
                </span>
                <div>
                    <h2 class="text-2xl font-bold">Join Our Newsletter</h2>
                    <p class="text-sm text-brand-100 mt-1">Get the latest offers, new arrivals and exclusive discounts.
                    </p>
                </div>
            </div>
            <form data-demo data-msg="You're subscribed. Welcome to NexioMart!" class="flex flex-1 max-w-lg w-full">
                <label class="sr-only" for="nl">Email address</label>
                <input id="nl" type="email" required placeholder="Enter your email address"
                    class="field !rounded-r-none !border-0 text-slate-800">
                <button
                    class="btn bg-brand-500 hover:bg-brand-600 text-white !rounded-l-none !rounded-r-[10px] border border-white/30">Subscribe</button>
            </form>
        </div>
    </section>

@endsection


@push('scripts')
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
        }, true)
    </script>
@endpush
