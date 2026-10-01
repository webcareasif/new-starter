@extends('frontend.frrontend_app')
@section('content')
    <section class="hero-bg border-b border-brand-100">
        <div class="max-w-7xl mx-auto px-4 py-9 md:py-12">
            <h1 class="text-2xl md:text-3xl font-bold text-brand-900">All Products</h1>
            <p class="text-sm text-slate-600 mt-1.5 max-w-xl">Browse our full collection and find something you will love.
            </p>
            <div class="mt-3">
                <nav class="text-sm text-slate-500 flex items-center gap-1.5 flex-wrap" aria-label="Breadcrumb"><a
                        href="index.html" class="hover:text-brand-600">Home</a><span class="text-slate-300">/</span><span
                        class="text-slate-800 font-medium">Shop</span></nav>
            </div>
        </div>
    </section>
    <section class="max-w-7xl mx-auto px-4 pt-8 grid lg:grid-cols-[250px_1fr] gap-7">
        <aside class="space-y-4 lg:sticky lg:top-[150px] self-start">
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
                    <div class="hidden sm:flex border border-slate-200 rounded-lg overflow-hidden">
                        <button data-view="grid" class="p-2.5 text-brand-600" aria-label="Grid view">
                            <svg class="w-4 h-4" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                                <rect width="7" height="7" x="3" y="3" rx="1" />
                                <rect width="7" height="7" x="14" y="3" rx="1" />
                                <rect width="7" height="7" x="14" y="14" rx="1" />
                                <rect width="7" height="7" x="3" y="14" rx="1" />
                            </svg>
                        </button>
                        <button data-view="list" class="p-2.5 border-l border-slate-200" aria-label="List view"><svg
                                class="w-4 h-4" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                                <line x1="8" x2="21" y1="6" y2="6" />
                                <line x1="8" x2="21" y1="12" y2="12" />
                                <line x1="8" x2="21" y1="18" y2="18" />
                                <line x1="3" x2="3.01" y1="6" y2="6" />
                                <line x1="3" x2="3.01" y1="12" y2="12" />
                                <line x1="3" x2="3.01" y1="18" y2="18" />
                            </svg>
                        </button>
                    </div>
                </div>
            </div>
            <div id="productGrid" class="grid grid-cols-2 md:grid-cols-4 gap-4">
                @for ($i = 0; $i <= 23; $i++)
                    @include('frontend.partials._card')
                @endfor
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
