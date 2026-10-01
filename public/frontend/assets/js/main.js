/* NexioMart – vanilla JS */
(function(){
  const $=(s,r=document)=>r.querySelector(s), $$=(s,r=document)=>[...r.querySelectorAll(s)];
  const money=n=>'৳'+Math.round(n).toLocaleString('en-US');

  /* Toast */
  function toast(msg){let t=$('#toast');if(!t){t=document.createElement('div');t.id='toast';document.body.appendChild(t)}
    t.textContent=msg;t.classList.add('show');clearTimeout(t._h);t._h=setTimeout(()=>t.classList.remove('show'),2200)}

  /* Mobile menu */
  const mm=$('#mobileMenu'),ov=$('#overlay');
  function menu(open){mm&&mm.classList.toggle('open',open);ov&&ov.classList.toggle('open',open);document.body.style.overflow=open?'hidden':''}
  $$('[data-menu-open]').forEach(b=>b.addEventListener('click',()=>menu(true)));
  $$('[data-menu-close]').forEach(b=>b.addEventListener('click',()=>menu(false)));
  ov&&ov.addEventListener('click',()=>menu(false));
  document.addEventListener('keydown',e=>{if(e.key==='Escape')menu(false)});

  /* Cart count (localStorage, demo only) */
  const KEY='nm_cart_count';
  const get=()=>{try{return +localStorage.getItem(KEY)||0}catch(e){return 0}};
  const set=n=>{try{localStorage.setItem(KEY,n)}catch(e){}};
  const paint=()=>$$('[data-cart-count]').forEach(el=>el.textContent=get());
  paint();
  document.addEventListener('click',e=>{
    const add=e.target.closest('[data-add]');
    if(add){e.preventDefault();set(get()+1);paint();toast('Added to cart')}
    const w=e.target.closest('.wish');
    if(w){e.preventDefault();w.classList.toggle('active');toast(w.classList.contains('active')?'Saved to wishlist':'Removed from wishlist')}
    const rm=e.target.closest('[data-remove]');
    if(rm){const row=rm.closest('[data-row]');row&&row.remove();recalc();toast('Item removed')}
  });

  /* Tabs */
  $$('[data-tabs]').forEach(group=>{
    const btns=$$('[data-tab]',group), scope=group.dataset.tabs?document.getElementById(group.dataset.tabs):document;
    btns.forEach(b=>b.addEventListener('click',()=>{
      btns.forEach(x=>x.classList.toggle('active',x===b));
      $$('[data-panel]',scope).forEach(p=>p.classList.toggle('active',p.dataset.panel===b.dataset.tab));
    }));
  });

  /* Quantity steppers */
  $$('.qty').forEach(q=>{
    const inp=$('input',q);
    $$('[data-q]',q).forEach(b=>b.addEventListener('click',()=>{inp.value=Math.max(1,(+inp.value||1)+(+b.dataset.q));recalc()}));
    inp.addEventListener('change',()=>{inp.value=Math.max(1,+inp.value||1);recalc()});
  });

  /* Cart totals */
  function recalc(){
    const rows=$$('[data-row]');if(!$('[data-subtotal]'))return;
    let sub=0;
    rows.forEach(r=>{const q=+$('input',r).value||1,p=+r.dataset.price;const line=q*p;sub+=line;const t=$('[data-line]',r);if(t)t.textContent=money(line)});
    const disc=+($('[data-discount]')?.dataset.discount||0);
    const ship=sub===0||sub>=3000?0:80;
    $('[data-subtotal]').textContent=money(sub);
    const s=$('[data-shipping]');if(s)s.textContent=ship?money(ship):'Free';
    const t=$('[data-total]');if(t)t.textContent=money(Math.max(0,sub-disc+ship));
  }
  recalc();

  /* Countdown */
  const cd=$('[data-countdown]');
  if(cd){let end=Date.now()+((2*24+14)*3600+36*60+20)*1000;
    const pad=n=>String(n).padStart(2,'0');
    const tick=()=>{let s=Math.max(0,Math.floor((end-Date.now())/1000));
      const v={d:Math.floor(s/86400),h:Math.floor(s%86400/3600),m:Math.floor(s%3600/60),s:s%60};
      Object.keys(v).forEach(k=>{const el=$('[data-cd="'+k+'"]',cd);if(el)el.textContent=pad(v[k])})};
    tick();setInterval(tick,1000)}

  /* Product gallery */
  $$('[data-thumb]').forEach(t=>t.addEventListener('click',()=>{
    const main=$('[data-main]');if(!main)return;
    main.innerHTML=t.innerHTML;main.style.background=t.style.background;
    $$('[data-thumb]').forEach(x=>x.classList.remove('ring-2','ring-brand-600'));t.classList.add('ring-2','ring-brand-600')}));

  /* Option pickers (color / size / payment) */
  $$('[data-pick]').forEach(g=>$$('button',g).forEach(b=>b.addEventListener('click',()=>{
    $$('button',g).forEach(x=>x.classList.remove('!border-brand-600','!bg-brand-50','!text-brand-700'));
    b.classList.add('!border-brand-600','!bg-brand-50','!text-brand-700')})));

  /* Price range output */
  const pr=$('#priceRange'),po=$('#priceOut');
  if(pr&&po){const u=()=>po.textContent=money(pr.value);pr.addEventListener('input',u);u()}

  /* Grid/List toggle on shop */
  $$('[data-view]').forEach(b=>b.addEventListener('click',()=>{
    const g=$('#productGrid');if(!g)return;
    $$('[data-view]').forEach(x=>x.classList.toggle('text-brand-600',x===b));
    g.classList.toggle('list-view',b.dataset.view==='list');
  }));

  /* Payment method reveal */
  $$('input[name=pay]').forEach(r=>r.addEventListener('change',()=>{
    $$('[data-pay-info]').forEach(p=>p.classList.toggle('hidden',p.dataset.payInfo!==r.value))}));

  /* Forms (demo) */
  $$('form[data-demo]').forEach(f=>f.addEventListener('submit',e=>{
    e.preventDefault();
    if(f.dataset.demo==='redirect'){location.href=f.dataset.to;return}
    toast(f.dataset.msg||'Thanks! We received your request.');f.reset()}));

  /* Footer year */
  $$('[data-year]').forEach(el=>el.textContent=new Date().getFullYear());
})();

/* ===== Hero slider ===== */
(function(){
  const root=document.querySelector('[data-hero]');if(!root)return;
  const slides=[...root.querySelectorAll('.hero-slide')],dots=[...root.querySelectorAll('[data-hero-dot]')];
  const DELAY=6000,reduce=matchMedia('(prefers-reduced-motion: reduce)').matches;
  let cur=0,timer=null;
  root.style.setProperty('--hero-delay',DELAY+'ms');
  if(reduce)root.classList.add('no-auto');
  function go(n){
    n=(n+slides.length)%slides.length;
    slides[cur].classList.remove('is-active');slides[cur].setAttribute('aria-hidden','true');dots[cur].classList.remove('is-active');
    cur=n;
    slides[cur].classList.add('is-active');slides[cur].removeAttribute('aria-hidden');
    void dots[cur].offsetWidth;dots[cur].classList.add('is-active');
    play();
  }
  function play(){clearTimeout(timer);if(reduce||root.classList.contains('is-paused'))return;timer=setTimeout(()=>go(cur+1),DELAY)}
  function pause(){root.classList.add('is-paused');clearTimeout(timer)}
  function resume(){root.classList.remove('is-paused');play()}
  root.querySelector('[data-hero-next]').addEventListener('click',()=>go(cur+1));
  root.querySelector('[data-hero-prev]').addEventListener('click',()=>go(cur-1));
  dots.forEach((d,i)=>d.addEventListener('click',()=>go(i)));
  root.addEventListener('mouseenter',pause);root.addEventListener('mouseleave',resume);
  root.addEventListener('focusin',pause);root.addEventListener('focusout',resume);
  root.addEventListener('keydown',e=>{if(e.key==='ArrowRight')go(cur+1);if(e.key==='ArrowLeft')go(cur-1)});
  /* swipe */
  let x0=null;
  root.addEventListener('touchstart',e=>{x0=e.touches[0].clientX},{passive:true});
  root.addEventListener('touchend',e=>{if(x0===null)return;const dx=e.changedTouches[0].clientX-x0;if(Math.abs(dx)>50)go(cur+(dx<0?1:-1));x0=null});
  document.addEventListener('visibilitychange',()=>document.hidden?pause():resume());
  play();
})();
