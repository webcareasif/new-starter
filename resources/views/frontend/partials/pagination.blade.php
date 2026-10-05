@if ($paginator->hasPages())
    @php
        $current = $paginator->currentPage();
        $last = $paginator->lastPage();

        $start = max($current - 1, 1);
        $end = min($current + 1, $last);
    @endphp

    <div class="flex justify-center gap-2 mt-10">

        {{-- Previous --}}
        @if ($paginator->onFirstPage())
            <span
                class="w-10 h-10 grid place-items-center rounded-lg border text-sm font-medium border-slate-200 text-slate-400 cursor-not-allowed">

                <svg xmlns="http://www.w3.org/2000/svg" class="w-4 h-4" fill="none" viewBox="0 0 24 24"
                    stroke="currentColor" stroke-width="2">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M15 19l-7-7 7-7" />
                </svg>

            </span>
        @else
            <a href="{{ $paginator->previousPageUrl() }}"
                class="w-10 h-10 grid place-items-center rounded-lg border text-sm font-medium border-slate-200 hover:border-brand-600 hover:text-brand-600">

                <svg xmlns="http://www.w3.org/2000/svg" class="w-4 h-4" fill="none" viewBox="0 0 24 24"
                    stroke="currentColor" stroke-width="2">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M15 19l-7-7 7-7" />
                </svg>

            </a>
        @endif


        {{-- First Page --}}
        @if ($start > 1)

            <a href="{{ $paginator->url(1) }}"
                class="w-10 h-10 grid place-items-center rounded-lg border text-sm font-medium border-slate-200 hover:border-brand-600 hover:text-brand-600">
                1
            </a>

            {{-- Left Ellipsis --}}
            @if ($start > 2)
                <span
                    class="w-10 h-10 grid place-items-center rounded-lg border text-sm font-medium border-slate-200 text-slate-400">

                    <svg xmlns="http://www.w3.org/2000/svg" class="w-5 h-5" viewBox="0 0 24 24" fill="currentColor">
                        <circle cx="5" cy="12" r="1.5" />
                        <circle cx="12" cy="12" r="1.5" />
                        <circle cx="19" cy="12" r="1.5" />
                    </svg>

                </span>
            @endif

        @endif


        {{-- Page Numbers --}}
        @for ($i = $start; $i <= $end; $i++)
            @if ($i == $current)
                <span
                    class="w-10 h-10 grid place-items-center rounded-lg border text-sm font-medium bg-brand-600 border-brand-600 text-white">
                    {{ $i }}
                </span>
            @else
                <a href="{{ $paginator->url($i) }}"
                    class="w-10 h-10 grid place-items-center rounded-lg border text-sm font-medium border-slate-200 hover:border-brand-600 hover:text-brand-600">
                    {{ $i }}
                </a>
            @endif
        @endfor


        {{-- Last Page --}}
        @if ($end < $last)

            {{-- Right Ellipsis --}}
            @if ($end < $last - 1)
                <span
                    class="w-10 h-10 grid place-items-center rounded-lg border text-sm font-medium border-slate-200 text-slate-400">

                    <svg xmlns="http://www.w3.org/2000/svg" class="w-5 h-5" viewBox="0 0 24 24" fill="currentColor">
                        <circle cx="5" cy="12" r="1.5" />
                        <circle cx="12" cy="12" r="1.5" />
                        <circle cx="19" cy="12" r="1.5" />
                    </svg>

                </span>
            @endif


            @if ($current == $last)
                <span
                    class="w-10 h-10 grid place-items-center rounded-lg border text-sm font-medium bg-brand-600 border-brand-600 text-white">
                    {{ $last }}
                </span>
            @else
                <a href="{{ $paginator->url($last) }}"
                    class="w-10 h-10 grid place-items-center rounded-lg border text-sm font-medium border-slate-200 hover:border-brand-600 hover:text-brand-600">
                    {{ $last }}
                </a>
            @endif

        @endif


        {{-- Next --}}
        @if ($paginator->hasMorePages())
            <a href="{{ $paginator->nextPageUrl() }}"
                class="w-10 h-10 grid place-items-center rounded-lg border text-sm font-medium border-slate-200 hover:border-brand-600 hover:text-brand-600">

                <svg xmlns="http://www.w3.org/2000/svg" class="w-4 h-4" fill="none" viewBox="0 0 24 24"
                    stroke="currentColor" stroke-width="2">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M9 5l7 7-7 7" />
                </svg>

            </a>
        @else
            <span
                class="w-10 h-10 grid place-items-center rounded-lg border text-sm font-medium border-slate-200 text-slate-400 cursor-not-allowed">

                <svg xmlns="http://www.w3.org/2000/svg" class="w-4 h-4" fill="none" viewBox="0 0 24 24"
                    stroke="currentColor" stroke-width="2">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M9 5l7 7-7 7" />
                </svg>

            </span>
        @endif

    </div>
@endif
