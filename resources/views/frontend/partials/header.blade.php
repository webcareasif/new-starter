<header class="sticky top-0 z-40 bg-white border-b border-slate-100">
    <div class="container-fluid h-[64px] sm:h-[68px] flex items-center gap-2 sm:gap-4 lg:gap-8">
        <button data-menu-open class="lg:hidden p-2 -ml-2" aria-label="Open menu"><svg class="w-6 h-6" viewBox="0 0 24 24"
                fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"
                aria-hidden="true">
                <line x1="4" x2="20" y1="12" y2="12" />
                <line x1="4" x2="20" y1="6" y2="6" />
                <line x1="4" x2="20" y1="18" y2="18" />
            </svg>
        </button>
        <a href="{{ route('frontend.home') }}" class="flex items-center gap-2 sm:gap-2.5 shrink-0"
            aria-label="NexioMart home"><svg class="w-8 h-8 sm:w-9 sm:h-9" viewBox="0 0 40 40" aria-hidden="true">
                <rect width="40" height="40" rx="10" fill="#0e7d3b" />
                <path d="M11 29c0-9 5-15 17-16-1 11-6 17-14 17-1 0-2-.3-3-1Z" fill="#fff" />
                <path d="M12 30c4-6 8-9 13-12" stroke="#0e7d3b" stroke-width="1.6" stroke-linecap="round"
                    fill="none" />
            </svg><span class="leading-none"><span
                    class="block text-[1.15rem] sm:text-[1.3rem] font-bold text-brand-900">NexioMart</span><span
                    class="hidden min-[420px]:block text-[10px] text-slate-500 mt-1">Shop Smart, Live
                    Better</span></span></a>
        <form action="shop.html" class="hidden md:flex flex-1 max-w-xl mx-auto"><label class="sr-only"
                for="q">Search
                products</label>
            <input id="q" type="search" placeholder="Search for products..."
                class="field !rounded-r-none !py-2.5 !text-[13px] bg-slate-50">
            <button class="bg-brand-600 hover:bg-brand-700 text-white px-4 rounded-r-[10px]" aria-label="Search"><svg
                    class="w-4 h-4" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"
                    stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                    <circle cx="11" cy="11" r="8" />
                    <path d="m21 21-4.3-4.3" />
                </svg></button>
        </form>
        <div class="ml-auto flex items-center sm:gap-3 text-[11px] text-slate-600">
            <a href="login.html" class="flex flex-col items-center px-1.5 sm:px-2 hover:text-brand-600"><span><svg
                        class="w-[22px] h-[22px]" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                        stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                        <path d="M19 21v-2a4 4 0 0 0-4-4H9a4 4 0 0 0-4 4v2" />
                        <circle cx="12" cy="7" r="4" />
                    </svg></span><span class="hidden sm:block">Account</span></a>
            <a href="wishlist.html" class="relative flex flex-col items-center px-1.5 sm:px-2 hover:text-brand-600"><svg
                    class="w-[22px] h-[22px]" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                    stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                    <path
                        d="M19 14c1.49-1.46 3-3.21 3-5.5A5.5 5.5 0 0 0 16.5 3c-1.76 0-3 .5-4.5 2-1.5-1.5-2.74-2-4.5-2A5.5 5.5 0 0 0 2 8.5c0 2.3 1.5 4.05 3 5.5l7 7Z" />
                </svg><span class="hidden sm:block">Wishlist</span><b
                    class="absolute -top-1 right-0 bg-brand-600 text-white text-[9px] w-4 h-4 rounded-full grid place-items-center">4</b></a>
            <a href="cart.html" data-cart-open
                class="relative flex flex-col items-center px-1.5 sm:px-2 hover:text-brand-600"
                aria-haspopup="dialog"><svg class="w-[22px] h-[22px]" viewBox="0 0 24 24" fill="none"
                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"
                    aria-hidden="true">
                    <circle cx="8" cy="21" r="1" />
                    <circle cx="19" cy="21" r="1" />
                    <path d="M2.05 2.05h2l2.66 12.42a2 2 0 0 0 2 1.58h9.78a2 2 0 0 0 1.95-1.57l1.65-7.43H5.12" />
                </svg><span class="hidden sm:block">Cart</span><b data-cart-count
                    class="absolute -top-1 right-0 bg-brand-600 text-white text-[9px] w-4 h-4 rounded-full grid place-items-center">0</b></a>
        </div>
    </div>
    <div class="md:hidden px-4 pb-3">
        <form action="shop.html" class="flex"><input type="search" placeholder="Search for products..."
                class="field !rounded-r-none !py-2 !text-[13px]" aria-label="Search products"><button
                class="bg-brand-600 text-white px-4 rounded-r-[10px]" aria-label="Search"><svg class="w-4 h-4"
                    viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"
                    stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                    <circle cx="11" cy="11" r="8" />
                    <path d="m21 21-4.3-4.3" />
                </svg></button></form>
    </div>
    <div class="hidden lg:block border-t border-slate-100">
        <div class="container-fluid flex items-center gap-8">
            <div class="dd-wrap relative"><button
                    class="btn btn-primary !rounded-lg !py-2 !px-4 !text-[13px] my-1.5"><svg class="w-4 h-4"
                        viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"
                        stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                        <rect width="7" height="7" x="3" y="3" rx="1" />
                        <rect width="7" height="7" x="14" y="3" rx="1" />
                        <rect width="7" height="7" x="14" y="14" rx="1" />
                        <rect width="7" height="7" x="3" y="14" rx="1" />
                    </svg> All Categories <svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                        stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"
                        aria-hidden="true">
                        <path d="m6 9 6 6 6-6" />
                    </svg></button>
                <div
                    class="dd absolute left-0 top-full w-60 bg-white border border-slate-100 rounded-xl shadow-xl py-2 z-50">
                    <a href="shop.html"
                        class="flex items-center gap-3 px-4 py-2.5 text-sm hover:bg-brand-50 hover:text-brand-700"><span
                            class="text-lg">👕</span>Fashion</a><a href="shop.html"
                        class="flex items-center gap-3 px-4 py-2.5 text-sm hover:bg-brand-50 hover:text-brand-700"><span
                            class="text-lg">🎧</span>Electronics</a><a href="shop.html"
                        class="flex items-center gap-3 px-4 py-2.5 text-sm hover:bg-brand-50 hover:text-brand-700"><span
                            class="text-lg">🛋️</span>Home & Living</a><a href="shop.html"
                        class="flex items-center gap-3 px-4 py-2.5 text-sm hover:bg-brand-50 hover:text-brand-700"><span
                            class="text-lg">🧴</span>Beauty & Care</a><a href="shop.html"
                        class="flex items-center gap-3 px-4 py-2.5 text-sm hover:bg-brand-50 hover:text-brand-700"><span
                            class="text-lg">🧸</span>Kids Zone</a><a href="shop.html"
                        class="flex items-center gap-3 px-4 py-2.5 text-sm hover:bg-brand-50 hover:text-brand-700"><span
                            class="text-lg">🏋️</span>Sports & Fitness</a><a href="shop.html"
                        class="flex items-center gap-3 px-4 py-2.5 text-sm hover:bg-brand-50 hover:text-brand-700"><span
                            class="text-lg">🧺</span>Groceries</a><a href="shop.html"
                        class="flex items-center gap-3 px-4 py-2.5 text-sm hover:bg-brand-50 hover:text-brand-700"><span
                            class="text-lg">🕶️</span>Accessories</a>
                </div>
            </div>
            <nav class="flex items-center gap-7" aria-label="Main">
                <a href="{{ route('frontend.home') }}"
                    class="py-3 text-[13px] font-medium {{ request()->routeIs('frontend.home') ? 'text-brand-600' : 'text-slate-700 hover:text-brand-600' }}">
                    Home
                </a>

                <a href="{{ route('frontend.all-products') }}"
                    class="py-3 text-[13px] font-medium {{ request()->routeIs('frontend.all-products') ? 'text-brand-600' : 'text-slate-700 hover:text-brand-600' }}">
                    Products
                </a>
                <a href="shop.html"
                    class="py-3 text-[13px] font-medium text-slate-700 hover:text-brand-600">Categories</a>
                <a href="{{ route('frontend.home') }}#flash"
                    class="py-3 text-[13px] font-medium text-slate-700 hover:text-brand-600">Flash Sale</a>
                <a href="shop.html"
                    class="py-3 text-[13px] font-medium text-slate-700 hover:text-brand-600">Offers</a>
                <a href="blog.html" class="py-3 text-[13px] font-medium text-slate-700 hover:text-brand-600">Blog</a>
                <a href="track-order.html"
                    class="py-3 text-[13px] font-medium text-slate-700 hover:text-brand-600">Track Order</a>
            </nav>

            <a href="tel:01316690209" class="ml-auto text-[12px] flex items-center gap-2 text-slate-600"><span
                    class="text-brand-600"><svg class="w-4 h-4" viewBox="0 0 24 24" fill="none"
                        stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"
                        aria-hidden="true">
                        <path
                            d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6 19.79 19.79 0 0 1-3.07-8.67A2 2 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72c.127.96.361 1.903.7 2.81a2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45c.907.339 1.85.573 2.81.7A2 2 0 0 1 22 16.92z" />
                    </svg></span>Need Help? <b class="text-brand-700">01316 690 209</b></a>
        </div>
    </div>
</header>
