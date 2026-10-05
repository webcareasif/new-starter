@extends('frontend.frrontend_app')
@section('content')
    <section class="container-fluid pt-4">
        <div class="grid lg:grid-cols-[272px_minmax(0,1fr)] gap-5">
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
                        @php
                            $hasSubcategories = ($category->subcategories ?? collect())->count() > 0;
                            $hasProducts = ($category->products_count ?? 0) > 0;
                            $hasMegaContent = $hasSubcategories || $hasProducts;
                        @endphp

                        <li class="relative group">
                            <a href="{{ route('frontend.all-products', ['category' => $category->slug]) }}"
                                class="cat-link flex items-center gap-3 px-5 py-[9px] text-[13.5px] font-medium text-slate-700">

                                {{-- Category Icon --}}
                                <span class="w-7 h-7 flex items-center justify-center text-center shrink-0">
                                    @if ($category->category_image)
                                        <img src="{{ uploaded_asset($category->category_image) }}"
                                            alt="{{ $category->category_name }}" class="w-7 h-7 object-cover rounded-md">
                                    @else
                                        <span class="text-xl">🛍️</span>
                                    @endif
                                </span>
                                <span class="flex-1">
                                    {{ $category->category_name }}
                                </span>
                                @if (($category->products_count ?? 0) > 0)
                                    <span class="text-[11px] text-slate-400 mr-1">
                                        {{ $category->products_count }}
                                    </span>
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
            @if (!empty($sliders) && count($sliders))
                <div class="hero-slider relative rounded-2xl overflow-hidden" aria-roledescription="carousel"
                    aria-label="Featured offers" data-hero>
                    <div class="hero-track relative">
                        @foreach ($sliders as $index => $slider)
                            @php
                                $isFirst = $index === 0;

                                $sliderImage = !empty($slider['photos']) ? uploaded_asset($slider['photos']) : null;

                                $starCount = (int) ($slider['star_count'] ?? 0);

                                $sliderLink = $slider['button_link'] ?? '#';

                                // Alternate overlay darkness for visual variety
                                $overlayClass =
                                    $index % 2 === 0
                                        ? 'bg-gradient-to-r from-green/70 via-green/50 to-green/20'
                                        : 'bg-gradient-to-r from-green/75 via-green/55 to-green/25';
                            @endphp

                            <div class="hero-slide {{ $isFirst ? 'is-active' : '' }}" role="group"
                                aria-roledescription="slide" aria-label="{{ $index + 1 }} of {{ count($sliders) }}"
                                @if (!$isFirst) aria-hidden="true" @endif>

                                <div class="relative w-full h-full">

                                    {{-- ---------- FULL-BLEED BACKGROUND IMAGE ---------- --}}
                                    @if ($sliderImage)
                                        <img src="{{ $sliderImage }}" alt="{{ $slider['title'] ?? 'Slide' }}"
                                            class="absolute inset-0 w-full h-full object-cover object-center"
                                            loading="{{ $isFirst ? 'eager' : 'lazy' }}">
                                    @else
                                        {{-- Fallback gradient if no image --}}
                                        <div class="absolute inset-0 bg-gradient-to-br from-brand-700 to-brand-900"></div>
                                    @endif

                                    {{-- ---------- DARK OVERLAY ---------- --}}
                                    <div class="absolute inset-0 {{ $overlayClass }}"></div>

                                    {{-- ---------- CONTENT ON TOP ---------- shop --}}
                                    <div class="relative z-10 h-full flex items-center">
                                        <div
                                            class="w-full px-6 sm:px-10 lg:px-14 py-10 lg:py-16
                                        grid lg:grid-cols-2 items-center gap-6">

                                            {{-- Text block --}}
                                            <div class="hero-copy text-center lg:text-left max-w-xl mx-auto lg:mx-0">
                                                {{-- Review row --}}
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
                                            {{-- Shop --}}
                                        </div>
                                    </div>

                                </div>
                            </div>
                        @endforeach

                        {{-- ---------- CONTROLS ---------- --}}
                        <div class="hero-ctrl absolute left-0 right-0 bottom-4 z-20 pointer-events-none">
                            <div class="px-6 sm:px-10 flex items-center justify-center lg:justify-between gap-4">

                                {{-- Dots --}}
                                <div class="flex items-center gap-2 pointer-events-auto" role="tablist">
                                    @foreach ($sliders as $index => $slider)
                                        <button class="hero-dot {{ $index === 0 ? 'is-active' : '' }}"
                                            data-hero-dot="{{ $index }}"
                                            aria-label="Go to slide {{ $index + 1 }}">
                                            <i></i>
                                        </button>
                                    @endforeach
                                </div>

                                {{-- Arrows --}}
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

    <section class="container-fluid pt-8 pb-2 lg:hidden">
        <div class="flex gap-5 lg:justify-between overflow-x-auto snap-x pb-2 -mx-4 px-4 no-scrollbar">
            <a href="shop.html" class="cat-item flex flex-col items-center gap-2 w-[96px] shrink-0 snap-start"><span
                    class="cat-circle w-[88px] h-[88px] rounded-full border border-slate-200 grid place-items-center text-4xl"
                    style="background:linear-gradient(135deg,#e3f1e5,#fff)">👕</span><span
                    class="text-[13px] font-medium text-slate-800 text-center leading-tight">Fashion</span><span
                    class="text-[11px] text-slate-400 -mt-1.5">72+ items</span></a><a href="shop.html"
                class="cat-item flex flex-col items-center gap-2 w-[96px] shrink-0 snap-start"><span
                    class="cat-circle w-[88px] h-[88px] rounded-full border border-slate-200 grid place-items-center text-4xl"
                    style="background:linear-gradient(135deg,#e6eef9,#fff)">🎧</span><span
                    class="text-[13px] font-medium text-slate-800 text-center leading-tight">Electronics</span><span
                    class="text-[11px] text-slate-400 -mt-1.5">54+ items</span></a><a href="shop.html"
                class="cat-item flex flex-col items-center gap-2 w-[96px] shrink-0 snap-start"><span
                    class="cat-circle w-[88px] h-[88px] rounded-full border border-slate-200 grid place-items-center text-4xl"
                    style="background:linear-gradient(135deg,#f6efe4,#fff)">🛋️</span><span
                    class="text-[13px] font-medium text-slate-800 text-center leading-tight">Home &
                    Living</span><span class="text-[11px] text-slate-400 -mt-1.5">46+ items</span></a><a href="shop.html"
                class="cat-item flex flex-col items-center gap-2 w-[96px] shrink-0 snap-start"><span
                    class="cat-circle w-[88px] h-[88px] rounded-full border border-slate-200 grid place-items-center text-4xl"
                    style="background:linear-gradient(135deg,#fbe9ee,#fff)">🧴</span><span
                    class="text-[13px] font-medium text-slate-800 text-center leading-tight">Beauty &
                    Care</span><span class="text-[11px] text-slate-400 -mt-1.5">31+ items</span></a><a href="shop.html"
                class="cat-item flex flex-col items-center gap-2 w-[96px] shrink-0 snap-start"><span
                    class="cat-circle w-[88px] h-[88px] rounded-full border border-slate-200 grid place-items-center text-4xl"
                    style="background:linear-gradient(135deg,#fdeee3,#fff)">🧸</span><span
                    class="text-[13px] font-medium text-slate-800 text-center leading-tight">Kids Zone</span><span
                    class="text-[11px] text-slate-400 -mt-1.5">27+ items</span></a><a href="shop.html"
                class="cat-item flex flex-col items-center gap-2 w-[96px] shrink-0 snap-start"><span
                    class="cat-circle w-[88px] h-[88px] rounded-full border border-slate-200 grid place-items-center text-4xl"
                    style="background:linear-gradient(135deg,#eceff1,#fff)">🏋️</span><span
                    class="text-[13px] font-medium text-slate-800 text-center leading-tight">Sports &
                    Fitness</span><span class="text-[11px] text-slate-400 -mt-1.5">18+ items</span></a><a href="shop.html"
                class="cat-item flex flex-col items-center gap-2 w-[96px] shrink-0 snap-start"><span
                    class="cat-circle w-[88px] h-[88px] rounded-full border border-slate-200 grid place-items-center text-4xl"
                    style="background:linear-gradient(135deg,#e4f4ef,#fff)">🧺</span><span
                    class="text-[13px] font-medium text-slate-800 text-center leading-tight">Groceries</span><span
                    class="text-[11px] text-slate-400 -mt-1.5">40+ items</span></a><a href="shop.html"
                class="cat-item flex flex-col items-center gap-2 w-[96px] shrink-0 snap-start"><span
                    class="cat-circle w-[88px] h-[88px] rounded-full border border-slate-200 grid place-items-center text-4xl"
                    style="background:linear-gradient(135deg,#efe9f8,#fff)">🕶️</span><span
                    class="text-[13px] font-medium text-slate-800 text-center leading-tight">Accessories</span><span
                    class="text-[11px] text-slate-400 -mt-1.5">26+ items</span></a>
        </div>
    </section>

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
                <div class="cd-box"><b data-cd="s">00</b><small>Seconds</small></div><a href="shop.html"
                    class="btn btn-primary btn-sm sm:ml-2">View All <svg class="w-3.5 h-3.5" viewBox="0 0 24 24"
                        fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                        stroke-linejoin="round" aria-hidden="true">
                        <path d="M5 12h14" />
                        <path d="m12 5 7 7-7 7" />
                    </svg></a>
            </div>
        </div>
        <div
            class="flex gap-4 overflow-x-auto snap-x snap-mandatory -mx-4 px-4 pb-2 no-scrollbar md:mx-0 md:px-0 md:overflow-visible md:grid md:grid-cols-3 lg:grid-cols-5">
            <article class="card pcard overflow-hidden flex flex-col min-w-[62%] sm:min-w-[40%] snap-start md:min-w-0">
                <div class="relative pimg aspect-square overflow-hidden bg-slate-100"><a href="product.html"
                        class="block w-full h-full"><img src="https://placehold.co/400x400"
                            alt="T800 Ultra Smart Watch (Original)" width="400" height="400" loading="lazy"
                            class="w-full h-full object-cover"></a><span
                        class="absolute left-2.5 top-2.5 z-10 bg-[#e5383b] text-white text-[11px] font-semibold px-2 py-0.5 rounded-md">-40%</span>
                    <button
                        class="wish absolute right-2.5 top-2.5 z-10 w-8 h-8 rounded-full bg-white/90 grid place-items-center text-slate-500 hover:text-[#e5383b]"
                        aria-label="Add to wishlist"><svg class="w-4 h-4" viewBox="0 0 24 24" fill="none"
                            stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"
                            aria-hidden="true">
                            <path
                                d="M19 14c1.49-1.46 3-3.21 3-5.5A5.5 5.5 0 0 0 16.5 3c-1.76 0-3 .5-4.5 2-1.5-1.5-2.74-2-4.5-2A5.5 5.5 0 0 0 2 8.5c0 2.3 1.5 4.05 3 5.5l7 7Z" />
                        </svg></button>
                </div>
                <div class="p-3.5 flex flex-col flex-1">
                    <p class="text-[11px] text-slate-400 mb-1">Electronics</p>
                    <h3 class="text-[13px] font-medium text-slate-800 leading-snug min-h-[2.4em]"><a href="product.html"
                            class="hover:text-brand-600">T800 Ultra Smart Watch
                            (Original)</a></h3>
                    <div class="mt-1.5 flex items-baseline gap-2"><span
                            class="font-bold text-brand-700">৳1,499</span><span
                            class="text-xs text-slate-400 line-through">৳2,500</span></div>
                    <div class="mt-1 flex items-center gap-1.5 text-[11px] text-slate-500"><span
                            class="inline-flex text-star"><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"
                                aria-hidden="true">
                                <polygon
                                    points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                    fill="currentColor" />
                            </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                                <polygon
                                    points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                    fill="currentColor" />
                            </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                                <polygon
                                    points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                    fill="currentColor" />
                            </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                                <polygon
                                    points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                    fill="currentColor" />
                            </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                                <polygon
                                    points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                    fill="currentColor" />
                            </svg></span><b class="text-slate-700">4.8</b>(320)</div>
                    <div class="mt-2.5">
                        <div class="h-1.5 rounded-full bg-slate-100 overflow-hidden">
                            <div class="h-full rounded-full bg-gradient-to-r from-[#f59e0b] to-[#e5383b]"
                                style="width:72%"></div>
                        </div>
                        <p class="text-[10.5px] text-slate-500 mt-1">72% sold &middot; hurry up</p>
                    </div>
                    <button data-add data-id="0" data-name="T800 Ultra Smart Watch (Original)" data-price="1499"
                        data-emoji="⌚" data-c1="#eceff1" data-c2="#dde2e5"
                        class="btn btn-primary btn-sm w-full mt-3"><svg class="w-3.5 h-3.5" viewBox="0 0 24 24"
                            fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                            stroke-linejoin="round" aria-hidden="true">
                            <path d="M6 2 3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4Z" />
                            <path d="M3 6h18" />
                            <path d="M16 10a4 4 0 0 1-8 0" />
                        </svg> Add to Cart</button>
                </div>
            </article>
            <article class="card pcard overflow-hidden flex flex-col min-w-[62%] sm:min-w-[40%] snap-start md:min-w-0">
                <div class="relative pimg aspect-square overflow-hidden bg-slate-100"><a href="product.html"
                        class="block w-full h-full"><img src="https://placehold.co/400x400"
                            alt="Airdots Pro Wireless Earbuds" width="400" height="400" loading="lazy"
                            class="w-full h-full object-cover"></a><span
                        class="absolute left-2.5 top-2.5 z-10 bg-[#e5383b] text-white text-[11px] font-semibold px-2 py-0.5 rounded-md">-35%</span>
                    <button
                        class="wish absolute right-2.5 top-2.5 z-10 w-8 h-8 rounded-full bg-white/90 grid place-items-center text-slate-500 hover:text-[#e5383b]"
                        aria-label="Add to wishlist"><svg class="w-4 h-4" viewBox="0 0 24 24" fill="none"
                            stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"
                            aria-hidden="true">
                            <path
                                d="M19 14c1.49-1.46 3-3.21 3-5.5A5.5 5.5 0 0 0 16.5 3c-1.76 0-3 .5-4.5 2-1.5-1.5-2.74-2-4.5-2A5.5 5.5 0 0 0 2 8.5c0 2.3 1.5 4.05 3 5.5l7 7Z" />
                        </svg></button>
                </div>
                <div class="p-3.5 flex flex-col flex-1">
                    <p class="text-[11px] text-slate-400 mb-1">Electronics</p>
                    <h3 class="text-[13px] font-medium text-slate-800 leading-snug min-h-[2.4em]"><a href="product.html"
                            class="hover:text-brand-600">Airdots Pro Wireless Earbuds</a>
                    </h3>
                    <div class="mt-1.5 flex items-baseline gap-2"><span
                            class="font-bold text-brand-700">৳1,299</span><span
                            class="text-xs text-slate-400 line-through">৳1,999</span></div>
                    <div class="mt-1 flex items-center gap-1.5 text-[11px] text-slate-500"><span
                            class="inline-flex text-star"><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"
                                aria-hidden="true">
                                <polygon
                                    points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                    fill="currentColor" />
                            </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                                <polygon
                                    points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                    fill="currentColor" />
                            </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                                <polygon
                                    points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                    fill="currentColor" />
                            </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                                <polygon
                                    points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                    fill="currentColor" />
                            </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                                <polygon
                                    points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                    fill="currentColor" />
                            </svg></span><b class="text-slate-700">4.7</b>(210)</div>
                    <div class="mt-2.5">
                        <div class="h-1.5 rounded-full bg-slate-100 overflow-hidden">
                            <div class="h-full rounded-full bg-gradient-to-r from-[#f59e0b] to-[#e5383b]"
                                style="width:58%"></div>
                        </div>
                        <p class="text-[10.5px] text-slate-500 mt-1">58% sold &middot; hurry up</p>
                    </div>
                    <button data-add data-id="1" data-name="Airdots Pro Wireless Earbuds" data-price="1299"
                        data-emoji="🎧" data-c1="#e6eef9" data-c2="#d3e0f4"
                        class="btn btn-primary btn-sm w-full mt-3"><svg class="w-3.5 h-3.5" viewBox="0 0 24 24"
                            fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                            stroke-linejoin="round" aria-hidden="true">
                            <path d="M6 2 3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4Z" />
                            <path d="M3 6h18" />
                            <path d="M16 10a4 4 0 0 1-8 0" />
                        </svg> Add to Cart</button>
                </div>
            </article>
            <article class="card pcard overflow-hidden flex flex-col min-w-[62%] sm:min-w-[40%] snap-start md:min-w-0">
                <div class="relative pimg aspect-square overflow-hidden bg-slate-100"><a href="product.html"
                        class="block w-full h-full"><img src="https://placehold.co/400x400" alt="Anti Theft Laptop Bag"
                            width="400" height="400" loading="lazy" class="w-full h-full object-cover"></a><span
                        class="absolute left-2.5 top-2.5 z-10 bg-[#e5383b] text-white text-[11px] font-semibold px-2 py-0.5 rounded-md">-20%</span>
                    <button
                        class="wish absolute right-2.5 top-2.5 z-10 w-8 h-8 rounded-full bg-white/90 grid place-items-center text-slate-500 hover:text-[#e5383b]"
                        aria-label="Add to wishlist"><svg class="w-4 h-4" viewBox="0 0 24 24" fill="none"
                            stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"
                            aria-hidden="true">
                            <path
                                d="M19 14c1.49-1.46 3-3.21 3-5.5A5.5 5.5 0 0 0 16.5 3c-1.76 0-3 .5-4.5 2-1.5-1.5-2.74-2-4.5-2A5.5 5.5 0 0 0 2 8.5c0 2.3 1.5 4.05 3 5.5l7 7Z" />
                        </svg></button>
                </div>
                <div class="p-3.5 flex flex-col flex-1">
                    <p class="text-[11px] text-slate-400 mb-1">Fashion</p>
                    <h3 class="text-[13px] font-medium text-slate-800 leading-snug min-h-[2.4em]"><a href="product.html"
                            class="hover:text-brand-600">Anti Theft Laptop Bag</a></h3>
                    <div class="mt-1.5 flex items-baseline gap-2"><span
                            class="font-bold text-brand-700">৳1,599</span><span
                            class="text-xs text-slate-400 line-through">৳1,999</span></div>
                    <div class="mt-1 flex items-center gap-1.5 text-[11px] text-slate-500"><span
                            class="inline-flex text-star"><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"
                                aria-hidden="true">
                                <polygon
                                    points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                    fill="currentColor" />
                            </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                                <polygon
                                    points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                    fill="currentColor" />
                            </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                                <polygon
                                    points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                    fill="currentColor" />
                            </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                                <polygon
                                    points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                    fill="currentColor" />
                            </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                                <polygon
                                    points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                    fill="currentColor" />
                            </svg></span><b class="text-slate-700">4.6</b>(180)</div>
                    <div class="mt-2.5">
                        <div class="h-1.5 rounded-full bg-slate-100 overflow-hidden">
                            <div class="h-full rounded-full bg-gradient-to-r from-[#f59e0b] to-[#e5383b]"
                                style="width:85%"></div>
                        </div>
                        <p class="text-[10.5px] text-slate-500 mt-1">85% sold &middot; hurry up</p>
                    </div>
                    <button data-add data-id="2" data-name="Anti Theft Laptop Bag" data-price="1599" data-emoji="🎒"
                        data-c1="#f6efe4" data-c2="#ecdfc9" class="btn btn-primary btn-sm w-full mt-3"><svg
                            class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                            stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                            <path d="M6 2 3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4Z" />
                            <path d="M3 6h18" />
                            <path d="M16 10a4 4 0 0 1-8 0" />
                        </svg> Add to Cart</button>
                </div>
            </article>
            <article class="card pcard overflow-hidden flex flex-col min-w-[62%] sm:min-w-[40%] snap-start md:min-w-0">
                <div class="relative pimg aspect-square overflow-hidden bg-slate-100"><a href="product.html"
                        class="block w-full h-full"><img src="https://placehold.co/400x400" alt="Digital Air Fryer 6L"
                            width="400" height="400" loading="lazy" class="w-full h-full object-cover"></a><span
                        class="absolute left-2.5 top-2.5 z-10 bg-[#e5383b] text-white text-[11px] font-semibold px-2 py-0.5 rounded-md">-29%</span>
                    <button
                        class="wish absolute right-2.5 top-2.5 z-10 w-8 h-8 rounded-full bg-white/90 grid place-items-center text-slate-500 hover:text-[#e5383b]"
                        aria-label="Add to wishlist"><svg class="w-4 h-4" viewBox="0 0 24 24" fill="none"
                            stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"
                            aria-hidden="true">
                            <path
                                d="M19 14c1.49-1.46 3-3.21 3-5.5A5.5 5.5 0 0 0 16.5 3c-1.76 0-3 .5-4.5 2-1.5-1.5-2.74-2-4.5-2A5.5 5.5 0 0 0 2 8.5c0 2.3 1.5 4.05 3 5.5l7 7Z" />
                        </svg></button>
                </div>
                <div class="p-3.5 flex flex-col flex-1">
                    <p class="text-[11px] text-slate-400 mb-1">Home & Living</p>
                    <h3 class="text-[13px] font-medium text-slate-800 leading-snug min-h-[2.4em]"><a href="product.html"
                            class="hover:text-brand-600">Digital Air Fryer 6L</a></h3>
                    <div class="mt-1.5 flex items-baseline gap-2"><span
                            class="font-bold text-brand-700">৳4,999</span><span
                            class="text-xs text-slate-400 line-through">৳6,999</span></div>
                    <div class="mt-1 flex items-center gap-1.5 text-[11px] text-slate-500"><span
                            class="inline-flex text-star"><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"
                                aria-hidden="true">
                                <polygon
                                    points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                    fill="currentColor" />
                            </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                                <polygon
                                    points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                    fill="currentColor" />
                            </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                                <polygon
                                    points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                    fill="currentColor" />
                            </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                                <polygon
                                    points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                    fill="currentColor" />
                            </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                                <polygon
                                    points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                    fill="currentColor" />
                            </svg></span><b class="text-slate-700">4.8</b>(95)</div>
                    <div class="mt-2.5">
                        <div class="h-1.5 rounded-full bg-slate-100 overflow-hidden">
                            <div class="h-full rounded-full bg-gradient-to-r from-[#f59e0b] to-[#e5383b]"
                                style="width:41%"></div>
                        </div>
                        <p class="text-[10.5px] text-slate-500 mt-1">41% sold &middot; hurry up</p>
                    </div>
                    <button data-add data-id="3" data-name="Digital Air Fryer 6L" data-price="4999" data-emoji="🍳"
                        data-c1="#fdeee3" data-c2="#f9dcc6" class="btn btn-primary btn-sm w-full mt-3"><svg
                            class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                            stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                            <path d="M6 2 3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4Z" />
                            <path d="M3 6h18" />
                            <path d="M16 10a4 4 0 0 1-8 0" />
                        </svg> Add to Cart</button>
                </div>
            </article>
            <article class="card pcard overflow-hidden flex flex-col min-w-[62%] sm:min-w-[40%] snap-start md:min-w-0">
                <div class="relative pimg aspect-square overflow-hidden bg-slate-100"><a href="product.html"
                        class="block w-full h-full"><img src="https://placehold.co/400x400" alt="Men&#x27;s Sports Shoes"
                            width="400" height="400" loading="lazy" class="w-full h-full object-cover"></a><span
                        class="absolute left-2.5 top-2.5 z-10 bg-[#e5383b] text-white text-[11px] font-semibold px-2 py-0.5 rounded-md">-40%</span>
                    <button
                        class="wish absolute right-2.5 top-2.5 z-10 w-8 h-8 rounded-full bg-white/90 grid place-items-center text-slate-500 hover:text-[#e5383b]"
                        aria-label="Add to wishlist"><svg class="w-4 h-4" viewBox="0 0 24 24" fill="none"
                            stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"
                            aria-hidden="true">
                            <path
                                d="M19 14c1.49-1.46 3-3.21 3-5.5A5.5 5.5 0 0 0 16.5 3c-1.76 0-3 .5-4.5 2-1.5-1.5-2.74-2-4.5-2A5.5 5.5 0 0 0 2 8.5c0 2.3 1.5 4.05 3 5.5l7 7Z" />
                        </svg></button>
                </div>
                <div class="p-3.5 flex flex-col flex-1">
                    <p class="text-[11px] text-slate-400 mb-1">Sports</p>
                    <h3 class="text-[13px] font-medium text-slate-800 leading-snug min-h-[2.4em]"><a href="product.html"
                            class="hover:text-brand-600">Men's Sports Shoes</a></h3>
                    <div class="mt-1.5 flex items-baseline gap-2"><span
                            class="font-bold text-brand-700">৳1,799</span><span
                            class="text-xs text-slate-400 line-through">৳2,999</span></div>
                    <div class="mt-1 flex items-center gap-1.5 text-[11px] text-slate-500"><span
                            class="inline-flex text-star"><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"
                                aria-hidden="true">
                                <polygon
                                    points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                    fill="currentColor" />
                            </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                                <polygon
                                    points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                    fill="currentColor" />
                            </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                                <polygon
                                    points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                    fill="currentColor" />
                            </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                                <polygon
                                    points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                    fill="currentColor" />
                            </svg></span><b class="text-slate-700">4.5</b>(140)</div>
                    <div class="mt-2.5">
                        <div class="h-1.5 rounded-full bg-slate-100 overflow-hidden">
                            <div class="h-full rounded-full bg-gradient-to-r from-[#f59e0b] to-[#e5383b]"
                                style="width:64%"></div>
                        </div>
                        <p class="text-[10.5px] text-slate-500 mt-1">64% sold &middot; hurry up</p>
                    </div>
                    <button data-add data-id="4" data-name="Men&#x27;s Sports Shoes" data-price="1799"
                        data-emoji="👟" data-c1="#e4f4ef" data-c2="#cde9e0"
                        class="btn btn-primary btn-sm w-full mt-3"><svg class="w-3.5 h-3.5" viewBox="0 0 24 24"
                            fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                            stroke-linejoin="round" aria-hidden="true">
                            <path d="M6 2 3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4Z" />
                            <path d="M3 6h18" />
                            <path d="M16 10a4 4 0 0 1-8 0" />
                        </svg> Add to Cart</button>
                </div>
            </article>
        </div>
    </section>

    <section class="container-fluid mt-10 grid md:grid-cols-2 gap-5">
        <a href="shop.html"
            class="relative overflow-hidden rounded-2xl p-7 min-h-[200px] flex flex-col justify-center text-white"
            style="background:linear-gradient(110deg,#2b6a3d,#4c8a58)">
            <p class="text-sm opacity-90">New Arrivals</p>
            <h3 class="text-2xl font-bold mt-1 leading-tight">Stylish Collection<br>For Everyone</h3><span
                class="btn btn-dark btn-sm mt-5 self-start">Shop Now <svg class="w-3.5 h-3.5" viewBox="0 0 24 24"
                    fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                    stroke-linejoin="round" aria-hidden="true">
                    <path d="M5 12h14" />
                    <path d="m12 5 7 7-7 7" />
                </svg></span>
            <span class="absolute right-6 bottom-0 text-[9rem] leading-none opacity-95">🧔</span>
        </a>
        <a href="shop.html"
            class="relative overflow-hidden rounded-2xl p-7 min-h-[200px] flex flex-col justify-center text-white"
            style="background:linear-gradient(110deg,#1f5e33,#3f8350)">
            <p class="text-sm opacity-90">Home & Living</p>
            <h3 class="text-2xl font-bold mt-1 leading-tight">Make Your Home<br>More Beautiful</h3><span
                class="btn btn-dark btn-sm mt-5 self-start">Shop Now <svg class="w-3.5 h-3.5" viewBox="0 0 24 24"
                    fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                    stroke-linejoin="round" aria-hidden="true">
                    <path d="M5 12h14" />
                    <path d="m12 5 7 7-7 7" />
                </svg></span>
            <span class="absolute right-6 bottom-2 text-[8rem] leading-none opacity-95">🛋️</span>
        </a>
    </section>

    <section class="container-fluid mt-12" id="best">
        <div class="flex items-end justify-between gap-4 flex-wrap mb-5">
            <div class="flex items-center gap-3">
                <span class="text-star"><svg class="w-7 h-7" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                        stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                        <path d="m2 4 3 12h14l3-12-6 7-4-7-4 7-6-7zm3 16h14" fill="currentColor" />
                    </svg></span>
                <div>
                    <h2 class="section-title">Best Selling Products</h2>
                    <p class="text-xs text-slate-500 mt-0.5">Our customers love these products</p>
                </div>
            </div>
            <div class="flex gap-1 overflow-x-auto no-scrollbar max-w-full -mx-1 px-1" data-tabs="best"><button
                    data-tab="all" class="tab-btn active">All</button><button data-tab="fashion"
                    class="tab-btn ">Fashion</button><button data-tab="electronics"
                    class="tab-btn ">Electronics</button><button data-tab="home" class="tab-btn ">Home &
                    Living</button><button data-tab="beauty" class="tab-btn ">Beauty</button><button data-tab="kids"
                    class="tab-btn ">Kids</button></div>
        </div>
        <div data-panel="all" class="active">
            <div class="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-5 gap-4">
                <article class="card pcard overflow-hidden flex flex-col ">
                    <div class="relative pimg aspect-square overflow-hidden bg-slate-100"><a href="product.html"
                            class="block w-full h-full"><img src="https://placehold.co/400x400"
                                alt="Premium Chiffon Hijab" width="400" height="400" loading="lazy"
                                class="w-full h-full object-cover"></a><span
                            class="absolute left-2.5 top-2.5 z-10 bg-[#e5383b] text-white text-[11px] font-semibold px-2 py-0.5 rounded-md">-20%</span>
                        <button
                            class="wish absolute right-2.5 top-2.5 z-10 w-8 h-8 rounded-full bg-white/90 grid place-items-center text-slate-500 hover:text-[#e5383b]"
                            aria-label="Add to wishlist"><svg class="w-4 h-4" viewBox="0 0 24 24" fill="none"
                                stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"
                                aria-hidden="true">
                                <path
                                    d="M19 14c1.49-1.46 3-3.21 3-5.5A5.5 5.5 0 0 0 16.5 3c-1.76 0-3 .5-4.5 2-1.5-1.5-2.74-2-4.5-2A5.5 5.5 0 0 0 2 8.5c0 2.3 1.5 4.05 3 5.5l7 7Z" />
                            </svg></button>
                    </div>
                    <div class="p-3.5 flex flex-col flex-1">
                        <p class="text-[11px] text-slate-400 mb-1">Fashion</p>
                        <h3 class="text-[13px] font-medium text-slate-800 leading-snug min-h-[2.4em]"><a
                                href="product.html" class="hover:text-brand-600">Premium Chiffon Hijab</a></h3>
                        <div class="mt-1.5 flex items-baseline gap-2"><span
                                class="font-bold text-brand-700">৳799</span><span
                                class="text-xs text-slate-400 line-through">৳999</span></div>
                        <div class="mt-1 flex items-center gap-1.5 text-[11px] text-slate-500"><span
                                class="inline-flex text-star"><svg class="w-3.5 h-3.5" viewBox="0 0 24 24"
                                    fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                    stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"
                                    aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                    stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"
                                    aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                    stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"
                                    aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                    stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"
                                    aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg></span><b class="text-slate-700">4.9</b>(260)</div>
                        <button data-add data-id="5" data-name="Premium Chiffon Hijab" data-price="799"
                            data-emoji="🧕" data-c1="#fbe9ee" data-c2="#f6d3dd"
                            class="btn btn-primary btn-sm w-full mt-3"><svg class="w-3.5 h-3.5" viewBox="0 0 24 24"
                                fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                stroke-linejoin="round" aria-hidden="true">
                                <path d="M6 2 3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4Z" />
                                <path d="M3 6h18" />
                                <path d="M16 10a4 4 0 0 1-8 0" />
                            </svg> Add to Cart</button>
                    </div>
                </article>
                <article class="card pcard overflow-hidden flex flex-col ">
                    <div class="relative pimg aspect-square overflow-hidden bg-slate-100"><a href="product.html"
                            class="block w-full h-full"><img src="https://placehold.co/400x400"
                                alt="UV Protection Sunglasses" width="400" height="400" loading="lazy"
                                class="w-full h-full object-cover"></a><span
                            class="absolute left-2.5 top-2.5 z-10 bg-[#e5383b] text-white text-[11px] font-semibold px-2 py-0.5 rounded-md">-30%</span>
                        <button
                            class="wish absolute right-2.5 top-2.5 z-10 w-8 h-8 rounded-full bg-white/90 grid place-items-center text-slate-500 hover:text-[#e5383b]"
                            aria-label="Add to wishlist"><svg class="w-4 h-4" viewBox="0 0 24 24" fill="none"
                                stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"
                                aria-hidden="true">
                                <path
                                    d="M19 14c1.49-1.46 3-3.21 3-5.5A5.5 5.5 0 0 0 16.5 3c-1.76 0-3 .5-4.5 2-1.5-1.5-2.74-2-4.5-2A5.5 5.5 0 0 0 2 8.5c0 2.3 1.5 4.05 3 5.5l7 7Z" />
                            </svg></button>
                    </div>
                    <div class="p-3.5 flex flex-col flex-1">
                        <p class="text-[11px] text-slate-400 mb-1">Accessories</p>
                        <h3 class="text-[13px] font-medium text-slate-800 leading-snug min-h-[2.4em]"><a
                                href="product.html" class="hover:text-brand-600">UV Protection Sunglasses</a>
                        </h3>
                        <div class="mt-1.5 flex items-baseline gap-2"><span
                                class="font-bold text-brand-700">৳699</span><span
                                class="text-xs text-slate-400 line-through">৳999</span></div>
                        <div class="mt-1 flex items-center gap-1.5 text-[11px] text-slate-500"><span
                                class="inline-flex text-star"><svg class="w-3.5 h-3.5" viewBox="0 0 24 24"
                                    fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                    stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"
                                    aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                    stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"
                                    aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                    stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"
                                    aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                    stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"
                                    aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg></span><b class="text-slate-700">4.6</b>(160)</div>
                        <button data-add data-id="6" data-name="UV Protection Sunglasses" data-price="699"
                            data-emoji="🕶️" data-c1="#f6efe4" data-c2="#ecdfc9"
                            class="btn btn-primary btn-sm w-full mt-3"><svg class="w-3.5 h-3.5" viewBox="0 0 24 24"
                                fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                stroke-linejoin="round" aria-hidden="true">
                                <path d="M6 2 3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4Z" />
                                <path d="M3 6h18" />
                                <path d="M16 10a4 4 0 0 1-8 0" />
                            </svg> Add to Cart</button>
                    </div>
                </article>
                <article class="card pcard overflow-hidden flex flex-col ">
                    <div class="relative pimg aspect-square overflow-hidden bg-slate-100"><a href="product.html"
                            class="block w-full h-full"><img src="https://placehold.co/400x400"
                                alt="Casual Sneakers for Men" width="400" height="400" loading="lazy"
                                class="w-full h-full object-cover"></a><span
                            class="absolute left-2.5 top-2.5 z-10 bg-[#e5383b] text-white text-[11px] font-semibold px-2 py-0.5 rounded-md">-24%</span>
                        <button
                            class="wish absolute right-2.5 top-2.5 z-10 w-8 h-8 rounded-full bg-white/90 grid place-items-center text-slate-500 hover:text-[#e5383b]"
                            aria-label="Add to wishlist"><svg class="w-4 h-4" viewBox="0 0 24 24" fill="none"
                                stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                stroke-linejoin="round" aria-hidden="true">
                                <path
                                    d="M19 14c1.49-1.46 3-3.21 3-5.5A5.5 5.5 0 0 0 16.5 3c-1.76 0-3 .5-4.5 2-1.5-1.5-2.74-2-4.5-2A5.5 5.5 0 0 0 2 8.5c0 2.3 1.5 4.05 3 5.5l7 7Z" />
                            </svg></button>
                    </div>
                    <div class="p-3.5 flex flex-col flex-1">
                        <p class="text-[11px] text-slate-400 mb-1">Fashion</p>
                        <h3 class="text-[13px] font-medium text-slate-800 leading-snug min-h-[2.4em]"><a
                                href="product.html" class="hover:text-brand-600">Casual Sneakers for Men</a>
                        </h3>
                        <div class="mt-1.5 flex items-baseline gap-2"><span
                                class="font-bold text-brand-700">৳1,899</span><span
                                class="text-xs text-slate-400 line-through">৳2,499</span></div>
                        <div class="mt-1 flex items-center gap-1.5 text-[11px] text-slate-500"><span
                                class="inline-flex text-star"><svg class="w-3.5 h-3.5" viewBox="0 0 24 24"
                                    fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg></span><b class="text-slate-700">4.8</b>(180)</div>
                        <button data-add data-id="7" data-name="Casual Sneakers for Men" data-price="1899"
                            data-emoji="👟" data-c1="#eceff1" data-c2="#dde2e5"
                            class="btn btn-primary btn-sm w-full mt-3"><svg class="w-3.5 h-3.5" viewBox="0 0 24 24"
                                fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                stroke-linejoin="round" aria-hidden="true">
                                <path d="M6 2 3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4Z" />
                                <path d="M3 6h18" />
                                <path d="M16 10a4 4 0 0 1-8 0" />
                            </svg> Add to Cart</button>
                    </div>
                </article>
                <article class="card pcard overflow-hidden flex flex-col ">
                    <div class="relative pimg aspect-square overflow-hidden bg-slate-100"><a href="product.html"
                            class="block w-full h-full"><img src="https://placehold.co/400x400" alt="Baby Girl Frock"
                                width="400" height="400" loading="lazy"
                                class="w-full h-full object-cover"></a><span
                            class="absolute left-2.5 top-2.5 z-10 bg-[#e5383b] text-white text-[11px] font-semibold px-2 py-0.5 rounded-md">-29%</span>
                        <button
                            class="wish absolute right-2.5 top-2.5 z-10 w-8 h-8 rounded-full bg-white/90 grid place-items-center text-slate-500 hover:text-[#e5383b]"
                            aria-label="Add to wishlist"><svg class="w-4 h-4" viewBox="0 0 24 24" fill="none"
                                stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                stroke-linejoin="round" aria-hidden="true">
                                <path
                                    d="M19 14c1.49-1.46 3-3.21 3-5.5A5.5 5.5 0 0 0 16.5 3c-1.76 0-3 .5-4.5 2-1.5-1.5-2.74-2-4.5-2A5.5 5.5 0 0 0 2 8.5c0 2.3 1.5 4.05 3 5.5l7 7Z" />
                            </svg></button>
                    </div>
                    <div class="p-3.5 flex flex-col flex-1">
                        <p class="text-[11px] text-slate-400 mb-1">Kids</p>
                        <h3 class="text-[13px] font-medium text-slate-800 leading-snug min-h-[2.4em]"><a
                                href="product.html" class="hover:text-brand-600">Baby Girl Frock</a></h3>
                        <div class="mt-1.5 flex items-baseline gap-2"><span
                                class="font-bold text-brand-700">৳999</span><span
                                class="text-xs text-slate-400 line-through">৳1,399</span></div>
                        <div class="mt-1 flex items-center gap-1.5 text-[11px] text-slate-500"><span
                                class="inline-flex text-star"><svg class="w-3.5 h-3.5" viewBox="0 0 24 24"
                                    fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg></span><b class="text-slate-700">4.7</b>(110)</div>
                        <button data-add data-id="8" data-name="Baby Girl Frock" data-price="999" data-emoji="👗"
                            data-c1="#fbe9ee" data-c2="#f6d3dd" class="btn btn-primary btn-sm w-full mt-3"><svg
                                class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"
                                aria-hidden="true">
                                <path d="M6 2 3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4Z" />
                                <path d="M3 6h18" />
                                <path d="M16 10a4 4 0 0 1-8 0" />
                            </svg> Add to Cart</button>
                    </div>
                </article>
                <article class="card pcard overflow-hidden flex flex-col ">
                    <div class="relative pimg aspect-square overflow-hidden bg-slate-100"><a href="product.html"
                            class="block w-full h-full"><img src="https://placehold.co/400x400"
                                alt="Portable Juicer Blender" width="400" height="400" loading="lazy"
                                class="w-full h-full object-cover"></a><span
                            class="absolute left-2.5 top-2.5 z-10 bg-[#e5383b] text-white text-[11px] font-semibold px-2 py-0.5 rounded-md">-30%</span>
                        <button
                            class="wish absolute right-2.5 top-2.5 z-10 w-8 h-8 rounded-full bg-white/90 grid place-items-center text-slate-500 hover:text-[#e5383b]"
                            aria-label="Add to wishlist"><svg class="w-4 h-4" viewBox="0 0 24 24" fill="none"
                                stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                stroke-linejoin="round" aria-hidden="true">
                                <path
                                    d="M19 14c1.49-1.46 3-3.21 3-5.5A5.5 5.5 0 0 0 16.5 3c-1.76 0-3 .5-4.5 2-1.5-1.5-2.74-2-4.5-2A5.5 5.5 0 0 0 2 8.5c0 2.3 1.5 4.05 3 5.5l7 7Z" />
                            </svg></button>
                    </div>
                    <div class="p-3.5 flex flex-col flex-1">
                        <p class="text-[11px] text-slate-400 mb-1">Home & Living</p>
                        <h3 class="text-[13px] font-medium text-slate-800 leading-snug min-h-[2.4em]"><a
                                href="product.html" class="hover:text-brand-600">Portable Juicer Blender</a>
                        </h3>
                        <div class="mt-1.5 flex items-baseline gap-2"><span
                                class="font-bold text-brand-700">৳1,399</span><span
                                class="text-xs text-slate-400 line-through">৳1,999</span></div>
                        <div class="mt-1 flex items-center gap-1.5 text-[11px] text-slate-500"><span
                                class="inline-flex text-star"><svg class="w-3.5 h-3.5" viewBox="0 0 24 24"
                                    fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg></span><b class="text-slate-700">4.5</b>(190)</div>
                        <button data-add data-id="9" data-name="Portable Juicer Blender" data-price="1399"
                            data-emoji="🥤" data-c1="#e3f1e5" data-c2="#cfe6d3"
                            class="btn btn-primary btn-sm w-full mt-3"><svg class="w-3.5 h-3.5" viewBox="0 0 24 24"
                                fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                stroke-linejoin="round" aria-hidden="true">
                                <path d="M6 2 3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4Z" />
                                <path d="M3 6h18" />
                                <path d="M16 10a4 4 0 0 1-8 0" />
                            </svg> Add to Cart</button>
                    </div>
                </article>
            </div>
        </div>
        <div data-panel="fashion" class="">
            <div class="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-5 gap-4">
                <article class="card pcard overflow-hidden flex flex-col ">
                    <div class="relative pimg aspect-square overflow-hidden bg-slate-100"><a href="product.html"
                            class="block w-full h-full"><img src="https://placehold.co/400x400"
                                alt="Premium Chiffon Hijab" width="400" height="400" loading="lazy"
                                class="w-full h-full object-cover"></a><span
                            class="absolute left-2.5 top-2.5 z-10 bg-[#e5383b] text-white text-[11px] font-semibold px-2 py-0.5 rounded-md">-20%</span>
                        <button
                            class="wish absolute right-2.5 top-2.5 z-10 w-8 h-8 rounded-full bg-white/90 grid place-items-center text-slate-500 hover:text-[#e5383b]"
                            aria-label="Add to wishlist"><svg class="w-4 h-4" viewBox="0 0 24 24" fill="none"
                                stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                stroke-linejoin="round" aria-hidden="true">
                                <path
                                    d="M19 14c1.49-1.46 3-3.21 3-5.5A5.5 5.5 0 0 0 16.5 3c-1.76 0-3 .5-4.5 2-1.5-1.5-2.74-2-4.5-2A5.5 5.5 0 0 0 2 8.5c0 2.3 1.5 4.05 3 5.5l7 7Z" />
                            </svg></button>
                    </div>
                    <div class="p-3.5 flex flex-col flex-1">
                        <p class="text-[11px] text-slate-400 mb-1">Fashion</p>
                        <h3 class="text-[13px] font-medium text-slate-800 leading-snug min-h-[2.4em]"><a
                                href="product.html" class="hover:text-brand-600">Premium Chiffon Hijab</a></h3>
                        <div class="mt-1.5 flex items-baseline gap-2"><span
                                class="font-bold text-brand-700">৳799</span><span
                                class="text-xs text-slate-400 line-through">৳999</span></div>
                        <div class="mt-1 flex items-center gap-1.5 text-[11px] text-slate-500"><span
                                class="inline-flex text-star"><svg class="w-3.5 h-3.5" viewBox="0 0 24 24"
                                    fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg></span><b class="text-slate-700">4.9</b>(260)</div>
                        <button data-add data-id="5" data-name="Premium Chiffon Hijab" data-price="799"
                            data-emoji="🧕" data-c1="#fbe9ee" data-c2="#f6d3dd"
                            class="btn btn-primary btn-sm w-full mt-3"><svg class="w-3.5 h-3.5" viewBox="0 0 24 24"
                                fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                stroke-linejoin="round" aria-hidden="true">
                                <path d="M6 2 3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4Z" />
                                <path d="M3 6h18" />
                                <path d="M16 10a4 4 0 0 1-8 0" />
                            </svg> Add to Cart</button>
                    </div>
                </article>
                <article class="card pcard overflow-hidden flex flex-col ">
                    <div class="relative pimg aspect-square overflow-hidden bg-slate-100"><a href="product.html"
                            class="block w-full h-full"><img src="https://placehold.co/400x400"
                                alt="Casual Sneakers for Men" width="400" height="400" loading="lazy"
                                class="w-full h-full object-cover"></a><span
                            class="absolute left-2.5 top-2.5 z-10 bg-[#e5383b] text-white text-[11px] font-semibold px-2 py-0.5 rounded-md">-24%</span>
                        <button
                            class="wish absolute right-2.5 top-2.5 z-10 w-8 h-8 rounded-full bg-white/90 grid place-items-center text-slate-500 hover:text-[#e5383b]"
                            aria-label="Add to wishlist"><svg class="w-4 h-4" viewBox="0 0 24 24" fill="none"
                                stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                stroke-linejoin="round" aria-hidden="true">
                                <path
                                    d="M19 14c1.49-1.46 3-3.21 3-5.5A5.5 5.5 0 0 0 16.5 3c-1.76 0-3 .5-4.5 2-1.5-1.5-2.74-2-4.5-2A5.5 5.5 0 0 0 2 8.5c0 2.3 1.5 4.05 3 5.5l7 7Z" />
                            </svg></button>
                    </div>
                    <div class="p-3.5 flex flex-col flex-1">
                        <p class="text-[11px] text-slate-400 mb-1">Fashion</p>
                        <h3 class="text-[13px] font-medium text-slate-800 leading-snug min-h-[2.4em]"><a
                                href="product.html" class="hover:text-brand-600">Casual Sneakers for Men</a>
                        </h3>
                        <div class="mt-1.5 flex items-baseline gap-2"><span
                                class="font-bold text-brand-700">৳1,899</span><span
                                class="text-xs text-slate-400 line-through">৳2,499</span></div>
                        <div class="mt-1 flex items-center gap-1.5 text-[11px] text-slate-500"><span
                                class="inline-flex text-star"><svg class="w-3.5 h-3.5" viewBox="0 0 24 24"
                                    fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg></span><b class="text-slate-700">4.8</b>(180)</div>
                        <button data-add data-id="7" data-name="Casual Sneakers for Men" data-price="1899"
                            data-emoji="👟" data-c1="#eceff1" data-c2="#dde2e5"
                            class="btn btn-primary btn-sm w-full mt-3"><svg class="w-3.5 h-3.5" viewBox="0 0 24 24"
                                fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                stroke-linejoin="round" aria-hidden="true">
                                <path d="M6 2 3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4Z" />
                                <path d="M3 6h18" />
                                <path d="M16 10a4 4 0 0 1-8 0" />
                            </svg> Add to Cart</button>
                    </div>
                </article>
                <article class="card pcard overflow-hidden flex flex-col ">
                    <div class="relative pimg aspect-square overflow-hidden bg-slate-100"><a href="product.html"
                            class="block w-full h-full"><img src="https://placehold.co/400x400"
                                alt="Anti Theft Laptop Bag" width="400" height="400" loading="lazy"
                                class="w-full h-full object-cover"></a><span
                            class="absolute left-2.5 top-2.5 z-10 bg-[#e5383b] text-white text-[11px] font-semibold px-2 py-0.5 rounded-md">-20%</span>
                        <button
                            class="wish absolute right-2.5 top-2.5 z-10 w-8 h-8 rounded-full bg-white/90 grid place-items-center text-slate-500 hover:text-[#e5383b]"
                            aria-label="Add to wishlist"><svg class="w-4 h-4" viewBox="0 0 24 24" fill="none"
                                stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                stroke-linejoin="round" aria-hidden="true">
                                <path
                                    d="M19 14c1.49-1.46 3-3.21 3-5.5A5.5 5.5 0 0 0 16.5 3c-1.76 0-3 .5-4.5 2-1.5-1.5-2.74-2-4.5-2A5.5 5.5 0 0 0 2 8.5c0 2.3 1.5 4.05 3 5.5l7 7Z" />
                            </svg></button>
                    </div>
                    <div class="p-3.5 flex flex-col flex-1">
                        <p class="text-[11px] text-slate-400 mb-1">Fashion</p>
                        <h3 class="text-[13px] font-medium text-slate-800 leading-snug min-h-[2.4em]"><a
                                href="product.html" class="hover:text-brand-600">Anti Theft Laptop Bag</a></h3>
                        <div class="mt-1.5 flex items-baseline gap-2"><span
                                class="font-bold text-brand-700">৳1,599</span><span
                                class="text-xs text-slate-400 line-through">৳1,999</span></div>
                        <div class="mt-1 flex items-center gap-1.5 text-[11px] text-slate-500"><span
                                class="inline-flex text-star"><svg class="w-3.5 h-3.5" viewBox="0 0 24 24"
                                    fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg></span><b class="text-slate-700">4.6</b>(180)</div>
                        <button data-add data-id="2" data-name="Anti Theft Laptop Bag" data-price="1599"
                            data-emoji="🎒" data-c1="#f6efe4" data-c2="#ecdfc9"
                            class="btn btn-primary btn-sm w-full mt-3"><svg class="w-3.5 h-3.5" viewBox="0 0 24 24"
                                fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                stroke-linejoin="round" aria-hidden="true">
                                <path d="M6 2 3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4Z" />
                                <path d="M3 6h18" />
                                <path d="M16 10a4 4 0 0 1-8 0" />
                            </svg> Add to Cart</button>
                    </div>
                </article>
                <article class="card pcard overflow-hidden flex flex-col ">
                    <div class="relative pimg aspect-square overflow-hidden bg-slate-100"><a href="product.html"
                            class="block w-full h-full"><img src="https://placehold.co/400x400" alt="Baby Girl Frock"
                                width="400" height="400" loading="lazy"
                                class="w-full h-full object-cover"></a><span
                            class="absolute left-2.5 top-2.5 z-10 bg-[#e5383b] text-white text-[11px] font-semibold px-2 py-0.5 rounded-md">-29%</span>
                        <button
                            class="wish absolute right-2.5 top-2.5 z-10 w-8 h-8 rounded-full bg-white/90 grid place-items-center text-slate-500 hover:text-[#e5383b]"
                            aria-label="Add to wishlist"><svg class="w-4 h-4" viewBox="0 0 24 24" fill="none"
                                stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                stroke-linejoin="round" aria-hidden="true">
                                <path
                                    d="M19 14c1.49-1.46 3-3.21 3-5.5A5.5 5.5 0 0 0 16.5 3c-1.76 0-3 .5-4.5 2-1.5-1.5-2.74-2-4.5-2A5.5 5.5 0 0 0 2 8.5c0 2.3 1.5 4.05 3 5.5l7 7Z" />
                            </svg></button>
                    </div>
                    <div class="p-3.5 flex flex-col flex-1">
                        <p class="text-[11px] text-slate-400 mb-1">Kids</p>
                        <h3 class="text-[13px] font-medium text-slate-800 leading-snug min-h-[2.4em]"><a
                                href="product.html" class="hover:text-brand-600">Baby Girl Frock</a></h3>
                        <div class="mt-1.5 flex items-baseline gap-2"><span
                                class="font-bold text-brand-700">৳999</span><span
                                class="text-xs text-slate-400 line-through">৳1,399</span></div>
                        <div class="mt-1 flex items-center gap-1.5 text-[11px] text-slate-500"><span
                                class="inline-flex text-star"><svg class="w-3.5 h-3.5" viewBox="0 0 24 24"
                                    fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg></span><b class="text-slate-700">4.7</b>(110)</div>
                        <button data-add data-id="8" data-name="Baby Girl Frock" data-price="999" data-emoji="👗"
                            data-c1="#fbe9ee" data-c2="#f6d3dd" class="btn btn-primary btn-sm w-full mt-3"><svg
                                class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"
                                aria-hidden="true">
                                <path d="M6 2 3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4Z" />
                                <path d="M3 6h18" />
                                <path d="M16 10a4 4 0 0 1-8 0" />
                            </svg> Add to Cart</button>
                    </div>
                </article>
                <article class="card pcard overflow-hidden flex flex-col ">
                    <div class="relative pimg aspect-square overflow-hidden bg-slate-100"><a href="product.html"
                            class="block w-full h-full"><img src="https://placehold.co/400x400"
                                alt="UV Protection Sunglasses" width="400" height="400" loading="lazy"
                                class="w-full h-full object-cover"></a><span
                            class="absolute left-2.5 top-2.5 z-10 bg-[#e5383b] text-white text-[11px] font-semibold px-2 py-0.5 rounded-md">-30%</span>
                        <button
                            class="wish absolute right-2.5 top-2.5 z-10 w-8 h-8 rounded-full bg-white/90 grid place-items-center text-slate-500 hover:text-[#e5383b]"
                            aria-label="Add to wishlist"><svg class="w-4 h-4" viewBox="0 0 24 24" fill="none"
                                stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                stroke-linejoin="round" aria-hidden="true">
                                <path
                                    d="M19 14c1.49-1.46 3-3.21 3-5.5A5.5 5.5 0 0 0 16.5 3c-1.76 0-3 .5-4.5 2-1.5-1.5-2.74-2-4.5-2A5.5 5.5 0 0 0 2 8.5c0 2.3 1.5 4.05 3 5.5l7 7Z" />
                            </svg></button>
                    </div>
                    <div class="p-3.5 flex flex-col flex-1">
                        <p class="text-[11px] text-slate-400 mb-1">Accessories</p>
                        <h3 class="text-[13px] font-medium text-slate-800 leading-snug min-h-[2.4em]"><a
                                href="product.html" class="hover:text-brand-600">UV Protection Sunglasses</a>
                        </h3>
                        <div class="mt-1.5 flex items-baseline gap-2"><span
                                class="font-bold text-brand-700">৳699</span><span
                                class="text-xs text-slate-400 line-through">৳999</span></div>
                        <div class="mt-1 flex items-center gap-1.5 text-[11px] text-slate-500"><span
                                class="inline-flex text-star"><svg class="w-3.5 h-3.5" viewBox="0 0 24 24"
                                    fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg></span><b class="text-slate-700">4.6</b>(160)</div>
                        <button data-add data-id="6" data-name="UV Protection Sunglasses" data-price="699"
                            data-emoji="🕶️" data-c1="#f6efe4" data-c2="#ecdfc9"
                            class="btn btn-primary btn-sm w-full mt-3"><svg class="w-3.5 h-3.5" viewBox="0 0 24 24"
                                fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                stroke-linejoin="round" aria-hidden="true">
                                <path d="M6 2 3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4Z" />
                                <path d="M3 6h18" />
                                <path d="M16 10a4 4 0 0 1-8 0" />
                            </svg> Add to Cart</button>
                    </div>
                </article>
            </div>
        </div>
        <div data-panel="electronics" class="">
            <div class="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-5 gap-4">
                <article class="card pcard overflow-hidden flex flex-col ">
                    <div class="relative pimg aspect-square overflow-hidden bg-slate-100"><a href="product.html"
                            class="block w-full h-full"><img src="https://placehold.co/400x400"
                                alt="T800 Ultra Smart Watch (Original)" width="400" height="400" loading="lazy"
                                class="w-full h-full object-cover"></a><span
                            class="absolute left-2.5 top-2.5 z-10 bg-[#e5383b] text-white text-[11px] font-semibold px-2 py-0.5 rounded-md">-40%</span>
                        <button
                            class="wish absolute right-2.5 top-2.5 z-10 w-8 h-8 rounded-full bg-white/90 grid place-items-center text-slate-500 hover:text-[#e5383b]"
                            aria-label="Add to wishlist"><svg class="w-4 h-4" viewBox="0 0 24 24" fill="none"
                                stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                stroke-linejoin="round" aria-hidden="true">
                                <path
                                    d="M19 14c1.49-1.46 3-3.21 3-5.5A5.5 5.5 0 0 0 16.5 3c-1.76 0-3 .5-4.5 2-1.5-1.5-2.74-2-4.5-2A5.5 5.5 0 0 0 2 8.5c0 2.3 1.5 4.05 3 5.5l7 7Z" />
                            </svg></button>
                    </div>
                    <div class="p-3.5 flex flex-col flex-1">
                        <p class="text-[11px] text-slate-400 mb-1">Electronics</p>
                        <h3 class="text-[13px] font-medium text-slate-800 leading-snug min-h-[2.4em]"><a
                                href="product.html" class="hover:text-brand-600">T800 Ultra Smart Watch
                                (Original)</a></h3>
                        <div class="mt-1.5 flex items-baseline gap-2"><span
                                class="font-bold text-brand-700">৳1,499</span><span
                                class="text-xs text-slate-400 line-through">৳2,500</span></div>
                        <div class="mt-1 flex items-center gap-1.5 text-[11px] text-slate-500"><span
                                class="inline-flex text-star"><svg class="w-3.5 h-3.5" viewBox="0 0 24 24"
                                    fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg></span><b class="text-slate-700">4.8</b>(320)</div>
                        <button data-add data-id="0" data-name="T800 Ultra Smart Watch (Original)"
                            data-price="1499" data-emoji="⌚" data-c1="#eceff1" data-c2="#dde2e5"
                            class="btn btn-primary btn-sm w-full mt-3"><svg class="w-3.5 h-3.5" viewBox="0 0 24 24"
                                fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                stroke-linejoin="round" aria-hidden="true">
                                <path d="M6 2 3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4Z" />
                                <path d="M3 6h18" />
                                <path d="M16 10a4 4 0 0 1-8 0" />
                            </svg> Add to Cart</button>
                    </div>
                </article>
                <article class="card pcard overflow-hidden flex flex-col ">
                    <div class="relative pimg aspect-square overflow-hidden bg-slate-100"><a href="product.html"
                            class="block w-full h-full"><img src="https://placehold.co/400x400"
                                alt="Airdots Pro Wireless Earbuds" width="400" height="400" loading="lazy"
                                class="w-full h-full object-cover"></a><span
                            class="absolute left-2.5 top-2.5 z-10 bg-[#e5383b] text-white text-[11px] font-semibold px-2 py-0.5 rounded-md">-35%</span>
                        <button
                            class="wish absolute right-2.5 top-2.5 z-10 w-8 h-8 rounded-full bg-white/90 grid place-items-center text-slate-500 hover:text-[#e5383b]"
                            aria-label="Add to wishlist"><svg class="w-4 h-4" viewBox="0 0 24 24" fill="none"
                                stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                stroke-linejoin="round" aria-hidden="true">
                                <path
                                    d="M19 14c1.49-1.46 3-3.21 3-5.5A5.5 5.5 0 0 0 16.5 3c-1.76 0-3 .5-4.5 2-1.5-1.5-2.74-2-4.5-2A5.5 5.5 0 0 0 2 8.5c0 2.3 1.5 4.05 3 5.5l7 7Z" />
                            </svg></button>
                    </div>
                    <div class="p-3.5 flex flex-col flex-1">
                        <p class="text-[11px] text-slate-400 mb-1">Electronics</p>
                        <h3 class="text-[13px] font-medium text-slate-800 leading-snug min-h-[2.4em]"><a
                                href="product.html" class="hover:text-brand-600">Airdots Pro Wireless
                                Earbuds</a></h3>
                        <div class="mt-1.5 flex items-baseline gap-2"><span
                                class="font-bold text-brand-700">৳1,299</span><span
                                class="text-xs text-slate-400 line-through">৳1,999</span></div>
                        <div class="mt-1 flex items-center gap-1.5 text-[11px] text-slate-500"><span
                                class="inline-flex text-star"><svg class="w-3.5 h-3.5" viewBox="0 0 24 24"
                                    fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg></span><b class="text-slate-700">4.7</b>(210)</div>
                        <button data-add data-id="1" data-name="Airdots Pro Wireless Earbuds" data-price="1299"
                            data-emoji="🎧" data-c1="#e6eef9" data-c2="#d3e0f4"
                            class="btn btn-primary btn-sm w-full mt-3"><svg class="w-3.5 h-3.5" viewBox="0 0 24 24"
                                fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                stroke-linejoin="round" aria-hidden="true">
                                <path d="M6 2 3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4Z" />
                                <path d="M3 6h18" />
                                <path d="M16 10a4 4 0 0 1-8 0" />
                            </svg> Add to Cart</button>
                    </div>
                </article>
                <article class="card pcard overflow-hidden flex flex-col ">
                    <div class="relative pimg aspect-square overflow-hidden bg-slate-100"><a href="product.html"
                            class="block w-full h-full"><img src="https://placehold.co/400x400"
                                alt="Bluetooth Speaker Mini" width="400" height="400" loading="lazy"
                                class="w-full h-full object-cover"></a><span
                            class="absolute left-2.5 top-2.5 z-10 bg-[#e5383b] text-white text-[11px] font-semibold px-2 py-0.5 rounded-md">-33%</span>
                        <button
                            class="wish absolute right-2.5 top-2.5 z-10 w-8 h-8 rounded-full bg-white/90 grid place-items-center text-slate-500 hover:text-[#e5383b]"
                            aria-label="Add to wishlist"><svg class="w-4 h-4" viewBox="0 0 24 24" fill="none"
                                stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                stroke-linejoin="round" aria-hidden="true">
                                <path
                                    d="M19 14c1.49-1.46 3-3.21 3-5.5A5.5 5.5 0 0 0 16.5 3c-1.76 0-3 .5-4.5 2-1.5-1.5-2.74-2-4.5-2A5.5 5.5 0 0 0 2 8.5c0 2.3 1.5 4.05 3 5.5l7 7Z" />
                            </svg></button>
                    </div>
                    <div class="p-3.5 flex flex-col flex-1">
                        <p class="text-[11px] text-slate-400 mb-1">Electronics</p>
                        <h3 class="text-[13px] font-medium text-slate-800 leading-snug min-h-[2.4em]"><a
                                href="product.html" class="hover:text-brand-600">Bluetooth Speaker Mini</a></h3>
                        <div class="mt-1.5 flex items-baseline gap-2"><span
                                class="font-bold text-brand-700">৳1,199</span><span
                                class="text-xs text-slate-400 line-through">৳1,799</span></div>
                        <div class="mt-1 flex items-center gap-1.5 text-[11px] text-slate-500"><span
                                class="inline-flex text-star"><svg class="w-3.5 h-3.5" viewBox="0 0 24 24"
                                    fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg></span><b class="text-slate-700">4.4</b>(88)</div>
                        <button data-add data-id="10" data-name="Bluetooth Speaker Mini" data-price="1199"
                            data-emoji="🔊" data-c1="#efe9f8" data-c2="#ddd2f0"
                            class="btn btn-primary btn-sm w-full mt-3"><svg class="w-3.5 h-3.5" viewBox="0 0 24 24"
                                fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                stroke-linejoin="round" aria-hidden="true">
                                <path d="M6 2 3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4Z" />
                                <path d="M3 6h18" />
                                <path d="M16 10a4 4 0 0 1-8 0" />
                            </svg> Add to Cart</button>
                    </div>
                </article>
                <article class="card pcard overflow-hidden flex flex-col ">
                    <div class="relative pimg aspect-square overflow-hidden bg-slate-100"><a href="product.html"
                            class="block w-full h-full"><img src="https://placehold.co/400x400"
                                alt="T800 Ultra Smart Watch (Original)" width="400" height="400" loading="lazy"
                                class="w-full h-full object-cover"></a><span
                            class="absolute left-2.5 top-2.5 z-10 bg-[#e5383b] text-white text-[11px] font-semibold px-2 py-0.5 rounded-md">-40%</span>
                        <button
                            class="wish absolute right-2.5 top-2.5 z-10 w-8 h-8 rounded-full bg-white/90 grid place-items-center text-slate-500 hover:text-[#e5383b]"
                            aria-label="Add to wishlist"><svg class="w-4 h-4" viewBox="0 0 24 24" fill="none"
                                stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                stroke-linejoin="round" aria-hidden="true">
                                <path
                                    d="M19 14c1.49-1.46 3-3.21 3-5.5A5.5 5.5 0 0 0 16.5 3c-1.76 0-3 .5-4.5 2-1.5-1.5-2.74-2-4.5-2A5.5 5.5 0 0 0 2 8.5c0 2.3 1.5 4.05 3 5.5l7 7Z" />
                            </svg></button>
                    </div>
                    <div class="p-3.5 flex flex-col flex-1">
                        <p class="text-[11px] text-slate-400 mb-1">Electronics</p>
                        <h3 class="text-[13px] font-medium text-slate-800 leading-snug min-h-[2.4em]"><a
                                href="product.html" class="hover:text-brand-600">T800 Ultra Smart Watch
                                (Original)</a></h3>
                        <div class="mt-1.5 flex items-baseline gap-2"><span
                                class="font-bold text-brand-700">৳1,499</span><span
                                class="text-xs text-slate-400 line-through">৳2,500</span></div>
                        <div class="mt-1 flex items-center gap-1.5 text-[11px] text-slate-500"><span
                                class="inline-flex text-star"><svg class="w-3.5 h-3.5" viewBox="0 0 24 24"
                                    fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg></span><b class="text-slate-700">4.8</b>(320)</div>
                        <button data-add data-id="0" data-name="T800 Ultra Smart Watch (Original)"
                            data-price="1499" data-emoji="⌚" data-c1="#eceff1" data-c2="#dde2e5"
                            class="btn btn-primary btn-sm w-full mt-3"><svg class="w-3.5 h-3.5" viewBox="0 0 24 24"
                                fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                stroke-linejoin="round" aria-hidden="true">
                                <path d="M6 2 3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4Z" />
                                <path d="M3 6h18" />
                                <path d="M16 10a4 4 0 0 1-8 0" />
                            </svg> Add to Cart</button>
                    </div>
                </article>
                <article class="card pcard overflow-hidden flex flex-col ">
                    <div class="relative pimg aspect-square overflow-hidden bg-slate-100"><a href="product.html"
                            class="block w-full h-full"><img src="https://placehold.co/400x400"
                                alt="Airdots Pro Wireless Earbuds" width="400" height="400" loading="lazy"
                                class="w-full h-full object-cover"></a><span
                            class="absolute left-2.5 top-2.5 z-10 bg-[#e5383b] text-white text-[11px] font-semibold px-2 py-0.5 rounded-md">-35%</span>
                        <button
                            class="wish absolute right-2.5 top-2.5 z-10 w-8 h-8 rounded-full bg-white/90 grid place-items-center text-slate-500 hover:text-[#e5383b]"
                            aria-label="Add to wishlist"><svg class="w-4 h-4" viewBox="0 0 24 24" fill="none"
                                stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                stroke-linejoin="round" aria-hidden="true">
                                <path
                                    d="M19 14c1.49-1.46 3-3.21 3-5.5A5.5 5.5 0 0 0 16.5 3c-1.76 0-3 .5-4.5 2-1.5-1.5-2.74-2-4.5-2A5.5 5.5 0 0 0 2 8.5c0 2.3 1.5 4.05 3 5.5l7 7Z" />
                            </svg></button>
                    </div>
                    <div class="p-3.5 flex flex-col flex-1">
                        <p class="text-[11px] text-slate-400 mb-1">Electronics</p>
                        <h3 class="text-[13px] font-medium text-slate-800 leading-snug min-h-[2.4em]"><a
                                href="product.html" class="hover:text-brand-600">Airdots Pro Wireless
                                Earbuds</a></h3>
                        <div class="mt-1.5 flex items-baseline gap-2"><span
                                class="font-bold text-brand-700">৳1,299</span><span
                                class="text-xs text-slate-400 line-through">৳1,999</span></div>
                        <div class="mt-1 flex items-center gap-1.5 text-[11px] text-slate-500"><span
                                class="inline-flex text-star"><svg class="w-3.5 h-3.5" viewBox="0 0 24 24"
                                    fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg></span><b class="text-slate-700">4.7</b>(210)</div>
                        <button data-add data-id="1" data-name="Airdots Pro Wireless Earbuds" data-price="1299"
                            data-emoji="🎧" data-c1="#e6eef9" data-c2="#d3e0f4"
                            class="btn btn-primary btn-sm w-full mt-3"><svg class="w-3.5 h-3.5" viewBox="0 0 24 24"
                                fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                stroke-linejoin="round" aria-hidden="true">
                                <path d="M6 2 3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4Z" />
                                <path d="M3 6h18" />
                                <path d="M16 10a4 4 0 0 1-8 0" />
                            </svg> Add to Cart</button>
                    </div>
                </article>
            </div>
        </div>
        <div data-panel="home" class="">
            <div class="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-5 gap-4">
                <article class="card pcard overflow-hidden flex flex-col ">
                    <div class="relative pimg aspect-square overflow-hidden bg-slate-100"><a href="product.html"
                            class="block w-full h-full"><img src="https://placehold.co/400x400"
                                alt="Digital Air Fryer 6L" width="400" height="400" loading="lazy"
                                class="w-full h-full object-cover"></a><span
                            class="absolute left-2.5 top-2.5 z-10 bg-[#e5383b] text-white text-[11px] font-semibold px-2 py-0.5 rounded-md">-29%</span>
                        <button
                            class="wish absolute right-2.5 top-2.5 z-10 w-8 h-8 rounded-full bg-white/90 grid place-items-center text-slate-500 hover:text-[#e5383b]"
                            aria-label="Add to wishlist"><svg class="w-4 h-4" viewBox="0 0 24 24" fill="none"
                                stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                stroke-linejoin="round" aria-hidden="true">
                                <path
                                    d="M19 14c1.49-1.46 3-3.21 3-5.5A5.5 5.5 0 0 0 16.5 3c-1.76 0-3 .5-4.5 2-1.5-1.5-2.74-2-4.5-2A5.5 5.5 0 0 0 2 8.5c0 2.3 1.5 4.05 3 5.5l7 7Z" />
                            </svg></button>
                    </div>
                    <div class="p-3.5 flex flex-col flex-1">
                        <p class="text-[11px] text-slate-400 mb-1">Home & Living</p>
                        <h3 class="text-[13px] font-medium text-slate-800 leading-snug min-h-[2.4em]"><a
                                href="product.html" class="hover:text-brand-600">Digital Air Fryer 6L</a></h3>
                        <div class="mt-1.5 flex items-baseline gap-2"><span
                                class="font-bold text-brand-700">৳4,999</span><span
                                class="text-xs text-slate-400 line-through">৳6,999</span></div>
                        <div class="mt-1 flex items-center gap-1.5 text-[11px] text-slate-500"><span
                                class="inline-flex text-star"><svg class="w-3.5 h-3.5" viewBox="0 0 24 24"
                                    fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg></span><b class="text-slate-700">4.8</b>(95)</div>
                        <button data-add data-id="3" data-name="Digital Air Fryer 6L" data-price="4999"
                            data-emoji="🍳" data-c1="#fdeee3" data-c2="#f9dcc6"
                            class="btn btn-primary btn-sm w-full mt-3"><svg class="w-3.5 h-3.5" viewBox="0 0 24 24"
                                fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                stroke-linejoin="round" aria-hidden="true">
                                <path d="M6 2 3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4Z" />
                                <path d="M3 6h18" />
                                <path d="M16 10a4 4 0 0 1-8 0" />
                            </svg> Add to Cart</button>
                    </div>
                </article>
                <article class="card pcard overflow-hidden flex flex-col ">
                    <div class="relative pimg aspect-square overflow-hidden bg-slate-100"><a href="product.html"
                            class="block w-full h-full"><img src="https://placehold.co/400x400"
                                alt="Portable Juicer Blender" width="400" height="400" loading="lazy"
                                class="w-full h-full object-cover"></a><span
                            class="absolute left-2.5 top-2.5 z-10 bg-[#e5383b] text-white text-[11px] font-semibold px-2 py-0.5 rounded-md">-30%</span>
                        <button
                            class="wish absolute right-2.5 top-2.5 z-10 w-8 h-8 rounded-full bg-white/90 grid place-items-center text-slate-500 hover:text-[#e5383b]"
                            aria-label="Add to wishlist"><svg class="w-4 h-4" viewBox="0 0 24 24" fill="none"
                                stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                stroke-linejoin="round" aria-hidden="true">
                                <path
                                    d="M19 14c1.49-1.46 3-3.21 3-5.5A5.5 5.5 0 0 0 16.5 3c-1.76 0-3 .5-4.5 2-1.5-1.5-2.74-2-4.5-2A5.5 5.5 0 0 0 2 8.5c0 2.3 1.5 4.05 3 5.5l7 7Z" />
                            </svg></button>
                    </div>
                    <div class="p-3.5 flex flex-col flex-1">
                        <p class="text-[11px] text-slate-400 mb-1">Home & Living</p>
                        <h3 class="text-[13px] font-medium text-slate-800 leading-snug min-h-[2.4em]"><a
                                href="product.html" class="hover:text-brand-600">Portable Juicer Blender</a>
                        </h3>
                        <div class="mt-1.5 flex items-baseline gap-2"><span
                                class="font-bold text-brand-700">৳1,399</span><span
                                class="text-xs text-slate-400 line-through">৳1,999</span></div>
                        <div class="mt-1 flex items-center gap-1.5 text-[11px] text-slate-500"><span
                                class="inline-flex text-star"><svg class="w-3.5 h-3.5" viewBox="0 0 24 24"
                                    fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg></span><b class="text-slate-700">4.5</b>(190)</div>
                        <button data-add data-id="9" data-name="Portable Juicer Blender" data-price="1399"
                            data-emoji="🥤" data-c1="#e3f1e5" data-c2="#cfe6d3"
                            class="btn btn-primary btn-sm w-full mt-3"><svg class="w-3.5 h-3.5" viewBox="0 0 24 24"
                                fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                stroke-linejoin="round" aria-hidden="true">
                                <path d="M6 2 3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4Z" />
                                <path d="M3 6h18" />
                                <path d="M16 10a4 4 0 0 1-8 0" />
                            </svg> Add to Cart</button>
                    </div>
                </article>
                <article class="card pcard overflow-hidden flex flex-col ">
                    <div class="relative pimg aspect-square overflow-hidden bg-slate-100"><a href="product.html"
                            class="block w-full h-full"><img src="https://placehold.co/400x400"
                                alt="Digital Air Fryer 6L" width="400" height="400" loading="lazy"
                                class="w-full h-full object-cover"></a><span
                            class="absolute left-2.5 top-2.5 z-10 bg-[#e5383b] text-white text-[11px] font-semibold px-2 py-0.5 rounded-md">-29%</span>
                        <button
                            class="wish absolute right-2.5 top-2.5 z-10 w-8 h-8 rounded-full bg-white/90 grid place-items-center text-slate-500 hover:text-[#e5383b]"
                            aria-label="Add to wishlist"><svg class="w-4 h-4" viewBox="0 0 24 24" fill="none"
                                stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                stroke-linejoin="round" aria-hidden="true">
                                <path
                                    d="M19 14c1.49-1.46 3-3.21 3-5.5A5.5 5.5 0 0 0 16.5 3c-1.76 0-3 .5-4.5 2-1.5-1.5-2.74-2-4.5-2A5.5 5.5 0 0 0 2 8.5c0 2.3 1.5 4.05 3 5.5l7 7Z" />
                            </svg></button>
                    </div>
                    <div class="p-3.5 flex flex-col flex-1">
                        <p class="text-[11px] text-slate-400 mb-1">Home & Living</p>
                        <h3 class="text-[13px] font-medium text-slate-800 leading-snug min-h-[2.4em]"><a
                                href="product.html" class="hover:text-brand-600">Digital Air Fryer 6L</a></h3>
                        <div class="mt-1.5 flex items-baseline gap-2"><span
                                class="font-bold text-brand-700">৳4,999</span><span
                                class="text-xs text-slate-400 line-through">৳6,999</span></div>
                        <div class="mt-1 flex items-center gap-1.5 text-[11px] text-slate-500"><span
                                class="inline-flex text-star"><svg class="w-3.5 h-3.5" viewBox="0 0 24 24"
                                    fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg></span><b class="text-slate-700">4.8</b>(95)</div>
                        <button data-add data-id="3" data-name="Digital Air Fryer 6L" data-price="4999"
                            data-emoji="🍳" data-c1="#fdeee3" data-c2="#f9dcc6"
                            class="btn btn-primary btn-sm w-full mt-3"><svg class="w-3.5 h-3.5" viewBox="0 0 24 24"
                                fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                stroke-linejoin="round" aria-hidden="true">
                                <path d="M6 2 3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4Z" />
                                <path d="M3 6h18" />
                                <path d="M16 10a4 4 0 0 1-8 0" />
                            </svg> Add to Cart</button>
                    </div>
                </article>
                <article class="card pcard overflow-hidden flex flex-col ">
                    <div class="relative pimg aspect-square overflow-hidden bg-slate-100"><a href="product.html"
                            class="block w-full h-full"><img src="https://placehold.co/400x400"
                                alt="Portable Juicer Blender" width="400" height="400" loading="lazy"
                                class="w-full h-full object-cover"></a><span
                            class="absolute left-2.5 top-2.5 z-10 bg-[#e5383b] text-white text-[11px] font-semibold px-2 py-0.5 rounded-md">-30%</span>
                        <button
                            class="wish absolute right-2.5 top-2.5 z-10 w-8 h-8 rounded-full bg-white/90 grid place-items-center text-slate-500 hover:text-[#e5383b]"
                            aria-label="Add to wishlist"><svg class="w-4 h-4" viewBox="0 0 24 24" fill="none"
                                stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                stroke-linejoin="round" aria-hidden="true">
                                <path
                                    d="M19 14c1.49-1.46 3-3.21 3-5.5A5.5 5.5 0 0 0 16.5 3c-1.76 0-3 .5-4.5 2-1.5-1.5-2.74-2-4.5-2A5.5 5.5 0 0 0 2 8.5c0 2.3 1.5 4.05 3 5.5l7 7Z" />
                            </svg></button>
                    </div>
                    <div class="p-3.5 flex flex-col flex-1">
                        <p class="text-[11px] text-slate-400 mb-1">Home & Living</p>
                        <h3 class="text-[13px] font-medium text-slate-800 leading-snug min-h-[2.4em]"><a
                                href="product.html" class="hover:text-brand-600">Portable Juicer Blender</a>
                        </h3>
                        <div class="mt-1.5 flex items-baseline gap-2"><span
                                class="font-bold text-brand-700">৳1,399</span><span
                                class="text-xs text-slate-400 line-through">৳1,999</span></div>
                        <div class="mt-1 flex items-center gap-1.5 text-[11px] text-slate-500"><span
                                class="inline-flex text-star"><svg class="w-3.5 h-3.5" viewBox="0 0 24 24"
                                    fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg></span><b class="text-slate-700">4.5</b>(190)</div>
                        <button data-add data-id="9" data-name="Portable Juicer Blender" data-price="1399"
                            data-emoji="🥤" data-c1="#e3f1e5" data-c2="#cfe6d3"
                            class="btn btn-primary btn-sm w-full mt-3"><svg class="w-3.5 h-3.5" viewBox="0 0 24 24"
                                fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                stroke-linejoin="round" aria-hidden="true">
                                <path d="M6 2 3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4Z" />
                                <path d="M3 6h18" />
                                <path d="M16 10a4 4 0 0 1-8 0" />
                            </svg> Add to Cart</button>
                    </div>
                </article>
                <article class="card pcard overflow-hidden flex flex-col ">
                    <div class="relative pimg aspect-square overflow-hidden bg-slate-100"><a href="product.html"
                            class="block w-full h-full"><img src="https://placehold.co/400x400"
                                alt="Digital Air Fryer 6L" width="400" height="400" loading="lazy"
                                class="w-full h-full object-cover"></a><span
                            class="absolute left-2.5 top-2.5 z-10 bg-[#e5383b] text-white text-[11px] font-semibold px-2 py-0.5 rounded-md">-29%</span>
                        <button
                            class="wish absolute right-2.5 top-2.5 z-10 w-8 h-8 rounded-full bg-white/90 grid place-items-center text-slate-500 hover:text-[#e5383b]"
                            aria-label="Add to wishlist"><svg class="w-4 h-4" viewBox="0 0 24 24" fill="none"
                                stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                stroke-linejoin="round" aria-hidden="true">
                                <path
                                    d="M19 14c1.49-1.46 3-3.21 3-5.5A5.5 5.5 0 0 0 16.5 3c-1.76 0-3 .5-4.5 2-1.5-1.5-2.74-2-4.5-2A5.5 5.5 0 0 0 2 8.5c0 2.3 1.5 4.05 3 5.5l7 7Z" />
                            </svg></button>
                    </div>
                    <div class="p-3.5 flex flex-col flex-1">
                        <p class="text-[11px] text-slate-400 mb-1">Home & Living</p>
                        <h3 class="text-[13px] font-medium text-slate-800 leading-snug min-h-[2.4em]"><a
                                href="product.html" class="hover:text-brand-600">Digital Air Fryer 6L</a></h3>
                        <div class="mt-1.5 flex items-baseline gap-2"><span
                                class="font-bold text-brand-700">৳4,999</span><span
                                class="text-xs text-slate-400 line-through">৳6,999</span></div>
                        <div class="mt-1 flex items-center gap-1.5 text-[11px] text-slate-500"><span
                                class="inline-flex text-star"><svg class="w-3.5 h-3.5" viewBox="0 0 24 24"
                                    fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg></span><b class="text-slate-700">4.8</b>(95)</div>
                        <button data-add data-id="3" data-name="Digital Air Fryer 6L" data-price="4999"
                            data-emoji="🍳" data-c1="#fdeee3" data-c2="#f9dcc6"
                            class="btn btn-primary btn-sm w-full mt-3"><svg class="w-3.5 h-3.5" viewBox="0 0 24 24"
                                fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                stroke-linejoin="round" aria-hidden="true">
                                <path d="M6 2 3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4Z" />
                                <path d="M3 6h18" />
                                <path d="M16 10a4 4 0 0 1-8 0" />
                            </svg> Add to Cart</button>
                    </div>
                </article>
            </div>
        </div>
        <div data-panel="beauty" class="">
            <div class="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-5 gap-4">
                <article class="card pcard overflow-hidden flex flex-col ">
                    <div class="relative pimg aspect-square overflow-hidden bg-slate-100"><a href="product.html"
                            class="block w-full h-full"><img src="https://placehold.co/400x400"
                                alt="Floral Perfume 50ml" width="400" height="400" loading="lazy"
                                class="w-full h-full object-cover"></a><span
                            class="absolute left-2.5 top-2.5 z-10 bg-[#e5383b] text-white text-[11px] font-semibold px-2 py-0.5 rounded-md">-24%</span>
                        <button
                            class="wish absolute right-2.5 top-2.5 z-10 w-8 h-8 rounded-full bg-white/90 grid place-items-center text-slate-500 hover:text-[#e5383b]"
                            aria-label="Add to wishlist"><svg class="w-4 h-4" viewBox="0 0 24 24" fill="none"
                                stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                stroke-linejoin="round" aria-hidden="true">
                                <path
                                    d="M19 14c1.49-1.46 3-3.21 3-5.5A5.5 5.5 0 0 0 16.5 3c-1.76 0-3 .5-4.5 2-1.5-1.5-2.74-2-4.5-2A5.5 5.5 0 0 0 2 8.5c0 2.3 1.5 4.05 3 5.5l7 7Z" />
                            </svg></button>
                    </div>
                    <div class="p-3.5 flex flex-col flex-1">
                        <p class="text-[11px] text-slate-400 mb-1">Beauty</p>
                        <h3 class="text-[13px] font-medium text-slate-800 leading-snug min-h-[2.4em]"><a
                                href="product.html" class="hover:text-brand-600">Floral Perfume 50ml</a></h3>
                        <div class="mt-1.5 flex items-baseline gap-2"><span
                                class="font-bold text-brand-700">৳1,250</span><span
                                class="text-xs text-slate-400 line-through">৳1,650</span></div>
                        <div class="mt-1 flex items-center gap-1.5 text-[11px] text-slate-500"><span
                                class="inline-flex text-star"><svg class="w-3.5 h-3.5" viewBox="0 0 24 24"
                                    fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg></span><b class="text-slate-700">4.7</b>(134)</div>
                        <button data-add data-id="11" data-name="Floral Perfume 50ml" data-price="1250"
                            data-emoji="🧴" data-c1="#fbe9ee" data-c2="#f6d3dd"
                            class="btn btn-primary btn-sm w-full mt-3"><svg class="w-3.5 h-3.5" viewBox="0 0 24 24"
                                fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                stroke-linejoin="round" aria-hidden="true">
                                <path d="M6 2 3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4Z" />
                                <path d="M3 6h18" />
                                <path d="M16 10a4 4 0 0 1-8 0" />
                            </svg> Add to Cart</button>
                    </div>
                </article>
                <article class="card pcard overflow-hidden flex flex-col ">
                    <div class="relative pimg aspect-square overflow-hidden bg-slate-100"><a href="product.html"
                            class="block w-full h-full"><img src="https://placehold.co/400x400"
                                alt="Floral Perfume 50ml" width="400" height="400" loading="lazy"
                                class="w-full h-full object-cover"></a><span
                            class="absolute left-2.5 top-2.5 z-10 bg-[#e5383b] text-white text-[11px] font-semibold px-2 py-0.5 rounded-md">-24%</span>
                        <button
                            class="wish absolute right-2.5 top-2.5 z-10 w-8 h-8 rounded-full bg-white/90 grid place-items-center text-slate-500 hover:text-[#e5383b]"
                            aria-label="Add to wishlist"><svg class="w-4 h-4" viewBox="0 0 24 24" fill="none"
                                stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                stroke-linejoin="round" aria-hidden="true">
                                <path
                                    d="M19 14c1.49-1.46 3-3.21 3-5.5A5.5 5.5 0 0 0 16.5 3c-1.76 0-3 .5-4.5 2-1.5-1.5-2.74-2-4.5-2A5.5 5.5 0 0 0 2 8.5c0 2.3 1.5 4.05 3 5.5l7 7Z" />
                            </svg></button>
                    </div>
                    <div class="p-3.5 flex flex-col flex-1">
                        <p class="text-[11px] text-slate-400 mb-1">Beauty</p>
                        <h3 class="text-[13px] font-medium text-slate-800 leading-snug min-h-[2.4em]"><a
                                href="product.html" class="hover:text-brand-600">Floral Perfume 50ml</a></h3>
                        <div class="mt-1.5 flex items-baseline gap-2"><span
                                class="font-bold text-brand-700">৳1,250</span><span
                                class="text-xs text-slate-400 line-through">৳1,650</span></div>
                        <div class="mt-1 flex items-center gap-1.5 text-[11px] text-slate-500"><span
                                class="inline-flex text-star"><svg class="w-3.5 h-3.5" viewBox="0 0 24 24"
                                    fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg></span><b class="text-slate-700">4.7</b>(134)</div>
                        <button data-add data-id="11" data-name="Floral Perfume 50ml" data-price="1250"
                            data-emoji="🧴" data-c1="#fbe9ee" data-c2="#f6d3dd"
                            class="btn btn-primary btn-sm w-full mt-3"><svg class="w-3.5 h-3.5" viewBox="0 0 24 24"
                                fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                stroke-linejoin="round" aria-hidden="true">
                                <path d="M6 2 3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4Z" />
                                <path d="M3 6h18" />
                                <path d="M16 10a4 4 0 0 1-8 0" />
                            </svg> Add to Cart</button>
                    </div>
                </article>
                <article class="card pcard overflow-hidden flex flex-col ">
                    <div class="relative pimg aspect-square overflow-hidden bg-slate-100"><a href="product.html"
                            class="block w-full h-full"><img src="https://placehold.co/400x400"
                                alt="Premium Chiffon Hijab" width="400" height="400" loading="lazy"
                                class="w-full h-full object-cover"></a><span
                            class="absolute left-2.5 top-2.5 z-10 bg-[#e5383b] text-white text-[11px] font-semibold px-2 py-0.5 rounded-md">-20%</span>
                        <button
                            class="wish absolute right-2.5 top-2.5 z-10 w-8 h-8 rounded-full bg-white/90 grid place-items-center text-slate-500 hover:text-[#e5383b]"
                            aria-label="Add to wishlist"><svg class="w-4 h-4" viewBox="0 0 24 24" fill="none"
                                stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                stroke-linejoin="round" aria-hidden="true">
                                <path
                                    d="M19 14c1.49-1.46 3-3.21 3-5.5A5.5 5.5 0 0 0 16.5 3c-1.76 0-3 .5-4.5 2-1.5-1.5-2.74-2-4.5-2A5.5 5.5 0 0 0 2 8.5c0 2.3 1.5 4.05 3 5.5l7 7Z" />
                            </svg></button>
                    </div>
                    <div class="p-3.5 flex flex-col flex-1">
                        <p class="text-[11px] text-slate-400 mb-1">Fashion</p>
                        <h3 class="text-[13px] font-medium text-slate-800 leading-snug min-h-[2.4em]"><a
                                href="product.html" class="hover:text-brand-600">Premium Chiffon Hijab</a></h3>
                        <div class="mt-1.5 flex items-baseline gap-2"><span
                                class="font-bold text-brand-700">৳799</span><span
                                class="text-xs text-slate-400 line-through">৳999</span></div>
                        <div class="mt-1 flex items-center gap-1.5 text-[11px] text-slate-500"><span
                                class="inline-flex text-star"><svg class="w-3.5 h-3.5" viewBox="0 0 24 24"
                                    fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg></span><b class="text-slate-700">4.9</b>(260)</div>
                        <button data-add data-id="5" data-name="Premium Chiffon Hijab" data-price="799"
                            data-emoji="🧕" data-c1="#fbe9ee" data-c2="#f6d3dd"
                            class="btn btn-primary btn-sm w-full mt-3"><svg class="w-3.5 h-3.5" viewBox="0 0 24 24"
                                fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                stroke-linejoin="round" aria-hidden="true">
                                <path d="M6 2 3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4Z" />
                                <path d="M3 6h18" />
                                <path d="M16 10a4 4 0 0 1-8 0" />
                            </svg> Add to Cart</button>
                    </div>
                </article>
                <article class="card pcard overflow-hidden flex flex-col ">
                    <div class="relative pimg aspect-square overflow-hidden bg-slate-100"><a href="product.html"
                            class="block w-full h-full"><img src="https://placehold.co/400x400"
                                alt="Floral Perfume 50ml" width="400" height="400" loading="lazy"
                                class="w-full h-full object-cover"></a><span
                            class="absolute left-2.5 top-2.5 z-10 bg-[#e5383b] text-white text-[11px] font-semibold px-2 py-0.5 rounded-md">-24%</span>
                        <button
                            class="wish absolute right-2.5 top-2.5 z-10 w-8 h-8 rounded-full bg-white/90 grid place-items-center text-slate-500 hover:text-[#e5383b]"
                            aria-label="Add to wishlist"><svg class="w-4 h-4" viewBox="0 0 24 24" fill="none"
                                stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                stroke-linejoin="round" aria-hidden="true">
                                <path
                                    d="M19 14c1.49-1.46 3-3.21 3-5.5A5.5 5.5 0 0 0 16.5 3c-1.76 0-3 .5-4.5 2-1.5-1.5-2.74-2-4.5-2A5.5 5.5 0 0 0 2 8.5c0 2.3 1.5 4.05 3 5.5l7 7Z" />
                            </svg></button>
                    </div>
                    <div class="p-3.5 flex flex-col flex-1">
                        <p class="text-[11px] text-slate-400 mb-1">Beauty</p>
                        <h3 class="text-[13px] font-medium text-slate-800 leading-snug min-h-[2.4em]"><a
                                href="product.html" class="hover:text-brand-600">Floral Perfume 50ml</a></h3>
                        <div class="mt-1.5 flex items-baseline gap-2"><span
                                class="font-bold text-brand-700">৳1,250</span><span
                                class="text-xs text-slate-400 line-through">৳1,650</span></div>
                        <div class="mt-1 flex items-center gap-1.5 text-[11px] text-slate-500"><span
                                class="inline-flex text-star"><svg class="w-3.5 h-3.5" viewBox="0 0 24 24"
                                    fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg></span><b class="text-slate-700">4.7</b>(134)</div>
                        <button data-add data-id="11" data-name="Floral Perfume 50ml" data-price="1250"
                            data-emoji="🧴" data-c1="#fbe9ee" data-c2="#f6d3dd"
                            class="btn btn-primary btn-sm w-full mt-3"><svg class="w-3.5 h-3.5" viewBox="0 0 24 24"
                                fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                stroke-linejoin="round" aria-hidden="true">
                                <path d="M6 2 3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4Z" />
                                <path d="M3 6h18" />
                                <path d="M16 10a4 4 0 0 1-8 0" />
                            </svg> Add to Cart</button>
                    </div>
                </article>
                <article class="card pcard overflow-hidden flex flex-col ">
                    <div class="relative pimg aspect-square overflow-hidden bg-slate-100"><a href="product.html"
                            class="block w-full h-full"><img src="https://placehold.co/400x400"
                                alt="UV Protection Sunglasses" width="400" height="400" loading="lazy"
                                class="w-full h-full object-cover"></a><span
                            class="absolute left-2.5 top-2.5 z-10 bg-[#e5383b] text-white text-[11px] font-semibold px-2 py-0.5 rounded-md">-30%</span>
                        <button
                            class="wish absolute right-2.5 top-2.5 z-10 w-8 h-8 rounded-full bg-white/90 grid place-items-center text-slate-500 hover:text-[#e5383b]"
                            aria-label="Add to wishlist"><svg class="w-4 h-4" viewBox="0 0 24 24" fill="none"
                                stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                stroke-linejoin="round" aria-hidden="true">
                                <path
                                    d="M19 14c1.49-1.46 3-3.21 3-5.5A5.5 5.5 0 0 0 16.5 3c-1.76 0-3 .5-4.5 2-1.5-1.5-2.74-2-4.5-2A5.5 5.5 0 0 0 2 8.5c0 2.3 1.5 4.05 3 5.5l7 7Z" />
                            </svg></button>
                    </div>
                    <div class="p-3.5 flex flex-col flex-1">
                        <p class="text-[11px] text-slate-400 mb-1">Accessories</p>
                        <h3 class="text-[13px] font-medium text-slate-800 leading-snug min-h-[2.4em]"><a
                                href="product.html" class="hover:text-brand-600">UV Protection Sunglasses</a>
                        </h3>
                        <div class="mt-1.5 flex items-baseline gap-2"><span
                                class="font-bold text-brand-700">৳699</span><span
                                class="text-xs text-slate-400 line-through">৳999</span></div>
                        <div class="mt-1 flex items-center gap-1.5 text-[11px] text-slate-500"><span
                                class="inline-flex text-star"><svg class="w-3.5 h-3.5" viewBox="0 0 24 24"
                                    fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg></span><b class="text-slate-700">4.6</b>(160)</div>
                        <button data-add data-id="6" data-name="UV Protection Sunglasses" data-price="699"
                            data-emoji="🕶️" data-c1="#f6efe4" data-c2="#ecdfc9"
                            class="btn btn-primary btn-sm w-full mt-3"><svg class="w-3.5 h-3.5" viewBox="0 0 24 24"
                                fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                stroke-linejoin="round" aria-hidden="true">
                                <path d="M6 2 3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4Z" />
                                <path d="M3 6h18" />
                                <path d="M16 10a4 4 0 0 1-8 0" />
                            </svg> Add to Cart</button>
                    </div>
                </article>
            </div>
        </div>
        <div data-panel="kids" class="">
            <div class="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-5 gap-4">
                <article class="card pcard overflow-hidden flex flex-col ">
                    <div class="relative pimg aspect-square overflow-hidden bg-slate-100"><a href="product.html"
                            class="block w-full h-full"><img src="https://placehold.co/400x400" alt="Baby Girl Frock"
                                width="400" height="400" loading="lazy"
                                class="w-full h-full object-cover"></a><span
                            class="absolute left-2.5 top-2.5 z-10 bg-[#e5383b] text-white text-[11px] font-semibold px-2 py-0.5 rounded-md">-29%</span>
                        <button
                            class="wish absolute right-2.5 top-2.5 z-10 w-8 h-8 rounded-full bg-white/90 grid place-items-center text-slate-500 hover:text-[#e5383b]"
                            aria-label="Add to wishlist"><svg class="w-4 h-4" viewBox="0 0 24 24" fill="none"
                                stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                stroke-linejoin="round" aria-hidden="true">
                                <path
                                    d="M19 14c1.49-1.46 3-3.21 3-5.5A5.5 5.5 0 0 0 16.5 3c-1.76 0-3 .5-4.5 2-1.5-1.5-2.74-2-4.5-2A5.5 5.5 0 0 0 2 8.5c0 2.3 1.5 4.05 3 5.5l7 7Z" />
                            </svg></button>
                    </div>
                    <div class="p-3.5 flex flex-col flex-1">
                        <p class="text-[11px] text-slate-400 mb-1">Kids</p>
                        <h3 class="text-[13px] font-medium text-slate-800 leading-snug min-h-[2.4em]"><a
                                href="product.html" class="hover:text-brand-600">Baby Girl Frock</a></h3>
                        <div class="mt-1.5 flex items-baseline gap-2"><span
                                class="font-bold text-brand-700">৳999</span><span
                                class="text-xs text-slate-400 line-through">৳1,399</span></div>
                        <div class="mt-1 flex items-center gap-1.5 text-[11px] text-slate-500"><span
                                class="inline-flex text-star"><svg class="w-3.5 h-3.5" viewBox="0 0 24 24"
                                    fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg></span><b class="text-slate-700">4.7</b>(110)</div>
                        <button data-add data-id="8" data-name="Baby Girl Frock" data-price="999" data-emoji="👗"
                            data-c1="#fbe9ee" data-c2="#f6d3dd" class="btn btn-primary btn-sm w-full mt-3"><svg
                                class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"
                                aria-hidden="true">
                                <path d="M6 2 3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4Z" />
                                <path d="M3 6h18" />
                                <path d="M16 10a4 4 0 0 1-8 0" />
                            </svg> Add to Cart</button>
                    </div>
                </article>
                <article class="card pcard overflow-hidden flex flex-col ">
                    <div class="relative pimg aspect-square overflow-hidden bg-slate-100"><a href="product.html"
                            class="block w-full h-full"><img src="https://placehold.co/400x400" alt="Baby Girl Frock"
                                width="400" height="400" loading="lazy"
                                class="w-full h-full object-cover"></a><span
                            class="absolute left-2.5 top-2.5 z-10 bg-[#e5383b] text-white text-[11px] font-semibold px-2 py-0.5 rounded-md">-29%</span>
                        <button
                            class="wish absolute right-2.5 top-2.5 z-10 w-8 h-8 rounded-full bg-white/90 grid place-items-center text-slate-500 hover:text-[#e5383b]"
                            aria-label="Add to wishlist"><svg class="w-4 h-4" viewBox="0 0 24 24" fill="none"
                                stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                stroke-linejoin="round" aria-hidden="true">
                                <path
                                    d="M19 14c1.49-1.46 3-3.21 3-5.5A5.5 5.5 0 0 0 16.5 3c-1.76 0-3 .5-4.5 2-1.5-1.5-2.74-2-4.5-2A5.5 5.5 0 0 0 2 8.5c0 2.3 1.5 4.05 3 5.5l7 7Z" />
                            </svg></button>
                    </div>
                    <div class="p-3.5 flex flex-col flex-1">
                        <p class="text-[11px] text-slate-400 mb-1">Kids</p>
                        <h3 class="text-[13px] font-medium text-slate-800 leading-snug min-h-[2.4em]"><a
                                href="product.html" class="hover:text-brand-600">Baby Girl Frock</a></h3>
                        <div class="mt-1.5 flex items-baseline gap-2"><span
                                class="font-bold text-brand-700">৳999</span><span
                                class="text-xs text-slate-400 line-through">৳1,399</span></div>
                        <div class="mt-1 flex items-center gap-1.5 text-[11px] text-slate-500"><span
                                class="inline-flex text-star"><svg class="w-3.5 h-3.5" viewBox="0 0 24 24"
                                    fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg></span><b class="text-slate-700">4.7</b>(110)</div>
                        <button data-add data-id="8" data-name="Baby Girl Frock" data-price="999" data-emoji="👗"
                            data-c1="#fbe9ee" data-c2="#f6d3dd" class="btn btn-primary btn-sm w-full mt-3"><svg
                                class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"
                                aria-hidden="true">
                                <path d="M6 2 3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4Z" />
                                <path d="M3 6h18" />
                                <path d="M16 10a4 4 0 0 1-8 0" />
                            </svg> Add to Cart</button>
                    </div>
                </article>
                <article class="card pcard overflow-hidden flex flex-col ">
                    <div class="relative pimg aspect-square overflow-hidden bg-slate-100"><a href="product.html"
                            class="block w-full h-full"><img src="https://placehold.co/400x400"
                                alt="Men&#x27;s Sports Shoes" width="400" height="400" loading="lazy"
                                class="w-full h-full object-cover"></a><span
                            class="absolute left-2.5 top-2.5 z-10 bg-[#e5383b] text-white text-[11px] font-semibold px-2 py-0.5 rounded-md">-40%</span>
                        <button
                            class="wish absolute right-2.5 top-2.5 z-10 w-8 h-8 rounded-full bg-white/90 grid place-items-center text-slate-500 hover:text-[#e5383b]"
                            aria-label="Add to wishlist"><svg class="w-4 h-4" viewBox="0 0 24 24" fill="none"
                                stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                stroke-linejoin="round" aria-hidden="true">
                                <path
                                    d="M19 14c1.49-1.46 3-3.21 3-5.5A5.5 5.5 0 0 0 16.5 3c-1.76 0-3 .5-4.5 2-1.5-1.5-2.74-2-4.5-2A5.5 5.5 0 0 0 2 8.5c0 2.3 1.5 4.05 3 5.5l7 7Z" />
                            </svg></button>
                    </div>
                    <div class="p-3.5 flex flex-col flex-1">
                        <p class="text-[11px] text-slate-400 mb-1">Sports</p>
                        <h3 class="text-[13px] font-medium text-slate-800 leading-snug min-h-[2.4em]"><a
                                href="product.html" class="hover:text-brand-600">Men's Sports Shoes</a></h3>
                        <div class="mt-1.5 flex items-baseline gap-2"><span
                                class="font-bold text-brand-700">৳1,799</span><span
                                class="text-xs text-slate-400 line-through">৳2,999</span></div>
                        <div class="mt-1 flex items-center gap-1.5 text-[11px] text-slate-500"><span
                                class="inline-flex text-star"><svg class="w-3.5 h-3.5" viewBox="0 0 24 24"
                                    fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg></span><b class="text-slate-700">4.5</b>(140)</div>
                        <button data-add data-id="4" data-name="Men&#x27;s Sports Shoes" data-price="1799"
                            data-emoji="👟" data-c1="#e4f4ef" data-c2="#cde9e0"
                            class="btn btn-primary btn-sm w-full mt-3"><svg class="w-3.5 h-3.5" viewBox="0 0 24 24"
                                fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                stroke-linejoin="round" aria-hidden="true">
                                <path d="M6 2 3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4Z" />
                                <path d="M3 6h18" />
                                <path d="M16 10a4 4 0 0 1-8 0" />
                            </svg> Add to Cart</button>
                    </div>
                </article>
                <article class="card pcard overflow-hidden flex flex-col ">
                    <div class="relative pimg aspect-square overflow-hidden bg-slate-100"><a href="product.html"
                            class="block w-full h-full"><img src="https://placehold.co/400x400" alt="Baby Girl Frock"
                                width="400" height="400" loading="lazy"
                                class="w-full h-full object-cover"></a><span
                            class="absolute left-2.5 top-2.5 z-10 bg-[#e5383b] text-white text-[11px] font-semibold px-2 py-0.5 rounded-md">-29%</span>
                        <button
                            class="wish absolute right-2.5 top-2.5 z-10 w-8 h-8 rounded-full bg-white/90 grid place-items-center text-slate-500 hover:text-[#e5383b]"
                            aria-label="Add to wishlist"><svg class="w-4 h-4" viewBox="0 0 24 24" fill="none"
                                stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                stroke-linejoin="round" aria-hidden="true">
                                <path
                                    d="M19 14c1.49-1.46 3-3.21 3-5.5A5.5 5.5 0 0 0 16.5 3c-1.76 0-3 .5-4.5 2-1.5-1.5-2.74-2-4.5-2A5.5 5.5 0 0 0 2 8.5c0 2.3 1.5 4.05 3 5.5l7 7Z" />
                            </svg></button>
                    </div>
                    <div class="p-3.5 flex flex-col flex-1">
                        <p class="text-[11px] text-slate-400 mb-1">Kids</p>
                        <h3 class="text-[13px] font-medium text-slate-800 leading-snug min-h-[2.4em]"><a
                                href="product.html" class="hover:text-brand-600">Baby Girl Frock</a></h3>
                        <div class="mt-1.5 flex items-baseline gap-2"><span
                                class="font-bold text-brand-700">৳999</span><span
                                class="text-xs text-slate-400 line-through">৳1,399</span></div>
                        <div class="mt-1 flex items-center gap-1.5 text-[11px] text-slate-500"><span
                                class="inline-flex text-star"><svg class="w-3.5 h-3.5" viewBox="0 0 24 24"
                                    fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg></span><b class="text-slate-700">4.7</b>(110)</div>
                        <button data-add data-id="8" data-name="Baby Girl Frock" data-price="999" data-emoji="👗"
                            data-c1="#fbe9ee" data-c2="#f6d3dd" class="btn btn-primary btn-sm w-full mt-3"><svg
                                class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"
                                aria-hidden="true">
                                <path d="M6 2 3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4Z" />
                                <path d="M3 6h18" />
                                <path d="M16 10a4 4 0 0 1-8 0" />
                            </svg> Add to Cart</button>
                    </div>
                </article>
                <article class="card pcard overflow-hidden flex flex-col ">
                    <div class="relative pimg aspect-square overflow-hidden bg-slate-100"><a href="product.html"
                            class="block w-full h-full"><img src="https://placehold.co/400x400" alt="Baby Girl Frock"
                                width="400" height="400" loading="lazy"
                                class="w-full h-full object-cover"></a><span
                            class="absolute left-2.5 top-2.5 z-10 bg-[#e5383b] text-white text-[11px] font-semibold px-2 py-0.5 rounded-md">-29%</span>
                        <button
                            class="wish absolute right-2.5 top-2.5 z-10 w-8 h-8 rounded-full bg-white/90 grid place-items-center text-slate-500 hover:text-[#e5383b]"
                            aria-label="Add to wishlist"><svg class="w-4 h-4" viewBox="0 0 24 24" fill="none"
                                stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                stroke-linejoin="round" aria-hidden="true">
                                <path
                                    d="M19 14c1.49-1.46 3-3.21 3-5.5A5.5 5.5 0 0 0 16.5 3c-1.76 0-3 .5-4.5 2-1.5-1.5-2.74-2-4.5-2A5.5 5.5 0 0 0 2 8.5c0 2.3 1.5 4.05 3 5.5l7 7Z" />
                            </svg></button>
                    </div>
                    <div class="p-3.5 flex flex-col flex-1">
                        <p class="text-[11px] text-slate-400 mb-1">Kids</p>
                        <h3 class="text-[13px] font-medium text-slate-800 leading-snug min-h-[2.4em]"><a
                                href="product.html" class="hover:text-brand-600">Baby Girl Frock</a></h3>
                        <div class="mt-1.5 flex items-baseline gap-2"><span
                                class="font-bold text-brand-700">৳999</span><span
                                class="text-xs text-slate-400 line-through">৳1,399</span></div>
                        <div class="mt-1 flex items-center gap-1.5 text-[11px] text-slate-500"><span
                                class="inline-flex text-star"><svg class="w-3.5 h-3.5" viewBox="0 0 24 24"
                                    fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                        fill="currentColor" />
                                </svg></span><b class="text-slate-700">4.7</b>(110)</div>
                        <button data-add data-id="8" data-name="Baby Girl Frock" data-price="999" data-emoji="👗"
                            data-c1="#fbe9ee" data-c2="#f6d3dd" class="btn btn-primary btn-sm w-full mt-3"><svg
                                class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"
                                aria-hidden="true">
                                <path d="M6 2 3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4Z" />
                                <path d="M3 6h18" />
                                <path d="M16 10a4 4 0 0 1-8 0" />
                            </svg> Add to Cart</button>
                    </div>
                </article>
            </div>
        </div>
    </section>

    <section class="container-fluid mt-14" aria-labelledby="cs-Fash">
        <div class="grid gap-5 lg:grid-cols-[290px_1fr]">
            <div class="relative overflow-hidden rounded-2xl p-6 flex flex-col text-slate-900"
                style="background:linear-gradient(160deg,#fde9ee,#f6c5d2)">
                <h3 class="text-2xl font-bold">Fashion</h3>
                <p class="text-sm mt-1 text-slate-600">Style for every occasion</p>
                <div class="mt-4 lg:mt-5 flex flex-wrap gap-2 lg:block lg:space-y-2"><a href="shop.html"
                        class="flex items-center justify-between gap-2 rounded-xl px-3 lg:px-4 py-1.5 lg:py-2.5 text-[13px] font-medium transition lg:w-auto bg-white/70 hover:bg-white">Women<span
                            class="hidden lg:inline text-[11px] opacity-70">320+</span></a><a href="shop.html"
                        class="flex items-center justify-between gap-2 rounded-xl px-3 lg:px-4 py-1.5 lg:py-2.5 text-[13px] font-medium transition lg:w-auto bg-white/70 hover:bg-white">Men<span
                            class="hidden lg:inline text-[11px] opacity-70">280+</span></a><a href="shop.html"
                        class="flex items-center justify-between gap-2 rounded-xl px-3 lg:px-4 py-1.5 lg:py-2.5 text-[13px] font-medium transition lg:w-auto bg-white/70 hover:bg-white">Hijab
                        & Modest<span class="hidden lg:inline text-[11px] opacity-70">140+</span></a><a href="shop.html"
                        class="flex items-center justify-between gap-2 rounded-xl px-3 lg:px-4 py-1.5 lg:py-2.5 text-[13px] font-medium transition lg:w-auto bg-white/70 hover:bg-white">Bags
                        & Shoes<span class="hidden lg:inline text-[11px] opacity-70">220+</span></a></div>
                <div class="hidden lg:grid flex-1 min-h-[120px] place-items-center text-[6.5rem] leading-none select-none"
                    aria-hidden="true" style="filter:drop-shadow(0 16px 16px rgba(0,0,0,.2))">👗</div>
                <a href="shop.html" class="btn btn-dark self-start mt-5 lg:mt-0">Shop Fashion <svg class="w-4 h-4"
                        viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"
                        stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                        <path d="M5 12h14" />
                        <path d="m12 5 7 7-7 7" />
                    </svg></a>
            </div>
            <div>
                <div class="flex items-center justify-between mb-4">
                    <h2 id="cs-Fash" class="section-title">Popular in Fashion</h2><a href="shop.html"
                        class="text-sm font-medium text-brand-600 hover:text-brand-800 inline-flex items-center gap-1.5">View
                        all
                        <svg class="w-4 h-4" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                            stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                            <path d="M5 12h14" />
                            <path d="m12 5 7 7-7 7" />
                        </svg></a>
                </div>
                <div class="cat-grid grid grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-4">
                    <article class="card pcard overflow-hidden flex flex-col ">
                        <div class="relative pimg aspect-square overflow-hidden bg-slate-100"><a href="product.html"
                                class="block w-full h-full"><img src="https://placehold.co/400x400"
                                    alt="Premium Chiffon Hijab" width="400" height="400" loading="lazy"
                                    class="w-full h-full object-cover"></a><span
                                class="absolute left-2.5 top-2.5 z-10 bg-[#e5383b] text-white text-[11px] font-semibold px-2 py-0.5 rounded-md">-20%</span>
                            <button
                                class="wish absolute right-2.5 top-2.5 z-10 w-8 h-8 rounded-full bg-white/90 grid place-items-center text-slate-500 hover:text-[#e5383b]"
                                aria-label="Add to wishlist"><svg class="w-4 h-4" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <path
                                        d="M19 14c1.49-1.46 3-3.21 3-5.5A5.5 5.5 0 0 0 16.5 3c-1.76 0-3 .5-4.5 2-1.5-1.5-2.74-2-4.5-2A5.5 5.5 0 0 0 2 8.5c0 2.3 1.5 4.05 3 5.5l7 7Z" />
                                </svg></button>
                        </div>
                        <div class="p-3.5 flex flex-col flex-1">
                            <p class="text-[11px] text-slate-400 mb-1">Fashion</p>
                            <h3 class="text-[13px] font-medium text-slate-800 leading-snug min-h-[2.4em]"><a
                                    href="product.html" class="hover:text-brand-600">Premium Chiffon Hijab</a>
                            </h3>
                            <div class="mt-1.5 flex items-baseline gap-2"><span
                                    class="font-bold text-brand-700">৳799</span><span
                                    class="text-xs text-slate-400 line-through">৳999</span></div>
                            <div class="mt-1 flex items-center gap-1.5 text-[11px] text-slate-500"><span
                                    class="inline-flex text-star"><svg class="w-3.5 h-3.5" viewBox="0 0 24 24"
                                        fill="none" stroke="currentColor" stroke-width="1.8"
                                        stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                                        <polygon
                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                            fill="currentColor" />
                                    </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                        stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                        stroke-linejoin="round" aria-hidden="true">
                                        <polygon
                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                            fill="currentColor" />
                                    </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                        stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                        stroke-linejoin="round" aria-hidden="true">
                                        <polygon
                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                            fill="currentColor" />
                                    </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                        stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                        stroke-linejoin="round" aria-hidden="true">
                                        <polygon
                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                            fill="currentColor" />
                                    </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                        stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                        stroke-linejoin="round" aria-hidden="true">
                                        <polygon
                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                            fill="currentColor" />
                                    </svg></span><b class="text-slate-700">4.9</b>(260)</div>
                            <button data-add data-id="5" data-name="Premium Chiffon Hijab" data-price="799"
                                data-emoji="🧕" data-c1="#fbe9ee" data-c2="#f6d3dd"
                                class="btn btn-primary btn-sm w-full mt-3"><svg class="w-3.5 h-3.5"
                                    viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"
                                    stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                                    <path d="M6 2 3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4Z" />
                                    <path d="M3 6h18" />
                                    <path d="M16 10a4 4 0 0 1-8 0" />
                                </svg> Add to Cart</button>
                        </div>
                    </article>
                    <article class="card pcard overflow-hidden flex flex-col ">
                        <div class="relative pimg aspect-square overflow-hidden bg-slate-100"><a href="product.html"
                                class="block w-full h-full"><img src="https://placehold.co/400x400"
                                    alt="Cotton Panjabi for Men" width="400" height="400" loading="lazy"
                                    class="w-full h-full object-cover"></a><span
                                class="absolute left-2.5 top-2.5 z-10 bg-[#e5383b] text-white text-[11px] font-semibold px-2 py-0.5 rounded-md">-27%</span>
                            <button
                                class="wish absolute right-2.5 top-2.5 z-10 w-8 h-8 rounded-full bg-white/90 grid place-items-center text-slate-500 hover:text-[#e5383b]"
                                aria-label="Add to wishlist"><svg class="w-4 h-4" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <path
                                        d="M19 14c1.49-1.46 3-3.21 3-5.5A5.5 5.5 0 0 0 16.5 3c-1.76 0-3 .5-4.5 2-1.5-1.5-2.74-2-4.5-2A5.5 5.5 0 0 0 2 8.5c0 2.3 1.5 4.05 3 5.5l7 7Z" />
                                </svg></button>
                        </div>
                        <div class="p-3.5 flex flex-col flex-1">
                            <p class="text-[11px] text-slate-400 mb-1">Fashion</p>
                            <h3 class="text-[13px] font-medium text-slate-800 leading-snug min-h-[2.4em]"><a
                                    href="product.html" class="hover:text-brand-600">Cotton Panjabi for Men</a>
                            </h3>
                            <div class="mt-1.5 flex items-baseline gap-2"><span
                                    class="font-bold text-brand-700">৳1,450</span><span
                                    class="text-xs text-slate-400 line-through">৳1,990</span></div>
                            <div class="mt-1 flex items-center gap-1.5 text-[11px] text-slate-500"><span
                                    class="inline-flex text-star"><svg class="w-3.5 h-3.5" viewBox="0 0 24 24"
                                        fill="none" stroke="currentColor" stroke-width="1.8"
                                        stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                                        <polygon
                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                            fill="currentColor" />
                                    </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                        stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                        stroke-linejoin="round" aria-hidden="true">
                                        <polygon
                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                            fill="currentColor" />
                                    </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                        stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                        stroke-linejoin="round" aria-hidden="true">
                                        <polygon
                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                            fill="currentColor" />
                                    </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                        stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                        stroke-linejoin="round" aria-hidden="true">
                                        <polygon
                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                            fill="currentColor" />
                                    </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                        stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                        stroke-linejoin="round" aria-hidden="true">
                                        <polygon
                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                            fill="currentColor" />
                                    </svg></span><b class="text-slate-700">4.7</b>(98)</div>
                            <button data-add data-id="14" data-name="Cotton Panjabi for Men" data-price="1450"
                                data-emoji="👔" data-c1="#f6efe4" data-c2="#ecdfc9"
                                class="btn btn-primary btn-sm w-full mt-3"><svg class="w-3.5 h-3.5"
                                    viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"
                                    stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                                    <path d="M6 2 3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4Z" />
                                    <path d="M3 6h18" />
                                    <path d="M16 10a4 4 0 0 1-8 0" />
                                </svg> Add to Cart</button>
                        </div>
                    </article>
                    <article class="card pcard overflow-hidden flex flex-col ">
                        <div class="relative pimg aspect-square overflow-hidden bg-slate-100"><a href="product.html"
                                class="block w-full h-full"><img src="https://placehold.co/400x400"
                                    alt="Casual Sneakers for Men" width="400" height="400" loading="lazy"
                                    class="w-full h-full object-cover"></a><span
                                class="absolute left-2.5 top-2.5 z-10 bg-[#e5383b] text-white text-[11px] font-semibold px-2 py-0.5 rounded-md">-24%</span>
                            <button
                                class="wish absolute right-2.5 top-2.5 z-10 w-8 h-8 rounded-full bg-white/90 grid place-items-center text-slate-500 hover:text-[#e5383b]"
                                aria-label="Add to wishlist"><svg class="w-4 h-4" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <path
                                        d="M19 14c1.49-1.46 3-3.21 3-5.5A5.5 5.5 0 0 0 16.5 3c-1.76 0-3 .5-4.5 2-1.5-1.5-2.74-2-4.5-2A5.5 5.5 0 0 0 2 8.5c0 2.3 1.5 4.05 3 5.5l7 7Z" />
                                </svg></button>
                        </div>
                        <div class="p-3.5 flex flex-col flex-1">
                            <p class="text-[11px] text-slate-400 mb-1">Fashion</p>
                            <h3 class="text-[13px] font-medium text-slate-800 leading-snug min-h-[2.4em]"><a
                                    href="product.html" class="hover:text-brand-600">Casual Sneakers for Men</a>
                            </h3>
                            <div class="mt-1.5 flex items-baseline gap-2"><span
                                    class="font-bold text-brand-700">৳1,899</span><span
                                    class="text-xs text-slate-400 line-through">৳2,499</span></div>
                            <div class="mt-1 flex items-center gap-1.5 text-[11px] text-slate-500"><span
                                    class="inline-flex text-star"><svg class="w-3.5 h-3.5" viewBox="0 0 24 24"
                                        fill="none" stroke="currentColor" stroke-width="1.8"
                                        stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                                        <polygon
                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                            fill="currentColor" />
                                    </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                        stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                        stroke-linejoin="round" aria-hidden="true">
                                        <polygon
                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                            fill="currentColor" />
                                    </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                        stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                        stroke-linejoin="round" aria-hidden="true">
                                        <polygon
                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                            fill="currentColor" />
                                    </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                        stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                        stroke-linejoin="round" aria-hidden="true">
                                        <polygon
                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                            fill="currentColor" />
                                    </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                        stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                        stroke-linejoin="round" aria-hidden="true">
                                        <polygon
                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                            fill="currentColor" />
                                    </svg></span><b class="text-slate-700">4.8</b>(180)</div>
                            <button data-add data-id="7" data-name="Casual Sneakers for Men" data-price="1899"
                                data-emoji="👟" data-c1="#eceff1" data-c2="#dde2e5"
                                class="btn btn-primary btn-sm w-full mt-3"><svg class="w-3.5 h-3.5"
                                    viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"
                                    stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                                    <path d="M6 2 3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4Z" />
                                    <path d="M3 6h18" />
                                    <path d="M16 10a4 4 0 0 1-8 0" />
                                </svg> Add to Cart</button>
                        </div>
                    </article>
                    <article class="card pcard overflow-hidden flex flex-col ">
                        <div class="relative pimg aspect-square overflow-hidden bg-slate-100"><a href="product.html"
                                class="block w-full h-full"><img src="https://placehold.co/400x400"
                                    alt="Anti Theft Laptop Bag" width="400" height="400" loading="lazy"
                                    class="w-full h-full object-cover"></a><span
                                class="absolute left-2.5 top-2.5 z-10 bg-[#e5383b] text-white text-[11px] font-semibold px-2 py-0.5 rounded-md">-20%</span>
                            <button
                                class="wish absolute right-2.5 top-2.5 z-10 w-8 h-8 rounded-full bg-white/90 grid place-items-center text-slate-500 hover:text-[#e5383b]"
                                aria-label="Add to wishlist"><svg class="w-4 h-4" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <path
                                        d="M19 14c1.49-1.46 3-3.21 3-5.5A5.5 5.5 0 0 0 16.5 3c-1.76 0-3 .5-4.5 2-1.5-1.5-2.74-2-4.5-2A5.5 5.5 0 0 0 2 8.5c0 2.3 1.5 4.05 3 5.5l7 7Z" />
                                </svg></button>
                        </div>
                        <div class="p-3.5 flex flex-col flex-1">
                            <p class="text-[11px] text-slate-400 mb-1">Fashion</p>
                            <h3 class="text-[13px] font-medium text-slate-800 leading-snug min-h-[2.4em]"><a
                                    href="product.html" class="hover:text-brand-600">Anti Theft Laptop Bag</a>
                            </h3>
                            <div class="mt-1.5 flex items-baseline gap-2"><span
                                    class="font-bold text-brand-700">৳1,599</span><span
                                    class="text-xs text-slate-400 line-through">৳1,999</span></div>
                            <div class="mt-1 flex items-center gap-1.5 text-[11px] text-slate-500"><span
                                    class="inline-flex text-star"><svg class="w-3.5 h-3.5" viewBox="0 0 24 24"
                                        fill="none" stroke="currentColor" stroke-width="1.8"
                                        stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                                        <polygon
                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                            fill="currentColor" />
                                    </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                        stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                        stroke-linejoin="round" aria-hidden="true">
                                        <polygon
                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                            fill="currentColor" />
                                    </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                        stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                        stroke-linejoin="round" aria-hidden="true">
                                        <polygon
                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                            fill="currentColor" />
                                    </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                        stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                        stroke-linejoin="round" aria-hidden="true">
                                        <polygon
                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                            fill="currentColor" />
                                    </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                        stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                        stroke-linejoin="round" aria-hidden="true">
                                        <polygon
                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                            fill="currentColor" />
                                    </svg></span><b class="text-slate-700">4.6</b>(180)</div>
                            <button data-add data-id="2" data-name="Anti Theft Laptop Bag" data-price="1599"
                                data-emoji="🎒" data-c1="#f6efe4" data-c2="#ecdfc9"
                                class="btn btn-primary btn-sm w-full mt-3"><svg class="w-3.5 h-3.5"
                                    viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"
                                    stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                                    <path d="M6 2 3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4Z" />
                                    <path d="M3 6h18" />
                                    <path d="M16 10a4 4 0 0 1-8 0" />
                                </svg> Add to Cart</button>
                        </div>
                    </article>
                    <article class="card pcard overflow-hidden flex flex-col ">
                        <div class="relative pimg aspect-square overflow-hidden bg-slate-100"><a href="product.html"
                                class="block w-full h-full"><img src="https://placehold.co/400x400"
                                    alt="Leather Wallet" width="400" height="400" loading="lazy"
                                    class="w-full h-full object-cover"></a><span
                                class="absolute left-2.5 top-2.5 z-10 bg-[#e5383b] text-white text-[11px] font-semibold px-2 py-0.5 rounded-md">-33%</span>
                            <button
                                class="wish absolute right-2.5 top-2.5 z-10 w-8 h-8 rounded-full bg-white/90 grid place-items-center text-slate-500 hover:text-[#e5383b]"
                                aria-label="Add to wishlist"><svg class="w-4 h-4" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <path
                                        d="M19 14c1.49-1.46 3-3.21 3-5.5A5.5 5.5 0 0 0 16.5 3c-1.76 0-3 .5-4.5 2-1.5-1.5-2.74-2-4.5-2A5.5 5.5 0 0 0 2 8.5c0 2.3 1.5 4.05 3 5.5l7 7Z" />
                                </svg></button>
                        </div>
                        <div class="p-3.5 flex flex-col flex-1">
                            <p class="text-[11px] text-slate-400 mb-1">Fashion</p>
                            <h3 class="text-[13px] font-medium text-slate-800 leading-snug min-h-[2.4em]"><a
                                    href="product.html" class="hover:text-brand-600">Leather Wallet</a></h3>
                            <div class="mt-1.5 flex items-baseline gap-2"><span
                                    class="font-bold text-brand-700">৳599</span><span
                                    class="text-xs text-slate-400 line-through">৳899</span></div>
                            <div class="mt-1 flex items-center gap-1.5 text-[11px] text-slate-500"><span
                                    class="inline-flex text-star"><svg class="w-3.5 h-3.5" viewBox="0 0 24 24"
                                        fill="none" stroke="currentColor" stroke-width="1.8"
                                        stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                                        <polygon
                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                            fill="currentColor" />
                                    </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                        stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                        stroke-linejoin="round" aria-hidden="true">
                                        <polygon
                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                            fill="currentColor" />
                                    </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                        stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                        stroke-linejoin="round" aria-hidden="true">
                                        <polygon
                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                            fill="currentColor" />
                                    </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                        stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                        stroke-linejoin="round" aria-hidden="true">
                                        <polygon
                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                            fill="currentColor" />
                                    </svg></span><b class="text-slate-700">4.4</b>(121)</div>
                            <button data-add data-id="15" data-name="Leather Wallet" data-price="599"
                                data-emoji="👛" data-c1="#fdeee3" data-c2="#f9dcc6"
                                class="btn btn-primary btn-sm w-full mt-3"><svg class="w-3.5 h-3.5"
                                    viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"
                                    stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                                    <path d="M6 2 3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4Z" />
                                    <path d="M3 6h18" />
                                    <path d="M16 10a4 4 0 0 1-8 0" />
                                </svg> Add to Cart</button>
                        </div>
                    </article>
                    <article class="card pcard overflow-hidden flex flex-col ">
                        <div class="relative pimg aspect-square overflow-hidden bg-slate-100"><a href="product.html"
                                class="block w-full h-full"><img src="https://placehold.co/400x400" alt="Denim Jacket"
                                    width="400" height="400" loading="lazy"
                                    class="w-full h-full object-cover"></a><span
                                class="absolute left-2.5 top-2.5 z-10 bg-[#e5383b] text-white text-[11px] font-semibold px-2 py-0.5 rounded-md">-23%</span>
                            <button
                                class="wish absolute right-2.5 top-2.5 z-10 w-8 h-8 rounded-full bg-white/90 grid place-items-center text-slate-500 hover:text-[#e5383b]"
                                aria-label="Add to wishlist"><svg class="w-4 h-4" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <path
                                        d="M19 14c1.49-1.46 3-3.21 3-5.5A5.5 5.5 0 0 0 16.5 3c-1.76 0-3 .5-4.5 2-1.5-1.5-2.74-2-4.5-2A5.5 5.5 0 0 0 2 8.5c0 2.3 1.5 4.05 3 5.5l7 7Z" />
                                </svg></button>
                        </div>
                        <div class="p-3.5 flex flex-col flex-1">
                            <p class="text-[11px] text-slate-400 mb-1">Fashion</p>
                            <h3 class="text-[13px] font-medium text-slate-800 leading-snug min-h-[2.4em]"><a
                                    href="product.html" class="hover:text-brand-600">Denim Jacket</a></h3>
                            <div class="mt-1.5 flex items-baseline gap-2"><span
                                    class="font-bold text-brand-700">৳2,299</span><span
                                    class="text-xs text-slate-400 line-through">৳2,999</span></div>
                            <div class="mt-1 flex items-center gap-1.5 text-[11px] text-slate-500"><span
                                    class="inline-flex text-star"><svg class="w-3.5 h-3.5" viewBox="0 0 24 24"
                                        fill="none" stroke="currentColor" stroke-width="1.8"
                                        stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                                        <polygon
                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                            fill="currentColor" />
                                    </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                        stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                        stroke-linejoin="round" aria-hidden="true">
                                        <polygon
                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                            fill="currentColor" />
                                    </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                        stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                        stroke-linejoin="round" aria-hidden="true">
                                        <polygon
                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                            fill="currentColor" />
                                    </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                        stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                        stroke-linejoin="round" aria-hidden="true">
                                        <polygon
                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                            fill="currentColor" />
                                    </svg></span><b class="text-slate-700">4.5</b>(69)</div>
                            <button data-add data-id="19" data-name="Denim Jacket" data-price="2299"
                                data-emoji="🧥" data-c1="#e6eef9" data-c2="#d3e0f4"
                                class="btn btn-primary btn-sm w-full mt-3"><svg class="w-3.5 h-3.5"
                                    viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"
                                    stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                                    <path d="M6 2 3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4Z" />
                                    <path d="M3 6h18" />
                                    <path d="M16 10a4 4 0 0 1-8 0" />
                                </svg> Add to Cart</button>
                        </div>
                    </article>
                    <article class="card pcard overflow-hidden flex flex-col ">
                        <div class="relative pimg aspect-square overflow-hidden bg-slate-100"><a href="product.html"
                                class="block w-full h-full"><img src="https://placehold.co/400x400"
                                    alt="Formal Leather Shoes" width="400" height="400" loading="lazy"
                                    class="w-full h-full object-cover"></a><span
                                class="absolute left-2.5 top-2.5 z-10 bg-[#e5383b] text-white text-[11px] font-semibold px-2 py-0.5 rounded-md">-24%</span>
                            <button
                                class="wish absolute right-2.5 top-2.5 z-10 w-8 h-8 rounded-full bg-white/90 grid place-items-center text-slate-500 hover:text-[#e5383b]"
                                aria-label="Add to wishlist"><svg class="w-4 h-4" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <path
                                        d="M19 14c1.49-1.46 3-3.21 3-5.5A5.5 5.5 0 0 0 16.5 3c-1.76 0-3 .5-4.5 2-1.5-1.5-2.74-2-4.5-2A5.5 5.5 0 0 0 2 8.5c0 2.3 1.5 4.05 3 5.5l7 7Z" />
                                </svg></button>
                        </div>
                        <div class="p-3.5 flex flex-col flex-1">
                            <p class="text-[11px] text-slate-400 mb-1">Fashion</p>
                            <h3 class="text-[13px] font-medium text-slate-800 leading-snug min-h-[2.4em]"><a
                                    href="product.html" class="hover:text-brand-600">Formal Leather Shoes</a>
                            </h3>
                            <div class="mt-1.5 flex items-baseline gap-2"><span
                                    class="font-bold text-brand-700">৳2,490</span><span
                                    class="text-xs text-slate-400 line-through">৳3,290</span></div>
                            <div class="mt-1 flex items-center gap-1.5 text-[11px] text-slate-500"><span
                                    class="inline-flex text-star"><svg class="w-3.5 h-3.5" viewBox="0 0 24 24"
                                        fill="none" stroke="currentColor" stroke-width="1.8"
                                        stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                                        <polygon
                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                            fill="currentColor" />
                                    </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                        stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                        stroke-linejoin="round" aria-hidden="true">
                                        <polygon
                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                            fill="currentColor" />
                                    </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                        stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                        stroke-linejoin="round" aria-hidden="true">
                                        <polygon
                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                            fill="currentColor" />
                                    </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                        stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                        stroke-linejoin="round" aria-hidden="true">
                                        <polygon
                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                            fill="currentColor" />
                                    </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                        stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                        stroke-linejoin="round" aria-hidden="true">
                                        <polygon
                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                            fill="currentColor" />
                                    </svg></span><b class="text-slate-700">4.6</b>(88)</div>
                            <button data-add data-id="20" data-name="Formal Leather Shoes" data-price="2490"
                                data-emoji="👞" data-c1="#eceff1" data-c2="#dde2e5"
                                class="btn btn-primary btn-sm w-full mt-3"><svg class="w-3.5 h-3.5"
                                    viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"
                                    stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                                    <path d="M6 2 3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4Z" />
                                    <path d="M3 6h18" />
                                    <path d="M16 10a4 4 0 0 1-8 0" />
                                </svg> Add to Cart</button>
                        </div>
                    </article>
                    <article class="card pcard overflow-hidden flex flex-col ">
                        <div class="relative pimg aspect-square overflow-hidden bg-slate-100"><a href="product.html"
                                class="block w-full h-full"><img src="https://placehold.co/400x400" alt="Cotton Saree"
                                    width="400" height="400" loading="lazy"
                                    class="w-full h-full object-cover"></a><span
                                class="absolute left-2.5 top-2.5 z-10 bg-[#e5383b] text-white text-[11px] font-semibold px-2 py-0.5 rounded-md">-24%</span>
                            <button
                                class="wish absolute right-2.5 top-2.5 z-10 w-8 h-8 rounded-full bg-white/90 grid place-items-center text-slate-500 hover:text-[#e5383b]"
                                aria-label="Add to wishlist"><svg class="w-4 h-4" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <path
                                        d="M19 14c1.49-1.46 3-3.21 3-5.5A5.5 5.5 0 0 0 16.5 3c-1.76 0-3 .5-4.5 2-1.5-1.5-2.74-2-4.5-2A5.5 5.5 0 0 0 2 8.5c0 2.3 1.5 4.05 3 5.5l7 7Z" />
                                </svg></button>
                        </div>
                        <div class="p-3.5 flex flex-col flex-1">
                            <p class="text-[11px] text-slate-400 mb-1">Fashion</p>
                            <h3 class="text-[13px] font-medium text-slate-800 leading-snug min-h-[2.4em]"><a
                                    href="product.html" class="hover:text-brand-600">Cotton Saree</a></h3>
                            <div class="mt-1.5 flex items-baseline gap-2"><span
                                    class="font-bold text-brand-700">৳1,890</span><span
                                    class="text-xs text-slate-400 line-through">৳2,490</span></div>
                            <div class="mt-1 flex items-center gap-1.5 text-[11px] text-slate-500"><span
                                    class="inline-flex text-star"><svg class="w-3.5 h-3.5" viewBox="0 0 24 24"
                                        fill="none" stroke="currentColor" stroke-width="1.8"
                                        stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                                        <polygon
                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                            fill="currentColor" />
                                    </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                        stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                        stroke-linejoin="round" aria-hidden="true">
                                        <polygon
                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                            fill="currentColor" />
                                    </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                        stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                        stroke-linejoin="round" aria-hidden="true">
                                        <polygon
                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                            fill="currentColor" />
                                    </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                        stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                        stroke-linejoin="round" aria-hidden="true">
                                        <polygon
                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                            fill="currentColor" />
                                    </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                        stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                        stroke-linejoin="round" aria-hidden="true">
                                        <polygon
                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                            fill="currentColor" />
                                    </svg></span><b class="text-slate-700">4.8</b>(112)</div>
                            <button data-add data-id="21" data-name="Cotton Saree" data-price="1890"
                                data-emoji="🥻" data-c1="#fbe9ee" data-c2="#f6d3dd"
                                class="btn btn-primary btn-sm w-full mt-3"><svg class="w-3.5 h-3.5"
                                    viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"
                                    stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                                    <path d="M6 2 3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4Z" />
                                    <path d="M3 6h18" />
                                    <path d="M16 10a4 4 0 0 1-8 0" />
                                </svg> Add to Cart</button>
                        </div>
                    </article>
                </div>
            </div>
        </div>
    </section>
    <section class="container-fluid mt-14" aria-labelledby="cs-Elec">
        <div class="grid gap-5 lg:grid-cols-[1fr_290px]">
            <div class="lg:order-last relative overflow-hidden rounded-2xl p-6 flex flex-col text-white"
                style="background:linear-gradient(160deg,#0e7d3b,#073a1d)">
                <h3 class="text-2xl font-bold">Electronics</h3>
                <p class="text-sm mt-1 text-white/75">Gadgets worth owning</p>
                <div class="mt-4 lg:mt-5 flex flex-wrap gap-2 lg:block lg:space-y-2"><a href="shop.html"
                        class="flex items-center justify-between gap-2 rounded-xl px-3 lg:px-4 py-1.5 lg:py-2.5 text-[13px] font-medium transition lg:w-auto bg-white/10 hover:bg-white/20">Smart
                        Watches<span class="hidden lg:inline text-[11px] opacity-70">60+</span></a><a href="shop.html"
                        class="flex items-center justify-between gap-2 rounded-xl px-3 lg:px-4 py-1.5 lg:py-2.5 text-[13px] font-medium transition lg:w-auto bg-white/10 hover:bg-white/20">Audio<span
                            class="hidden lg:inline text-[11px] opacity-70">95+</span></a><a href="shop.html"
                        class="flex items-center justify-between gap-2 rounded-xl px-3 lg:px-4 py-1.5 lg:py-2.5 text-[13px] font-medium transition lg:w-auto bg-white/10 hover:bg-white/20">Computer
                        Accessories<span class="hidden lg:inline text-[11px] opacity-70">110+</span></a><a
                        href="shop.html"
                        class="flex items-center justify-between gap-2 rounded-xl px-3 lg:px-4 py-1.5 lg:py-2.5 text-[13px] font-medium transition lg:w-auto bg-white/10 hover:bg-white/20">Cameras
                        & TVs<span class="hidden lg:inline text-[11px] opacity-70">45+</span></a></div>
                <div class="hidden lg:grid flex-1 min-h-[120px] place-items-center text-[6.5rem] leading-none select-none"
                    aria-hidden="true" style="filter:drop-shadow(0 16px 16px rgba(0,0,0,.2))">🎧</div>
                <a href="shop.html" class="btn btn-light self-start mt-5 lg:mt-0">Shop Electronics <svg
                        class="w-4 h-4" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                        stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                        <path d="M5 12h14" />
                        <path d="m12 5 7 7-7 7" />
                    </svg></a>
            </div>
            <div>
                <div class="flex items-center justify-between mb-4">
                    <h2 id="cs-Elec" class="section-title">Popular in Electronics</h2><a href="shop.html"
                        class="text-sm font-medium text-brand-600 hover:text-brand-800 inline-flex items-center gap-1.5">View
                        all
                        <svg class="w-4 h-4" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                            stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                            <path d="M5 12h14" />
                            <path d="m12 5 7 7-7 7" />
                        </svg></a>
                </div>
                <div class="cat-grid grid grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-4">
                    <article class="card pcard overflow-hidden flex flex-col ">
                        <div class="relative pimg aspect-square overflow-hidden bg-slate-100"><a href="product.html"
                                class="block w-full h-full"><img src="https://placehold.co/400x400"
                                    alt="T800 Ultra Smart Watch (Original)" width="400" height="400"
                                    loading="lazy" class="w-full h-full object-cover"></a><span
                                class="absolute left-2.5 top-2.5 z-10 bg-[#e5383b] text-white text-[11px] font-semibold px-2 py-0.5 rounded-md">-40%</span>
                            <button
                                class="wish absolute right-2.5 top-2.5 z-10 w-8 h-8 rounded-full bg-white/90 grid place-items-center text-slate-500 hover:text-[#e5383b]"
                                aria-label="Add to wishlist"><svg class="w-4 h-4" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <path
                                        d="M19 14c1.49-1.46 3-3.21 3-5.5A5.5 5.5 0 0 0 16.5 3c-1.76 0-3 .5-4.5 2-1.5-1.5-2.74-2-4.5-2A5.5 5.5 0 0 0 2 8.5c0 2.3 1.5 4.05 3 5.5l7 7Z" />
                                </svg></button>
                        </div>
                        <div class="p-3.5 flex flex-col flex-1">
                            <p class="text-[11px] text-slate-400 mb-1">Electronics</p>
                            <h3 class="text-[13px] font-medium text-slate-800 leading-snug min-h-[2.4em]"><a
                                    href="product.html" class="hover:text-brand-600">T800 Ultra Smart Watch
                                    (Original)</a></h3>
                            <div class="mt-1.5 flex items-baseline gap-2"><span
                                    class="font-bold text-brand-700">৳1,499</span><span
                                    class="text-xs text-slate-400 line-through">৳2,500</span></div>
                            <div class="mt-1 flex items-center gap-1.5 text-[11px] text-slate-500"><span
                                    class="inline-flex text-star"><svg class="w-3.5 h-3.5" viewBox="0 0 24 24"
                                        fill="none" stroke="currentColor" stroke-width="1.8"
                                        stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                                        <polygon
                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                            fill="currentColor" />
                                    </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                        stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                        stroke-linejoin="round" aria-hidden="true">
                                        <polygon
                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                            fill="currentColor" />
                                    </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                        stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                        stroke-linejoin="round" aria-hidden="true">
                                        <polygon
                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                            fill="currentColor" />
                                    </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                        stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                        stroke-linejoin="round" aria-hidden="true">
                                        <polygon
                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                            fill="currentColor" />
                                    </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                        stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                        stroke-linejoin="round" aria-hidden="true">
                                        <polygon
                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                            fill="currentColor" />
                                    </svg></span><b class="text-slate-700">4.8</b>(320)</div>
                            <button data-add data-id="0" data-name="T800 Ultra Smart Watch (Original)"
                                data-price="1499" data-emoji="⌚" data-c1="#eceff1" data-c2="#dde2e5"
                                class="btn btn-primary btn-sm w-full mt-3"><svg class="w-3.5 h-3.5"
                                    viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"
                                    stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                                    <path d="M6 2 3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4Z" />
                                    <path d="M3 6h18" />
                                    <path d="M16 10a4 4 0 0 1-8 0" />
                                </svg> Add to Cart</button>
                        </div>
                    </article>
                    <article class="card pcard overflow-hidden flex flex-col ">
                        <div class="relative pimg aspect-square overflow-hidden bg-slate-100"><a href="product.html"
                                class="block w-full h-full"><img src="https://placehold.co/400x400"
                                    alt="Airdots Pro Wireless Earbuds" width="400" height="400" loading="lazy"
                                    class="w-full h-full object-cover"></a><span
                                class="absolute left-2.5 top-2.5 z-10 bg-[#e5383b] text-white text-[11px] font-semibold px-2 py-0.5 rounded-md">-35%</span>
                            <button
                                class="wish absolute right-2.5 top-2.5 z-10 w-8 h-8 rounded-full bg-white/90 grid place-items-center text-slate-500 hover:text-[#e5383b]"
                                aria-label="Add to wishlist"><svg class="w-4 h-4" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <path
                                        d="M19 14c1.49-1.46 3-3.21 3-5.5A5.5 5.5 0 0 0 16.5 3c-1.76 0-3 .5-4.5 2-1.5-1.5-2.74-2-4.5-2A5.5 5.5 0 0 0 2 8.5c0 2.3 1.5 4.05 3 5.5l7 7Z" />
                                </svg></button>
                        </div>
                        <div class="p-3.5 flex flex-col flex-1">
                            <p class="text-[11px] text-slate-400 mb-1">Electronics</p>
                            <h3 class="text-[13px] font-medium text-slate-800 leading-snug min-h-[2.4em]"><a
                                    href="product.html" class="hover:text-brand-600">Airdots Pro Wireless
                                    Earbuds</a></h3>
                            <div class="mt-1.5 flex items-baseline gap-2"><span
                                    class="font-bold text-brand-700">৳1,299</span><span
                                    class="text-xs text-slate-400 line-through">৳1,999</span></div>
                            <div class="mt-1 flex items-center gap-1.5 text-[11px] text-slate-500"><span
                                    class="inline-flex text-star"><svg class="w-3.5 h-3.5" viewBox="0 0 24 24"
                                        fill="none" stroke="currentColor" stroke-width="1.8"
                                        stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                                        <polygon
                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                            fill="currentColor" />
                                    </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                        stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                        stroke-linejoin="round" aria-hidden="true">
                                        <polygon
                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                            fill="currentColor" />
                                    </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                        stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                        stroke-linejoin="round" aria-hidden="true">
                                        <polygon
                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                            fill="currentColor" />
                                    </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                        stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                        stroke-linejoin="round" aria-hidden="true">
                                        <polygon
                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                            fill="currentColor" />
                                    </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                        stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                        stroke-linejoin="round" aria-hidden="true">
                                        <polygon
                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                            fill="currentColor" />
                                    </svg></span><b class="text-slate-700">4.7</b>(210)</div>
                            <button data-add data-id="1" data-name="Airdots Pro Wireless Earbuds" data-price="1299"
                                data-emoji="🎧" data-c1="#e6eef9" data-c2="#d3e0f4"
                                class="btn btn-primary btn-sm w-full mt-3"><svg class="w-3.5 h-3.5"
                                    viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"
                                    stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                                    <path d="M6 2 3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4Z" />
                                    <path d="M3 6h18" />
                                    <path d="M16 10a4 4 0 0 1-8 0" />
                                </svg> Add to Cart</button>
                        </div>
                    </article>
                    <article class="card pcard overflow-hidden flex flex-col ">
                        <div class="relative pimg aspect-square overflow-hidden bg-slate-100"><a href="product.html"
                                class="block w-full h-full"><img src="https://placehold.co/400x400"
                                    alt="Bluetooth Speaker Mini" width="400" height="400" loading="lazy"
                                    class="w-full h-full object-cover"></a><span
                                class="absolute left-2.5 top-2.5 z-10 bg-[#e5383b] text-white text-[11px] font-semibold px-2 py-0.5 rounded-md">-33%</span>
                            <button
                                class="wish absolute right-2.5 top-2.5 z-10 w-8 h-8 rounded-full bg-white/90 grid place-items-center text-slate-500 hover:text-[#e5383b]"
                                aria-label="Add to wishlist"><svg class="w-4 h-4" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <path
                                        d="M19 14c1.49-1.46 3-3.21 3-5.5A5.5 5.5 0 0 0 16.5 3c-1.76 0-3 .5-4.5 2-1.5-1.5-2.74-2-4.5-2A5.5 5.5 0 0 0 2 8.5c0 2.3 1.5 4.05 3 5.5l7 7Z" />
                                </svg></button>
                        </div>
                        <div class="p-3.5 flex flex-col flex-1">
                            <p class="text-[11px] text-slate-400 mb-1">Electronics</p>
                            <h3 class="text-[13px] font-medium text-slate-800 leading-snug min-h-[2.4em]"><a
                                    href="product.html" class="hover:text-brand-600">Bluetooth Speaker Mini</a>
                            </h3>
                            <div class="mt-1.5 flex items-baseline gap-2"><span
                                    class="font-bold text-brand-700">৳1,199</span><span
                                    class="text-xs text-slate-400 line-through">৳1,799</span></div>
                            <div class="mt-1 flex items-center gap-1.5 text-[11px] text-slate-500"><span
                                    class="inline-flex text-star"><svg class="w-3.5 h-3.5" viewBox="0 0 24 24"
                                        fill="none" stroke="currentColor" stroke-width="1.8"
                                        stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                                        <polygon
                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                            fill="currentColor" />
                                    </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                        stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                        stroke-linejoin="round" aria-hidden="true">
                                        <polygon
                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                            fill="currentColor" />
                                    </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                        stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                        stroke-linejoin="round" aria-hidden="true">
                                        <polygon
                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                            fill="currentColor" />
                                    </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                        stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                        stroke-linejoin="round" aria-hidden="true">
                                        <polygon
                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                            fill="currentColor" />
                                    </svg></span><b class="text-slate-700">4.4</b>(88)</div>
                            <button data-add data-id="10" data-name="Bluetooth Speaker Mini" data-price="1199"
                                data-emoji="🔊" data-c1="#efe9f8" data-c2="#ddd2f0"
                                class="btn btn-primary btn-sm w-full mt-3"><svg class="w-3.5 h-3.5"
                                    viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"
                                    stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                                    <path d="M6 2 3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4Z" />
                                    <path d="M3 6h18" />
                                    <path d="M16 10a4 4 0 0 1-8 0" />
                                </svg> Add to Cart</button>
                        </div>
                    </article>
                    <article class="card pcard overflow-hidden flex flex-col ">
                        <div class="relative pimg aspect-square overflow-hidden bg-slate-100"><a href="product.html"
                                class="block w-full h-full"><img src="https://placehold.co/400x400"
                                    alt="Wireless Gaming Mouse" width="400" height="400" loading="lazy"
                                    class="w-full h-full object-cover"></a><span
                                class="absolute left-2.5 top-2.5 z-10 bg-[#e5383b] text-white text-[11px] font-semibold px-2 py-0.5 rounded-md">-31%</span>
                            <button
                                class="wish absolute right-2.5 top-2.5 z-10 w-8 h-8 rounded-full bg-white/90 grid place-items-center text-slate-500 hover:text-[#e5383b]"
                                aria-label="Add to wishlist"><svg class="w-4 h-4" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <path
                                        d="M19 14c1.49-1.46 3-3.21 3-5.5A5.5 5.5 0 0 0 16.5 3c-1.76 0-3 .5-4.5 2-1.5-1.5-2.74-2-4.5-2A5.5 5.5 0 0 0 2 8.5c0 2.3 1.5 4.05 3 5.5l7 7Z" />
                                </svg></button>
                        </div>
                        <div class="p-3.5 flex flex-col flex-1">
                            <p class="text-[11px] text-slate-400 mb-1">Electronics</p>
                            <h3 class="text-[13px] font-medium text-slate-800 leading-snug min-h-[2.4em]"><a
                                    href="product.html" class="hover:text-brand-600">Wireless Gaming Mouse</a>
                            </h3>
                            <div class="mt-1.5 flex items-baseline gap-2"><span
                                    class="font-bold text-brand-700">৳899</span><span
                                    class="text-xs text-slate-400 line-through">৳1,299</span></div>
                            <div class="mt-1 flex items-center gap-1.5 text-[11px] text-slate-500"><span
                                    class="inline-flex text-star"><svg class="w-3.5 h-3.5" viewBox="0 0 24 24"
                                        fill="none" stroke="currentColor" stroke-width="1.8"
                                        stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                                        <polygon
                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                            fill="currentColor" />
                                    </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                        stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                        stroke-linejoin="round" aria-hidden="true">
                                        <polygon
                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                            fill="currentColor" />
                                    </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                        stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                        stroke-linejoin="round" aria-hidden="true">
                                        <polygon
                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                            fill="currentColor" />
                                    </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                        stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                        stroke-linejoin="round" aria-hidden="true">
                                        <polygon
                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                            fill="currentColor" />
                                    </svg></span><b class="text-slate-700">4.5</b>(76)</div>
                            <button data-add data-id="12" data-name="Wireless Gaming Mouse" data-price="899"
                                data-emoji="🖱️" data-c1="#e6eef9" data-c2="#d3e0f4"
                                class="btn btn-primary btn-sm w-full mt-3"><svg class="w-3.5 h-3.5"
                                    viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"
                                    stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                                    <path d="M6 2 3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4Z" />
                                    <path d="M3 6h18" />
                                    <path d="M16 10a4 4 0 0 1-8 0" />
                                </svg> Add to Cart</button>
                        </div>
                    </article>
                    <article class="card pcard overflow-hidden flex flex-col ">
                        <div class="relative pimg aspect-square overflow-hidden bg-slate-100"><a href="product.html"
                                class="block w-full h-full"><img src="https://placehold.co/400x400"
                                    alt="Power Bank 20000mAh" width="400" height="400" loading="lazy"
                                    class="w-full h-full object-cover"></a><span
                                class="absolute left-2.5 top-2.5 z-10 bg-[#e5383b] text-white text-[11px] font-semibold px-2 py-0.5 rounded-md">-26%</span>
                            <button
                                class="wish absolute right-2.5 top-2.5 z-10 w-8 h-8 rounded-full bg-white/90 grid place-items-center text-slate-500 hover:text-[#e5383b]"
                                aria-label="Add to wishlist"><svg class="w-4 h-4" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <path
                                        d="M19 14c1.49-1.46 3-3.21 3-5.5A5.5 5.5 0 0 0 16.5 3c-1.76 0-3 .5-4.5 2-1.5-1.5-2.74-2-4.5-2A5.5 5.5 0 0 0 2 8.5c0 2.3 1.5 4.05 3 5.5l7 7Z" />
                                </svg></button>
                        </div>
                        <div class="p-3.5 flex flex-col flex-1">
                            <p class="text-[11px] text-slate-400 mb-1">Electronics</p>
                            <h3 class="text-[13px] font-medium text-slate-800 leading-snug min-h-[2.4em]"><a
                                    href="product.html" class="hover:text-brand-600">Power Bank 20000mAh</a>
                            </h3>
                            <div class="mt-1.5 flex items-baseline gap-2"><span
                                    class="font-bold text-brand-700">৳1,699</span><span
                                    class="text-xs text-slate-400 line-through">৳2,299</span></div>
                            <div class="mt-1 flex items-center gap-1.5 text-[11px] text-slate-500"><span
                                    class="inline-flex text-star"><svg class="w-3.5 h-3.5" viewBox="0 0 24 24"
                                        fill="none" stroke="currentColor" stroke-width="1.8"
                                        stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                                        <polygon
                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                            fill="currentColor" />
                                    </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                        stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                        stroke-linejoin="round" aria-hidden="true">
                                        <polygon
                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                            fill="currentColor" />
                                    </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                        stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                        stroke-linejoin="round" aria-hidden="true">
                                        <polygon
                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                            fill="currentColor" />
                                    </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                        stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                        stroke-linejoin="round" aria-hidden="true">
                                        <polygon
                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                            fill="currentColor" />
                                    </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                        stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                        stroke-linejoin="round" aria-hidden="true">
                                        <polygon
                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                            fill="currentColor" />
                                    </svg></span><b class="text-slate-700">4.6</b>(142)</div>
                            <button data-add data-id="13" data-name="Power Bank 20000mAh" data-price="1699"
                                data-emoji="🔋" data-c1="#e4f4ef" data-c2="#cde9e0"
                                class="btn btn-primary btn-sm w-full mt-3"><svg class="w-3.5 h-3.5"
                                    viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"
                                    stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                                    <path d="M6 2 3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4Z" />
                                    <path d="M3 6h18" />
                                    <path d="M16 10a4 4 0 0 1-8 0" />
                                </svg> Add to Cart</button>
                        </div>
                    </article>
                    <article class="card pcard overflow-hidden flex flex-col ">
                        <div class="relative pimg aspect-square overflow-hidden bg-slate-100"><a href="product.html"
                                class="block w-full h-full"><img src="https://placehold.co/400x400"
                                    alt="Mechanical Keyboard" width="400" height="400" loading="lazy"
                                    class="w-full h-full object-cover"></a><span
                                class="absolute left-2.5 top-2.5 z-10 bg-[#e5383b] text-white text-[11px] font-semibold px-2 py-0.5 rounded-md">-25%</span>
                            <button
                                class="wish absolute right-2.5 top-2.5 z-10 w-8 h-8 rounded-full bg-white/90 grid place-items-center text-slate-500 hover:text-[#e5383b]"
                                aria-label="Add to wishlist"><svg class="w-4 h-4" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <path
                                        d="M19 14c1.49-1.46 3-3.21 3-5.5A5.5 5.5 0 0 0 16.5 3c-1.76 0-3 .5-4.5 2-1.5-1.5-2.74-2-4.5-2A5.5 5.5 0 0 0 2 8.5c0 2.3 1.5 4.05 3 5.5l7 7Z" />
                                </svg></button>
                        </div>
                        <div class="p-3.5 flex flex-col flex-1">
                            <p class="text-[11px] text-slate-400 mb-1">Electronics</p>
                            <h3 class="text-[13px] font-medium text-slate-800 leading-snug min-h-[2.4em]"><a
                                    href="product.html" class="hover:text-brand-600">Mechanical Keyboard</a>
                            </h3>
                            <div class="mt-1.5 flex items-baseline gap-2"><span
                                    class="font-bold text-brand-700">৳2,399</span><span
                                    class="text-xs text-slate-400 line-through">৳3,199</span></div>
                            <div class="mt-1 flex items-center gap-1.5 text-[11px] text-slate-500"><span
                                    class="inline-flex text-star"><svg class="w-3.5 h-3.5" viewBox="0 0 24 24"
                                        fill="none" stroke="currentColor" stroke-width="1.8"
                                        stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                                        <polygon
                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                            fill="currentColor" />
                                    </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                        stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                        stroke-linejoin="round" aria-hidden="true">
                                        <polygon
                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                            fill="currentColor" />
                                    </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                        stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                        stroke-linejoin="round" aria-hidden="true">
                                        <polygon
                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                            fill="currentColor" />
                                    </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                        stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                        stroke-linejoin="round" aria-hidden="true">
                                        <polygon
                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                            fill="currentColor" />
                                    </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                        stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                        stroke-linejoin="round" aria-hidden="true">
                                        <polygon
                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                            fill="currentColor" />
                                    </svg></span><b class="text-slate-700">4.7</b>(91)</div>
                            <button data-add data-id="22" data-name="Mechanical Keyboard" data-price="2399"
                                data-emoji="⌨️" data-c1="#efe9f8" data-c2="#ddd2f0"
                                class="btn btn-primary btn-sm w-full mt-3"><svg class="w-3.5 h-3.5"
                                    viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"
                                    stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                                    <path d="M6 2 3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4Z" />
                                    <path d="M3 6h18" />
                                    <path d="M16 10a4 4 0 0 1-8 0" />
                                </svg> Add to Cart</button>
                        </div>
                    </article>
                    <article class="card pcard overflow-hidden flex flex-col ">
                        <div class="relative pimg aspect-square overflow-hidden bg-slate-100"><a href="product.html"
                                class="block w-full h-full"><img src="https://placehold.co/400x400"
                                    alt="4K Action Camera" width="400" height="400" loading="lazy"
                                    class="w-full h-full object-cover"></a><span
                                class="absolute left-2.5 top-2.5 z-10 bg-[#e5383b] text-white text-[11px] font-semibold px-2 py-0.5 rounded-md">-27%</span>
                            <button
                                class="wish absolute right-2.5 top-2.5 z-10 w-8 h-8 rounded-full bg-white/90 grid place-items-center text-slate-500 hover:text-[#e5383b]"
                                aria-label="Add to wishlist"><svg class="w-4 h-4" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <path
                                        d="M19 14c1.49-1.46 3-3.21 3-5.5A5.5 5.5 0 0 0 16.5 3c-1.76 0-3 .5-4.5 2-1.5-1.5-2.74-2-4.5-2A5.5 5.5 0 0 0 2 8.5c0 2.3 1.5 4.05 3 5.5l7 7Z" />
                                </svg></button>
                        </div>
                        <div class="p-3.5 flex flex-col flex-1">
                            <p class="text-[11px] text-slate-400 mb-1">Electronics</p>
                            <h3 class="text-[13px] font-medium text-slate-800 leading-snug min-h-[2.4em]"><a
                                    href="product.html" class="hover:text-brand-600">4K Action Camera</a></h3>
                            <div class="mt-1.5 flex items-baseline gap-2"><span
                                    class="font-bold text-brand-700">৳5,499</span><span
                                    class="text-xs text-slate-400 line-through">৳7,499</span></div>
                            <div class="mt-1 flex items-center gap-1.5 text-[11px] text-slate-500"><span
                                    class="inline-flex text-star"><svg class="w-3.5 h-3.5" viewBox="0 0 24 24"
                                        fill="none" stroke="currentColor" stroke-width="1.8"
                                        stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                                        <polygon
                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                            fill="currentColor" />
                                    </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                        stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                        stroke-linejoin="round" aria-hidden="true">
                                        <polygon
                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                            fill="currentColor" />
                                    </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                        stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                        stroke-linejoin="round" aria-hidden="true">
                                        <polygon
                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                            fill="currentColor" />
                                    </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                        stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                        stroke-linejoin="round" aria-hidden="true">
                                        <polygon
                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                            fill="currentColor" />
                                    </svg></span><b class="text-slate-700">4.4</b>(47)</div>
                            <button data-add data-id="23" data-name="4K Action Camera" data-price="5499"
                                data-emoji="📷" data-c1="#e4f4ef" data-c2="#cde9e0"
                                class="btn btn-primary btn-sm w-full mt-3"><svg class="w-3.5 h-3.5"
                                    viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"
                                    stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                                    <path d="M6 2 3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4Z" />
                                    <path d="M3 6h18" />
                                    <path d="M16 10a4 4 0 0 1-8 0" />
                                </svg> Add to Cart</button>
                        </div>
                    </article>
                    <article class="card pcard overflow-hidden flex flex-col ">
                        <div class="relative pimg aspect-square overflow-hidden bg-slate-100"><a href="product.html"
                                class="block w-full h-full"><img src="https://placehold.co/400x400"
                                    alt="Smart LED TV 32 inch" width="400" height="400" loading="lazy"
                                    class="w-full h-full object-cover"></a><span
                                class="absolute left-2.5 top-2.5 z-10 bg-[#e5383b] text-white text-[11px] font-semibold px-2 py-0.5 rounded-md">-20%</span>
                            <button
                                class="wish absolute right-2.5 top-2.5 z-10 w-8 h-8 rounded-full bg-white/90 grid place-items-center text-slate-500 hover:text-[#e5383b]"
                                aria-label="Add to wishlist"><svg class="w-4 h-4" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <path
                                        d="M19 14c1.49-1.46 3-3.21 3-5.5A5.5 5.5 0 0 0 16.5 3c-1.76 0-3 .5-4.5 2-1.5-1.5-2.74-2-4.5-2A5.5 5.5 0 0 0 2 8.5c0 2.3 1.5 4.05 3 5.5l7 7Z" />
                                </svg></button>
                        </div>
                        <div class="p-3.5 flex flex-col flex-1">
                            <p class="text-[11px] text-slate-400 mb-1">Electronics</p>
                            <h3 class="text-[13px] font-medium text-slate-800 leading-snug min-h-[2.4em]"><a
                                    href="product.html" class="hover:text-brand-600">Smart LED TV 32 inch</a>
                            </h3>
                            <div class="mt-1.5 flex items-baseline gap-2"><span
                                    class="font-bold text-brand-700">৳15,990</span><span
                                    class="text-xs text-slate-400 line-through">৳19,990</span></div>
                            <div class="mt-1 flex items-center gap-1.5 text-[11px] text-slate-500"><span
                                    class="inline-flex text-star"><svg class="w-3.5 h-3.5" viewBox="0 0 24 24"
                                        fill="none" stroke="currentColor" stroke-width="1.8"
                                        stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                                        <polygon
                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                            fill="currentColor" />
                                    </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                        stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                        stroke-linejoin="round" aria-hidden="true">
                                        <polygon
                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                            fill="currentColor" />
                                    </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                        stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                        stroke-linejoin="round" aria-hidden="true">
                                        <polygon
                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                            fill="currentColor" />
                                    </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                        stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                        stroke-linejoin="round" aria-hidden="true">
                                        <polygon
                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                            fill="currentColor" />
                                    </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                        stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                        stroke-linejoin="round" aria-hidden="true">
                                        <polygon
                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                            fill="currentColor" />
                                    </svg></span><b class="text-slate-700">4.6</b>(63)</div>
                            <button data-add data-id="24" data-name="Smart LED TV 32 inch" data-price="15990"
                                data-emoji="📺" data-c1="#eceff1" data-c2="#dde2e5"
                                class="btn btn-primary btn-sm w-full mt-3"><svg class="w-3.5 h-3.5"
                                    viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"
                                    stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                                    <path d="M6 2 3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4Z" />
                                    <path d="M3 6h18" />
                                    <path d="M16 10a4 4 0 0 1-8 0" />
                                </svg> Add to Cart</button>
                        </div>
                    </article>
                </div>
            </div>
        </div>
    </section>
    <section class="container-fluid mt-14" aria-labelledby="cs-Home">
        <div class="grid gap-5 lg:grid-cols-[290px_1fr]">
            <div class="relative overflow-hidden rounded-2xl p-6 flex flex-col text-slate-900"
                style="background:linear-gradient(160deg,#fbeedd,#f1d6b0)">
                <h3 class="text-2xl font-bold">Home & Living</h3>
                <p class="text-sm mt-1 text-slate-600">Comfort for every room</p>
                <div class="mt-4 lg:mt-5 flex flex-wrap gap-2 lg:block lg:space-y-2"><a href="shop.html"
                        class="flex items-center justify-between gap-2 rounded-xl px-3 lg:px-4 py-1.5 lg:py-2.5 text-[13px] font-medium transition lg:w-auto bg-white/70 hover:bg-white">Kitchen<span
                            class="hidden lg:inline text-[11px] opacity-70">180+</span></a><a href="shop.html"
                        class="flex items-center justify-between gap-2 rounded-xl px-3 lg:px-4 py-1.5 lg:py-2.5 text-[13px] font-medium transition lg:w-auto bg-white/70 hover:bg-white">Furniture<span
                            class="hidden lg:inline text-[11px] opacity-70">75+</span></a><a href="shop.html"
                        class="flex items-center justify-between gap-2 rounded-xl px-3 lg:px-4 py-1.5 lg:py-2.5 text-[13px] font-medium transition lg:w-auto bg-white/70 hover:bg-white">Decor
                        & Lighting<span class="hidden lg:inline text-[11px] opacity-70">130+</span></a><a
                        href="shop.html"
                        class="flex items-center justify-between gap-2 rounded-xl px-3 lg:px-4 py-1.5 lg:py-2.5 text-[13px] font-medium transition lg:w-auto bg-white/70 hover:bg-white">Bedding<span
                            class="hidden lg:inline text-[11px] opacity-70">90+</span></a></div>
                <div class="hidden lg:grid flex-1 min-h-[120px] place-items-center text-[6.5rem] leading-none select-none"
                    aria-hidden="true" style="filter:drop-shadow(0 16px 16px rgba(0,0,0,.2))">🛋️</div>
                <a href="shop.html" class="btn btn-dark self-start mt-5 lg:mt-0">Shop Home & Living <svg
                        class="w-4 h-4" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                        stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                        <path d="M5 12h14" />
                        <path d="m12 5 7 7-7 7" />
                    </svg></a>
            </div>
            <div>
                <div class="flex items-center justify-between mb-4">
                    <h2 id="cs-Home" class="section-title">Popular in Home & Living</h2><a href="shop.html"
                        class="text-sm font-medium text-brand-600 hover:text-brand-800 inline-flex items-center gap-1.5">View
                        all
                        <svg class="w-4 h-4" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                            stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                            <path d="M5 12h14" />
                            <path d="m12 5 7 7-7 7" />
                        </svg></a>
                </div>
                <div class="cat-grid grid grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-4">
                    <article class="card pcard overflow-hidden flex flex-col ">
                        <div class="relative pimg aspect-square overflow-hidden bg-slate-100"><a href="product.html"
                                class="block w-full h-full"><img src="https://placehold.co/400x400"
                                    alt="Digital Air Fryer 6L" width="400" height="400" loading="lazy"
                                    class="w-full h-full object-cover"></a><span
                                class="absolute left-2.5 top-2.5 z-10 bg-[#e5383b] text-white text-[11px] font-semibold px-2 py-0.5 rounded-md">-29%</span>
                            <button
                                class="wish absolute right-2.5 top-2.5 z-10 w-8 h-8 rounded-full bg-white/90 grid place-items-center text-slate-500 hover:text-[#e5383b]"
                                aria-label="Add to wishlist"><svg class="w-4 h-4" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <path
                                        d="M19 14c1.49-1.46 3-3.21 3-5.5A5.5 5.5 0 0 0 16.5 3c-1.76 0-3 .5-4.5 2-1.5-1.5-2.74-2-4.5-2A5.5 5.5 0 0 0 2 8.5c0 2.3 1.5 4.05 3 5.5l7 7Z" />
                                </svg></button>
                        </div>
                        <div class="p-3.5 flex flex-col flex-1">
                            <p class="text-[11px] text-slate-400 mb-1">Home & Living</p>
                            <h3 class="text-[13px] font-medium text-slate-800 leading-snug min-h-[2.4em]"><a
                                    href="product.html" class="hover:text-brand-600">Digital Air Fryer 6L</a>
                            </h3>
                            <div class="mt-1.5 flex items-baseline gap-2"><span
                                    class="font-bold text-brand-700">৳4,999</span><span
                                    class="text-xs text-slate-400 line-through">৳6,999</span></div>
                            <div class="mt-1 flex items-center gap-1.5 text-[11px] text-slate-500"><span
                                    class="inline-flex text-star"><svg class="w-3.5 h-3.5" viewBox="0 0 24 24"
                                        fill="none" stroke="currentColor" stroke-width="1.8"
                                        stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                                        <polygon
                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                            fill="currentColor" />
                                    </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                        stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                        stroke-linejoin="round" aria-hidden="true">
                                        <polygon
                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                            fill="currentColor" />
                                    </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                        stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                        stroke-linejoin="round" aria-hidden="true">
                                        <polygon
                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                            fill="currentColor" />
                                    </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                        stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                        stroke-linejoin="round" aria-hidden="true">
                                        <polygon
                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                            fill="currentColor" />
                                    </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                        stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                        stroke-linejoin="round" aria-hidden="true">
                                        <polygon
                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                            fill="currentColor" />
                                    </svg></span><b class="text-slate-700">4.8</b>(95)</div>
                            <button data-add data-id="3" data-name="Digital Air Fryer 6L" data-price="4999"
                                data-emoji="🍳" data-c1="#fdeee3" data-c2="#f9dcc6"
                                class="btn btn-primary btn-sm w-full mt-3"><svg class="w-3.5 h-3.5"
                                    viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"
                                    stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                                    <path d="M6 2 3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4Z" />
                                    <path d="M3 6h18" />
                                    <path d="M16 10a4 4 0 0 1-8 0" />
                                </svg> Add to Cart</button>
                        </div>
                    </article>
                    <article class="card pcard overflow-hidden flex flex-col ">
                        <div class="relative pimg aspect-square overflow-hidden bg-slate-100"><a href="product.html"
                                class="block w-full h-full"><img src="https://placehold.co/400x400"
                                    alt="Portable Juicer Blender" width="400" height="400" loading="lazy"
                                    class="w-full h-full object-cover"></a><span
                                class="absolute left-2.5 top-2.5 z-10 bg-[#e5383b] text-white text-[11px] font-semibold px-2 py-0.5 rounded-md">-30%</span>
                            <button
                                class="wish absolute right-2.5 top-2.5 z-10 w-8 h-8 rounded-full bg-white/90 grid place-items-center text-slate-500 hover:text-[#e5383b]"
                                aria-label="Add to wishlist"><svg class="w-4 h-4" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <path
                                        d="M19 14c1.49-1.46 3-3.21 3-5.5A5.5 5.5 0 0 0 16.5 3c-1.76 0-3 .5-4.5 2-1.5-1.5-2.74-2-4.5-2A5.5 5.5 0 0 0 2 8.5c0 2.3 1.5 4.05 3 5.5l7 7Z" />
                                </svg></button>
                        </div>
                        <div class="p-3.5 flex flex-col flex-1">
                            <p class="text-[11px] text-slate-400 mb-1">Home & Living</p>
                            <h3 class="text-[13px] font-medium text-slate-800 leading-snug min-h-[2.4em]"><a
                                    href="product.html" class="hover:text-brand-600">Portable Juicer Blender</a>
                            </h3>
                            <div class="mt-1.5 flex items-baseline gap-2"><span
                                    class="font-bold text-brand-700">৳1,399</span><span
                                    class="text-xs text-slate-400 line-through">৳1,999</span></div>
                            <div class="mt-1 flex items-center gap-1.5 text-[11px] text-slate-500"><span
                                    class="inline-flex text-star"><svg class="w-3.5 h-3.5" viewBox="0 0 24 24"
                                        fill="none" stroke="currentColor" stroke-width="1.8"
                                        stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                                        <polygon
                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                            fill="currentColor" />
                                    </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                        stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                        stroke-linejoin="round" aria-hidden="true">
                                        <polygon
                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                            fill="currentColor" />
                                    </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                        stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                        stroke-linejoin="round" aria-hidden="true">
                                        <polygon
                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                            fill="currentColor" />
                                    </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                        stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                        stroke-linejoin="round" aria-hidden="true">
                                        <polygon
                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                            fill="currentColor" />
                                    </svg></span><b class="text-slate-700">4.5</b>(190)</div>
                            <button data-add data-id="9" data-name="Portable Juicer Blender" data-price="1399"
                                data-emoji="🥤" data-c1="#e3f1e5" data-c2="#cfe6d3"
                                class="btn btn-primary btn-sm w-full mt-3"><svg class="w-3.5 h-3.5"
                                    viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"
                                    stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                                    <path d="M6 2 3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4Z" />
                                    <path d="M3 6h18" />
                                    <path d="M16 10a4 4 0 0 1-8 0" />
                                </svg> Add to Cart</button>
                        </div>
                    </article>
                    <article class="card pcard overflow-hidden flex flex-col ">
                        <div class="relative pimg aspect-square overflow-hidden bg-slate-100"><a href="product.html"
                                class="block w-full h-full"><img src="https://placehold.co/400x400"
                                    alt="LED Desk Lamp" width="400" height="400" loading="lazy"
                                    class="w-full h-full object-cover"></a><span
                                class="absolute left-2.5 top-2.5 z-10 bg-[#e5383b] text-white text-[11px] font-semibold px-2 py-0.5 rounded-md">-32%</span>
                            <button
                                class="wish absolute right-2.5 top-2.5 z-10 w-8 h-8 rounded-full bg-white/90 grid place-items-center text-slate-500 hover:text-[#e5383b]"
                                aria-label="Add to wishlist"><svg class="w-4 h-4" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <path
                                        d="M19 14c1.49-1.46 3-3.21 3-5.5A5.5 5.5 0 0 0 16.5 3c-1.76 0-3 .5-4.5 2-1.5-1.5-2.74-2-4.5-2A5.5 5.5 0 0 0 2 8.5c0 2.3 1.5 4.05 3 5.5l7 7Z" />
                                </svg></button>
                        </div>
                        <div class="p-3.5 flex flex-col flex-1">
                            <p class="text-[11px] text-slate-400 mb-1">Home & Living</p>
                            <h3 class="text-[13px] font-medium text-slate-800 leading-snug min-h-[2.4em]"><a
                                    href="product.html" class="hover:text-brand-600">LED Desk Lamp</a></h3>
                            <div class="mt-1.5 flex items-baseline gap-2"><span
                                    class="font-bold text-brand-700">৳749</span><span
                                    class="text-xs text-slate-400 line-through">৳1,099</span></div>
                            <div class="mt-1 flex items-center gap-1.5 text-[11px] text-slate-500"><span
                                    class="inline-flex text-star"><svg class="w-3.5 h-3.5" viewBox="0 0 24 24"
                                        fill="none" stroke="currentColor" stroke-width="1.8"
                                        stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                                        <polygon
                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                            fill="currentColor" />
                                    </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                        stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                        stroke-linejoin="round" aria-hidden="true">
                                        <polygon
                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                            fill="currentColor" />
                                    </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                        stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                        stroke-linejoin="round" aria-hidden="true">
                                        <polygon
                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                            fill="currentColor" />
                                    </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                        stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                        stroke-linejoin="round" aria-hidden="true">
                                        <polygon
                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                            fill="currentColor" />
                                    </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                        stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                        stroke-linejoin="round" aria-hidden="true">
                                        <polygon
                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                            fill="currentColor" />
                                    </svg></span><b class="text-slate-700">4.6</b>(64)</div>
                            <button data-add data-id="16" data-name="LED Desk Lamp" data-price="749"
                                data-emoji="💡" data-c1="#f6efe4" data-c2="#ecdfc9"
                                class="btn btn-primary btn-sm w-full mt-3"><svg class="w-3.5 h-3.5"
                                    viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"
                                    stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                                    <path d="M6 2 3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4Z" />
                                    <path d="M3 6h18" />
                                    <path d="M16 10a4 4 0 0 1-8 0" />
                                </svg> Add to Cart</button>
                        </div>
                    </article>
                    <article class="card pcard overflow-hidden flex flex-col ">
                        <div class="relative pimg aspect-square overflow-hidden bg-slate-100"><a href="product.html"
                                class="block w-full h-full"><img src="https://placehold.co/400x400"
                                    alt="Ceramic Dinner Set 12pcs" width="400" height="400" loading="lazy"
                                    class="w-full h-full object-cover"></a><span
                                class="absolute left-2.5 top-2.5 z-10 bg-[#e5383b] text-white text-[11px] font-semibold px-2 py-0.5 rounded-md">-25%</span>
                            <button
                                class="wish absolute right-2.5 top-2.5 z-10 w-8 h-8 rounded-full bg-white/90 grid place-items-center text-slate-500 hover:text-[#e5383b]"
                                aria-label="Add to wishlist"><svg class="w-4 h-4" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <path
                                        d="M19 14c1.49-1.46 3-3.21 3-5.5A5.5 5.5 0 0 0 16.5 3c-1.76 0-3 .5-4.5 2-1.5-1.5-2.74-2-4.5-2A5.5 5.5 0 0 0 2 8.5c0 2.3 1.5 4.05 3 5.5l7 7Z" />
                                </svg></button>
                        </div>
                        <div class="p-3.5 flex flex-col flex-1">
                            <p class="text-[11px] text-slate-400 mb-1">Home & Living</p>
                            <h3 class="text-[13px] font-medium text-slate-800 leading-snug min-h-[2.4em]"><a
                                    href="product.html" class="hover:text-brand-600">Ceramic Dinner Set
                                    12pcs</a></h3>
                            <div class="mt-1.5 flex items-baseline gap-2"><span
                                    class="font-bold text-brand-700">৳2,999</span><span
                                    class="text-xs text-slate-400 line-through">৳3,999</span></div>
                            <div class="mt-1 flex items-center gap-1.5 text-[11px] text-slate-500"><span
                                    class="inline-flex text-star"><svg class="w-3.5 h-3.5" viewBox="0 0 24 24"
                                        fill="none" stroke="currentColor" stroke-width="1.8"
                                        stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                                        <polygon
                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                            fill="currentColor" />
                                    </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                        stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                        stroke-linejoin="round" aria-hidden="true">
                                        <polygon
                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                            fill="currentColor" />
                                    </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                        stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                        stroke-linejoin="round" aria-hidden="true">
                                        <polygon
                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                            fill="currentColor" />
                                    </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                        stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                        stroke-linejoin="round" aria-hidden="true">
                                        <polygon
                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                            fill="currentColor" />
                                    </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                        stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                        stroke-linejoin="round" aria-hidden="true">
                                        <polygon
                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                            fill="currentColor" />
                                    </svg></span><b class="text-slate-700">4.8</b>(57)</div>
                            <button data-add data-id="17" data-name="Ceramic Dinner Set 12pcs" data-price="2999"
                                data-emoji="🍽️" data-c1="#eceff1" data-c2="#dde2e5"
                                class="btn btn-primary btn-sm w-full mt-3"><svg class="w-3.5 h-3.5"
                                    viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"
                                    stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                                    <path d="M6 2 3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4Z" />
                                    <path d="M3 6h18" />
                                    <path d="M16 10a4 4 0 0 1-8 0" />
                                </svg> Add to Cart</button>
                        </div>
                    </article>
                    <article class="card pcard overflow-hidden flex flex-col ">
                        <div class="relative pimg aspect-square overflow-hidden bg-slate-100"><a href="product.html"
                                class="block w-full h-full"><img src="https://placehold.co/400x400"
                                    alt="Memory Foam Pillow" width="400" height="400" loading="lazy"
                                    class="w-full h-full object-cover"></a><span
                                class="absolute left-2.5 top-2.5 z-10 bg-[#e5383b] text-white text-[11px] font-semibold px-2 py-0.5 rounded-md">-31%</span>
                            <button
                                class="wish absolute right-2.5 top-2.5 z-10 w-8 h-8 rounded-full bg-white/90 grid place-items-center text-slate-500 hover:text-[#e5383b]"
                                aria-label="Add to wishlist"><svg class="w-4 h-4" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <path
                                        d="M19 14c1.49-1.46 3-3.21 3-5.5A5.5 5.5 0 0 0 16.5 3c-1.76 0-3 .5-4.5 2-1.5-1.5-2.74-2-4.5-2A5.5 5.5 0 0 0 2 8.5c0 2.3 1.5 4.05 3 5.5l7 7Z" />
                                </svg></button>
                        </div>
                        <div class="p-3.5 flex flex-col flex-1">
                            <p class="text-[11px] text-slate-400 mb-1">Home & Living</p>
                            <h3 class="text-[13px] font-medium text-slate-800 leading-snug min-h-[2.4em]"><a
                                    href="product.html" class="hover:text-brand-600">Memory Foam Pillow</a></h3>
                            <div class="mt-1.5 flex items-baseline gap-2"><span
                                    class="font-bold text-brand-700">৳899</span><span
                                    class="text-xs text-slate-400 line-through">৳1,299</span></div>
                            <div class="mt-1 flex items-center gap-1.5 text-[11px] text-slate-500"><span
                                    class="inline-flex text-star"><svg class="w-3.5 h-3.5" viewBox="0 0 24 24"
                                        fill="none" stroke="currentColor" stroke-width="1.8"
                                        stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                                        <polygon
                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                            fill="currentColor" />
                                    </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                        stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                        stroke-linejoin="round" aria-hidden="true">
                                        <polygon
                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                            fill="currentColor" />
                                    </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                        stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                        stroke-linejoin="round" aria-hidden="true">
                                        <polygon
                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                            fill="currentColor" />
                                    </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                        stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                        stroke-linejoin="round" aria-hidden="true">
                                        <polygon
                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                            fill="currentColor" />
                                    </svg></span><b class="text-slate-700">4.5</b>(83)</div>
                            <button data-add data-id="18" data-name="Memory Foam Pillow" data-price="899"
                                data-emoji="🛏️" data-c1="#efe9f8" data-c2="#ddd2f0"
                                class="btn btn-primary btn-sm w-full mt-3"><svg class="w-3.5 h-3.5"
                                    viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"
                                    stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                                    <path d="M6 2 3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4Z" />
                                    <path d="M3 6h18" />
                                    <path d="M16 10a4 4 0 0 1-8 0" />
                                </svg> Add to Cart</button>
                        </div>
                    </article>
                    <article class="card pcard overflow-hidden flex flex-col ">
                        <div class="relative pimg aspect-square overflow-hidden bg-slate-100"><a href="product.html"
                                class="block w-full h-full"><img src="https://placehold.co/400x400"
                                    alt="Non-stick Cookware Set" width="400" height="400" loading="lazy"
                                    class="w-full h-full object-cover"></a><span
                                class="absolute left-2.5 top-2.5 z-10 bg-[#e5383b] text-white text-[11px] font-semibold px-2 py-0.5 rounded-md">-27%</span>
                            <button
                                class="wish absolute right-2.5 top-2.5 z-10 w-8 h-8 rounded-full bg-white/90 grid place-items-center text-slate-500 hover:text-[#e5383b]"
                                aria-label="Add to wishlist"><svg class="w-4 h-4" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <path
                                        d="M19 14c1.49-1.46 3-3.21 3-5.5A5.5 5.5 0 0 0 16.5 3c-1.76 0-3 .5-4.5 2-1.5-1.5-2.74-2-4.5-2A5.5 5.5 0 0 0 2 8.5c0 2.3 1.5 4.05 3 5.5l7 7Z" />
                                </svg></button>
                        </div>
                        <div class="p-3.5 flex flex-col flex-1">
                            <p class="text-[11px] text-slate-400 mb-1">Home & Living</p>
                            <h3 class="text-[13px] font-medium text-slate-800 leading-snug min-h-[2.4em]"><a
                                    href="product.html" class="hover:text-brand-600">Non-stick Cookware Set</a>
                            </h3>
                            <div class="mt-1.5 flex items-baseline gap-2"><span
                                    class="font-bold text-brand-700">৳2,199</span><span
                                    class="text-xs text-slate-400 line-through">৳2,999</span></div>
                            <div class="mt-1 flex items-center gap-1.5 text-[11px] text-slate-500"><span
                                    class="inline-flex text-star"><svg class="w-3.5 h-3.5" viewBox="0 0 24 24"
                                        fill="none" stroke="currentColor" stroke-width="1.8"
                                        stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                                        <polygon
                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                            fill="currentColor" />
                                    </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                        stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                        stroke-linejoin="round" aria-hidden="true">
                                        <polygon
                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                            fill="currentColor" />
                                    </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                        stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                        stroke-linejoin="round" aria-hidden="true">
                                        <polygon
                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                            fill="currentColor" />
                                    </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                        stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                        stroke-linejoin="round" aria-hidden="true">
                                        <polygon
                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                            fill="currentColor" />
                                    </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                        stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                        stroke-linejoin="round" aria-hidden="true">
                                        <polygon
                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                            fill="currentColor" />
                                    </svg></span><b class="text-slate-700">4.7</b>(74)</div>
                            <button data-add data-id="25" data-name="Non-stick Cookware Set" data-price="2199"
                                data-emoji="🍲" data-c1="#fdeee3" data-c2="#f9dcc6"
                                class="btn btn-primary btn-sm w-full mt-3"><svg class="w-3.5 h-3.5"
                                    viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"
                                    stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                                    <path d="M6 2 3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4Z" />
                                    <path d="M3 6h18" />
                                    <path d="M16 10a4 4 0 0 1-8 0" />
                                </svg> Add to Cart</button>
                        </div>
                    </article>
                    <article class="card pcard overflow-hidden flex flex-col ">
                        <div class="relative pimg aspect-square overflow-hidden bg-slate-100"><a href="product.html"
                                class="block w-full h-full"><img src="https://placehold.co/400x400"
                                    alt="Rechargeable Table Fan" width="400" height="400" loading="lazy"
                                    class="w-full h-full object-cover"></a><span
                                class="absolute left-2.5 top-2.5 z-10 bg-[#e5383b] text-white text-[11px] font-semibold px-2 py-0.5 rounded-md">-26%</span>
                            <button
                                class="wish absolute right-2.5 top-2.5 z-10 w-8 h-8 rounded-full bg-white/90 grid place-items-center text-slate-500 hover:text-[#e5383b]"
                                aria-label="Add to wishlist"><svg class="w-4 h-4" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <path
                                        d="M19 14c1.49-1.46 3-3.21 3-5.5A5.5 5.5 0 0 0 16.5 3c-1.76 0-3 .5-4.5 2-1.5-1.5-2.74-2-4.5-2A5.5 5.5 0 0 0 2 8.5c0 2.3 1.5 4.05 3 5.5l7 7Z" />
                                </svg></button>
                        </div>
                        <div class="p-3.5 flex flex-col flex-1">
                            <p class="text-[11px] text-slate-400 mb-1">Home & Living</p>
                            <h3 class="text-[13px] font-medium text-slate-800 leading-snug min-h-[2.4em]"><a
                                    href="product.html" class="hover:text-brand-600">Rechargeable Table Fan</a>
                            </h3>
                            <div class="mt-1.5 flex items-baseline gap-2"><span
                                    class="font-bold text-brand-700">৳1,399</span><span
                                    class="text-xs text-slate-400 line-through">৳1,899</span></div>
                            <div class="mt-1 flex items-center gap-1.5 text-[11px] text-slate-500"><span
                                    class="inline-flex text-star"><svg class="w-3.5 h-3.5" viewBox="0 0 24 24"
                                        fill="none" stroke="currentColor" stroke-width="1.8"
                                        stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                                        <polygon
                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                            fill="currentColor" />
                                    </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                        stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                        stroke-linejoin="round" aria-hidden="true">
                                        <polygon
                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                            fill="currentColor" />
                                    </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                        stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                        stroke-linejoin="round" aria-hidden="true">
                                        <polygon
                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                            fill="currentColor" />
                                    </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                        stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                        stroke-linejoin="round" aria-hidden="true">
                                        <polygon
                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                            fill="currentColor" />
                                    </svg></span><b class="text-slate-700">4.5</b>(102)</div>
                            <button data-add data-id="26" data-name="Rechargeable Table Fan" data-price="1399"
                                data-emoji="🌬️" data-c1="#e4f4ef" data-c2="#cde9e0"
                                class="btn btn-primary btn-sm w-full mt-3"><svg class="w-3.5 h-3.5"
                                    viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"
                                    stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                                    <path d="M6 2 3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4Z" />
                                    <path d="M3 6h18" />
                                    <path d="M16 10a4 4 0 0 1-8 0" />
                                </svg> Add to Cart</button>
                        </div>
                    </article>
                    <article class="card pcard overflow-hidden flex flex-col ">
                        <div class="relative pimg aspect-square overflow-hidden bg-slate-100"><a href="product.html"
                                class="block w-full h-full"><img src="https://placehold.co/400x400"
                                    alt="Modern Wall Clock" width="400" height="400" loading="lazy"
                                    class="w-full h-full object-cover"></a><span
                                class="absolute left-2.5 top-2.5 z-10 bg-[#e5383b] text-white text-[11px] font-semibold px-2 py-0.5 rounded-md">-33%</span>
                            <button
                                class="wish absolute right-2.5 top-2.5 z-10 w-8 h-8 rounded-full bg-white/90 grid place-items-center text-slate-500 hover:text-[#e5383b]"
                                aria-label="Add to wishlist"><svg class="w-4 h-4" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                    stroke-linejoin="round" aria-hidden="true">
                                    <path
                                        d="M19 14c1.49-1.46 3-3.21 3-5.5A5.5 5.5 0 0 0 16.5 3c-1.76 0-3 .5-4.5 2-1.5-1.5-2.74-2-4.5-2A5.5 5.5 0 0 0 2 8.5c0 2.3 1.5 4.05 3 5.5l7 7Z" />
                                </svg></button>
                        </div>
                        <div class="p-3.5 flex flex-col flex-1">
                            <p class="text-[11px] text-slate-400 mb-1">Home & Living</p>
                            <h3 class="text-[13px] font-medium text-slate-800 leading-snug min-h-[2.4em]"><a
                                    href="product.html" class="hover:text-brand-600">Modern Wall Clock</a></h3>
                            <div class="mt-1.5 flex items-baseline gap-2"><span
                                    class="font-bold text-brand-700">৳799</span><span
                                    class="text-xs text-slate-400 line-through">৳1,199</span></div>
                            <div class="mt-1 flex items-center gap-1.5 text-[11px] text-slate-500"><span
                                    class="inline-flex text-star"><svg class="w-3.5 h-3.5" viewBox="0 0 24 24"
                                        fill="none" stroke="currentColor" stroke-width="1.8"
                                        stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                                        <polygon
                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                            fill="currentColor" />
                                    </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                        stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                        stroke-linejoin="round" aria-hidden="true">
                                        <polygon
                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                            fill="currentColor" />
                                    </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                        stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                        stroke-linejoin="round" aria-hidden="true">
                                        <polygon
                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                            fill="currentColor" />
                                    </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                        stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                        stroke-linejoin="round" aria-hidden="true">
                                        <polygon
                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                            fill="currentColor" />
                                    </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                        stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                        stroke-linejoin="round" aria-hidden="true">
                                        <polygon
                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                            fill="currentColor" />
                                    </svg></span><b class="text-slate-700">4.6</b>(58)</div>
                            <button data-add data-id="27" data-name="Modern Wall Clock" data-price="799"
                                data-emoji="🕰️" data-c1="#f6efe4" data-c2="#ecdfc9"
                                class="btn btn-primary btn-sm w-full mt-3"><svg class="w-3.5 h-3.5"
                                    viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"
                                    stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                                    <path d="M6 2 3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4Z" />
                                    <path d="M3 6h18" />
                                    <path d="M16 10a4 4 0 0 1-8 0" />
                                </svg> Add to Cart</button>
                        </div>
                    </article>
                </div>
            </div>
        </div>
    </section>

    <section class="container-fluid mt-16 text-center">
        <h2 class="section-title">Why Choose NexioMart?</h2>
        <p class="text-xs text-slate-500 mt-1">We are committed to giving you the best shopping experience.</p>
        <div class="mt-8 grid grid-cols-2 lg:grid-cols-4 gap-y-8 lg:divide-x divide-slate-200">
            <div class="flex flex-col items-center text-center px-4"><span
                    class="w-16 h-16 rounded-full bg-brand-50 text-brand-600 grid place-items-center mb-3"><svg
                        class="w-8 h-8" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                        stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                        <path d="M14 18V6a2 2 0 0 0-2-2H4a2 2 0 0 0-2 2v11a1 1 0 0 0 1 1h2" />
                        <path d="M15 18H9" />
                        <path d="M19 18h2a1 1 0 0 0 1-1v-3.65a1 1 0 0 0-.22-.624l-3.48-4.35A1 1 0 0 0 17.52 8H14" />
                        <circle cx="17" cy="18" r="2" />
                        <circle cx="7" cy="18" r="2" />
                    </svg></span>
                <h3 class="font-semibold text-slate-900 text-sm">Free Delivery</h3>
                <p class="text-xs text-slate-500 mt-1">All Over Bangladesh</p>
            </div>
            <div class="flex flex-col items-center text-center px-4"><span
                    class="w-16 h-16 rounded-full bg-brand-50 text-brand-600 grid place-items-center mb-3"><svg
                        class="w-8 h-8" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                        stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                        <path
                            d="M20 13c0 5-3.5 7.5-7.66 8.95a1 1 0 0 1-.67-.01C7.5 20.5 4 18 4 13V6a1 1 0 0 1 1-1c2 0 4.5-1.2 6.24-2.72a1.17 1.17 0 0 1 1.52 0C14.51 3.81 17 5 19 5a1 1 0 0 1 1 1z" />
                        <path d="m9 12 2 2 4-4" />
                    </svg></span>
                <h3 class="font-semibold text-slate-900 text-sm">Secure Payment</h3>
                <p class="text-xs text-slate-500 mt-1">100% Safe & Secure</p>
            </div>
            <div class="flex flex-col items-center text-center px-4"><span
                    class="w-16 h-16 rounded-full bg-brand-50 text-brand-600 grid place-items-center mb-3"><svg
                        class="w-8 h-8" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                        stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                        <path
                            d="M21 8a2 2 0 0 0-1-1.73l-7-4a2 2 0 0 0-2 0l-7 4A2 2 0 0 0 3 8v8a2 2 0 0 0 1 1.73l7 4a2 2 0 0 0 2 0l7-4A2 2 0 0 0 21 16Z" />
                        <path d="m3.3 7 8.7 5 8.7-5" />
                        <path d="M12 22V12" />
                    </svg></span>
                <h3 class="font-semibold text-slate-900 text-sm">Easy Return</h3>
                <p class="text-xs text-slate-500 mt-1">Within 7 Days</p>
            </div>
            <div class="flex flex-col items-center text-center px-4"><span
                    class="w-16 h-16 rounded-full bg-brand-50 text-brand-600 grid place-items-center mb-3"><svg
                        class="w-8 h-8" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                        stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                        <path
                            d="M3 11h3a2 2 0 0 1 2 2v3a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-5Zm0 0a9 9 0 1 1 18 0m0 0v5a2 2 0 0 1-2 2h-1a2 2 0 0 1-2-2v-3a2 2 0 0 1 2-2h3Z" />
                        <path d="M21 16v2a4 4 0 0 1-4 4h-5" />
                    </svg></span>
                <h3 class="font-semibold text-slate-900 text-sm">24/7 Support</h3>
                <p class="text-xs text-slate-500 mt-1">Always Here for You</p>
            </div>
        </div>
    </section>

    <section class="container-fluid mt-16">
        <div class="text-center mb-7">
            <h2 class="section-title">What Our Customers Say</h2>
            <p class="text-xs text-slate-500 mt-1">Real feedback from our valued customers</p>
        </div>
        <div class="grid md:grid-cols-3 gap-5">
            <figure class="card p-5">
                <div class="text-brand-600 text-4xl font-serif leading-none">“</div>
                <blockquote class="text-[13px] text-slate-600 leading-relaxed -mt-1">Amazing product quality and
                    very fast
                    delivery. Highly recommended!</blockquote>
                <figcaption class="flex items-center gap-3 mt-4"><span
                        class="w-11 h-11 rounded-full bg-brand-100 grid place-items-center text-xl">🧕</span><span><b
                            class="block text-sm text-slate-900">Sadia Islam</b><span class="text-star flex"><svg
                                class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"
                                aria-hidden="true">
                                <polygon
                                    points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                    fill="currentColor" />
                            </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"
                                aria-hidden="true">
                                <polygon
                                    points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                    fill="currentColor" />
                            </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"
                                aria-hidden="true">
                                <polygon
                                    points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                    fill="currentColor" />
                            </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"
                                aria-hidden="true">
                                <polygon
                                    points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                    fill="currentColor" />
                            </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"
                                aria-hidden="true">
                                <polygon
                                    points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                    fill="currentColor" />
                            </svg></span></span></figcaption>
            </figure>
            <figure class="card p-5">
                <div class="text-brand-600 text-4xl font-serif leading-none">“</div>
                <blockquote class="text-[13px] text-slate-600 leading-relaxed -mt-1">Best online shopping
                    experience. Customer
                    service is excellent.</blockquote>
                <figcaption class="flex items-center gap-3 mt-4"><span
                        class="w-11 h-11 rounded-full bg-brand-100 grid place-items-center text-xl">👨</span><span><b
                            class="block text-sm text-slate-900">Mahfuzur Rahman</b><span class="text-star flex"><svg
                                class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"
                                aria-hidden="true">
                                <polygon
                                    points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                    fill="currentColor" />
                            </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"
                                aria-hidden="true">
                                <polygon
                                    points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                    fill="currentColor" />
                            </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"
                                aria-hidden="true">
                                <polygon
                                    points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                    fill="currentColor" />
                            </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"
                                aria-hidden="true">
                                <polygon
                                    points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                    fill="currentColor" />
                            </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"
                                aria-hidden="true">
                                <polygon
                                    points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                    fill="currentColor" />
                            </svg></span></span></figcaption>
            </figure>
            <figure class="card p-5">
                <div class="text-brand-600 text-4xl font-serif leading-none">“</div>
                <blockquote class="text-[13px] text-slate-600 leading-relaxed -mt-1">Products are genuine and
                    exactly as
                    described. Will shop again!</blockquote>
                <figcaption class="flex items-center gap-3 mt-4"><span
                        class="w-11 h-11 rounded-full bg-brand-100 grid place-items-center text-xl">👩</span><span><b
                            class="block text-sm text-slate-900">Nusrat Jahan</b><span class="text-star flex"><svg
                                class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"
                                aria-hidden="true">
                                <polygon
                                    points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                    fill="currentColor" />
                            </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"
                                aria-hidden="true">
                                <polygon
                                    points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                    fill="currentColor" />
                            </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"
                                aria-hidden="true">
                                <polygon
                                    points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                    fill="currentColor" />
                            </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"
                                aria-hidden="true">
                                <polygon
                                    points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                    fill="currentColor" />
                            </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"
                                aria-hidden="true">
                                <polygon
                                    points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                    fill="currentColor" />
                            </svg></span></span></figcaption>
            </figure>
        </div>
    </section>

    <section class="container-fluid mt-14">
        <div class="nl-bg rounded-2xl px-7 py-9 md:px-12 flex flex-col lg:flex-row lg:items-center gap-6 text-white">
            <div class="flex items-center gap-5 flex-1"><span class="hidden sm:block text-brand-100"><svg
                        class="w-14 h-14" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                        stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                        <rect width="20" height="16" x="2" y="4" rx="2" />
                        <path d="m22 7-8.97 5.7a1.94 1.94 0 0 1-2.06 0L2 7" />
                    </svg></span>
                <div>
                    <h2 class="text-2xl font-bold">Join Our Newsletter</h2>
                    <p class="text-sm text-brand-100 mt-1">Get the latest offers, new arrivals and exclusive
                        discounts.</p>
                </div>
            </div>
            <form data-demo data-msg="You're subscribed. Welcome to NexioMart!" class="flex flex-1 max-w-lg w-full">
                <label class="sr-only" for="nl">Email
                    address</label>
                <input id="nl" type="email" required placeholder="Enter your email address"
                    class="field !rounded-r-none !border-0 text-slate-800"><button
                    class="btn bg-brand-500 hover:bg-brand-600 text-white !rounded-l-none !rounded-r-[10px] border border-white/30">Subscribe</button>
            </form>
        </div>
    </section>

    <section class="container-fluid mt-14">
        <div class="flex items-end justify-between gap-4 flex-wrap mb-5">
            <div class="flex items-center gap-3">
                <span class="text-star"><svg class="w-7 h-7" viewBox="0 0 24 24" fill="none"
                        stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"
                        aria-hidden="true">
                        <path
                            d="M21 8a2 2 0 0 0-1-1.73l-7-4a2 2 0 0 0-2 0l-7 4A2 2 0 0 0 3 8v8a2 2 0 0 0 1 1.73l7 4a2 2 0 0 0 2 0l7-4A2 2 0 0 0 21 16Z" />
                        <path d="m3.3 7 8.7 5 8.7-5" />
                        <path d="M12 22V12" />
                    </svg></span>
                <div>
                    <h2 class="section-title">From Our Blog</h2>
                    <p class="text-xs text-slate-500 mt-0.5">Tips, guides and more for a better lifestyle</p>
                </div>
            </div><a href="blog.html" class="btn btn-outline btn-sm">View All Posts <svg class="w-3.5 h-3.5"
                    viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"
                    stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                    <path d="M5 12h14" />
                    <path d="m12 5 7 7-7 7" />
                </svg></a>
        </div>
        <div class="grid md:grid-cols-3 gap-5">
            <article class="card overflow-hidden group"><a href="blog-single.html" class="block aspect-[16/10]">
                    <div class="ph lg" style="background:linear-gradient(135deg,#f6efe4,#ecdfc9)">
                        <span>🛒</span>
                    </div>
                </a>
                <div class="p-4">
                    <p class="text-[11px] text-brand-600 font-medium">Shopping Tips</p>
                    <h3 class="font-semibold text-slate-900 mt-1 leading-snug"><a href="blog-single.html"
                            class="hover:text-brand-600">5 Tips for Safe Online Shopping in Bangladesh</a></h3>
                    <p class="text-[11px] text-slate-400 mt-3 flex items-center gap-1.5"><svg class="w-3.5 h-3.5"
                            viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"
                            stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                            <rect width="18" height="18" x="3" y="4" rx="2" />
                            <path d="M16 2v4M8 2v4M3 10h18" />
                        </svg>10 Sep 2026</p>
                </div>
            </article>
            <article class="card overflow-hidden group"><a href="blog-single.html" class="block aspect-[16/10]">
                    <div class="ph lg" style="background:linear-gradient(135deg,#fdeee3,#f9dcc6)">
                        <span>🛋️</span>
                    </div>
                </a>
                <div class="p-4">
                    <p class="text-[11px] text-brand-600 font-medium">Home & Living</p>
                    <h3 class="font-semibold text-slate-900 mt-1 leading-snug"><a href="blog-single.html"
                            class="hover:text-brand-600">How to Decorate Your Home on a Budget</a></h3>
                    <p class="text-[11px] text-slate-400 mt-3 flex items-center gap-1.5"><svg class="w-3.5 h-3.5"
                            viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"
                            stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                            <rect width="18" height="18" x="3" y="4" rx="2" />
                            <path d="M16 2v4M8 2v4M3 10h18" />
                        </svg>08 Sep 2026</p>
                </div>
            </article>
            <article class="card overflow-hidden group"><a href="blog-single.html" class="block aspect-[16/10]">
                    <div class="ph lg" style="background:linear-gradient(135deg,#eceff1,#dde2e5)">
                        <span>⌚</span>
                    </div>
                </a>
                <div class="p-4">
                    <p class="text-[11px] text-brand-600 font-medium">Gadgets</p>
                    <h3 class="font-semibold text-slate-900 mt-1 leading-snug"><a href="blog-single.html"
                            class="hover:text-brand-600">Top 10 Must-Have Gadgets in 2026</a></h3>
                    <p class="text-[11px] text-slate-400 mt-3 flex items-center gap-1.5"><svg class="w-3.5 h-3.5"
                            viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"
                            stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                            <rect width="18" height="18" x="3" y="4" rx="2" />
                            <path d="M16 2v4M8 2v4M3 10h18" />
                        </svg>05 Sep 2026</p>
                </div>
            </article>
        </div>
    </section>
@endsection
