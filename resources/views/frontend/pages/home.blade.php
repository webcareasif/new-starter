@extends('frontend.frrontend_app')
@section('content')
    <section class="hero-slider relative" aria-roledescription="carousel" aria-label="Featured offers" data-hero>
        <div class="hero-track relative">
            <div class="hero-slide sl-green is-active" role="group" aria-roledescription="slide" aria-label="1 of 4">
                <div class="max-w-7xl mx-auto px-4 h-full grid lg:grid-cols-[1fr_1.05fr] items-center gap-2">
                    <div class="hero-copy relative z-10 pt-10 pb-2 lg:py-0 text-center lg:text-left">
                        <p class="text-xs font-medium text-brand-700 tracking-[0.25em]">TRENDING COLLECTION</p>
                        <h2 class="mt-3 text-[2.15rem] sm:text-5xl lg:text-[3.1rem] leading-[1.1] font-bold text-slate-900">
                            Better
                            Products<br><span class="text-brand-600">Brighter Living</span></h2>
                        <p class="mt-4 text-sm text-slate-600 max-w-sm leading-relaxed mx-auto lg:mx-0">Discover
                            high-quality
                            products at the best price. Shop now and make your life easier.</p>
                        <div class="mt-6 flex flex-wrap items-center gap-3 justify-center lg:justify-start"><a
                                href="shop.html" class="btn btn-dark !py-3 !px-6">Shop Now <svg class="w-4 h-4"
                                    viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"
                                    stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                                    <path d="M5 12h14" />
                                    <path d="m12 5 7 7-7 7" />
                                </svg></a>
                            <a href="#flash" class="btn btn-light border border-slate-200 !py-3"><span
                                    class="text-brand-600"><svg class="w-5 h-5" viewBox="0 0 24 24" fill="none"
                                        stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                        stroke-linejoin="round" aria-hidden="true">
                                        <circle cx="12" cy="12" r="10" />
                                        <polygon points="10 8 16 12 10 16 10 8" />
                                    </svg></span> Watch Video</a>
                        </div>
                    </div>
                    <div class="hero-art relative h-[260px] sm:h-[330px] lg:h-[430px]" aria-hidden="true">
                        <div
                            class="absolute left-[30%] top-2 w-24 h-24 rounded-full bg-white badge-circle grid place-items-center text-center leading-tight shadow-lg">
                            <span class="text-[10px] text-slate-500">UP TO<b
                                    class="block text-3xl text-brand-700 -my-0.5">70%</b><b
                                    class="text-brand-700 text-xs">OFF</b></span>
                        </div>
                        <p class="hidden md:block absolute right-0 top-4 text-right text-2xl text-brand-800 leading-tight -rotate-6"
                            style="font-family:'Segoe Script','Brush Script MT',cursive">Good Things<br>For A
                            Better You</p>
                        <div class="absolute left-[6%] right-[2%] bottom-4 h-14 hero-podium"></div><span
                            class="absolute left-[6%] bottom-[56px] text-[6.5rem] md:text-[9rem] floaty"
                            style="filter:drop-shadow(0 18px 18px rgba(0,0,0,.2));">🎧</span><span
                            class="absolute left-[34%] bottom-[62px] text-[4.5rem] md:text-[6.5rem] "
                            style="filter:drop-shadow(0 18px 18px rgba(0,0,0,.2));">🪴</span><span
                            class="absolute left-[52%] bottom-[92px] text-[7rem] md:text-[10rem] floaty"
                            style="filter:drop-shadow(0 18px 18px rgba(0,0,0,.2));animation-delay:-2s">🧃</span><span
                            class="absolute right-[4%] bottom-[68px] text-[5.5rem] md:text-[7.5rem] "
                            style="filter:drop-shadow(0 18px 18px rgba(0,0,0,.2));">⌚</span>
                    </div>
                </div>
            </div>
            <div class="hero-slide sl-dark " role="group" aria-roledescription="slide" aria-label="2 of 4"
                aria-hidden="true">
                <div class="max-w-7xl mx-auto px-4 h-full grid lg:grid-cols-[1fr_1.05fr] items-center gap-2">
                    <div class="hero-copy relative z-10 pt-10 pb-2 lg:py-0 text-center lg:text-left">
                        <p class="text-xs font-medium text-brand-700 tracking-[0.25em]">FLASH SALE · ENDS SOON</p>
                        <h2 class="mt-3 text-[2.15rem] sm:text-5xl lg:text-[3.1rem] leading-[1.1] font-bold text-slate-900">
                            Smart
                            Gadgets<br><span class="text-amber-300">From ৳499</span></h2>
                        <p class="mt-4 text-sm text-slate-600 max-w-sm leading-relaxed mx-auto lg:mx-0">Watches,
                            earbuds, speakers
                            and more. Original products with 6-month warranty and cash on delivery.</p>
                        <div class="mt-6 flex flex-wrap items-center gap-3 justify-center lg:justify-start"><a
                                href="shop.html" class="btn btn-dark !py-3 !px-6">Shop Gadgets <svg class="w-4 h-4"
                                    viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"
                                    stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                                    <path d="M5 12h14" />
                                    <path d="m12 5 7 7-7 7" />
                                </svg></a>
                            <a href="#flash" class="btn btn-light border border-slate-200 !py-3"><span
                                    class="text-brand-600"><svg class="w-5 h-5" viewBox="0 0 24 24" fill="none"
                                        stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                        stroke-linejoin="round" aria-hidden="true">
                                        <circle cx="12" cy="12" r="10" />
                                        <polygon points="10 8 16 12 10 16 10 8" />
                                    </svg></span> Watch Video</a>
                        </div>
                    </div>
                    <div class="hero-art relative h-[260px] sm:h-[330px] lg:h-[430px]" aria-hidden="true">
                        <div
                            class="absolute right-[6%] top-2 bg-amber-300 text-brand-900 rounded-2xl px-4 py-2.5 font-bold leading-tight rotate-6 shadow-lg text-center">
                            <span class="text-[11px] font-medium block">Save up to</span><span
                                class="text-2xl">৳1,001</span>
                        </div>
                        <div class="absolute left-[10%] right-[8%] bottom-5 h-12 rounded-[50%] bg-black/25 blur-md">
                        </div><span class="absolute left-[4%] bottom-[50px] text-[7rem] md:text-[10rem] floaty"
                            style="filter:drop-shadow(0 18px 18px rgba(0,0,0,.2));">⌚</span><span
                            class="absolute left-[38%] bottom-[70px] text-[6rem] md:text-[8.5rem] floaty"
                            style="filter:drop-shadow(0 18px 18px rgba(0,0,0,.2));animation-delay:-1.5s">🎧</span><span
                            class="absolute right-[6%] bottom-[56px] text-[5.5rem] md:text-[7.5rem] "
                            style="filter:drop-shadow(0 18px 18px rgba(0,0,0,.2));">🔊</span>
                    </div>
                </div>
            </div>
            <div class="hero-slide sl-rose " role="group" aria-roledescription="slide" aria-label="3 of 4"
                aria-hidden="true">
                <div class="max-w-7xl mx-auto px-4 h-full grid lg:grid-cols-[1fr_1.05fr] items-center gap-2">
                    <div class="hero-copy relative z-10 pt-10 pb-2 lg:py-0 text-center lg:text-left">
                        <p class="text-xs font-medium text-brand-700 tracking-[0.25em]">NEW ARRIVALS</p>
                        <h2
                            class="mt-3 text-[2.15rem] sm:text-5xl lg:text-[3.1rem] leading-[1.1] font-bold text-slate-900">
                            Fresh
                            Styles<br><span class="text-rose-600">For Every Season</span></h2>
                        <p class="mt-4 text-sm text-slate-600 max-w-sm leading-relaxed mx-auto lg:mx-0">Hijabs,
                            sneakers, kids
                            wear and accessories. New collection added every week.</p>
                        <div class="mt-6 flex flex-wrap items-center gap-3 justify-center lg:justify-start"><a
                                href="shop.html" class="btn btn-dark !py-3 !px-6">Explore Fashion <svg class="w-4 h-4"
                                    viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"
                                    stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                                    <path d="M5 12h14" />
                                    <path d="m12 5 7 7-7 7" />
                                </svg></a>
                            <a href="#flash" class="btn btn-light border border-slate-200 !py-3"><span
                                    class="text-brand-600"><svg class="w-5 h-5" viewBox="0 0 24 24" fill="none"
                                        stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                        stroke-linejoin="round" aria-hidden="true">
                                        <circle cx="12" cy="12" r="10" />
                                        <polygon points="10 8 16 12 10 16 10 8" />
                                    </svg></span> Watch Video</a>
                        </div>
                    </div>
                    <div class="hero-art relative h-[260px] sm:h-[330px] lg:h-[430px]" aria-hidden="true">
                        <div
                            class="absolute left-[4%] top-4 bg-white rounded-full px-4 py-2 text-xs font-semibold text-rose-600 shadow-lg flex items-center gap-2">
                            <span class="w-2 h-2 rounded-full bg-rose-500"></span>240+ new styles
                        </div>
                        <div class="absolute left-[6%] right-[4%] bottom-4 h-14 rounded-[50%/40%] bg-rose-200/70">
                        </div><span class="absolute left-[4%] bottom-[48px] text-[6.5rem] md:text-[9rem] "
                            style="filter:drop-shadow(0 18px 18px rgba(0,0,0,.2));">🧕</span><span
                            class="absolute left-[32%] bottom-[60px] text-[6rem] md:text-[8.5rem] floaty"
                            style="filter:drop-shadow(0 18px 18px rgba(0,0,0,.2));">👗</span><span
                            class="absolute left-[60%] bottom-[48px] text-[5rem] md:text-[6.5rem] "
                            style="filter:drop-shadow(0 18px 18px rgba(0,0,0,.2));">👟</span><span
                            class="absolute right-[2%] top-[22%] text-[3.5rem] md:text-[5rem] floaty"
                            style="filter:drop-shadow(0 18px 18px rgba(0,0,0,.2));animation-delay:-3s">🕶️</span>
                    </div>
                </div>
            </div>
            <div class="hero-slide sl-mint " role="group" aria-roledescription="slide" aria-label="4 of 4"
                aria-hidden="true">
                <div class="max-w-7xl mx-auto px-4 h-full grid lg:grid-cols-[1fr_1.05fr] items-center gap-2">
                    <div class="hero-copy relative z-10 pt-10 pb-2 lg:py-0 text-center lg:text-left">
                        <p class="text-xs font-medium text-brand-700 tracking-[0.25em]">HOME & LIVING</p>
                        <h2
                            class="mt-3 text-[2.15rem] sm:text-5xl lg:text-[3.1rem] leading-[1.1] font-bold text-slate-900">
                            Make
                            Your Home<br><span class="text-brand-600">More Beautiful</span></h2>
                        <p class="mt-4 text-sm text-slate-600 max-w-sm leading-relaxed mx-auto lg:mx-0">Furniture,
                            kitchen
                            appliances and decor that make every room feel like yours.</p>
                        <div class="mt-6 flex flex-wrap items-center gap-3 justify-center lg:justify-start"><a
                                href="shop.html" class="btn btn-dark !py-3 !px-6">Shop Home <svg class="w-4 h-4"
                                    viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"
                                    stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                                    <path d="M5 12h14" />
                                    <path d="m12 5 7 7-7 7" />
                                </svg></a>
                            <a href="#flash" class="btn btn-light border border-slate-200 !py-3"><span
                                    class="text-brand-600"><svg class="w-5 h-5" viewBox="0 0 24 24" fill="none"
                                        stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                        stroke-linejoin="round" aria-hidden="true">
                                        <circle cx="12" cy="12" r="10" />
                                        <polygon points="10 8 16 12 10 16 10 8" />
                                    </svg></span> Watch Video</a>
                        </div>
                    </div>
                    <div class="hero-art relative h-[260px] sm:h-[330px] lg:h-[430px]" aria-hidden="true">
                        <div
                            class="absolute right-[8%] top-3 w-24 h-24 rounded-full bg-white badge-circle grid place-items-center text-center leading-tight shadow-lg">
                            <span class="text-[10px] text-slate-500">FLAT<b
                                    class="block text-3xl text-brand-700 -my-0.5">30%</b><b
                                    class="text-brand-700 text-xs">OFF</b></span>
                        </div>
                        <div class="absolute left-[4%] right-[4%] bottom-4 h-14 rounded-[50%/40%] bg-brand-200/70">
                        </div><span class="absolute left-[4%] bottom-[44px] text-[8rem] md:text-[11rem] "
                            style="filter:drop-shadow(0 18px 18px rgba(0,0,0,.2));">🛋️</span><span
                            class="absolute left-[48%] bottom-[56px] text-[5rem] md:text-[7rem] "
                            style="filter:drop-shadow(0 18px 18px rgba(0,0,0,.2));">🪴</span><span
                            class="absolute right-[4%] bottom-[64px] text-[5rem] md:text-[6.5rem] floaty"
                            style="filter:drop-shadow(0 18px 18px rgba(0,0,0,.2));">🍳</span>
                    </div>
                </div>
            </div>
            <div class="hero-ctrl absolute left-0 right-0 bottom-4 z-20 pointer-events-none">
                <div class="max-w-7xl mx-auto px-4 flex items-center justify-center lg:justify-between gap-4">
                    <div class="flex items-center gap-2 pointer-events-auto" role="tablist"><button
                            class="hero-dot is-active" data-hero-dot="0"
                            aria-label="Go to slide 1"><i></i></button><button class="hero-dot " data-hero-dot="1"
                            aria-label="Go to slide 2"><i></i></button><button class="hero-dot " data-hero-dot="2"
                            aria-label="Go to slide 3"><i></i></button><button class="hero-dot " data-hero-dot="3"
                            aria-label="Go to slide 4"><i></i></button></div>
                    <div class="hidden md:flex items-center gap-2 pointer-events-auto">
                        <button class="hero-arrow" data-hero-prev aria-label="Previous slide"><svg
                                class="w-5 h-5 rotate-180" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                                <path d="m9 18 6-6-6-6" />
                            </svg></button>
                        <button class="hero-arrow" data-hero-next aria-label="Next slide"><svg class="w-5 h-5"
                                viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"
                                stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                                <path d="m9 18 6-6-6-6" />
                            </svg></button>
                    </div>
                </div>
            </div>
        </div>
        <div class="relative z-10 bg-white border-t border-brand-100 shadow-[0_-2px_10px_rgba(0,0,0,0.1)]"
            style="border-bottom: 2px solid #e8eae8 ">
            <div class="max-w-7xl mx-auto px-4 py-4 grid grid-cols-2 lg:grid-cols-4 gap-4">
                <div class="flex items-center gap-3"><span class="text-brand-600"><svg class="w-7 h-7"
                            viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"
                            stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
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
                <div class="flex items-center gap-3"><span class="text-brand-600"><svg class="w-7 h-7"
                            viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"
                            stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                            <rect width="20" height="12" x="2" y="6" rx="2" />
                            <circle cx="12" cy="12" r="2" />
                            <path d="M6 12h.01M18 12h.01" />
                        </svg></span>
                    <div>
                        <p class="text-[13px] font-semibold text-slate-800">Cash on Delivery</p>
                        <p class="text-[11px] text-slate-500">Pay After Receive</p>
                    </div>
                </div>
                <div class="flex items-center gap-3"><span class="text-brand-600"><svg class="w-7 h-7"
                            viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"
                            stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                            <path d="M3 12a9 9 0 1 0 9-9 9.75 9.75 0 0 0-6.74 2.74L3 8" />
                            <path d="M3 3v5h5" />
                        </svg></span>
                    <div>
                        <p class="text-[13px] font-semibold text-slate-800">Easy Return</p>
                        <p class="text-[11px] text-slate-500">Within 7 Days</p>
                    </div>
                </div>
                <div class="flex items-center gap-3"><span class="text-brand-600"><svg class="w-7 h-7"
                            viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"
                            stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
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
        </div>
    </section>

    <section class="max-w-7xl mx-auto px-4 py-9">
        <div class="flex gap-5 lg:justify-between overflow-x-auto snap-x pb-2 -mx-4 px-4 no-scrollbar"><a href="shop.html"
                class="cat-item flex flex-col items-center gap-2 w-[96px] shrink-0 snap-start"><span
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
                    class="text-[11px] text-slate-400 -mt-1.5">26+ items</span></a></div>
    </section>

    <section id="flash" class="max-w-7xl mx-auto px-4 pt-3">
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
            <div class="flex items-center gap-3" data-countdown>
                <div class="cd-box"><b data-cd="d">00</b><small>Days</small></div>
                <div class="cd-box"><b data-cd="h">00</b><small>Hours</small></div>
                <div class="cd-box"><b data-cd="m">00</b><small>Minutes</small></div>
                <div class="cd-box"><b data-cd="s">00</b><small>Seconds</small></div><a href="shop.html"
                    class="btn btn-primary btn-sm ml-2">View All <svg class="w-3.5 h-3.5" viewBox="0 0 24 24"
                        fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                        stroke-linejoin="round" aria-hidden="true">
                        <path d="M5 12h14" />
                        <path d="m12 5 7 7-7 7" />
                    </svg></a>
            </div>
        </div>
        <div class="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-5 gap-3 sm:gap-4">
            @include('frontend.partials._card')
            @include('frontend.partials._card')
            @include('frontend.partials._card')
            @include('frontend.partials._card')
            @include('frontend.partials._card')

        </div>
    </section>

    <section class="max-w-7xl mx-auto px-4 mt-10 grid md:grid-cols-2 gap-5">
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


    <section id="category" class="max-w-7xl mx-auto px-4 pt-3">
        <div class="flex items-end justify-between gap-4 flex-wrap mb-5">
            <div class="flex items-center gap-3">
                <span class="text-[#e5383b]">
                    <svg class="w-7 h-7" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"
                        stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                        <path d="M20.5 3.5C12 3.5 5 7.5 5 14.5c0 3.5 2.5 5.5 5.5 5.5 6.5 0 10-7 10-16.5Z" />
                        <path d="M4 21c3-5 7-8 12-10" />
                    </svg>
                </span>
                <div>
                    <h2 class="section-title">Life Style</h2>
                    <p class="text-xs text-slate-500 mt-0.5">Tips and ideas for everyday living</p>
                </div>
            </div>
        </div>
        <div class="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-5 gap-3 sm:gap-4">
            @include('frontend.partials._card')
            @include('frontend.partials._card')
            @include('frontend.partials._card')
            @include('frontend.partials._card')
            @include('frontend.partials._card')
            @include('frontend.partials._card')
            @include('frontend.partials._card')
            @include('frontend.partials._card')
            @include('frontend.partials._card')
            @include('frontend.partials._card')
        </div>
    </section>



    <section class="max-w-7xl mx-auto px-4 mt-12" id="best">
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
            <div class="flex flex-wrap gap-1" data-tabs="best"><button data-tab="all"
                    class="tab-btn active">All</button><button data-tab="fashion"
                    class="tab-btn ">Fashion</button><button data-tab="electronics"
                    class="tab-btn ">Electronics</button><button data-tab="home" class="tab-btn ">Home &
                    Living</button><button data-tab="beauty" class="tab-btn ">Beauty</button><button data-tab="kids"
                    class="tab-btn ">Kids</button></div>
        </div>
        <div data-panel="all" class="active">
            <div class="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-5 gap-4">
                @include('frontend.partials._card')
                @include('frontend.partials._card')
                @include('frontend.partials._card')
                @include('frontend.partials._card')
                @include('frontend.partials._card')

            </div>
        </div>
        <div data-panel="fashion" class="">
            <div class="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-5 gap-4">
                @include('frontend.partials._card')
                @include('frontend.partials._card')
                @include('frontend.partials._card')
                @include('frontend.partials._card')
            </div>
        </div>
        <div data-panel="electronics" class="">
            <div class="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-5 gap-4">
                @include('frontend.partials._card')
                @include('frontend.partials._card')
                @include('frontend.partials._card')
                @include('frontend.partials._card')
                @include('frontend.partials._card')
            </div>
        </div>
        <div data-panel="home" class="">
            <div class="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-5 gap-4">
                @include('frontend.partials._card')
                @include('frontend.partials._card')
                @include('frontend.partials._card')
                @include('frontend.partials._card')
                @include('frontend.partials._card')
            </div>
        </div>
        <div data-panel="beauty" class="">
            <div class="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-5 gap-4">
                @include('frontend.partials._card')
                @include('frontend.partials._card')
                @include('frontend.partials._card')
                @include('frontend.partials._card')
            </div>
        </div>
        <div data-panel="kids" class="">
            <div class="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-5 gap-4">
                @include('frontend.partials._card')
                @include('frontend.partials._card')
                @include('frontend.partials._card')
            </div>
        </div>
    </section>

    <section class="max-w-7xl mx-auto px-4 mt-16 text-center">
        <h2 class="section-title">Why Choose NexioMart?</h2>
        <p class="text-xs text-slate-500 mt-1">We are committed to giving you the best shopping experience.</p>
        <div class="mt-8 grid grid-cols-2 lg:grid-cols-4 gap-y-8 lg:divide-x divide-slate-200">
            <div class="flex flex-col items-center text-center px-4"><span
                    class="w-16 h-16 rounded-full bg-brand-50 text-brand-600 grid place-items-center mb-3"><svg
                        class="w-8 h-8" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"
                        stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                        <path d="M14 18V6a2 2 0 0 0-2-2H4a2 2 0 0 0-2 2v11a1 1 0 0 0 1 1h2" />
                        <path d="M15 18H9" />
                        <path d="M19 18h2a1 1 0 0 0 1-1v-3.65a1 1 0 0 0-.22-.624l-3.48-4.35A1 1 0 0 0 17.52 8H14" />
                        <circle cx="17" cy="18" r="2" />
                        <circle cx="7" cy="18" r="2" />
                    </svg></span>
                <h3 class="font-semibold text-slate-900 text-sm">First Delivery</h3>
                <p class="text-xs text-slate-500 mt-1">All Over Bangladesh</p>
            </div>
            <div class="flex flex-col items-center text-center px-4"><span
                    class="w-16 h-16 rounded-full bg-brand-50 text-brand-600 grid place-items-center mb-3"><svg
                        class="w-8 h-8" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"
                        stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                        <path
                            d="M20 13c0 5-3.5 7.5-7.66 8.95a1 1 0 0 1-.67-.01C7.5 20.5 4 18 4 13V6a1 1 0 0 1 1-1c2 0 4.5-1.2 6.24-2.72a1.17 1.17 0 0 1 1.52 0C14.51 3.81 17 5 19 5a1 1 0 0 1 1 1z" />
                        <path d="m9 12 2 2 4-4" />
                    </svg></span>
                <h3 class="font-semibold text-slate-900 text-sm">Secure Payment</h3>
                <p class="text-xs text-slate-500 mt-1">100% Safe & Secure</p>
            </div>
            <div class="flex flex-col items-center text-center px-4"><span
                    class="w-16 h-16 rounded-full bg-brand-50 text-brand-600 grid place-items-center mb-3"><svg
                        class="w-8 h-8" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"
                        stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
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
                        class="w-8 h-8" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"
                        stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                        <path
                            d="M3 11h3a2 2 0 0 1 2 2v3a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-5Zm0 0a9 9 0 1 1 18 0m0 0v5a2 2 0 0 1-2 2h-1a2 2 0 0 1-2-2v-3a2 2 0 0 1 2-2h3Z" />
                        <path d="M21 16v2a4 4 0 0 1-4 4h-5" />
                    </svg></span>
                <h3 class="font-semibold text-slate-900 text-sm">24/7 Support</h3>
                <p class="text-xs text-slate-500 mt-1">Always Here for You</p>
            </div>
        </div>
    </section>

    <section class="max-w-7xl mx-auto px-4 mt-16">
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
                            </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
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
                            </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
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
                            </svg><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                                <polygon
                                    points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                                    fill="currentColor" />
                            </svg></span></span></figcaption>
            </figure>
        </div>
    </section>

    <section class="max-w-7xl mx-auto px-4 mt-14">
        <div class="nl-bg rounded-2xl px-7 py-9 md:px-12 flex flex-col lg:flex-row lg:items-center gap-6 text-white">
            <div class="flex items-center gap-5 flex-1"><span class="hidden sm:block text-brand-100"><svg
                        class="w-14 h-14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"
                        stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
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

    <section class="max-w-7xl mx-auto px-4 mt-14">
        <div class="flex items-end justify-between gap-4 flex-wrap mb-5">
            <div class="flex items-center gap-3">
                <span class="text-star"><svg class="w-7 h-7" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                        stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
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
                    viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                    stroke-linejoin="round" aria-hidden="true">
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
