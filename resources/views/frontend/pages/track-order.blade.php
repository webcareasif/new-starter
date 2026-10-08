@extends('frontend.frrontend_app')

@section('content')
    {{-- ================= Header + Search ================= --}}
    <section class="bg-white border-b border-slate-200/80 shadow-sm">
        <div class="container max-w-2xl mx-auto px-4 sm:px-6 py-10 md:py-14">

            <nav class="text-sm text-slate-500 flex items-center gap-1.5" aria-label="Breadcrumb">
                <a href="{{ url('/') }}"
                    class="hover:text-brand-700 focus-visible:outline-none focus-visible:underline transition">Home</a>
                <span class="text-slate-300" aria-hidden="true">/</span>
                <span class="text-slate-800 font-medium" aria-current="page">Track order</span>
            </nav>

            <h1 class="text-3xl md:text-4xl font-bold tracking-tight text-slate-900 mt-5">Where is my order?</h1>
            <p class="text-slate-600 mt-2 text-base md:text-lg">
                Enter the code from your confirmation SMS or email to see the latest delivery status.
            </p>

            <form action="{{ route('frontend.track.order') }}" method="GET" class="mt-7" role="search">
                <label for="code" class="block text-sm font-medium text-slate-700 mb-2">Order code or phone
                    number</label>

                <div class="flex flex-col sm:flex-row gap-3">
                    <div class="relative flex-1">
                        <input type="text" name="code" id="code" value="{{ $orderId ?? '' }}"
                            placeholder="e.g. NX261007OFUFG" autocomplete="off" autocapitalize="characters"
                            spellcheck="false" required
                            class="w-full h-12 rounded-xl border border-slate-300 bg-white px-4 {{ !empty($orderId) ? 'pr-12' : '' }}
                                   text-base tracking-wide text-slate-900 placeholder:text-slate-400
                                   focus:border-brand-600 focus:ring-4 focus:ring-brand-100 outline-none transition shadow-sm">

                        @if (!empty($orderId))
                            <a href="{{ route('frontend.track.order') }}"
                                class="absolute right-2 top-1/2 -translate-y-1/2 w-8 h-8 rounded-full grid place-items-center
                                       text-slate-400 hover:text-slate-700 hover:bg-slate-100 transition"
                                aria-label="Clear search">
                                <svg class="w-4 h-4" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                    stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                                    <path d="M18 6 6 18M6 6l12 12" />
                                </svg>
                            </a>
                        @endif
                    </div>

                    <button type="submit"
                        class="inline-flex items-center justify-center h-12 px-7 rounded-xl font-semibold text-white bg-brand-600 hover:bg-brand-700
                               focus-visible:outline-none focus-visible:ring-4 focus-visible:ring-brand-200 shadow-sm transition">
                        Track order
                    </button>
                </div>
            </form>
        </div>
    </section>

    {{-- ================= Results ================= --}}
    <section class="container max-w-2xl mx-auto px-4 sm:px-6 pt-8 pb-20">
        @if ($searched)
            @if ($order)
                @php
                    $statusKey = strtolower($order->delivery_status ?? 'pending');
                    $steps = ['pending', 'confirmed', 'on_delivery', 'delivered'];
                    $currentIndex = array_search($statusKey, $steps);
                    if ($currentIndex === false) {
                        $currentIndex = 0;
                    }

                    $isBad = in_array($statusKey, ['cancelled', 'returned']);
                    $total = count($steps);
                    $lastIndex = max($total - 1, 1);
                    $progressPct = $isBad ? 100 : (int) round((($currentIndex + 1) / $total) * 100);
                    $fillPct = $isBad ? 100 : ($currentIndex / $lastIndex) * 100;
                    $fillColor = $isBad ? 'bg-red-500' : 'bg-brand-600';

                    $statusColors = [
                        'pending' => 'bg-amber-50 text-amber-800 ring-amber-200',
                        'confirmed' => 'bg-blue-50 text-blue-800 ring-blue-200',
                        'processing' => 'bg-blue-50 text-blue-800 ring-blue-200',
                        'on_delivery' => 'bg-indigo-50 text-indigo-800 ring-indigo-200',
                        'shipped' => 'bg-indigo-50 text-indigo-800 ring-indigo-200',
                        'delivered' => 'bg-green-50 text-green-800 ring-green-200',
                        'cancelled' => 'bg-red-50 text-red-800 ring-red-200',
                        'returned' => 'bg-rose-50 text-rose-800 ring-rose-200',
                    ];
                    $statusClass = $statusColors[$statusKey] ?? 'bg-slate-100 text-slate-800 ring-slate-200';

                    $isPaid = strtolower((string) $order->payment_status) === 'paid';
                    $paymentClass = $isPaid
                        ? 'bg-green-50 text-green-800 ring-green-200'
                        : 'bg-amber-50 text-amber-800 ring-amber-200';

                    $placedAt = $order->created_at ? \Carbon\Carbon::parse($order->created_at) : null;
                    $updatedAt = $order->updated_at ? \Carbon\Carbon::parse($order->updated_at) : null;
                    $customerName = $order->name ?: $order->user->name ?? 'Customer';
                    $customerPhone = $order->phone_number ?: $order->user->phone ?? '—';
                    $customerEmail = $order->email_address ?: $order->user->email ?? null;

                    $pretty = fn($v) => ucwords(str_replace('_', ' ', (string) $v));

                    $subtitle = match (true) {
                        $isBad => 'This order was ' . $statusKey . '.',
                        $statusKey === 'delivered' => 'Your order has been delivered.',
                        default => 'Step ' .
                            ($currentIndex + 1) .
                            ' of ' .
                            $total .
                            ' · ' .
                            $pretty($steps[$currentIndex]),
                    };
                @endphp

                <article
                    class="bg-white rounded-2xl border border-slate-200 shadow-md overflow-hidden transition hover:shadow-lg">

                    {{-- Order summary --}}
                    <header
                        class="p-6 md:p-8 flex flex-wrap items-start justify-between gap-x-6 gap-y-4 border-b border-slate-100/80">
                        <div class="min-w-0">
                            <p class="text-sm text-slate-500">Order code</p>
                            <div class="flex items-center gap-1.5 mt-0.5">
                                <h2 class="text-xl font-semibold text-slate-900 break-all">{{ $order->code }}</h2>
                                <button type="button"
                                    class="js-copy-code -m-1 p-1.5 rounded-md text-slate-400 hover:text-brand-700 hover:bg-slate-100 transition focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-brand-200"
                                    data-code="{{ $order->code }}" aria-label="Copy order code">
                                    <svg class="w-4 h-4" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                        stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"
                                        aria-hidden="true">
                                        <rect x="9" y="9" width="13" height="13" rx="2" />
                                        <path d="M5 15V5a2 2 0 0 1 2-2h10" />
                                    </svg>
                                </button>
                            </div>
                            @if ($placedAt)
                                <p class="text-sm text-slate-500 mt-1">Placed {{ $placedAt->format('d M Y, h:i A') }}</p>
                            @endif
                        </div>

                        <div class="sm:text-right">
                            <p class="text-sm text-slate-500">Total</p>
                            <p class="text-2xl font-bold text-slate-900 tabular-nums mt-0.5">
                                ৳{{ number_format((float) $order->grand_total, 2) }}
                            </p>
                        </div>
                    </header>

                    {{-- Status badges --}}
                    <div class="px-6 md:px-8 py-4 flex flex-wrap items-center gap-2 border-b border-slate-100/80">
                        <span
                            class="inline-flex items-center gap-1.5 px-3 py-1 rounded-full text-xs font-medium ring-1 ring-inset {{ $statusClass }}">
                            <span class="w-1.5 h-1.5 rounded-full bg-current" aria-hidden="true"></span>
                            {{ $pretty($order->delivery_status ?: 'pending') }}
                        </span>
                        <span
                            class="inline-flex items-center px-3 py-1 rounded-full text-xs font-medium ring-1 ring-inset {{ $paymentClass }}">
                            {{ ucfirst($order->payment_status ?: 'unpaid') }}
                        </span>
                        <span
                            class="inline-flex items-center px-3 py-1 rounded-full text-xs font-medium bg-slate-100 text-slate-700">
                            {{ $pretty($order->payment_type ?: 'cod') }}
                        </span>
                    </div>

                    {{-- ================= Delivery progress ================= --}}
                    <section class="px-6 md:px-8 py-8 border-b border-slate-100/80"
                        aria-labelledby="delivery-progress-title">
                        <div class="flex items-start justify-between gap-4 mb-8">
                            <div class="min-w-0">
                                <h3 id="delivery-progress-title" class="text-base font-semibold text-slate-900">
                                    Delivery progress
                                </h3>
                                <p class="text-sm text-slate-500 mt-1">{{ $subtitle }}</p>
                            </div>
                            <span
                                class="shrink-0 inline-flex items-center rounded-full px-3 py-1 text-sm font-semibold tabular-nums ring-1 ring-inset
                                    {{ $isBad ? 'bg-red-50 text-red-700 ring-red-200' : 'bg-brand-50 text-brand-700 ring-brand-100' }}">
                                {{ $progressPct }}%
                            </span>
                        </div>

                        <div class="relative">
                            {{-- Desktop track --}}
                            <div class="hidden md:block absolute top-5 left-[12.5%] right-[12.5%] h-1 rounded-full bg-slate-100"
                                aria-hidden="true">
                                <div class="h-full rounded-full {{ $fillColor }} transition-[width] duration-700 ease-out motion-reduce:transition-none"
                                    style="width: {{ $fillPct }}%"></div>
                            </div>

                            {{-- Mobile track --}}
                            <div class="md:hidden absolute left-5 -translate-x-1/2 top-5 bottom-5 w-1 rounded-full bg-slate-100"
                                aria-hidden="true">
                                <div class="w-full rounded-full {{ $fillColor }} transition-[height] duration-700 ease-out motion-reduce:transition-none"
                                    style="height: {{ $fillPct }}%"></div>
                            </div>

                            <ol class="relative grid grid-cols-1 md:grid-cols-4 gap-8 md:gap-0">
                                @foreach ($steps as $i => $step)
                                    @php
                                        $isDone = $i < $currentIndex;
                                        $isActive = $i === $currentIndex;
                                        $isFinal = $i === $total - 1;
                                        $isBadStep = $isBad && $isFinal;
                                        $isComplete = $isDone || ($isActive && $isFinal && $statusKey === 'delivered');

                                        $circle = match (true) {
                                            $isBadStep => 'bg-red-500 text-white ring-4 ring-red-100',
                                            $isComplete => 'bg-brand-600 text-white',
                                            $isActive
                                                => 'bg-white text-brand-700 border-2 border-brand-600 ring-4 ring-brand-100',
                                            default => 'bg-white text-slate-400 border-2 border-slate-200',
                                        };
                                        $label = match (true) {
                                            $isBadStep => 'text-red-700',
                                            $isComplete || $isActive => 'text-slate-900',
                                            default => 'text-slate-400',
                                        };
                                    @endphp

                                    <li class="step-item flex md:flex-col items-center md:text-center gap-4 md:gap-0 p-2 md:p-0"
                                        @if ($isActive) aria-current="step" @endif>

                                        <div
                                            class="relative z-10 shrink-0 w-10 h-10 rounded-full grid place-items-center text-sm font-semibold transition-colors duration-300 {{ $circle }}">
                                            @if ($isBadStep)
                                                <svg class="w-5 h-5" viewBox="0 0 24 24" fill="none"
                                                    stroke="currentColor" stroke-width="2.5" stroke-linecap="round"
                                                    stroke-linejoin="round" aria-hidden="true">
                                                    <path d="M18 6 6 18M6 6l12 12" />
                                                </svg>
                                            @elseif ($isComplete)
                                                <svg class="w-5 h-5" viewBox="0 0 24 24" fill="none"
                                                    stroke="currentColor" stroke-width="2.5" stroke-linecap="round"
                                                    stroke-linejoin="round" aria-hidden="true">
                                                    <path d="M20 6 9 17l-5-5" />
                                                </svg>
                                            @else
                                                {{ $i + 1 }}
                                            @endif

                                            @if ($isActive && !$isComplete && !$isBadStep)
                                                <span
                                                    class="absolute inset-0 rounded-full border-2 border-brand-400 animate-ping opacity-40 motion-reduce:hidden"
                                                    aria-hidden="true"></span>
                                            @endif
                                        </div>

                                        <div class="md:mt-4 min-w-0">
                                            <p class="text-sm font-medium {{ $label }}">{{ $pretty($step) }}</p>
                                            <p
                                                class="text-xs mt-0.5 {{ $isBadStep ? 'text-red-600 font-medium' : ($isActive && !$isComplete ? 'text-brand-700 font-medium' : 'text-slate-400') }}">
                                                @if ($isBadStep)
                                                    {{ ucfirst($statusKey) }}
                                                @elseif ($isComplete)
                                                    Completed
                                                @elseif ($isActive)
                                                    In progress
                                                @elseif (!$isBad)
                                                    Upcoming
                                                @endif
                                            </p>
                                        </div>
                                    </li>
                                @endforeach
                            </ol>
                        </div>
                    </section>

                    {{-- ================= Shipping details ================= --}}
                    <section class="px-6 md:px-8 py-8 border-b border-slate-100/80" aria-labelledby="shipping-title">
                        <h3 id="shipping-title" class="text-base font-semibold text-slate-900 mb-5">Shipping details</h3>

                        <dl class="grid sm:grid-cols-2 gap-x-8 gap-y-5 text-sm">
                            <div>
                                <dt class="text-slate-500">Customer</dt>
                                <dd class="font-medium text-slate-900 mt-0.5">{{ $customerName }}</dd>
                            </div>
                            <div>
                                <dt class="text-slate-500">Phone</dt>
                                <dd class="font-medium text-slate-900 mt-0.5">{{ $customerPhone }}</dd>
                            </div>

                            @if ($customerEmail)
                                <div class="sm:col-span-2">
                                    <dt class="text-slate-500">Email</dt>
                                    <dd class="font-medium text-slate-900 mt-0.5 break-all">{{ $customerEmail }}</dd>
                                </div>
                            @endif

                            <div class="sm:col-span-2">
                                <dt class="text-slate-500">Shipping address</dt>
                                <dd class="font-medium text-slate-900 mt-0.5">{{ $order->shipping_address ?: '—' }}</dd>
                            </div>

                            @if ($order->courier_tracking_code)
                                <div class="sm:col-span-2">
                                    <dt class="text-slate-500">Courier tracking code</dt>
                                    <dd class="font-medium text-slate-900 mt-0.5 flex items-center gap-1.5">
                                        {{ $order->courier_tracking_code }}
                                        <button type="button"
                                            class="js-copy-code -m-1 p-1.5 rounded-md text-slate-400 hover:text-brand-700 hover:bg-slate-100 transition focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-brand-200"
                                            data-code="{{ $order->courier_tracking_code }}"
                                            aria-label="Copy tracking code">
                                            <svg class="w-4 h-4" viewBox="0 0 24 24" fill="none"
                                                stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                                stroke-linejoin="round" aria-hidden="true">
                                                <rect x="9" y="9" width="13" height="13" rx="2" />
                                                <path d="M5 15V5a2 2 0 0 1 2-2h10" />
                                            </svg>
                                        </button>
                                    </dd>
                                </div>
                            @endif

                            @if ($order->notes)
                                <div class="sm:col-span-2">
                                    <dt class="text-slate-500">Notes</dt>
                                    <dd class="text-slate-700 mt-0.5">{{ $order->notes }}</dd>
                                </div>
                            @endif
                        </dl>
                    </section>

                    {{-- ================= Footer ================= --}}
                    <footer
                        class="px-6 md:px-8 py-4 bg-slate-50/80 flex flex-wrap items-center justify-between gap-2 text-sm text-slate-500">
                        <span>
                            Last updated
                            <span
                                class="font-medium text-slate-700">{{ $updatedAt ? $updatedAt->diffForHumans() : '—' }}</span>
                        </span>
                        <span>
                            Need help?
                            <a href="{{ url('/contact-us') }}"
                                class="font-medium text-brand-700 hover:underline transition">Contact us</a>
                        </span>
                    </footer>
                </article>
            @else
                {{-- Empty state --}}
                <div class="bg-white rounded-2xl border border-slate-200 shadow-sm p-8 md:p-10 text-center"
                    role="status">
                    <div class="mx-auto w-14 h-14 rounded-full bg-amber-50 text-amber-600 grid place-items-center mb-4">
                        <svg class="w-7 h-7" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                            stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                            <circle cx="11" cy="11" r="7" />
                            <path d="m21 21-4.3-4.3" />
                            <path d="M11 8v3M11 14h.01" />
                        </svg>
                    </div>
                    <h2 class="text-lg font-semibold text-slate-900">No order found</h2>
                    <p class="text-slate-600 mt-2 max-w-md mx-auto">
                        Nothing matches that code or phone number. Check for typos, or
                        <a href="{{ url('/contact-us') }}"
                            class="font-medium text-brand-700 hover:underline transition">contact us</a>
                        and we'll help you find it.
                    </p>
                </div>
            @endif
        @endif
    </section>
@endsection

@push('scripts')
    <script>
        /* ---------- Copy to clipboard ---------- */
        document.addEventListener('click', async function(e) {
            const btn = e.target.closest('.js-copy-code');
            if (!btn) return;

            e.preventDefault();
            const text = btn.dataset.code || '';
            if (!text) return;

            try {
                await navigator.clipboard.writeText(text);
            } catch (err) {
                const tmp = document.createElement('textarea');
                tmp.value = text;
                document.body.appendChild(tmp);
                tmp.select();
                try {
                    document.execCommand('copy');
                } catch (_) {}
                tmp.remove();
            }

            // Visual feedback
            const original = btn.innerHTML;
            btn.innerHTML =
                '<svg class="w-4 h-4 text-green-600" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M20 6 9 17l-5-5"/></svg>';
            btn.setAttribute('aria-label', 'Copied');
            setTimeout(() => {
                btn.innerHTML = original;
                btn.setAttribute('aria-label', 'Copy code');
            }, 1200);
        });
    </script>
@endpush

@push('styles')
    <style>
        /* subtle motion-safe transitions */
        .motion-reduce\:transition-none {
            transition: none;
        }

        .animate-ping {
            animation: ping 1.5s cubic-bezier(0, 0, 0.2, 1) infinite;
        }

        @keyframes ping {

            75%,
            100% {
                transform: scale(1.8);
                opacity: 0;
            }
        }

        /* improved step hover */
        .step-item {
            transition: background 0.2s, transform 0.1s;
            border-radius: 12px;
        }

        .step-item:hover {
            background: #f8fafc;
        }

        .step-item:active {
            transform: scale(0.99);
        }
    </style>
@endpush
