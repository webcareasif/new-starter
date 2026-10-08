{{-- ================= Mobile bottom navigation =================
     Save as: resources/views/frontend/partials/mobile-bottom-nav.blade.php
     Include once in the layout, just before </body>:
         @include('frontend.partials.mobile-bottom-nav')

     Uses the same hooks as the header, so your existing JS drives it:
       data-menu-open  -> opens the mobile category menu
       data-cart-open  -> opens the cart drawer
       data-cart-count -> live cart badge
     ============================================================ --}}
@php
    $isHome = request()->routeIs('frontend.home');
    $isTrack = request()->routeIs('frontend.track.order');
    $isAccount = request()->routeIs('frontend.profile*', 'frontend.login*', 'frontend.register*');
@endphp

<nav id="bottomNav" class="md:hidden fixed inset-x-0 bottom-0 z-40 bg-white/95 backdrop-blur border-t border-slate-200"
    aria-label="Quick navigation">
    <ul class="grid grid-cols-5">

        {{-- Home --}}
        <li>
            <a href="{{ route('frontend.home') }}" class="bn-item {{ $isHome ? 'is-active' : '' }}"
                @if ($isHome) aria-current="page" @endif>
                <svg class="w-6 h-6" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"
                    stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                    <path d="m3 10.5 9-7 9 7V20a1 1 0 0 1-1 1h-5v-6h-6v6H4a1 1 0 0 1-1-1Z" />
                </svg>
                <span>Home</span>
            </a>
        </li>

        {{-- Categories --}}
        <li>
            <button type="button" data-menu-open class="bn-item w-full" aria-label="Browse categories">
                <svg class="w-6 h-6" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"
                    stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                    <rect x="3" y="3" width="7" height="7" rx="1.5" />
                    <rect x="14" y="3" width="7" height="7" rx="1.5" />
                    <rect x="3" y="14" width="7" height="7" rx="1.5" />
                    <rect x="14" y="14" width="7" height="7" rx="1.5" />
                </svg>
                <span>Categories</span>
            </button>
        </li>

        {{-- Cart --}}
        <li>
            <a href="{{ route('frontend.cart') }}" data-cart-open class="bn-item" aria-haspopup="dialog"
                aria-label="Open cart">
                <span class="relative">
                    <svg class="w-6 h-6" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"
                        stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                        <path d="M6 7h12l-1 13H7Z" />
                        <path d="M9 7a3 3 0 0 1 6 0" />
                    </svg>
                    <b class="bn-badge hidden" data-cart-count>0</b>
                </span>
                <span>Cart</span>
            </a>
        </li>

        {{-- Track order --}}
        <li>
            <a href="{{ route('frontend.track.order') }}" class="bn-item {{ $isTrack ? 'is-active' : '' }}"
                @if ($isTrack) aria-current="page" @endif>
                <svg class="w-6 h-6" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"
                    stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                    <path d="M3 7h11v9H3Z" />
                    <path d="M14 10h4l3 3v3h-7Z" />
                    <circle cx="7" cy="17.5" r="1.7" />
                    <circle cx="17" cy="17.5" r="1.7" />
                </svg>
                <span>Track</span>
            </a>
        </li>

        {{-- Account --}}
        <li>
            <a href="{{ auth()->check() ? route('frontend.profile') : route('frontend.login') }}"
                class="bn-item {{ $isAccount ? 'is-active' : '' }}"
                @if ($isAccount) aria-current="page" @endif>
                <svg class="w-6 h-6" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"
                    stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                    <circle cx="12" cy="8" r="4" />
                    <path d="M4 21a8 8 0 0 1 16 0" />
                </svg>
                <span>{{ auth()->check() ? 'Account' : 'Sign in' }}</span>
            </a>
        </li>
    </ul>
</nav>
