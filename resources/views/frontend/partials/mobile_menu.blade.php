{{-- ================= Mobile menu drawer =================
     Save as: resources/views/frontend/partials/mobile-menu.blade.php
     Needs $categories (the same variable your header already uses).
     ====================================================== --}}
@php
    $categories = $categories ?? collect();

    $menuLinks = [
        ['Home', route('frontend.home'), 'frontend.home'],
        ['Products', route('frontend.all-products'), 'frontend.all-products'],
        ['Flash Sale', route('frontend.home') . '#flash', null],
        ['Blogs', route('frontend.blogs'), 'frontend.blogs'],
        ['Contact Us', route('frontend.contact-us'), 'frontend.contact-us'],
        ['About Us', route('frontend.about-us'), 'frontend.about-us'],
        ['Track Order', route('frontend.track.order'), 'frontend.track.order'],
    ];
@endphp

<aside id="mobileMenu" class="fixed top-0 left-0 bottom-0 w-[82%] max-w-xs bg-white z-[60] overflow-y-auto"
    aria-label="Mobile menu">

    {{-- Header --}}
    <div class="sticky top-0 z-10 bg-white flex items-center justify-between p-4 border-b border-slate-100">
        <a href="{{ route('frontend.home') }}" class="flex items-center gap-2.5 shrink-0" aria-label="NexioMart home">
            <svg class="w-9 h-9" viewBox="0 0 40 40" aria-hidden="true">
                <rect width="40" height="40" rx="10" fill="#0e7d3b" />
                <path d="M11 29c0-9 5-15 17-16-1 11-6 17-14 17-1 0-2-.3-3-1Z" fill="#fff" />
                <path d="M12 30c4-6 8-9 13-12" stroke="#0e7d3b" stroke-width="1.6" stroke-linecap="round"
                    fill="none" />
            </svg>
            <span class="leading-none">
                <span class="block text-[1.2rem] font-bold text-brand-900">NexioMart</span>
                <span class="block text-[10px] text-slate-500 mt-1">Shop Smart, Live Better</span>
            </span>
        </a>

        <button data-menu-close class="grid place-items-center w-10 h-10 -mr-2 rounded-lg hover:bg-slate-50"
            aria-label="Close menu">
            <svg class="w-6 h-6" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"
                stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                <path d="M18 6 6 18" />
                <path d="m6 6 12 12" />
            </svg>
        </button>
    </div>

    {{-- Main links --}}
    <nav aria-label="Main">
        @foreach ($menuLinks as [$label, $url, $routeName])
            @php($isCurrent = $routeName && request()->routeIs($routeName))
            <a href="{{ $url }}"
                class="flex items-center justify-between px-5 py-3.5 border-b border-slate-100 text-sm font-medium
                       {{ $isCurrent ? 'text-brand-700 bg-brand-50' : 'text-slate-800 active:bg-slate-50' }}"
                @if ($isCurrent) aria-current="page" @endif>
                {{ $label }}
                <svg class="w-4 h-4 text-slate-300" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                    stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                    <path d="m9 18 6-6-6-6" />
                </svg>
            </a>
        @endforeach
    </nav>

    {{-- Categories (dynamic) --}}
    @if ($categories->count())
        <p class="px-5 pt-6 pb-2 text-xs text-slate-500 font-medium">Shop by category</p>

        <nav aria-label="Categories" class="pb-2">
            @foreach ($categories as $category)
                <a href="{{ route('frontend.all-products', ['category' => $category->slug]) }}"
                    class="flex items-center gap-3 px-5 py-2.5 text-sm text-slate-700 active:bg-slate-50">
                    @if (!empty($category->category_image))
                        <img src="{{ uploaded_asset($category->category_image) }}" alt="" loading="lazy"
                            class="w-7 h-7 rounded-full object-cover bg-slate-100 shrink-0">
                    @else
                        <span class="w-7 h-7 rounded-full bg-brand-50 shrink-0"></span>
                    @endif
                    <span class="truncate">{{ $category->category_name }}</span>
                </a>
            @endforeach

            <a href="{{ route('frontend.all-products') }}"
                class="flex items-center gap-2 px-5 py-3 text-sm font-medium text-brand-700">
                View all products
                <svg class="w-4 h-4" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                    stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                    <path d="M5 12h14M13 6l6 6-6 6" />
                </svg>
            </a>
        </nav>
    @endif

    {{-- Account + help --}}
    <div class="mt-2 p-5 border-t border-slate-100 space-y-3"
        style="padding-bottom: calc(1.25rem + env(safe-area-inset-bottom, 0px))">
        @auth
            <a href="{{ route('frontend.profile') }}" class="btn btn-outline w-full">My account</a>
        @else
            <a href="{{ route('frontend.login') }}" class="btn btn-primary w-full">Sign in</a>
        @endauth

        <a href="tel:01316690209" class="flex items-center justify-center gap-2 text-sm text-slate-600">
            Need help? <b class="text-brand-700">{{ get_setting('contact_phone') }}</b>
        </a>
    </div>
</aside>
