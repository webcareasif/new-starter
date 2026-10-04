/* NexioMart – vanilla JS */
(function () {
  const $ = (s, r = document) => r.querySelector(s), $$ = (s, r = document) => [...r.querySelectorAll(s)];
  const money = n => '৳' + Math.round(n).toLocaleString('en-US');
  const esc = s => String(s).replace(/[&<>"]/g, c => ({ '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;' }[c]));

  /* ---------- Toast ---------- */
  function toast(msg) {
    let t = $('#toast'); if (!t) { t = document.createElement('div'); t.id = 'toast'; document.body.appendChild(t) }
    t.textContent = msg; t.classList.add('show'); clearTimeout(t._h); t._h = setTimeout(() => t.classList.remove('show'), 2200)
  }

  /* ---------- Mobile menu ---------- */
  const mm = $('#mobileMenu'), ov = $('#overlay');
  function menu(open) { mm && mm.classList.toggle('open', open); ov && ov.classList.toggle('open', open); document.body.style.overflow = open ? 'hidden' : '' }
  $$('[data-menu-open]').forEach(b => b.addEventListener('click', () => menu(true)));
  $$('[data-menu-close]').forEach(b => b.addEventListener('click', () => menu(false)));
  ov && ov.addEventListener('click', () => menu(false));

  /* ======================================================
     CART  (front-end demo – stored in localStorage)
     Replace read()/write() with API calls for a real shop.
     ====================================================== */
  const FREE_SHIP = 3000, BASE_FEE = 60, SEED_DEMO = true;   // set SEED_DEMO=false for an empty cart on first visit
  const COUPONS = { NEXIO10: { type: 'pct', v: 10, label: '10% off' }, WELCOME100: { type: 'flat', v: 100, label: '৳100 off' } };
  const KEY = 'nm_cart_v2'; let mem = null;
  const read = () => { try { const r = localStorage.getItem(KEY); if (r) return JSON.parse(r) } catch (e) { } return mem };
  const write = s => { mem = s; try { localStorage.setItem(KEY, JSON.stringify(s)) } catch (e) { } };
  let state = read();
  if (!state) {
    state = {
      items: SEED_DEMO ? [
        { id: 0, name: 'T800 Ultra Smart Watch (Original)', price: 1499, emoji: '⌚', c1: '#eceff1', c2: '#dde2e5', qty: 1 },
        { id: 1, name: 'Airdots Pro Wireless Earbuds', price: 1299, emoji: '🎧', c1: '#e6eef9', c2: '#d3e0f4', qty: 2 }] : [], coupon: null
    };
    write(state);
  }
  const ICON = {
    minus: '<path d="M5 12h14"/>', plus: '<path d="M5 12h14"/><path d="M12 5v14"/>',
    trash: '<path d="M3 6h18"/><path d="M19 6v14c0 1-1 2-2 2H7c-1 0-2-1-2-2V6"/><path d="M8 6V4c0-1 1-2 2-2h4c1 0 2 1 2 2v2"/>',
    x: '<path d="M18 6 6 18"/><path d="m6 6 12 12"/>',
    bag: '<path d="M6 2 3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4Z"/><path d="M3 6h18"/><path d="M16 10a4 4 0 0 1-8 0"/>'
  };
  const ic = (n, c = 'w-4 h-4') => `<svg class="${c}" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">${ICON[n]}</svg>`;

  const count = () => state.items.reduce((a, i) => a + i.qty, 0);
  const subtotal = () => state.items.reduce((a, i) => a + i.price * i.qty, 0);
  const discount = () => { const c = state.coupon && COUPONS[state.coupon]; if (!c) return 0; const s = subtotal(); return c.type === 'pct' ? Math.round(s * c.v / 100) : Math.min(c.v, s) };
  const feeSel = () => { const r = $('input[name=ship]:checked'); return r ? +r.dataset.fee : BASE_FEE };
  const shipping = () => { const s = subtotal(); return (s === 0 || s >= FREE_SHIP) ? 0 : feeSel() };
  const total = () => Math.max(0, subtotal() - discount()) + shipping();
  const PRODUCT_IMG = 'https://placehold.co/400x400';   // swap for real product image URLs
  const tile = (i, cls) => `<span class="mini-tile ${cls}"><img src="${PRODUCT_IMG}" alt="" class="w-full h-full object-cover"></span>`;
  const stepper = (i, sm) => `<div class="flex items-center border border-slate-200 rounded-lg"><button data-cq="-1" data-id="${i.id}" class="${sm ? 'w-8 h-8' : 'w-9 h-9'} grid place-items-center text-slate-600 hover:text-brand-600" aria-label="Decrease quantity">${ic('minus', 'w-3.5 h-3.5')}</button><span class="w-8 text-center text-sm font-semibold" aria-live="polite">${i.qty}</span><button data-cq="1" data-id="${i.id}" class="${sm ? 'w-8 h-8' : 'w-9 h-9'} grid place-items-center text-slate-600 hover:text-brand-600" aria-label="Increase quantity">${ic('plus', 'w-3.5 h-3.5')}</button></div>`;
  const emptyHTML = (cls = '') => `<div class="${cls} flex flex-col items-center justify-center text-center py-14"><span class="w-20 h-20 rounded-full bg-brand-50 text-brand-600 grid place-items-center">${ic('bag', 'w-9 h-9')}</span><h3 class="font-semibold text-slate-900 mt-5">Your cart is empty</h3><p class="text-sm text-slate-500 mt-1 max-w-[240px]">Add something you like and it will show up here.</p><a href="shop.html" class="btn btn-primary mt-5">Start Shopping</a></div>`;

  function paint() {
    const n = count();
    $$('[data-cart-count]').forEach(el => el.textContent = n);
    /* drawer */
    const dl = $('#drawerItems');
    if (dl) {
      dl.innerHTML = state.items.length ? state.items.map(i => `<li class="flex gap-3 py-4 border-b border-slate-100">
        <a href="product.html">${tile(i, 'w-[68px] h-[68px] rounded-xl text-3xl')}</a>
        <div class="flex-1 min-w-0"><a href="product.html" class="text-[13px] font-medium text-slate-800 leading-snug line-clamp-2 hover:text-brand-600">${esc(i.name)}</a>
          <p class="text-xs text-slate-400 mt-0.5">${money(i.price)} each</p>
          <div class="mt-2 flex items-center justify-between">${stepper(i, true)}<b class="text-sm text-slate-900">${money(i.price * i.qty)}</b></div></div>
        <button data-rm data-id="${i.id}" class="self-start p-1 text-slate-400 hover:text-[#e5383b]" aria-label="Remove ${esc(i.name)}">${ic('x', 'w-4 h-4')}</button></li>`).join('') : emptyHTML('h-full');
      const f = $('#drawerFoot'); if (f) f.classList.toggle('hidden', !state.items.length);
    }
    /* cart page */
    const cp = $('#cartItems');
    if (cp) {
      cp.innerHTML = state.items.length ? state.items.map(i => `<div class="card p-4 grid grid-cols-[76px_1fr] sm:grid-cols-[88px_1fr_auto_auto_auto] gap-x-4 gap-y-3 items-center">
        <a href="product.html">${tile(i, 'w-[76px] h-[76px] sm:w-[88px] sm:h-[88px] rounded-xl text-4xl')}</a>
        <div><a href="product.html" class="text-sm font-medium text-slate-800 hover:text-brand-600">${esc(i.name)}</a><p class="text-xs text-slate-400 mt-0.5">In stock</p><p class="text-sm font-semibold text-brand-700 mt-1 sm:hidden">${money(i.price)}</p></div>
        <p class="hidden sm:block text-sm font-semibold w-20 text-right">${money(i.price)}</p>
        <div class="col-start-2 sm:col-start-auto">${stepper(i)}</div>
        <div class="hidden sm:flex items-center gap-3 w-28 justify-end"><b class="text-sm">${money(i.price * i.qty)}</b><button data-rm data-id="${i.id}" class="text-slate-400 hover:text-[#e5383b]" aria-label="Remove ${esc(i.name)}">${ic('trash')}</button></div>
        <button data-rm data-id="${i.id}" class="sm:hidden col-start-2 justify-self-start text-xs text-slate-400 hover:text-[#e5383b] inline-flex items-center gap-1.5">${ic('trash', 'w-3.5 h-3.5')} Remove</button></div>`).join('') : `<div class="card">${emptyHTML()}</div>`;
      const cc = $('#cartCheckout'); if (cc) cc.classList.toggle('pointer-events-none', !state.items.length), cc && cc.classList.toggle('opacity-50', !state.items.length);
    }
    /* checkout */
    const co = $('#coItems');
    if (co) {
      co.innerHTML = state.items.length ? state.items.map(i => `<div class="flex items-center gap-3">${tile(i, 'w-12 h-12 rounded-lg text-2xl')}<p class="text-[13px] flex-1 leading-snug">${esc(i.name)}<span class="text-slate-400"> × ${i.qty}</span></p><b class="text-sm">${money(i.price * i.qty)}</b></div>`).join('') : `<p class="text-sm text-slate-500">Your cart is empty. <a href="shop.html" class="text-brand-600 underline">Continue shopping</a></p>`;
      const po = $('#placeOrder'); if (po) { po.disabled = !state.items.length; po.classList.toggle('opacity-50', !state.items.length) }
    }
    totals();
  }
  function totals() {
    const s = subtotal(), d = discount(), sh = shipping();
    $$('[data-subtotal]').forEach(e => e.textContent = money(s));
    $$('[data-discount]').forEach(e => e.textContent = '-' + money(d));
    $$('[data-discount-row]').forEach(e => { e.classList.toggle('hidden', !d); e.classList.toggle('flex', !!d) });
    $$('[data-coupon-name]').forEach(e => e.textContent = state.coupon ? '(' + state.coupon + ')' : '');
    $$('[data-shipping]').forEach(e => e.textContent = s === 0 ? '–' : (sh ? money(sh) : 'Free'));
    $$('[data-total]').forEach(e => e.textContent = money(total()));
    const left = FREE_SHIP - s;
    $$('[data-free-text]').forEach(e => e.innerHTML = s === 0 ? `Free delivery on orders over <b>${money(FREE_SHIP)}</b>` : left > 0 ? `Add <b>${money(left)}</b> more to get <b class="text-brand-700">free delivery</b>` : `<b class="text-brand-700">You've unlocked delivery!</b>`);
    $$('[data-free-bar]').forEach(e => e.style.width = Math.min(100, s / FREE_SHIP * 100) + '%');
  }
  function commit() { write(state); paint() }
  function bump() { $$('[data-cart-count]').forEach(el => { el.classList.remove('bump'); void el.offsetWidth; el.classList.add('bump') }) }

  /* ---------- Drawer open / close ---------- */
  const drawer = $('#cartDrawer'), dov = $('#cartOverlay'); let lastFocus = null;
  function openDrawer() {
    if (!drawer) return; lastFocus = document.activeElement;
    drawer.classList.add('open'); dov.classList.add('open'); document.body.style.overflow = 'hidden';
    setTimeout(() => { const c = $('[data-cart-close]', drawer); c && c.focus() }, 50);
  }
  function closeDrawer() {
    if (!drawer) return; drawer.classList.remove('open'); dov.classList.remove('open'); document.body.style.overflow = '';
    lastFocus && lastFocus.focus && lastFocus.focus();
  }
  document.addEventListener('keydown', e => {
    if (e.key === 'Escape') { closeDrawer(); menu(false) }
    if (e.key === 'Tab' && drawer && drawer.classList.contains('open')) {           // simple focus trap
      const f = $$('a[href],button:not([disabled])', drawer).filter(x => x.offsetParent !== null); if (!f.length) return;
      const first = f[0], last = f[f.length - 1];
      if (e.shiftKey && document.activeElement === first) { e.preventDefault(); last.focus() }
      else if (!e.shiftKey && document.activeElement === last) { e.preventDefault(); first.focus() }
    }
  });

  /* ---------- Delegated clicks ---------- */
  document.addEventListener('click', e => {
    const add = e.target.closest('[data-add]');
    if (add) {
      const d = add.dataset, id = +d.id;
      if (!isNaN(id) && d.name) {
        const q = d.qtySrc ? Math.max(1, +($(d.qtySrc)?.value) || 1) : 1;
        const ex = state.items.find(i => i.id === id);
        if (ex) ex.qty += q; else state.items.push({ id, name: d.name, price: +d.price, emoji: d.emoji, c1: d.c1, c2: d.c2, qty: q });
        commit(); bump();
        if (d.buy) return;                       // "Buy now": let the link go to checkout
        e.preventDefault();
        if (drawer) openDrawer(); else toast('Added to cart');
      }
      return;
    }
    const cq = e.target.closest('[data-cq]');
    if (cq) { const it = state.items.find(i => i.id === +cq.dataset.id); if (it) { it.qty = Math.max(1, it.qty + (+cq.dataset.cq)); commit() } return }
    const rm = e.target.closest('[data-rm]');
    if (rm) { state.items = state.items.filter(i => i.id !== +rm.dataset.id); if (!state.items.length) state.coupon = null; commit(); toast('Item removed'); return }
    const op = e.target.closest('[data-cart-open]');
    if (op && drawer && !$('#cartPage')) { e.preventDefault(); openDrawer(); return }
    if (e.target.closest('[data-cart-close]')) { closeDrawer(); return }
    if (e.target.closest('#drawerItems a[href], #drawerFoot a[href]')) return;
    const w = e.target.closest('.wish');
    if (w) { e.preventDefault(); w.classList.toggle('active'); toast(w.classList.contains('active') ? 'Saved to wishlist' : 'Removed from wishlist') }
  });

  /* ---------- Coupon ---------- */
  const cf = $('#couponForm');
  if (cf) cf.addEventListener('submit', e => {
    e.preventDefault(); const code = $('#couponCode').value.trim().toUpperCase();
    if (!code) return;
    if (COUPONS[code] && state.items.length) { state.coupon = code; commit(); toast('Coupon applied: ' + COUPONS[code].label) }
    else toast(state.items.length ? 'Invalid coupon code' : 'Add items before applying a coupon');
  });
  $$('input[name=ship]').forEach(r => r.addEventListener('change', totals));

  paint();

  /* ---------- Generic show/hide toggle (e.g. shop filters on mobile) ---------- */
  $$('[data-toggle]').forEach(btn => btn.addEventListener('click', () => {
    const t = $(btn.dataset.toggle); if (!t) return;
    const open = t.classList.toggle('hidden') === false; btn.setAttribute('aria-expanded', open);
  }));

  /* ---------- Tabs ---------- */
  $$('[data-tabs]').forEach(group => {
    const btns = $$('[data-tab]', group), scope = group.dataset.tabs ? document.getElementById(group.dataset.tabs) : document;
    btns.forEach(b => b.addEventListener('click', () => {
      btns.forEach(x => x.classList.toggle('active', x === b));
      $$('[data-panel]', scope).forEach(p => p.classList.toggle('active', p.dataset.panel === b.dataset.tab));
    }));
  });

  /* ---------- Static quantity steppers (product page) ---------- */
  $$('.qty').forEach(q => {
    const inp = $('input', q);
    $$('[data-q]', q).forEach(b => b.addEventListener('click', () => { inp.value = Math.max(1, (+inp.value || 1) + (+b.dataset.q)) }));
    inp.addEventListener('change', () => { inp.value = Math.max(1, +inp.value || 1) });
  });

  /* ---------- Countdown ---------- */
  const cd = $('[data-countdown]');
  if (cd) {
    let end = Date.now() + ((2 * 24 + 14) * 3600 + 36 * 60 + 20) * 1000;
    const pad = n => String(n).padStart(2, '0');
    const tick = () => {
      let s = Math.max(0, Math.floor((end - Date.now()) / 1000));
      const v = { d: Math.floor(s / 86400), h: Math.floor(s % 86400 / 3600), m: Math.floor(s % 3600 / 60), s: s % 60 };
      Object.keys(v).forEach(k => { const el = $('[data-cd="' + k + '"]', cd); if (el) el.textContent = pad(v[k]) })
    };
    tick(); setInterval(tick, 1000)
  }

  /* ---------- Product gallery ---------- */
  $$('[data-thumb]').forEach(t => t.addEventListener('click', () => {
    const main = $('[data-main]'); if (!main) return;
    main.innerHTML = t.innerHTML; main.style.background = t.style.background;
    $$('[data-thumb]').forEach(x => x.classList.remove('ring-2', 'ring-brand-600')); t.classList.add('ring-2', 'ring-brand-600')
  }));

  /* ---------- Option pickers ---------- */
  $$('[data-pick]').forEach(g => $$('button', g).forEach(b => b.addEventListener('click', () => {
    $$('button', g).forEach(x => x.classList.remove('!border-brand-600', '!bg-brand-50', '!text-brand-700'));
    b.classList.add('!border-brand-600', '!bg-brand-50', '!text-brand-700')
  })));

  /* ---------- Price range ---------- */
  const pr = $('#priceRange'), po = $('#priceOut');
  if (pr && po) { const u = () => po.textContent = money(pr.value); pr.addEventListener('input', u); u() }

  /* ---------- Shop grid/list toggle ---------- */
  $$('[data-view]').forEach(b => b.addEventListener('click', () => {
    const g = $('#productGrid'); if (!g) return;
    $$('[data-view]').forEach(x => x.classList.toggle('text-brand-600', x === b));
    g.classList.toggle('list-view', b.dataset.view === 'list');
  }));

  /* ---------- Payment method reveal ---------- */
  $$('input[name=pay]').forEach(r => r.addEventListener('change', () => {
    $$('[data-pay-info]').forEach(p => p.classList.toggle('hidden', p.dataset.payInfo !== r.value))
  }));

  /* ---------- Demo forms ---------- */
  $$('form[data-demo]').forEach(f => f.addEventListener('submit', e => {
    e.preventDefault();
    if (f.dataset.demo === 'redirect') {
      if (f.hasAttribute('data-clear-cart')) { state = { items: [], coupon: null }; write(state) }
      location.href = f.dataset.to; return
    }
    toast(f.dataset.msg || 'Thanks! We received your request.'); f.reset()
  }));

  $$('[data-year]').forEach(el => el.textContent = new Date().getFullYear());
})();

/* ===== Hero slider ===== */
(function () {
  const root = document.querySelector('[data-hero]'); if (!root) return;
  const slides = [...root.querySelectorAll('.hero-slide')], dots = [...root.querySelectorAll('[data-hero-dot]')];
  const DELAY = 6000, reduce = matchMedia('(prefers-reduced-motion: reduce)').matches;
  let cur = 0, timer = null;
  root.style.setProperty('--hero-delay', DELAY + 'ms');
  if (reduce) root.classList.add('no-auto');
  function go(n) {
    n = (n + slides.length) % slides.length;
    slides[cur].classList.remove('is-active'); slides[cur].setAttribute('aria-hidden', 'true'); dots[cur].classList.remove('is-active');
    cur = n;
    slides[cur].classList.add('is-active'); slides[cur].removeAttribute('aria-hidden');
    void dots[cur].offsetWidth; dots[cur].classList.add('is-active');
    play();
  }
  function play() { clearTimeout(timer); if (reduce || root.classList.contains('is-paused')) return; timer = setTimeout(() => go(cur + 1), DELAY) }
  function pause() { root.classList.add('is-paused'); clearTimeout(timer) }
  function resume() { root.classList.remove('is-paused'); play() }
  root.querySelector('[data-hero-next]').addEventListener('click', () => go(cur + 1));
  root.querySelector('[data-hero-prev]').addEventListener('click', () => go(cur - 1));
  dots.forEach((d, i) => d.addEventListener('click', () => go(i)));
  root.addEventListener('mouseenter', pause); root.addEventListener('mouseleave', resume);
  root.addEventListener('focusin', pause); root.addEventListener('focusout', resume);
  root.addEventListener('keydown', e => { if (e.key === 'ArrowRight') go(cur + 1); if (e.key === 'ArrowLeft') go(cur - 1) });
  /* swipe */
  let x0 = null;
  root.addEventListener('touchstart', e => { x0 = e.touches[0].clientX }, { passive: true });
  root.addEventListener('touchend', e => { if (x0 === null) return; const dx = e.changedTouches[0].clientX - x0; if (Math.abs(dx) > 50) go(cur + (dx < 0 ? 1 : -1)); x0 = null });
  document.addEventListener('visibilitychange', () => document.hidden ? pause() : resume());
  play();
})();
