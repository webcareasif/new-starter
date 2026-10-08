<script>
    (function() {
        const CSRF = document.querySelector('meta[name="csrf-token"]')?.content;
        if (!CSRF) return;

        const TOGGLE_URL = '{{ route('frontend.wishlist.toggle') }}';

        // ---------- initial state load (any product currently on the page) ----------
        async function syncWishlistStates() {
            const ids = [...document.querySelectorAll('.js-wish-toggle')]
                .map(b => b.dataset.id)
                .filter(Boolean);

            if (!ids.length) return;

            try {
                const res = await fetch('{{ route('frontend.wishlist.ids') }}', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                        'Accept': 'application/json',
                        'X-CSRF-TOKEN': CSRF,
                    },
                    body: JSON.stringify({
                        ids
                    }),
                });
                const d = await res.json();

                if (d.success && Array.isArray(d.ids)) {
                    const set = new Set(d.ids.map(String));
                    document.querySelectorAll('.js-wish-toggle').forEach(btn => {
                        applyState(btn, set.has(String(btn.dataset.id)));
                    });
                }
            } catch (e) {
                /* silent */
            }
        }

        // ---------- visual state ----------
        function applyState(btn, active) {
            const svg = btn.querySelector('svg');
            if (!svg) return;

            if (active) {
                btn.classList.add('is-active');
                svg.setAttribute('fill', 'currentColor');
                btn.classList.remove('text-slate-500');
                btn.classList.add('text-[#e5383b]');
                btn.setAttribute('title', 'Remove from wishlist');
                btn.setAttribute('aria-label', 'Remove from wishlist');
            } else {
                btn.classList.remove('is-active');
                svg.setAttribute('fill', 'none');
                btn.classList.add('text-slate-500');
                btn.classList.remove('text-[#e5383b]');
                btn.setAttribute('title', 'Add to wishlist');
                btn.setAttribute('aria-label', 'Add to wishlist');
            }
        }

        // ---------- click ----------
        document.addEventListener('click', async (e) => {
            const btn = e.target.closest('.js-wish-toggle');
            if (!btn || btn.disabled) return;

            e.preventDefault();
            btn.disabled = true;

            try {
                const res = await fetch(TOGGLE_URL, {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                        'Accept': 'application/json',
                        'X-CSRF-TOKEN': CSRF,
                    },
                    body: JSON.stringify({
                        product_id: btn.dataset.id
                    }),
                });
                const d = await res.json();

                if (d.success) {
                    applyState(btn, !!d.added);

                    // update header badge
                    document.querySelectorAll('.js-wish-count').forEach(el => {
                        el.textContent = d.count;
                        el.classList.toggle('hidden', d.count <= 0);
                    });
                } else if (d.message) {
                    console.warn(d.message);
                }
            } catch (err) {
                console.error(err);
            } finally {
                btn.disabled = false;
            }
        });

        document.addEventListener('DOMContentLoaded', syncWishlistStates);
        // re-sync after AJAX-loaded product grids (search / filter)
        window.addEventListener('products:loaded', syncWishlistStates);
    })();
</script>
