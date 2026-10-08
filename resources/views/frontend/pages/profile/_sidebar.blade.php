<aside class="card p-4 h-fit" x-data="{ showLogoutModal: false }">
    <div class="flex items-center gap-3 px-2 py-3 border-b border-slate-100 mb-2">
        <div class="w-10 h-10 rounded-full bg-brand-100 text-brand-700 grid place-items-center font-semibold">
            {{ strtoupper(substr(auth()->user()->name, 0, 1)) }}
        </div>
        <div class="min-w-0">
            <p class="font-medium text-sm truncate">{{ auth()->user()->name }}</p>
            <p class="text-xs text-slate-500 truncate">{{ auth()->user()->email }}</p>
        </div>
    </div>

    <nav class="space-y-1 text-sm">
        <a href="{{ route('frontend.profile') }}"
            class="block px-3 py-2 rounded-lg {{ request()->routeIs('frontend.profile') ? 'bg-brand-50 text-brand-700 font-medium' : 'text-slate-600 hover:bg-slate-50' }}">
            Dashboard
        </a>

        <a href="{{ route('frontend.profile.orders') }}"
            class="block px-3 py-2 rounded-lg {{ request()->routeIs('frontend.profile.orders', 'frontend.profile.order') ? 'bg-brand-50 text-brand-700 font-medium' : 'text-slate-600 hover:bg-slate-50' }}">
            My Orders
        </a>

        <a href="{{ route('frontend.wishlist.index') }}"
            class="block px-3 py-2 rounded-lg {{ request()->routeIs('frontend.wishlist.*') ? 'bg-brand-50 text-brand-700 font-medium' : 'text-slate-600 hover:bg-slate-50' }}">
            My Wishlist
        </a>

        <a href="{{ route('frontend.profile.edit') }}"
            class="block px-3 py-2 rounded-lg {{ request()->routeIs('frontend.profile.edit') ? 'bg-brand-50 text-brand-700 font-medium' : 'text-slate-600 hover:bg-slate-50' }}">
            Edit Profile
        </a>

        {{-- Logout trigger (no longer a form) --}}
        <div class="pt-2 mt-2 border-t border-slate-100">
            <button type="button" @click="showLogoutModal = true"
                class="w-full text-left px-3 py-2 rounded-lg text-red-600 hover:bg-red-50">
                Logout
            </button>
        </div>
    </nav>

    {{-- ===== Logout Confirmation Modal ===== --}}
    <div x-show="showLogoutModal" x-cloak x-transition.opacity
        class="fixed inset-0 z-50 flex items-center justify-center p-4" role="dialog" aria-modal="true"
        aria-labelledby="logout-modal-title">

        {{-- Backdrop --}}
        <div class="absolute inset-0 bg-slate-900/50" @click="showLogoutModal = false" x-transition.opacity></div>

        {{-- Modal panel --}}
        <div class="relative bg-white rounded-2xl shadow-xl w-full max-w-sm p-6" x-transition.scale.origin.center
            @keydown.escape.window="showLogoutModal = false">

            <div class="flex items-start gap-3">
                <div class="w-10 h-10 rounded-full bg-red-100 text-red-600 grid place-items-center shrink-0">
                    <svg class="w-5 h-5" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                        stroke-linecap="round" stroke-linejoin="round">
                        <path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4" />
                        <polyline points="16 17 21 12 16 7" />
                        <line x1="21" y1="12" x2="9" y2="12" />
                    </svg>
                </div>
                <div>
                    <h3 id="logout-modal-title" class="font-semibold text-slate-900">
                        Confirm Logout
                    </h3>
                    <p class="text-sm text-slate-500 mt-1">
                        Are you sure you want to log out of your account?
                    </p>
                </div>
            </div>

            <div class="flex gap-3 mt-6">
                <button type="button" @click="showLogoutModal = false"
                    class="flex-1 px-4 py-2.5 rounded-lg border border-slate-200 text-slate-700 text-sm font-medium hover:bg-slate-50">
                    Cancel
                </button>

                <form method="POST" action="{{ route('frontend.logout') }}" class="flex-1">
                    @csrf
                    <button type="submit"
                        class="w-full px-4 py-2.5 rounded-lg bg-red-600 text-white text-sm font-medium hover:bg-red-700">
                        Yes, Logout
                    </button>
                </form>
            </div>
        </div>
    </div>
</aside>
