<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Better Products, Brighter Living | NexioMart</title>
    <meta name="description"
        content="NexioMart – quality products across Bangladesh with cash on delivery and easy returns.">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
    <script src="https://cdn.tailwindcss.com"></script>
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
                </svg> Free Delivery Across Bangladesh</span>
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
            <div class="grid grid-cols-2 gap-3"><a href="cart.html" class="btn btn-outline !py-3">View Cart</a><a
                    href="checkout.html" class="btn btn-primary !py-3">Checkout</a></div>
        </div>
    </aside>
    <script src="{{ asset('frontend/assets/js/main.js') }}"></script>
</body>

</html>
