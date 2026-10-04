@extends('frontend.frrontend_app')
@section('content')
    <section class="hero-bg border-b border-brand-100">
        <div class="container-fluid py-9 md:py-12">
            <h1 class="text-2xl md:text-3xl font-bold text-brand-900">Shop All Products</h1>
            <p class="text-sm text-slate-600 mt-1.5 max-w-xl">Browse our full collection and find something you will love.
            </p>
            <div class="mt-3">
                <nav class="text-sm text-slate-500 flex items-center gap-1.5 flex-wrap" aria-label="Breadcrumb"><a
                        href="index.html" class="hover:text-brand-600">Home</a><span class="text-slate-300">/</span><span
                        class="text-slate-800 font-medium">Shop</span></nav>
            </div>
        </div>
    </section>
    <section class="container-fluid pt-8 grid lg:grid-cols-[250px_1fr] gap-7">
        <div class="lg:hidden"><button type="button" data-toggle="#filters" aria-expanded="false" aria-controls="filters"
                class="btn btn-outline w-full"><svg class="w-4 h-4" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                    stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                    <line x1="21" x2="14" y1="4" y2="4" />
                    <line x1="10" x2="3" y1="4" y2="4" />
                    <line x1="21" x2="12" y1="12" y2="12" />
                    <line x1="8" x2="3" y1="12" y2="12" />
                    <line x1="21" x2="16" y1="20" y2="20" />
                    <line x1="12" x2="3" y1="20" y2="20" />
                    <line x1="14" x2="14" y1="2" y2="6" />
                    <line x1="8" x2="8" y1="10" y2="14" />
                    <line x1="16" x2="16" y1="18" y2="22" />
                </svg> Filters &amp; Categories</button></div>
        <aside id="filters" class="hidden lg:block space-y-4 lg:sticky lg:top-[150px] self-start">
            <div class="card p-5">
                <h3 class="font-semibold text-slate-900 mb-2 text-sm">Categories</h3><label
                    class="flex items-center justify-between text-[13px] py-1.5 cursor-pointer"><span
                        class="flex items-center gap-2.5"><input type="checkbox" checked> All Products</span><span
                        class="text-xs text-slate-400">248</span></label><label
                    class="flex items-center justify-between text-[13px] py-1.5 cursor-pointer"><span
                        class="flex items-center gap-2.5"><input type="checkbox"> Fashion</span><span
                        class="text-xs text-slate-400">72</span></label><label
                    class="flex items-center justify-between text-[13px] py-1.5 cursor-pointer"><span
                        class="flex items-center gap-2.5"><input type="checkbox"> Electronics</span><span
                        class="text-xs text-slate-400">54</span></label><label
                    class="flex items-center justify-between text-[13px] py-1.5 cursor-pointer"><span
                        class="flex items-center gap-2.5"><input type="checkbox"> Home & Living</span><span
                        class="text-xs text-slate-400">46</span></label><label
                    class="flex items-center justify-between text-[13px] py-1.5 cursor-pointer"><span
                        class="flex items-center gap-2.5"><input type="checkbox"> Beauty & Care</span><span
                        class="text-xs text-slate-400">31</span></label><label
                    class="flex items-center justify-between text-[13px] py-1.5 cursor-pointer"><span
                        class="flex items-center gap-2.5"><input type="checkbox"> Kids Zone</span><span
                        class="text-xs text-slate-400">27</span></label><label
                    class="flex items-center justify-between text-[13px] py-1.5 cursor-pointer"><span
                        class="flex items-center gap-2.5"><input type="checkbox"> Sports & Fitness</span><span
                        class="text-xs text-slate-400">18</span></label>
            </div>
            <div class="card p-5">
                <h3 class="font-semibold text-slate-900 mb-3 text-sm">Max Price</h3><input id="priceRange" type="range"
                    min="200" max="10000" step="100" value="5000" aria-label="Maximum price">
                <div class="flex justify-between text-xs text-slate-500 mt-1"><span>৳200</span><b id="priceOut"
                        class="text-brand-700">৳5,000</b></div>
            </div>
            <div class="card p-5">
                <h3 class="font-semibold text-slate-900 mb-2 text-sm">Rating</h3><label
                    class="flex items-center gap-2.5 py-1.5 text-[13px] cursor-pointer"><input type="radio"
                        name="rt"> <span class="inline-flex text-star"><svg class="w-3.5 h-3.5" viewBox="0 0 24 24"
                            fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                            stroke-linejoin="round" aria-hidden="true">
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
                        </svg></span> <span class="text-xs text-slate-400">& up</span></label><label
                    class="flex items-center gap-2.5 py-1.5 text-[13px] cursor-pointer"><input type="radio"
                        name="rt"> <span class="inline-flex text-star"><svg class="w-3.5 h-3.5" viewBox="0 0 24 24"
                            fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                            stroke-linejoin="round" aria-hidden="true">
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
                        </svg></span> <span class="text-xs text-slate-400">& up</span></label><label
                    class="flex items-center gap-2.5 py-1.5 text-[13px] cursor-pointer"><input type="radio"
                        name="rt"> <span class="inline-flex text-star"><svg class="w-3.5 h-3.5" viewBox="0 0 24 24"
                            fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                            stroke-linejoin="round" aria-hidden="true">
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
                        </svg></span> <span class="text-xs text-slate-400">& up</span></label>
            </div>
            <div class="card p-5">
                <h3 class="font-semibold text-slate-900 mb-2 text-sm">Availability</h3><label
                    class="flex items-center justify-between text-[13px] py-1.5 cursor-pointer"><span
                        class="flex items-center gap-2.5"><input type="checkbox" checked> In Stock</span><span
                        class="text-xs text-slate-400">231</span></label><label
                    class="flex items-center justify-between text-[13px] py-1.5 cursor-pointer"><span
                        class="flex items-center gap-2.5"><input type="checkbox"> On Sale</span><span
                        class="text-xs text-slate-400">86</span></label><label
                    class="flex items-center justify-between text-[13px] py-1.5 cursor-pointer"><span
                        class="flex items-center gap-2.5"><input type="checkbox"> Free Delivery</span><span
                        class="text-xs text-slate-400">190</span></label>
            </div>
            <button class="btn btn-primary w-full">Apply Filters</button>
        </aside>
        <div>
            <div class="flex flex-wrap items-center justify-between gap-3 mb-5">
                <p class="text-sm text-slate-500">Showing <b class="text-slate-800">1–12</b> of 248 products</p>
                <div class="flex items-center gap-3"><label class="sr-only" for="sort">Sort</label>
                    <select id="sort" class="field !w-auto !py-2 !text-[13px]">
                        <option>Sort: Featured</option>
                        <option>Price: Low to High</option>
                        <option>Price: High to Low</option>
                        <option>Top Rated</option>
                        <option>Newest</option>
                    </select>
                    <div class="hidden sm:flex border border-slate-200 rounded-lg overflow-hidden"><button
                            data-view="grid" class="p-2.5 text-brand-600" aria-label="Grid view"><svg class="w-4 h-4"
                                viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"
                                stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                                <rect width="7" height="7" x="3" y="3" rx="1" />
                                <rect width="7" height="7" x="14" y="3" rx="1" />
                                <rect width="7" height="7" x="14" y="14" rx="1" />
                                <rect width="7" height="7" x="3" y="14" rx="1" />
                            </svg></button><button data-view="list" class="p-2.5 border-l border-slate-200"
                            aria-label="List view"><svg class="w-4 h-4" viewBox="0 0 24 24" fill="none"
                                stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"
                                aria-hidden="true">
                                <line x1="8" x2="21" y1="6" y2="6" />
                                <line x1="8" x2="21" y1="12" y2="12" />
                                <line x1="8" x2="21" y1="18" y2="18" />
                                <line x1="3" x2="3.01" y1="6" y2="6" />
                                <line x1="3" x2="3.01" y1="12" y2="12" />
                                <line x1="3" x2="3.01" y1="18" y2="18" />
                            </svg></button></div>
                </div>
            </div>
            <div id="productGrid" class="grid grid-cols-2 md:grid-cols-5 gap-4">
                <article class="card pcard overflow-hidden flex flex-col ">
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
                        <h3 class="text-[13px] font-medium text-slate-800 leading-snug min-h-[2.4em]"><a
                                href="product.html" class="hover:text-brand-600">T800 Ultra Smart Watch (Original)</a>
                        </h3>
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
                                </svg></span><b class="text-slate-700">4.8</b>(320)</div>
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
                <article class="card pcard overflow-hidden flex flex-col ">
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
                        <h3 class="text-[13px] font-medium text-slate-800 leading-snug min-h-[2.4em]"><a
                                href="product.html" class="hover:text-brand-600">Airdots Pro Wireless Earbuds</a></h3>
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
                                alt="Anti Theft Laptop Bag" width="400" height="400" loading="lazy"
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
                            class="block w-full h-full"><img src="https://placehold.co/400x400"
                                alt="Digital Air Fryer 6L" width="400" height="400" loading="lazy"
                                class="w-full h-full object-cover"></a><span
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
                                alt="Men&#x27;s Sports Shoes" width="400" height="400" loading="lazy"
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
                                href="product.html" class="hover:text-brand-600">UV Protection Sunglasses</a></h3>
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
                                href="product.html" class="hover:text-brand-600">Casual Sneakers for Men</a></h3>
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
                                href="product.html" class="hover:text-brand-600">Portable Juicer Blender</a></h3>
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
            </div>
            <div class="flex justify-center gap-2 mt-10"><a href="#"
                    class="w-10 h-10 grid place-items-center rounded-lg border text-sm font-medium bg-brand-600 border-brand-600 text-white">1</a><a
                    href="#"
                    class="w-10 h-10 grid place-items-center rounded-lg border text-sm font-medium border-slate-200 hover:border-brand-600 hover:text-brand-600">2</a><a
                    href="#"
                    class="w-10 h-10 grid place-items-center rounded-lg border text-sm font-medium border-slate-200 hover:border-brand-600 hover:text-brand-600">3</a><a
                    href="#"
                    class="w-10 h-10 grid place-items-center rounded-lg border text-sm font-medium border-slate-200 hover:border-brand-600 hover:text-brand-600">4</a>
            </div>
        </div>
    </section>
@endsection
