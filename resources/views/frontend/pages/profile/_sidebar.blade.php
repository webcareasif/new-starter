<aside class="card p-4 h-fit">
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

        {{-- ✅ Wishlist link --}}
        <a href="{{ route('frontend.wishlist.index') }}"
            class="block px-3 py-2 rounded-lg {{ request()->routeIs('frontend.wishlist.*') ? 'bg-brand-50 text-brand-700 font-medium' : 'text-slate-600 hover:bg-slate-50' }}">
            My Wishlist
        </a>

        <a href="{{ route('frontend.profile.edit') }}"
            class="block px-3 py-2 rounded-lg {{ request()->routeIs('frontend.profile.edit') ? 'bg-brand-50 text-brand-700 font-medium' : 'text-slate-600 hover:bg-slate-50' }}">
            Edit Profile
        </a>

        <form method="POST" action="{{ route('frontend.logout') }}" class="pt-2 mt-2 border-t border-slate-100">
            @csrf
            <button type="submit" class="w-full text-left px-3 py-2 rounded-lg text-red-600 hover:bg-red-50">
                Logout
            </button>
        </form>
    </nav>
</aside>
