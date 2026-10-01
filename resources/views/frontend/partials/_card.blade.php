<article class="card pcard overflow-hidden flex flex-col snap-start min-w-0">

    {{-- Image --}}
    <div class="relative pimg aspect-square">
        <a href="product.html" class="block w-full h-full">
            <img src="https://placehold.co/400x400" alt="T800 Ultra Smart Watch (Original)" loading="lazy"
                class="w-full h-full object-cover" />
        </a>

        <span
            class="absolute left-2 top-2 z-10 bg-[#e5383b] text-white 
            text-[10px] font-semibold px-1.5 py-0.5 rounded-md">-40%</span>

        <button
            class="wish absolute right-2 top-2 z-10 w-7 h-7 rounded-full 
            bg-white/90 grid place-items-center text-slate-500 
            hover:text-[#e5383b] active:scale-95 transition"
            aria-label="Add to wishlist">
            <svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"
                stroke-linecap="round" stroke-linejoin="round">
                <path
                    d="M19 14c1.49-1.46 3-3.21 3-5.5A5.5 5.5 0 0 0 16.5 3c-1.76 0-3 .5-4.5 2-1.5-1.5-2.74-2-4.5-2A5.5 5.5 0 0 0 2 8.5c0 2.3 1.5 4.05 3 5.5l7 7Z" />
            </svg>
        </button>
    </div>

    {{-- Body --}}
    <div class="p-2.5 sm:p-3.5 flex flex-col flex-1">

        <p class="text-[10px] sm:text-[11px] text-slate-400 mb-0.5">Electronics</p>

        <h3
            class="text-[12px] sm:text-[13px] font-medium text-slate-800 
            leading-snug min-h-[2.4em] line-clamp-2">
            <a href="product.html" class="hover:text-brand-600">
                T800 Ultra Smart Watch (Original)
            </a>
        </h3>

        <div class="mt-1 flex flex-wrap items-baseline gap-1.5">
            <span class="font-bold text-brand-700 text-sm">৳1,499</span>
            <span class="text-[10px] text-slate-400 line-through">৳2,500</span>
        </div>

        <div class="mt-0.5 flex items-center gap-1 text-[10px] text-slate-500">
            <span class="inline-flex text-star">
                @for ($i = 0; $i < 5; $i++)
                    <svg class="w-3 h-3" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"
                        stroke-linecap="round" stroke-linejoin="round">
                        <polygon
                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"
                            fill="currentColor" />
                    </svg>
                @endfor
            </span>
            <b class="text-slate-700">4.8</b>
            <span>(320)</span>
        </div>

        <div class="mt-1.5">
            <div class="h-1 rounded-full bg-slate-100 overflow-hidden">
                <div class="h-full rounded-full bg-gradient-to-r from-[#f59e0b] to-[#e5383b]" style="width:72%"></div>
            </div>
            <p class="text-[9px] text-slate-500 mt-0.5">72% sold · hurry up</p>
        </div>

        <button data-add class="btn btn-primary btn-sm w-full mt-2 
            !py-2 !text-[11px]">
            <svg class="w-3 h-3" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"
                stroke-linecap="round" stroke-linejoin="round">
                <path d="M6 2 3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4Z" />
                <path d="M3 6h18" />
                <path d="M16 10a4 4 0 0 1-8 0" />
            </svg>
            Add to Cart
        </button>

    </div>
</article>
