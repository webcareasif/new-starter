<header class="sticky top-0 z-40 bg-white border-b border-slate-100">
    <div class="container-fluid h-[64px] sm:h-[68px] flex items-center gap-2 sm:gap-4 lg:gap-8">

        {{-- Menu (mobile / tablet) --}}
        <button data-menu-open class="lg:hidden grid place-items-center w-10 h-10 -ml-2 rounded-lg hover:bg-slate-50"
            aria-label="Open menu">
            <svg class="w-6 h-6" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"
                stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                <line x1="4" x2="20" y1="12" y2="12" />
                <line x1="4" x2="20" y1="6" y2="6" />
                <line x1="4" x2="20" y1="18" y2="18" />
            </svg>
        </button>

        {{-- Logo --}}
        <a href="{{ route('frontend.home') }}" class="flex items-center gap-3 shrink-0"
            aria-label="{{ get_setting('website_name') ?? 'Home' }}">

            <img src="{{ uploaded_asset(get_setting('header_logo')) }}"
                alt="{{ get_setting('website_name') ?? 'Website Logo' }}"
                class="w-auto h-12 sm:h-14 md:h-16 object-contain">

        </a>

        {{-- DESKTOP SEARCH (autocomplete) --}}
        @include('frontend.partials.search-box', [
            'inputId' => 'q',
            'formClass' => 'hidden md:flex flex-1 max-w-xl mx-auto',
            'inputClass' => '!py-2.5 !text-[13px] bg-slate-50',
        ])

        {{-- ================= Utility icons ================= --}}
        <div class="ml-auto flex items-center sm:gap-1 text-[11px] text-slate-600">

            {{-- Account: hidden on mobile (it lives in the bottom bar) --}}
            @auth
                <a href="{{ route('frontend.profile') }}"
                    class="hidden md:flex flex-col items-center justify-center min-w-10 min-h-10 px-2 hover:text-brand-600"
                    title="{{ auth()->user()->name }}">
                    <svg class="w-[22px] h-[22px]" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                        stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                        <path d="M19 21v-2a4 4 0 0 0-4-4H9a4 4 0 0 0-4 4v2" />
                        <circle cx="12" cy="7" r="4" />
                    </svg>
                    <span class="hidden sm:block">Account</span>
                </a>
            @else
                <a href="{{ route('frontend.login') }}"
                    class="hidden md:flex flex-col items-center justify-center min-w-10 min-h-10 px-2 hover:text-brand-600">
                    <svg class="w-[22px] h-[22px]" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                        stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                        <path d="M19 21v-2a4 4 0 0 0-4-4H9a4 4 0 0 0-4 4v2" />
                        <circle cx="12" cy="7" r="4" />
                    </svg>
                    <span class="hidden sm:block">Sign in</span>
                </a>
            @endauth

            {{-- Wishlist --}}
            <a href="{{ route('frontend.wishlist.index') }}"
                class="relative flex flex-col items-center justify-center min-w-10 min-h-10 px-2 hover:text-brand-600"
                title="Wishlist" aria-label="Wishlist">
                <svg class="w-[22px] h-[22px]" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                    stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                    <path
                        d="M19 14c1.49-1.46 3-3.21 3-5.5A5.5 5.5 0 0 0 16.5 3c-1.76 0-3 .5-4.5 2-1.5-1.5-2.74-2-4.5-2A5.5 5.5 0 0 0 2 8.5c0 2.3 1.5 4.05 3 5.5l7 7Z" />
                </svg>
                <span class="hidden sm:block">Wishlist</span>
                <b class="js-wish-count hidden absolute top-0 right-1 bg-brand-600 text-white text-[9px] w-4 h-4 rounded-full grid place-items-center"
                    data-initial="{{ $wishlistCount ?? 0 }}">{{ $wishlistCount ?? 0 }}</b>
            </a>

            {{-- Cart (opens the cart drawer) --}}
            <a href="{{ route('frontend.cart') }}" data-cart-open
                class="relative flex flex-col items-center justify-center min-w-10 min-h-10 px-2 hover:text-brand-600"
                aria-haspopup="dialog" aria-label="Cart">
                <svg class="w-[22px] h-[22px]" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                    stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                    <circle cx="8" cy="21" r="1" />
                    <circle cx="19" cy="21" r="1" />
                    <path d="M2.05 2.05h2l2.66 12.42a2 2 0 0 0 2 1.58h9.78a2 2 0 0 0 1.95-1.57l1.65-7.43H5.12" />
                </svg>
                <span class="hidden sm:block">Cart</span>
                <b data-cart-count
                    class="absolute top-0 right-1 bg-brand-600 text-white text-[9px] w-4 h-4 rounded-full grid place-items-center hidden">0</b>
            </a>

            {{-- Track order: plain link (it was wrongly opening the cart drawer and showing a cart badge) --}}
            <a href="{{ route('frontend.track.order') }}"
                class="hidden md:flex flex-col items-center justify-center min-w-10 min-h-10 px-2 hover:text-brand-600
                       {{ request()->routeIs('frontend.track.order') ? 'text-brand-600' : '' }}"
                title="Track order" aria-label="Track order">
                <svg class="w-[22px] h-[22px]" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                    stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                    <path d="M3 7h11v9H3Z" />
                    <path d="M14 10h4l3 3v3h-7Z" />
                    <circle cx="7" cy="17.5" r="1.7" />
                    <circle cx="17" cy="17.5" r="1.7" />
                </svg>
                <span class="hidden sm:block">Track</span>
            </a>
        </div>
    </div>

    {{-- MOBILE SEARCH (autocomplete) --}}
    <div class="md:hidden px-4 pb-3">
        @include('frontend.partials.search-box', [
            'inputId' => 'q-mobile',
            'formClass' => 'flex',
            'inputClass' => '!py-2 !text-[13px]',
        ])
    </div>

    {{-- ================= Desktop nav bar ================= --}}
    <div class="hidden lg:block border-t border-slate-100">
        <div class="container-fluid flex items-center gap-8">
            @if (!request()->routeIs('frontend.home'))
                <div class="dd-wrap relative">
                    <button class="btn btn-primary !rounded-lg !py-2 !px-4 !text-[13px] my-1.5" aria-haspopup="true">
                        <svg class="w-4 h-4" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                            stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                            <rect width="7" height="7" x="3" y="3" rx="1" />
                            <rect width="7" height="7" x="14" y="3" rx="1" />
                            <rect width="7" height="7" x="14" y="14" rx="1" />
                            <rect width="7" height="7" x="3" y="14" rx="1" />
                        </svg>
                        All Categories
                        <svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                            stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                            <path d="m6 9 6 6 6-6" />
                        </svg>
                    </button>
                    <div
                        class="dd absolute left-0 top-full w-60 bg-white border border-slate-100 rounded-xl shadow-xl py-2 z-50">
                        @foreach ($categories as $category)
                            <a href="{{ route('frontend.all-products', ['category' => $category->slug]) }}"
                                class="flex items-center gap-3 px-4 py-2.5 text-sm hover:bg-brand-50 hover:text-brand-700">
                                <img src="{{ uploaded_asset($category->category_image) }}" alt=""
                                    class="w-5 h-5 object-cover rounded-full">
                                {{ $category->category_name }}
                            </a>
                        @endforeach
                    </div>
                </div>
            @endif

            @php
                $navLinks = [
                    ['Home', 'frontend.home'],
                    ['Products', 'frontend.all-products'],
                    ['Blogs', 'frontend.blogs'],
                    ['Contact Us', 'frontend.contact-us'],
                    ['About Us', 'frontend.about-us'],
                    ['Track Order', 'frontend.track.order'],
                ];
            @endphp

            <nav class="flex items-center gap-7" aria-label="Main">
                @foreach ($navLinks as [$label, $routeName])
                    @php($isCurrent = request()->routeIs($routeName))
                    <a href="{{ route($routeName) }}"
                        class="py-3 text-[13px] font-medium {{ $isCurrent ? 'text-brand-600' : 'text-slate-700 hover:text-brand-600' }}"
                        @if ($isCurrent) aria-current="page" @endif>{{ $label }}</a>
                @endforeach
            </nav>

            <a href="tel:01316690209" class="ml-auto text-[12px] flex items-center gap-2 text-slate-600">
                <svg class="w-4 h-4 text-brand-600" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                    stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                    <path
                        d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6 19.79 19.79 0 0 1-3.07-8.67A2 2 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72c.127.96.361 1.903.7 2.81a2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45c.907.339 1.85.573 2.81.7A2 2 0 0 1 22 16.92z" />
                </svg>
                Need Help? <b class="text-brand-700">{{ get_setting('contact_phone') }}</b>
            </a>
        </div>
    </div>
</header>

{{-- ============================================================
     SEARCH AUTOCOMPLETE SCRIPT (with Add to Cart)
============================================================ --}}
<script>
    (function() {
        const ENDPOINT = @json(route('frontend.search-suggestions'));
        const MIN_CHARS = 2;
        const DELAY = 250;

        const esc = s => String(s ?? '').replace(/[&<>"']/g, c => ({
            '&': '&amp;',
            '<': '&lt;',
            '>': '&gt;',
            '"': '&quot;',
            "'": '&#39;'
        } [c]));

        const money = n => '৳' + Number(n).toLocaleString('en-US');

        function highlight(text, q) {
            const i = text.toLowerCase().indexOf(q.toLowerCase());
            if (i < 0) return esc(text);
            return esc(text.slice(0, i)) +
                '<mark class="bg-transparent text-brand-700 font-semibold">' +
                esc(text.slice(i, i + q.length)) + '</mark>' +
                esc(text.slice(i + q.length));
        }

        function init(form) {
            const input = form.querySelector('[data-search-input]');
            const box = form.querySelector('[data-search-dropdown]');
            let timer = null,
                controller = null,
                items = [],
                active = -1;

            const open = () => {
                box.classList.remove('hidden');
                input.setAttribute('aria-expanded', 'true');
            };
            const close = () => {
                box.classList.add('hidden');
                input.setAttribute('aria-expanded', 'false');
                active = -1;
            };

            function setActive(i) {
                const links = box.querySelectorAll('[data-item]');
                links.forEach(l => l.parentElement.classList.remove('bg-brand-50'));
                active = i;
                if (i >= 0 && links[i]) {
                    links[i].parentElement.classList.add('bg-brand-50');
                    links[i].scrollIntoView({
                        block: 'nearest'
                    });
                }
            }

            function message(text) {
                box.innerHTML = '<div class="px-4 py-5 text-sm text-slate-500 text-center">' + esc(text) + '</div>';
                open();
            }

            function render(data, q) {
                items = data.items || [];
                if (!items.length) return message('No products found for "' + q + '"');

                const rows = items.map(p => {
                    const img = p.image ?
                        '<img src="' + esc(p.image) +
                        '" alt="" width="48" height="48" loading="lazy" class="w-12 h-12 rounded-lg object-cover bg-slate-100 shrink-0">' :
                        '<span class="w-12 h-12 rounded-lg bg-slate-100 shrink-0"></span>';

                    const old = p.regular ?
                        '<span class="text-xs text-slate-400 line-through ml-1.5">' + money(p.regular) +
                        '</span>' : '';

                    const cat = p.category ?
                        '<p class="text-[11px] text-slate-400 truncate">' + esc(p.category) + '</p>' : '';

                    let action;
                    if (!p.in_stock) {
                        action =
                            '<span class="text-[11px] text-red-500 font-medium whitespace-nowrap">Out of stock</span>';
                    } else if (p.has_variants) {
                        action = '<a href="' + esc(p.url) +
                            '" class="px-3 py-1.5 rounded-lg border border-slate-200 text-[12px] font-medium text-slate-700 hover:border-brand-600 hover:text-brand-700 whitespace-nowrap">Select options</a>';
                    } else {
                        action = '<button type="button" data-add data-search-add' +
                            ' data-id="' + esc(p.id) + '"' +
                            ' data-name="' + esc(p.name) + '"' +
                            ' data-price="' + esc(p.price) + '"' +
                            ' data-image="' + esc(p.image || '') + '"' +
                            ' class="btn btn-primary btn-sm whitespace-nowrap">Add to cart</button>';
                    }

                    return '<div class="flex items-center gap-2 pr-3 hover:bg-brand-50 transition" role="option">' +
                        '<a data-item href="' + esc(p.url) +
                        '" class="flex items-center gap-3 pl-3 py-2.5 flex-1 min-w-0">' +
                        img +
                        '<span class="min-w-0 flex-1">' +
                        '<p class="text-[13px] text-slate-800 leading-snug line-clamp-2">' + highlight(p
                            .name, q) + '</p>' +
                        cat +
                        '<p class="text-sm font-bold text-brand-700 mt-0.5">' + money(p.price) + old +
                        '</p>' +
                        '</span>' +
                        '</a>' +
                        action +
                        '</div>';
                }).join('');

                const allUrl = form.action + '?q=' + encodeURIComponent(q);
                const footer = '<a href="' + esc(allUrl) +
                    '" class="block text-center text-[13px] font-medium text-brand-700 bg-slate-50 hover:bg-brand-50 py-2.5 border-t border-slate-100">' +
                    'View all ' + data.total + ' result' + (data.total === 1 ? '' : 's') + '</a>';

                box.innerHTML = rows + footer;
                active = -1;
                open();
            }

            async function search(q) {
                if (controller) controller.abort();
                controller = new AbortController();
                // Only show "Searching…" when nothing is on screen, so results don't flicker while typing
                if (box.classList.contains('hidden')) message('Searching…');
                try {
                    const res = await fetch(ENDPOINT + '?q=' + encodeURIComponent(q), {
                        signal: controller.signal,
                        headers: {
                            'Accept': 'application/json',
                            'X-Requested-With': 'XMLHttpRequest'
                        }
                    });
                    if (!res.ok) throw new Error('bad response');
                    render(await res.json(), q);
                } catch (e) {
                    if (e.name !== 'AbortError') message('Something went wrong. Please try again.');
                }
            }

            input.addEventListener('input', function() {
                const q = this.value.trim();
                clearTimeout(timer);
                if (q.length < MIN_CHARS) {
                    if (controller) controller.abort();
                    items = [];
                    close();
                    return;
                }
                timer = setTimeout(() => search(q), DELAY);
            });

            input.addEventListener('focus', function() {
                if (items.length && this.value.trim().length >= MIN_CHARS) open();
            });

            input.addEventListener('keydown', function(e) {
                if (box.classList.contains('hidden')) return;
                const count = items.length;
                if (e.key === 'ArrowDown') {
                    e.preventDefault();
                    setActive(count ? (active + 1) % count : -1);
                } else if (e.key === 'ArrowUp') {
                    e.preventDefault();
                    setActive(count ? (active - 1 + count) % count : -1);
                } else if (e.key === 'Enter' && active >= 0 && items[active]) {
                    e.preventDefault();
                    window.location.href = items[active].url;
                } else if (e.key === 'Escape') {
                    close();
                }
            });

            // Visual feedback after clicking "Add" in the dropdown
            box.addEventListener('click', function(e) {
                const btn = e.target.closest('[data-search-add]');
                if (!btn) return;
                const label = btn.textContent;
                btn.textContent = 'Added ✓';
                setTimeout(() => {
                    btn.textContent = label;
                }, 1200);
            });

            document.addEventListener('click', e => {
                if (!form.contains(e.target)) close();
            });
        }

        document.querySelectorAll('[data-search-form]').forEach(init);
    })();
</script>
