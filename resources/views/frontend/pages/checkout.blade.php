@extends('frontend.frrontend_app')

@section('content')
    <section class="container-fluid py-8">
        <div class="flex items-center justify-between mb-6">
            <h1 class="text-2xl font-bold text-slate-900">Checkout</h1>
            <a href="{{ route('frontend.cart') }}" class="text-sm text-brand-600 hover:underline">&larr; Back to cart</a>
        </div>

        <div id="coErrors" class="mb-4 space-y-2"></div>

        <div class="grid lg:grid-cols-3 gap-8">
            {{-- ============ Delivery form ============ --}}
            <form id="checkoutForm" class="lg:col-span-2 card p-5 space-y-5" novalidate>
                <h2 class="font-semibold text-lg">Delivery Information</h2>

                <div class="grid sm:grid-cols-2 gap-4">
                    <div>
                        <label class="label mb-1 block" for="coName">Full Name *</label>
                        <input id="coName" name="name" type="text" required maxlength="100"
                            value="{{ auth()->user()->name ?? '' }}"
                            class="w-full border border-slate-200 rounded-lg px-3 py-2.5 text-sm outline-none focus:border-brand-600">
                    </div>
                    <div>
                        <label class="label mb-1 block" for="coPhone">Mobile Number *</label>
                        <input id="coPhone" name="phone" type="tel" required placeholder="01XXXXXXXXX"
                            value="{{ auth()->user()->phone ?? '' }}"
                            class="w-full border border-slate-200 rounded-lg px-3 py-2.5 text-sm outline-none focus:border-brand-600">
                    </div>
                </div>

                <div>
                    <label class="label mb-1 block" for="coAddress">Full Address *</label>
                    <textarea id="coAddress" name="address" rows="3" required maxlength="500"
                        placeholder="House, road, area, district"
                        class="w-full border border-slate-200 rounded-lg px-3 py-2.5 text-sm outline-none focus:border-brand-600"></textarea>
                </div>

                <div>
                    <p class="label mb-2">Delivery Area *</p>
                    <div class="grid sm:grid-cols-2 gap-3">
                        <label
                            class="flex items-center justify-between border border-slate-200 rounded-lg px-4 py-3 cursor-pointer has-[:checked]:border-brand-600 has-[:checked]:bg-brand-50">
                            <span class="flex items-center gap-2 text-sm">
                                <input type="radio" name="area" value="inside" checked> Inside Dhaka
                            </span>
                            <b class="text-sm">৳{{ $shipping['inside'] }}</b>
                        </label>
                        <label
                            class="flex items-center justify-between border border-slate-200 rounded-lg px-4 py-3 cursor-pointer has-[:checked]:border-brand-600 has-[:checked]:bg-brand-50">
                            <span class="flex items-center gap-2 text-sm">
                                <input type="radio" name="area" value="outside"> Outside Dhaka
                            </span>
                            <b class="text-sm">৳{{ $shipping['outside'] }}</b>
                        </label>
                    </div>
                </div>

                <div>
                    <label class="label mb-1 block" for="coNotes">Order Notes (optional)</label>
                    <textarea id="coNotes" name="notes" rows="2" maxlength="500"
                        class="w-full border border-slate-200 rounded-lg px-3 py-2.5 text-sm outline-none focus:border-brand-600"></textarea>
                </div>

                <div>
                    <p class="label mb-2">Payment Method</p>
                    <div class="flex items-center gap-2 border border-brand-600 bg-brand-50 rounded-lg px-4 py-3 text-sm">
                        <input type="radio" checked disabled> Cash on Delivery
                        <span class="text-slate-500 text-xs ml-1">— pay when you receive</span>
                    </div>
                </div>
            </form>

            {{-- ============ Summary ============ --}}
            <aside class="card p-5 h-fit">
                <h2 class="font-semibold text-lg mb-4">Your Order</h2>
                <ul id="coLines" class="divide-y divide-slate-100 text-sm mb-4"></ul>

                {{-- Coupon --}}
                <div class="mb-4 pt-4 border-t border-slate-100">
                    <label class="label mb-1.5 block" for="couponInput">Have a coupon?</label>
                    <div class="flex gap-2">
                        <input id="couponInput" type="text" maxlength="50" placeholder="Enter code" autocomplete="off"
                            class="flex-1 min-w-0 border border-slate-200 rounded-lg px-3 py-2 text-sm uppercase outline-none focus:border-brand-600 disabled:bg-slate-50 disabled:text-slate-500">
                        <button id="couponBtn" type="button" class="btn btn-outline !py-2 !px-4 text-sm">Apply</button>
                    </div>
                    <p id="couponMsg" class="text-xs mt-1.5"></p>
                </div>

                <div class="space-y-2 text-sm border-t border-slate-100 pt-4">
                    <div class="flex justify-between"><span class="text-slate-500">Subtotal</span><b id="coSub">৳0</b>
                    </div>
                    <div id="coDiscRow" class="flex justify-between text-brand-700" style="display:none">
                        <span id="coDiscLabel">Coupon discount</span><b id="coDisc">-৳0</b>
                    </div>
                    <div class="flex justify-between"><span class="text-slate-500">Delivery</span><b id="coShip">৳0</b>
                    </div>
                    <div class="flex justify-between text-base pt-2 border-t border-slate-100">
                        <span class="font-semibold">Total</span><b id="coTotal" class="text-brand-700">৳0</b>
                    </div>
                </div>

                <button id="placeBtn" type="submit" form="checkoutForm" class="btn btn-primary w-full !py-3 mt-5">
                    Place Order
                </button>
                <p class="text-[11px] text-slate-400 mt-3 text-center">
                    By placing your order you agree to our terms. 7-day easy return.
                </p>
            </aside>
        </div>
    </section>

    @push('scripts')
        <script>
            (function() {
                const SUMMARY_URL = @json(route('frontend.cart.summary'));
                const PLACE_URL = @json(route('frontend.checkout.place'));
                const CART_URL = @json(route('frontend.cart'));
                const CSRF = document.querySelector('meta[name="csrf-token"]').content;
                const CHECKOUT_KEY = 'nexio_checkout'; // keys chosen on the cart page
                const UNSEL_KEY = 'nexio_unselected';
                const COUPON_KEY = 'nexio_coupon';

                const form = document.getElementById('checkoutForm');
                const btn = document.getElementById('placeBtn');
                const couponInput = document.getElementById('couponInput');
                const couponBtn = document.getElementById('couponBtn');
                const couponMsg = document.getElementById('couponMsg');

                const money = n => '৳' + Number(n).toLocaleString('en-US');
                const esc = s => String(s ?? '').replace(/[&<>"']/g, c => ({
                    '&': '&amp;',
                    '<': '&lt;',
                    '>': '&gt;',
                    '"': '&quot;',
                    "'": '&#39;'
                } [c]));
                const area = () => form.querySelector('[name="area"]:checked').value;
                const getCoupon = () => localStorage.getItem(COUPON_KEY) || '';

                /* ---------- Which cart items are being checked out? ---------- */
                function selectedKeys() {
                    try {
                        const raw = sessionStorage.getItem(CHECKOUT_KEY);
                        return raw ? JSON.parse(raw) : null; // null = everything in the cart
                    } catch (e) {
                        return null;
                    }
                }

                function checkoutItems() {
                    const cart = NexioCart.getCart();
                    const keys = selectedKeys();
                    if (!keys) return cart;
                    return cart.filter(i => keys.includes(i.cartKey));
                }

                let hasItems = false;

                function showErrors(list) {
                    document.getElementById('coErrors').innerHTML = list.map(e =>
                        '<div class="text-sm bg-red-50 text-red-700 border border-red-200 rounded-lg px-4 py-2">' +
                        esc(e) + '</div>').join('');
                    if (list.length) window.scrollTo({
                        top: 0,
                        behavior: 'smooth'
                    });
                }

                /* ---------- Coupon UI ---------- */
                function setMsg(text, ok) {
                    couponMsg.textContent = text || '';
                    couponMsg.className = 'text-xs mt-1.5 ' + (ok ? 'text-brand-700' : 'text-red-600');
                }

                function paintCouponBox() {
                    const code = getCoupon();
                    couponInput.value = code;
                    couponInput.disabled = !!code;
                    couponBtn.textContent = code ? 'Remove' : 'Apply';
                }

                couponBtn.addEventListener('click', async function() {
                    if (getCoupon()) { // Remove
                        localStorage.removeItem(COUPON_KEY);
                        setMsg('', true);
                        paintCouponBox();
                        return loadSummary();
                    }
                    const code = couponInput.value.trim().toUpperCase();
                    if (!code) return setMsg('Please enter a coupon code.', false);

                    couponBtn.disabled = true;
                    localStorage.setItem(COUPON_KEY, code);
                    await loadSummary(); // invalid codes are cleared automatically below
                    couponBtn.disabled = false;
                });

                couponInput.addEventListener('keydown', function(e) {
                    if (e.key === 'Enter') {
                        e.preventDefault();
                        couponBtn.click();
                    }
                });

                /* ---------- Summary ---------- */
                async function loadSummary() {
                    const items = checkoutItems();
                    if (!items.length) {
                        window.location.href = CART_URL;
                        return;
                    }

                    let d;
                    try {
                        const res = await fetch(SUMMARY_URL, {
                            method: 'POST',
                            headers: {
                                'Content-Type': 'application/json',
                                'Accept': 'application/json',
                                'X-CSRF-TOKEN': CSRF
                            },
                            body: JSON.stringify({
                                items: items,
                                area: area(),
                                coupon: getCoupon()
                            })
                        });
                        d = await res.json();
                    } catch (e) {
                        return showErrors(['Could not load your order. Please refresh the page.']);
                    }

                    hasItems = d.lines.length > 0;

                    document.getElementById('coLines').innerHTML = d.lines.map(l => `
                        <li class="flex justify-between gap-3 py-2.5">
                            <span class="min-w-0">
                                <span class="block truncate text-slate-800">${esc(l.name)}</span>
                                <span class="text-xs text-slate-500">${l.label ? esc(l.label) + ' · ' : ''}${money(l.price)} × ${l.qty}</span>
                            </span>
                            <b class="shrink-0">${money(l.line_total)}</b>
                        </li>`).join('');

                    /* Coupon result */
                    if (d.coupon) {
                        setMsg('Coupon "' + d.coupon.code + '" applied. You save ' + money(d.coupon.discount) + '.',
                            true);
                    } else if (d.coupon_error) {
                        // A bad coupon must never block the order, so drop it and tell the customer.
                        localStorage.removeItem(COUPON_KEY);
                        setMsg(d.coupon_error + ' The coupon was removed.', false);
                    } else if (!getCoupon()) {
                        setMsg('', true);
                    }
                    paintCouponBox();

                    const discount = Number(d.discount || 0);
                    document.getElementById('coDiscRow').style.display = discount > 0 ? '' : 'none';
                    document.getElementById('coDiscLabel').textContent = d.coupon ? 'Coupon (' + d.coupon.code + ')' :
                        'Coupon discount';
                    document.getElementById('coDisc').textContent = '-' + money(discount);

                    document.getElementById('coSub').textContent = money(d.subtotal);
                    document.getElementById('coShip').textContent = money(d.shipping);
                    document.getElementById('coTotal').textContent = money(d.total);
                    showErrors(d.errors);
                    btn.disabled = !hasItems;
                    btn.classList.toggle('opacity-50', !hasItems);
                }

                form.querySelectorAll('[name="area"]').forEach(r => r.addEventListener('change', loadSummary));

                form.addEventListener('submit', async function(e) {
                    e.preventDefault();
                    showErrors([]);

                    const items = checkoutItems();
                    const el = form.elements;

                    const payload = {
                        name: el['name'].value.trim(),
                        phone: el['phone'].value.trim(),
                        address: el['address'].value.trim(),
                        area: area(),
                        notes: el['notes'].value.trim(),
                        coupon: getCoupon(),
                        items: items
                    };

                    if (!items.length) {
                        window.location.href = CART_URL;
                        return;
                    }

                    if (!payload.name || !payload.phone || !payload.address) {
                        return showErrors(['Please fill in your name, mobile number and address.']);
                    }

                    btn.disabled = true;
                    const original = btn.textContent;
                    btn.textContent = 'Placing order...';

                    try {
                        const res = await fetch(PLACE_URL, {
                            method: 'POST',
                            headers: {
                                'Content-Type': 'application/json',
                                'Accept': 'application/json',
                                'X-CSRF-TOKEN': CSRF
                            },
                            body: JSON.stringify(payload)
                        });
                        const d = await res.json();

                        if (d.success) {
                            /* Remove ONLY the ordered items; the rest stay in the cart */
                            const ordered = new Set(items.map(i => i.cartKey));
                            const remaining = NexioCart.getCart().filter(i => !ordered.has(i.cartKey));
                            NexioCart.saveCart(remaining);
                            sessionStorage.removeItem(CHECKOUT_KEY);
                            sessionStorage.removeItem(UNSEL_KEY);
                            localStorage.removeItem(COUPON_KEY);
                            window.location.href = d.redirect;
                            return;
                        }

                        const msgs = d.errors ? Object.values(d.errors).flat() : [d.message];
                        showErrors(msgs);
                        loadSummary();
                    } catch (err) {
                        showErrors(['Network error. Please check your connection and try again.']);
                    }

                    btn.disabled = false;
                    btn.textContent = original;
                });

                document.addEventListener('DOMContentLoaded', function() {
                    paintCouponBox();
                    loadSummary();
                });
            })();
        </script>
    @endpush
@endsection
