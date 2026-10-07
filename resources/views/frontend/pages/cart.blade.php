@extends('frontend.frrontend_app')

@section('content')
    <section class="container-fluid py-8">
        <h1 class="text-2xl font-bold text-slate-900 mb-6">Shopping Cart</h1>

        <div id="cartErrors" class="mb-4 space-y-2"></div>

        <div class="grid lg:grid-cols-3 gap-8">
            <div class="lg:col-span-2">
                {{-- Select all bar --}}
                <div id="selectBar" class="card px-4 py-3 mb-3 flex items-center justify-between" style="display:none">
                    <label class="flex items-center gap-2.5 text-sm font-medium text-slate-700 cursor-pointer">
                        <input id="selectAll" type="checkbox" class="w-4 h-4 accent-[#0e7d3b]">
                        Select all (<span id="totalCount">0</span> items)
                    </label>
                    <span class="text-xs text-slate-400">Only selected items go to checkout</span>
                </div>

                <ul id="cartLines" class="card divide-y divide-slate-100 px-4"></ul>
            </div>

            <aside class="card p-5 h-fit">
                <h2 class="font-semibold text-lg mb-4">Order Summary</h2>
                <div class="flex justify-between text-sm mb-2">
                    <span class="text-slate-500">Selected items</span><b id="sumCount">0</b>
                </div>
                <div class="flex justify-between text-sm mb-2">
                    <span class="text-slate-500">Subtotal</span><b id="sumSub">৳0</b>
                </div>
                <p class="text-xs text-slate-400 mb-4">Delivery charge is calculated at checkout.</p>
                <a id="checkoutBtn" href="{{ route('frontend.checkout') }}" class="btn btn-primary w-full !py-3">
                    Proceed to Checkout
                </a>
                <a href="{{ route('frontend.all-products') }}"
                    class="block text-center text-sm text-brand-600 mt-3 hover:underline">Continue shopping</a>
            </aside>
        </div>
    </section>

    @push('scripts')
        <script>
            (function() {
                const SUMMARY_URL = @json(route('frontend.cart.summary'));
                const CSRF = document.querySelector('meta[name="csrf-token"]').content;
                const UNSEL_KEY = 'nexio_unselected'; // keys the user unticked (new items default to selected)
                const CHECKOUT_KEY = 'nexio_checkout'; // keys sent to checkout

                const money = n => '৳' + Number(n).toLocaleString('en-US');
                const esc = s => String(s ?? '').replace(/[&<>"']/g, c => ({
                    '&': '&amp;',
                    '<': '&lt;',
                    '>': '&gt;',
                    '"': '&quot;',
                    "'": '&#39;'
                } [c]));

                let lines = [];

                /* ---------------- selection state ---------------- */
                function getUnselected() {
                    try {
                        return new Set(JSON.parse(sessionStorage.getItem(UNSEL_KEY)) || []);
                    } catch (e) {
                        return new Set();
                    }
                }

                function saveUnselected(set) {
                    sessionStorage.setItem(UNSEL_KEY, JSON.stringify([...set]));
                }

                function selectedLines() {
                    const un = getUnselected();
                    return lines.filter(l => !un.has(l.key));
                }

                /* ---------------- load from server ---------------- */
                async function load() {
                    const cart = NexioCart.getCart();
                    if (!cart.length) {
                        lines = [];
                        return render([]);
                    }

                    let data;
                    try {
                        const res = await fetch(SUMMARY_URL, {
                            method: 'POST',
                            headers: {
                                'Content-Type': 'application/json',
                                'Accept': 'application/json',
                                'X-CSRF-TOKEN': CSRF
                            },
                            body: JSON.stringify({
                                items: cart
                            })
                        });
                        data = await res.json();
                    } catch (e) {
                        return render([], ['Could not load your cart. Please refresh the page.']);
                    }

                    /* Sync localStorage with the server's truth (drop dead items, fix qty/price) */
                    const synced = data.lines.map(l => ({
                        cartKey: l.key,
                        id: String(l.product_id),
                        variantId: l.variant_id,
                        variantLabel: l.label,
                        name: l.name,
                        price: l.price,
                        qty: l.qty,
                        image: l.image || ''
                    }));
                    localStorage.setItem('nexio_cart', JSON.stringify(synced));
                    NexioCart.updateUI();

                    lines = data.lines;
                    render(data.errors);
                }

                /* ---------------- render ---------------- */
                function render(errors) {
                    errors = errors || [];
                    const list = document.getElementById('cartLines');
                    const un = getUnselected();

                    document.getElementById('cartErrors').innerHTML = errors.map(e =>
                        '<div class="text-sm bg-amber-50 text-amber-800 border border-amber-200 rounded-lg px-4 py-2">' +
                        esc(e) + '</div>').join('');

                    document.getElementById('selectBar').style.display = lines.length ? '' : 'none';
                    document.getElementById('totalCount').textContent = lines.length;

                    if (!lines.length) {
                        list.innerHTML = '<li class="py-14 text-center text-slate-400">Your cart is empty</li>';
                        updateSummary();
                        return;
                    }

                    list.innerHTML = lines.map(l => `
                    <li class="flex gap-3 sm:gap-4 py-4 items-start">
                        <input type="checkbox" data-sel="${esc(l.key)}" ${un.has(l.key) ? '' : 'checked'}
                            class="w-4 h-4 mt-8 shrink-0 accent-[#0e7d3b] cursor-pointer" aria-label="Select ${esc(l.name)}">
                        <a href="/product/${esc(l.slug)}" class="w-20 h-20 rounded-lg overflow-hidden bg-slate-100 shrink-0">
                            ${l.image ? `<img src="${esc(l.image)}" alt="" class="w-full h-full object-cover">` : ''}
                        </a>
                        <div class="flex-1 min-w-0">
                            <a href="/product/${esc(l.slug)}" class="text-sm font-medium text-slate-800 hover:text-brand-600">${esc(l.name)}</a>
                            ${l.label ? `<p class="text-xs text-slate-500 mt-0.5">${esc(l.label)}</p>` : ''}
                            <p class="text-xs text-slate-500 mt-0.5">${money(l.price)} each</p>
                            <div class="flex items-center justify-between mt-3">
                                <div class="flex items-center border border-slate-200 rounded-md overflow-hidden">
                                    <button type="button" data-dec="${esc(l.key)}" class="w-8 h-8 grid place-items-center hover:bg-slate-50" aria-label="Decrease">−</button>
                                    <span class="w-10 text-center text-sm font-semibold">${l.qty}</span>
                                    <button type="button" data-inc="${esc(l.key)}" class="w-8 h-8 grid place-items-center hover:bg-slate-50 disabled:opacity-40" aria-label="Increase" ${l.qty >= l.stock ? 'disabled' : ''}>+</button>
                                </div>
                                <b class="text-brand-700">${money(l.line_total)}</b>
                            </div>
                            <button type="button" data-rm="${esc(l.key)}" class="text-xs text-red-500 hover:underline mt-2">Remove</button>
                        </div>
                    </li>`).join('');

                    updateSummary();
                }

                /* Summary + select-all state (no full re-render needed) */
                function updateSummary() {
                    const sel = selectedLines();
                    const subtotal = sel.reduce((s, l) => s + l.line_total, 0);
                    const itemCount = sel.reduce((s, l) => s + l.qty, 0);

                    document.getElementById('sumCount').textContent = sel.length + (sel.length === 1 ? ' product' :
                        ' products') + ' (' + itemCount + ' pcs)';
                    document.getElementById('sumSub').textContent = money(subtotal);

                    const all = document.getElementById('selectAll');
                    all.checked = lines.length > 0 && sel.length === lines.length;
                    all.indeterminate = sel.length > 0 && sel.length < lines.length;

                    const btn = document.getElementById('checkoutBtn');
                    const disabled = sel.length === 0;
                    btn.classList.toggle('opacity-50', disabled);
                    btn.classList.toggle('pointer-events-none', disabled);
                    btn.textContent = disabled ? 'Select items to checkout' : 'Proceed to Checkout (' + sel.length + ')';
                }

                /* ---------------- cart mutations ---------------- */
                function mutate(key, fn) {
                    const cart = NexioCart.getCart();
                    const i = cart.findIndex(x => x.cartKey === key);
                    if (i < 0) return;
                    fn(cart, i);
                    NexioCart.saveCart(cart);
                    load();
                }

                const listEl = document.getElementById('cartLines');

                listEl.addEventListener('click', e => {
                    const t = e.target.closest('button');
                    if (!t) return;
                    if (t.dataset.inc) mutate(t.dataset.inc, (c, i) => c[i].qty = parseInt(c[i].qty) + 1);
                    if (t.dataset.dec) mutate(t.dataset.dec, (c, i) => {
                        if (parseInt(c[i].qty) <= 1) c.splice(i, 1);
                        else c[i].qty = parseInt(c[i].qty) - 1;
                    });
                    if (t.dataset.rm) mutate(t.dataset.rm, (c, i) => c.splice(i, 1));
                });

                /* Single product checkbox */
                listEl.addEventListener('change', e => {
                    const cb = e.target.closest('[data-sel]');
                    if (!cb) return;
                    const un = getUnselected();
                    if (cb.checked) un.delete(cb.dataset.sel);
                    else un.add(cb.dataset.sel);
                    saveUnselected(un);
                    updateSummary();
                });

                /* Select all */
                document.getElementById('selectAll').addEventListener('change', function() {
                    const un = getUnselected();
                    lines.forEach(l => this.checked ? un.delete(l.key) : un.add(l.key));
                    saveUnselected(un);
                    listEl.querySelectorAll('[data-sel]').forEach(cb => cb.checked = this.checked);
                    updateSummary();
                });

                /* Proceed: remember exactly which items go to checkout */
                document.getElementById('checkoutBtn').addEventListener('click', e => {
                    const sel = selectedLines();
                    if (!sel.length) {
                        e.preventDefault();
                        return;
                    }
                    sessionStorage.setItem(CHECKOUT_KEY, JSON.stringify(sel.map(l => l.key)));
                });

                document.addEventListener('DOMContentLoaded', load);
            })();
        </script>
    @endpush
@endsection
