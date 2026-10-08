<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>Better Products, Brighter Living | NexioMart</title>
    <meta name="description"
        content="NexioMart – quality products across Bangladesh with cash on delivery and easy returns.">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        [x-cloak] {
            display: none !important;
        }
    </style>
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    fontFamily: {
                        sans: ['Poppins', 'system-ui', 'sans-serif']
                    },
                    colors: {
                        star: '#f5a524',
                        brand: {
                            50: '#eef7f0',
                            100: '#d9eddd',
                            200: '#b5dbbd',
                            500: '#1a9447',
                            600: '#0e7d3b',
                            700: '#0a6530',
                            800: '#0a4a26',
                            900: '#073a1d'
                        }
                    }
                }
            }
        }
    </script>
    <link rel="stylesheet" href="{{ asset('frontend/assets/css/style.css') }}">
</head>

<body class="font-sans text-slate-700 bg-white">
    <div class="bg-brand-900 text-white text-[11px]">
        <div class="container-fluid py-2 flex justify-center md:justify-between gap-6">
            <span class="flex items-center gap-2"><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"
                    aria-hidden="true">
                    <path d="M14 18V6a2 2 0 0 0-2-2H4a2 2 0 0 0-2 2v11a1 1 0 0 0 1 1h2" />
                    <path d="M15 18H9" />
                    <path d="M19 18h2a1 1 0 0 0 1-1v-3.65a1 1 0 0 0-.22-.624l-3.48-4.35A1 1 0 0 0 17.52 8H14" />
                    <circle cx="17" cy="18" r="2" />
                    <circle cx="7" cy="18" r="2" />
                </svg> Delivery Across Bangladesh</span>
            <span class="hidden md:flex items-center gap-2"><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"
                    aria-hidden="true">
                    <rect width="20" height="12" x="2" y="6" rx="2" />
                    <circle cx="12" cy="12" r="2" />
                    <path d="M6 12h.01M18 12h.01" />
                </svg> Cash on Delivery Available</span>
            <span class="hidden md:flex items-center gap-2"><svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"
                    aria-hidden="true">
                    <path d="M3 12a9 9 0 1 0 9-9 9.75 9.75 0 0 0-6.74 2.74L3 8" />
                    <path d="M3 3v5h5" />
                </svg> Easy Return Within 7 Days</span>
        </div>
    </div>
    @include('frontend.partials.header')
    <div id="overlay" class="fixed inset-0 bg-black/50 z-50"></div>
    @include('frontend.partials.mobile_menu')
    <main>
        @yield('content')
    </main>
    @include('frontend.partials.footer')
    <div id="cartOverlay" data-cart-close class="fixed inset-0 bg-black/50 z-[70]"></div>
    <aside id="cartDrawer" role="dialog" aria-modal="true" aria-labelledby="cartTitle"
        class="fixed top-0 right-0 bottom-0 w-full max-w-[420px] bg-white z-[80] flex flex-col shadow-2xl">
        <div class="flex items-center justify-between px-5 py-4 border-b border-slate-100">
            <h2 id="cartTitle" class="font-semibold text-lg text-slate-900 flex items-center gap-2"><svg
                    class="w-5 h-5 text-brand-600" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                    stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                    <path d="M6 2 3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4Z" />
                    <path d="M3 6h18" />
                    <path d="M16 10a4 4 0 0 1-8 0" />
                </svg> Your Cart <span data-cart-count
                    class="text-xs bg-brand-50 text-brand-700 rounded-full px-2 py-0.5 font-semibold">0</span></h2>
            <button data-cart-close class="w-9 h-9 rounded-full hover:bg-slate-100 grid place-items-center"
                aria-label="Close cart"><svg class="w-5 h-5" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                    stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                    <path d="M18 6 6 18" />
                    <path d="m6 6 12 12" />
                </svg></button>
        </div>
        <div data-free-wrap class="px-5 py-3 bg-brand-50/70 border-b border-brand-100 text-xs">
            <p data-free-text class="text-slate-700"></p>
            <div class="h-1.5 rounded-full bg-white mt-2 overflow-hidden">
                <div data-free-bar class="h-full rounded-full bg-brand-600 transition-all duration-500" style="width:0">
                </div>
            </div>
        </div>
        <ul id="drawerItems" class="flex-1 overflow-y-auto px-5"></ul>
        <div id="drawerFoot" class="border-t border-slate-100 p-5 space-y-3 bg-white">
            <div class="flex justify-between text-sm"><span class="text-slate-500">Subtotal</span><b data-subtotal
                    class="text-base text-slate-900">৳0</b></div>
            <p class="text-[11px] text-slate-400">Delivery and coupons are calculated at checkout.</p>
            <div class="grid grid-cols-2 gap-3">
                <a href="{{ route('frontend.cart') }}" class="btn btn-outline !py-3">View Cart</a>
                <a href="{{ route('frontend.checkout') }}" class="btn btn-primary !py-3">Checkout</a>
            </div>
        </div>
    </aside>
    <script src="{{ asset('frontend/assets/js/main.js') }}"></script>
    <script defer src="https://cdn.jsdelivr.net/npm/alpinejs@3.x.x/dist/cdn.min.js"></script>

    <script>
        (function() {
            'use strict';

            const CART_KEY = 'nexio_cart';

            const FALLBACK_IMAGE =
                'data:image/svg+xml;utf8,' +
                encodeURIComponent(
                    '<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 24 24" fill="none" stroke="#94a3b8" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">' +
                    '<rect x="3" y="3" width="18" height="18" rx="2" ry="2"></rect>' +
                    '<circle cx="8.5" cy="8.5" r="1.5"></circle>' +
                    '<polyline points="21 15 16 10 5 21"></polyline>' +
                    '</svg>'
                );

            /* --------------------------------------------------------
               Helpers
               -------------------------------------------------------- */
            function esc(s) {
                return String(s == null ? '' : s).replace(/[&<>"']/g, function(c) {
                    return {
                        '&': '&amp;',
                        '<': '&lt;',
                        '>': '&gt;',
                        '"': '&quot;',
                        "'": '&#39;'
                    } [c];
                });
            }

            function getCart() {
                try {
                    return JSON.parse(localStorage.getItem(CART_KEY)) || [];
                } catch (e) {
                    return [];
                }
            }

            function saveCart(cart) {
                localStorage.setItem(CART_KEY, JSON.stringify(cart));
                updateCartUI();
            }

            /* --------------------------------------------------------
               Cart UI (drawer)
               -------------------------------------------------------- */
            function updateCartUI() {
                const cart = getCart();

                const list = document.getElementById('drawerItems');
                const countEl = document.querySelector('[data-cart-count]');
                const subEl = document.querySelector('[data-subtotal]');

                if (!list) return;

                if (cart.length === 0) {
                    list.innerHTML =
                        '<li class="py-10 text-center text-sm text-slate-400">Your cart is empty</li>';
                    if (countEl) countEl.textContent = '0';
                    if (subEl) subEl.textContent = '৳0';
                    return;
                }

                let totalItems = 0;
                let subtotal = 0;
                let html = '';

                cart.forEach(function(item, index) {
                    const qty = parseInt(item.qty || 1);
                    const price = parseFloat(item.price || 0);
                    const image = esc(item.image || FALLBACK_IMAGE);
                    const variantLabel = esc(item.variantLabel || '');
                    const name = esc(item.name || 'Product');

                    totalItems += qty;
                    subtotal += qty * price;

                    html +=
                        '<li class="flex gap-3 py-4 border-b border-slate-100 last:border-0">' +

                        /* Image */
                        '<div class="w-16 h-16 rounded-lg overflow-hidden bg-slate-100 shrink-0">' +
                        '<img src="' + image + '" alt="' + name +
                        '" class="w-full h-full object-cover" ' +
                        'onerror="this.onerror=null;this.src=\'' + FALLBACK_IMAGE + '\';">' +
                        '</div>' +

                        /* Details */
                        '<div class="flex-1 min-w-0">' +

                        /* Name */
                        '<p class="text-[13px] font-medium text-slate-800 truncate">' +
                        name +
                        '</p>' +

                        /* Variant label */
                        (variantLabel ?
                            '<p class="text-[11px] text-slate-500 mt-0.5">' +
                            variantLabel +
                            '</p>' :
                            '') +

                        /* Unit price */
                        '<p class="text-[12px] text-slate-500 mt-0.5">৳' +
                        price.toLocaleString('en-US') + ' × ' + qty +
                        '</p>' +

                        /* Qty controls + line total */
                        '<div class="flex items-center justify-between mt-2">' +

                        '<div class="flex items-center border border-slate-200 rounded-md overflow-hidden">' +
                        '<button type="button" data-qty-dec="' + index + '" ' +
                        'class="w-7 h-7 grid place-items-center text-slate-600 hover:bg-slate-50" ' +
                        'aria-label="Decrease quantity">' +
                        '<svg class="w-3 h-3" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round">' +
                        '<path d="M5 12h14" />' +
                        '</svg>' +
                        '</button>' +
                        '<span class="w-8 text-center text-[12px] font-semibold text-slate-800 select-none">' +
                        qty +
                        '</span>' +
                        '<button type="button" data-qty-inc="' + index + '" ' +
                        'class="w-7 h-7 grid place-items-center text-slate-600 hover:bg-slate-50" ' +
                        'aria-label="Increase quantity">' +
                        '<svg class="w-3 h-3" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round">' +
                        '<path d="M5 12h14" />' +
                        '<path d="M12 5v14" />' +
                        '</svg>' +
                        '</button>' +
                        '</div>' +

                        '<span class="text-[13px] font-semibold text-brand-700">৳' +
                        (price * qty).toLocaleString('en-US') +
                        '</span>' +

                        '</div>' +

                        /* Remove */
                        '<button type="button" data-remove="' + index + '" ' +
                        'class="text-[11px] text-red-500 hover:underline mt-1.5">Remove</button>' +

                        '</div>' +

                        '</li>';
                });

                list.innerHTML = html;

                if (countEl) countEl.textContent = totalItems;
                if (subEl) subEl.textContent = '৳' + subtotal.toLocaleString('en-US');

                /* Remove */
                list.querySelectorAll('[data-remove]').forEach(function(btn) {
                    btn.addEventListener('click', function() {
                        const idx = parseInt(this.dataset.remove);
                        const cart = getCart();
                        cart.splice(idx, 1);
                        saveCart(cart);
                    });
                });

                /* Increase */
                list.querySelectorAll('[data-qty-inc]').forEach(function(btn) {
                    btn.addEventListener('click', function() {
                        const idx = parseInt(this.dataset.qtyInc);
                        const cart = getCart();
                        if (cart[idx]) {
                            cart[idx].qty = parseInt(cart[idx].qty || 1) + 1;
                            saveCart(cart);
                        }
                    });
                });

                /* Decrease */
                list.querySelectorAll('[data-qty-dec]').forEach(function(btn) {
                    btn.addEventListener('click', function() {
                        const idx = parseInt(this.dataset.qtyDec);
                        const cart = getCart();
                        if (!cart[idx]) return;

                        const currentQty = parseInt(cart[idx].qty || 1);
                        if (currentQty <= 1) {
                            cart.splice(idx, 1);
                        } else {
                            cart[idx].qty = currentQty - 1;
                        }
                        saveCart(cart);
                    });
                });
            }

            /* --------------------------------------------------------
               Global Add-to-Cart handler
               -------------------------------------------------------- */
            document.addEventListener('click', function(e) {
                const addBtn = e.target.closest('[data-add]');
                if (!addBtn) return;

                e.preventDefault();
                if (addBtn.disabled) return;

                /* Variant product on a listing card -> choose the option on the detail page */
                if (addBtn.dataset.hasVariants === '1' && !addBtn.dataset.variantSource) {
                    window.location.href = addBtn.dataset.detailUrl;
                    return;
                }

                const id = String(addBtn.dataset.id);
                const name = addBtn.dataset.name || 'Product';
                const price = parseFloat(addBtn.dataset.price || 0);
                const image = addBtn.dataset.image || '';

                /* Variant is stored on the button by the product page script */
                const variantId = addBtn.dataset.variantId || null;
                const variantLabel = addBtn.dataset.variantLabel || null;

                /* Unique key so the same product with different variants
                   is treated as separate cart lines. */
                const cartKey = variantId ? id + '::' + variantId : id;

                let qty = 1;
                if (addBtn.dataset.qtySrc) {
                    const qtyInput = document.querySelector(addBtn.dataset.qtySrc);
                    if (qtyInput) qty = Math.max(1, parseInt(qtyInput.value || 1));
                }

                const cart = getCart();
                const existing = cart.find(function(item) {
                    return item.cartKey === cartKey;
                });

                if (existing) {
                    existing.qty = parseInt(existing.qty || 1) + qty;
                    existing.price = price; // keep latest displayed price
                    if (!existing.image && image) existing.image = image;
                } else {
                    cart.push({
                        cartKey: cartKey,
                        id: id,
                        variantId: variantId,
                        variantLabel: variantLabel,
                        name: name,
                        price: price,
                        qty: qty,
                        image: image
                    });
                }

                saveCart(cart);

                /* "Buy Now" -> go straight to checkout */
                if (addBtn.hasAttribute('data-buy')) {
                    window.location.href = addBtn.getAttribute('href');
                }
            });

            document.addEventListener('DOMContentLoaded', updateCartUI);

            window.NexioCart = {
                getCart: getCart,
                saveCart: saveCart,
                updateUI: updateCartUI
            };
        })();
    </script>

    @stack('scripts')
</body>

</html>
