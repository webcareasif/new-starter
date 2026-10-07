@extends('frontend.frrontend_app')

@section('content')
    {{-- ================= Hero ================= --}}
    <section class="bg-gradient-to-br from-brand-50 via-white to-brand-50 border-b border-brand-100">
        <div class="container-fluid py-10 md:py-14">
            <div class="max-w-3xl mx-auto text-center">
                <div
                    class="inline-flex items-center justify-center w-14 h-14 rounded-2xl bg-brand-600 text-white shadow-lg shadow-brand-600/20 mb-4">
                    <svg class="w-7 h-7" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"
                        stroke-linecap="round" stroke-linejoin="round">
                        <path d="M3 7h13l5 5v6a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V9a2 2 0 0 1 2-2Z" />
                        <path d="M3 7v4h6V7" />
                        <circle cx="7.5" cy="17.5" r="1.5" />
                        <circle cx="16.5" cy="17.5" r="1.5" />
                    </svg>
                </div>

                <h1 class="text-2xl md:text-3xl font-bold text-brand-900">Track Your Order</h1>
                <p class="text-sm md:text-base text-slate-600 mt-2 max-w-xl mx-auto">
                    Enter your order code or phone number to see the latest delivery status.
                </p>

                <nav class="mt-4 text-sm text-slate-500 flex items-center justify-center gap-1.5 flex-wrap"
                    aria-label="Breadcrumb">
                    <a href="{{ url('/') }}" class="hover:text-brand-600">Home</a>
                    <span class="text-slate-300">/</span>
                    <span class="text-slate-800 font-medium">Track Order</span>
                </nav>
            </div>
        </div>
    </section>

    {{-- ================= Body ================= --}}
    <section class="container-fluid pt-10 pb-20 max-w-3xl mx-auto">

        {{-- ========== Search Form ========== --}}
        <form action="{{ route('frontend.track.order') }}" method="GET"
            class="card p-6 md:p-8 shadow-sm border border-slate-100">

            {{-- Header --}}
            <div class="flex items-start gap-4 mb-6">
                <div
                    class="w-12 h-12 rounded-2xl bg-gradient-to-br from-brand-500 to-brand-700 text-white grid place-items-center shadow-md shadow-brand-600/20 shrink-0">
                    <svg class="w-6 h-6" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"
                        stroke-linecap="round" stroke-linejoin="round">
                        <circle cx="11" cy="11" r="7" />
                        <path d="m21 21-4.3-4.3" />
                    </svg>
                </div>
                <div class="min-w-0">
                    <h2 class="font-semibold text-slate-900 text-base md:text-lg">Find your order</h2>
                    <p class="text-xs md:text-sm text-slate-500 mt-0.5">
                        Enter the order code from your confirmation SMS or email.
                    </p>
                </div>
            </div>

            {{-- Input --}}
            <div>
                <label for="code" class="block text-sm font-medium text-slate-700 mb-1.5">
                    Order Code
                </label>

                <div class="relative group">
                    <span
                        class="pointer-events-none absolute left-3.5 top-1/2 -translate-y-1/2 text-slate-400 group-focus-within:text-brand-600 transition-colors">
                        <svg class="w-4 h-4" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"
                            stroke-linecap="round" stroke-linejoin="round">
                            <path d="M4 4h16v16H4z" />
                            <path d="M8 8h8M8 12h8M8 16h5" />
                        </svg>
                    </span>

                    <input type="text" name="code" id="code" value="{{ $orderId ?? '' }}"
                        placeholder="e.g. NX261007OFUFG" autocomplete="off" autocapitalize="characters" spellcheck="false"
                        class="w-full rounded-xl border border-slate-200 bg-white pl-10 pr-12 py-3 text-sm md:text-base tracking-wide
                          focus:border-brand-600 focus:ring-2 focus:ring-brand-100 outline-none transition">

                    {{-- Clear button (shown when value exists) --}}
                    @if (!empty($orderId))
                        <a href="{{ route('frontend.track.order') }}"
                            class="absolute right-3 top-1/2 -translate-y-1/2 w-7 h-7 rounded-full grid place-items-center text-slate-400 hover:text-slate-700 hover:bg-slate-100 transition"
                            title="Clear" aria-label="Clear">
                            <svg class="w-4 h-4" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                                stroke-linecap="round" stroke-linejoin="round">
                                <path d="M18 6 6 18M6 6l12 12" />
                            </svg>
                        </a>
                    @endif
                </div>

                <p class="text-[11px] text-slate-400 mt-2 flex items-center gap-1.5">
                    <svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"
                        stroke-linecap="round" stroke-linejoin="round">
                        <circle cx="12" cy="12" r="10" />
                        <path d="M12 16v-4M12 8h.01" />
                    </svg>
                    You'll find this code in your order confirmation message.
                </p>
            </div>

            {{-- CTA --}}
            <button type="submit"
                class="btn btn-primary w-full !py-3 mt-6 inline-flex items-center justify-center gap-2 rounded-xl shadow-md shadow-brand-600/20 hover:shadow-lg hover:shadow-brand-600/30 transition-all">
                <svg class="w-4 h-4" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                    stroke-linecap="round" stroke-linejoin="round">
                    <circle cx="11" cy="11" r="7" />
                    <path d="m21 21-4.3-4.3" />
                </svg>
                Track Order
            </button>
        </form>

        {{-- ========== Results ========== --}}
        @if ($searched)
            @if ($order)
                @php
                    $statusColors = [
                        'pending' => 'bg-amber-100 text-amber-800 border-amber-200',
                        'confirmed' => 'bg-blue-100 text-blue-800 border-blue-200',
                        'processing' => 'bg-blue-100 text-blue-800 border-blue-200',
                        'on_delivery' => 'bg-indigo-100 text-indigo-800 border-indigo-200',
                        'shipped' => 'bg-indigo-100 text-indigo-800 border-indigo-200',
                        'delivered' => 'bg-green-100 text-green-800 border-green-200',
                        'cancelled' => 'bg-red-100 text-red-800 border-red-200',
                        'returned' => 'bg-rose-100 text-rose-800 border-rose-200',
                    ];
                    $statusKey = strtolower($order->delivery_status ?? 'pending');
                    $statusClass = $statusColors[$statusKey] ?? 'bg-slate-100 text-slate-800 border-slate-200';

                    $paymentClass =
                        strtolower($order->payment_status) === 'paid'
                            ? 'bg-green-100 text-green-800 border-green-200'
                            : 'bg-amber-100 text-amber-800 border-amber-200';

                    $steps = ['pending', 'confirmed', 'on_delivery', 'delivered'];
                    $currentIndex = array_search($statusKey, $steps);
                    if ($currentIndex === false) {
                        $currentIndex = 0;
                    }

                    $placedAt = $order->created_at ? \Carbon\Carbon::parse($order->created_at) : null;
                    $customerName = $order->name ?: $order->user->name ?? 'Customer';
                    $customerPhone = $order->phone_number ?: $order->user->phone ?? '—';
                    $customerEmail = $order->email_address ?: $order->user->email ?? null;

                    // Safe helper for array/string status
                    $pretty = fn($v) => ucwords(str_replace('_', ' ', (string) $v));
                @endphp

                {{-- ========== Order Card ========== --}}
                <div class="card overflow-hidden mt-6 shadow-sm">

                    {{-- Card header --}}
                    <div class="bg-gradient-to-br from-brand-600 to-brand-700 text-white p-6 md:p-7">
                        <div class="flex flex-wrap items-start justify-between gap-4">
                            <div class="min-w-0">
                                <p class="text-xs text-brand-100 uppercase tracking-wide">Order Code</p>
                                <div class="flex items-center gap-2 mt-1">
                                    <p class="font-semibold text-lg break-all">{{ $order->code }}</p>
                                    <button type="button"
                                        class="js-copy-code text-brand-100 hover:text-white p-1 rounded"
                                        data-code="{{ $order->code }}" aria-label="Copy order code"
                                        title="Copy order code">
                                        <svg class="w-4 h-4" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                            stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round">
                                            <rect x="9" y="9" width="13" height="13" rx="2" />
                                            <path d="M5 15V5a2 2 0 0 1 2-2h10" />
                                        </svg>
                                    </button>
                                </div>
                                @if ($placedAt)
                                    <p class="text-xs text-brand-100 mt-1">
                                        Placed on {{ $placedAt->format('d M Y, h:i A') }}
                                    </p>
                                @endif
                            </div>

                            <div class="text-right">
                                <p class="text-xs text-brand-100 uppercase tracking-wide">Total</p>
                                <p class="font-bold text-xl mt-0.5">
                                    ৳{{ number_format((float) $order->grand_total, 2) }}
                                </p>
                            </div>
                        </div>
                    </div>

                    {{-- Badges row --}}
                    <div class="px-6 md:px-7 py-4 border-b border-slate-100 flex flex-wrap items-center gap-3">
                        <span class="px-3 py-1 rounded-full text-xs font-medium border {{ $statusClass }}">
                            <span class="inline-block w-1.5 h-1.5 rounded-full bg-current mr-1.5 align-middle"></span>
                            {{ $pretty($order->delivery_status ?: 'pending') }}
                        </span>
                        <span class="px-3 py-1 rounded-full text-xs font-medium border {{ $paymentClass }}">
                            {{ ucfirst($order->payment_status ?: 'unpaid') }}
                        </span>
                        <span class="ml-auto text-xs text-slate-500">
                            {{ $pretty($order->payment_type ?: 'cod') }}
                        </span>
                    </div>

                    {{-- ================= Timeline ================= --}}
                    <div class="p-6 md:p-7">
                        <div class="flex items-center justify-between mb-6">
                            <div>
                                <h3 class="text-sm font-semibold text-slate-900">Delivery Progress</h3>
                                <p class="text-xs text-slate-500 mt-0.5">
                                    @if (in_array($statusKey, ['cancelled', 'returned']))
                                        This order has been {{ $statusKey }}.
                                    @elseif ($statusKey === 'delivered')
                                        Delivered on time. Thank you!
                                    @else
                                        Step {{ $currentIndex + 1 }} of {{ count($steps) }} —
                                        {{ $pretty($steps[$currentIndex] ?? 'pending') }}
                                    @endif
                                </p>
                            </div>

                            {{-- Progress percentage chip --}}
                            @php
                                $progressPct = in_array($statusKey, ['cancelled', 'returned'])
                                    ? 100
                                    : (int) round((($currentIndex + 1) / count($steps)) * 100);
                                $isBad = in_array($statusKey, ['cancelled', 'returned']);
                            @endphp
                            <span
                                class="inline-flex items-center gap-1.5 px-2.5 py-1 rounded-full text-xs font-medium
                     {{ $isBad ? 'bg-red-50 text-red-700' : 'bg-brand-50 text-brand-700' }}">
                                <span class="w-1.5 h-1.5 rounded-full bg-current"></span>
                                {{ $progressPct }}%
                            </span>
                        </div>

                        {{-- ================= Timeline ================= --}}
                        <div class="relative">
                            {{-- Desktop horizontal track (base + fill) --}}
                            <div class="hidden md:block absolute top-4 left-0 right-0 h-0.5 bg-slate-100"></div>
                            <div class="hidden md:block absolute top-4 left-0 h-0.5 transition-all duration-500
                    {{ $isBad ? 'bg-red-400' : 'bg-brand-500' }}"
                                style="width: {{ $isBad ? '100%' : (count($steps) > 1 ? ($currentIndex / (count($steps) - 1)) * 100 : 0) }}%">
                            </div>

                            {{-- Mobile vertical track --}}
                            <div class="md:hidden absolute top-2 bottom-2 left-4 w-0.5 bg-slate-100"></div>
                            <div class="md:hidden absolute top-2 left-4 w-0.5 transition-all duration-500
                    {{ $isBad ? 'bg-red-400' : 'bg-brand-500' }}"
                                style="height: {{ $isBad ? '100%' : (count($steps) > 1 ? ($currentIndex / (count($steps) - 1)) * 100 : 0) }}%">
                            </div>

                            <ol class="grid grid-cols-1 md:grid-cols-4 gap-6 md:gap-2 relative">
                                @foreach ($steps as $i => $step)
                                    @php
                                        $isDone = $i < $currentIndex;
                                        $isActive = $i === $currentIndex;
                                        $isFuture = $i > $currentIndex;
                                        $isFinal = $i === count($steps) - 1;
                                        $isBadStep = $isBad && $isFinal;

                                        // Per-step timestamp (optional — uncomment if you have real dates)
                                        // $stepDates = [
                                        //     'pending'     => $order->created_at,
                                        //     'confirmed'   => $order->confirmed_at ?? null,
                                        //     'on_delivery' => $order->shipped_at ?? null,
                                        //     'delivered'   => $order->delivered_at ?? null,
                                        // ];
                                        // $ts = $stepDates[$step] ?? null;

                                    @endphp

                                    <li
                                        class="flex md:flex-col items-start md:items-center md:text-center gap-3 md:gap-0 relative">

                                        {{-- Circle --}}
                                        <div class="relative z-10 shrink-0">
                                            {{-- Ring halo on active --}}
                                            @if ($isActive && !$isBadStep)
                                                <span
                                                    class="absolute inset-0 rounded-full bg-brand-400/30 animate-ping"></span>
                                            @endif

                                            <div
                                                class="relative w-8 h-8 rounded-full grid place-items-center text-xs font-semibold
                                    transition-all duration-300
                                    {{ $isBadStep
                                        ? 'bg-red-500 text-white ring-4 ring-red-100'
                                        : ($isDone || $isActive
                                            ? 'bg-brand-600 text-white ' . ($isActive ? 'ring-4 ring-brand-100' : '')
                                            : 'bg-white text-slate-400 border-2 border-slate-200') }}">

                                                @if ($isBadStep)
                                                    {{-- X icon for cancelled/returned --}}
                                                    <svg class="w-4 h-4" viewBox="0 0 24 24" fill="none"
                                                        stroke="currentColor" stroke-width="2.5" stroke-linecap="round"
                                                        stroke-linejoin="round">
                                                        <path d="M18 6 6 18M6 6l12 12" />
                                                    </svg>
                                                @elseif ($isDone)
                                                    {{-- Check icon for done steps --}}
                                                    <svg class="w-4 h-4" viewBox="0 0 24 24" fill="none"
                                                        stroke="currentColor" stroke-width="2.5" stroke-linecap="round"
                                                        stroke-linejoin="round">
                                                        <path d="M20 6 9 17l-5-5" />
                                                    </svg>
                                                @elseif ($isActive && $isFinal)
                                                    {{-- Special dot for active-final (delivered) --}}
                                                    <svg class="w-4 h-4" viewBox="0 0 24 24" fill="none"
                                                        stroke="currentColor" stroke-width="2.2" stroke-linecap="round"
                                                        stroke-linejoin="round">
                                                        <path d="M20 6 9 17l-5-5" />
                                                    </svg>
                                                @else
                                                    <span class="text-[11px]">{{ $i + 1 }}</span>
                                                @endif
                                            </div>
                                        </div>

                                        {{-- Label + hint --}}
                                        <div class="md:mt-3 min-w-0">
                                            <p
                                                class="text-xs md:text-sm font-medium
                                  {{ $isBadStep ? 'text-red-700' : ($isDone || $isActive ? 'text-slate-900' : 'text-slate-400') }}">
                                                {{ $pretty($step) }}
                                            </p>

                                            @if ($isActive && !$isBadStep)
                                                <p
                                                    class="text-[11px] text-brand-600 font-medium mt-0.5 md:mt-1 inline-flex items-center gap-1">
                                                    <span
                                                        class="w-1.5 h-1.5 rounded-full bg-brand-500 animate-pulse"></span>
                                                    In progress
                                                </p>
                                            @elseif ($isDone)
                                                <p class="text-[11px] text-slate-400 mt-0.5 md:mt-1">Completed</p>
                                            @elseif ($isFuture && !$isBad)
                                                <p class="text-[11px] text-slate-300 mt-0.5 md:mt-1">Pending</p>
                                            @elseif ($isBadStep)
                                                <p class="text-[11px] text-red-500 font-medium mt-0.5 md:mt-1">
                                                    {{ ucfirst($statusKey) }}
                                                </p>
                                            @endif
                                        </div>
                                    </li>
                                @endforeach
                            </ol>
                        </div>

                        {{-- ================= Bottom info strip ================= --}}
                        @if (!in_array($statusKey, ['cancelled', 'returned']))
                            <div class="mt-6 pt-5 border-t border-slate-100 grid grid-cols-2 sm:grid-cols-3 gap-3 text-xs">
                                <div class="flex items-center gap-2 text-slate-500">
                                    <svg class="w-3.5 h-3.5 text-brand-600 shrink-0" viewBox="0 0 24 24" fill="none"
                                        stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                        stroke-linejoin="round">
                                        <circle cx="12" cy="12" r="10" />
                                        <path d="M12 6v6l4 2" />
                                    </svg>
                                    <span>Last updated
                                        <b class="text-slate-700">
                                            {{ $order->updated_at ? \Carbon\Carbon::parse($order->updated_at)->diffForHumans() : '—' }}
                                        </b>
                                    </span>
                                </div>

                                @if ($statusKey === 'delivered')
                                    <div class="flex items-center gap-2 text-slate-500">
                                        <svg class="w-3.5 h-3.5 text-green-600 shrink-0" viewBox="0 0 24 24"
                                            fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                            stroke-linejoin="round">
                                            <path d="M20 6 9 17l-5-5" />
                                        </svg>
                                        <span>Completed successfully</span>
                                    </div>
                                @else
                                    <div class="flex items-center gap-2 text-slate-500">
                                        <svg class="w-3.5 h-3.5 text-indigo-600 shrink-0" viewBox="0 0 24 24"
                                            fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                            stroke-linejoin="round">
                                            <path d="M3 7h13l5 5v6a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V9a2 2 0 0 1 2-2Z" />
                                        </svg>
                                        <span>Estimated delivery in 1–3 days</span>
                                    </div>
                                @endif

                                <div class="flex items-center gap-2 text-slate-500">
                                    <svg class="w-3.5 h-3.5 text-slate-400 shrink-0" viewBox="0 0 24 24" fill="none"
                                        stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                        stroke-linejoin="round">
                                        <path
                                            d="M22 16.92v3a2 2 0 0 1-2.18 2 19.8 19.8 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6A19.8 19.8 0 0 1 2.12 4.18 2 2 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72 12.8 12.8 0 0 0 .7 2.81 2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45 12.8 12.8 0 0 0 2.81.7A2 2 0 0 1 22 16.92Z" />
                                    </svg>
                                    <span>Need help? <a href="{{ url('/contact-us') }}"
                                            class="text-brand-600 hover:underline">Contact us</a></span>
                                </div>
                            </div>
                        @endif
                    </div>

                    {{-- Info grid --}}
                    <div class="px-6 md:px-7 pb-7">
                        <h3 class="text-sm font-semibold text-slate-900 mb-4">Shipping Details</h3>

                        <dl class="grid sm:grid-cols-2 gap-x-6 gap-y-4 text-sm">
                            <div>
                                <dt class="text-xs text-slate-500 mb-0.5">Customer</dt>
                                <dd class="font-medium text-slate-900">{{ $customerName }}</dd>
                            </div>
                            <div>
                                <dt class="text-xs text-slate-500 mb-0.5">Phone</dt>
                                <dd class="font-medium text-slate-900">{{ $customerPhone }}</dd>
                            </div>

                            @if ($customerEmail)
                                <div class="sm:col-span-2">
                                    <dt class="text-xs text-slate-500 mb-0.5">Email</dt>
                                    <dd class="font-medium text-slate-900 break-all">{{ $customerEmail }}</dd>
                                </div>
                            @endif

                            <div class="sm:col-span-2">
                                <dt class="text-xs text-slate-500 mb-0.5">Shipping Address</dt>
                                <dd class="font-medium text-slate-900">{{ $order->shipping_address ?: '—' }}</dd>
                            </div>

                            @if ($order->courier_tracking_code)
                                <div class="sm:col-span-2">
                                    <dt class="text-xs text-slate-500 mb-0.5">Courier Tracking Code</dt>
                                    <dd class="font-medium text-slate-900">
                                        <span class="inline-flex items-center gap-1.5">
                                            {{ $order->courier_tracking_code }}
                                            <button type="button"
                                                class="js-copy-code text-slate-400 hover:text-brand-600"
                                                data-code="{{ $order->courier_tracking_code }}"
                                                aria-label="Copy tracking code">
                                                <svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none"
                                                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                                                    stroke-linejoin="round">
                                                    <rect x="9" y="9" width="13" height="13" rx="2" />
                                                    <path d="M5 15V5a2 2 0 0 1 2-2h10" />
                                                </svg>
                                            </button>
                                        </span>
                                    </dd>
                                </div>
                            @endif

                            @if ($order->notes)
                                <div class="sm:col-span-2">
                                    <dt class="text-xs text-slate-500 mb-0.5">Notes</dt>
                                    <dd class="text-slate-700">{{ $order->notes }}</dd>
                                </div>
                            @endif
                        </dl>
                    </div>
                </div>
            @else
                {{-- Empty state --}}
                <div class="card p-10 mt-6 text-center">
                    <div class="mx-auto w-16 h-16 rounded-full bg-amber-50 text-amber-600 grid place-items-center mb-4">
                        <svg class="w-8 h-8" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                            stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round">
                            <circle cx="11" cy="11" r="7" />
                            <path d="m21 21-4.3-4.3" />
                            <path d="M11 8v3M11 14h.01" />
                        </svg>
                    </div>
                    <h3 class="text-lg font-semibold text-slate-900">No order found</h3>
                    <p class="text-sm text-slate-500 mt-2 max-w-md mx-auto">
                        We couldn't find any order matching that code or phone number.
                        Double-check the details, or <a href="{{ url('/contact-us') }}"
                            class="text-brand-600 hover:underline">contact us</a> if you need help.
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
                // Fallback
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
                '<svg class="w-4 h-4" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><path d="M20 6 9 17l-5-5"/></svg>';
            btn.classList.add('text-white');
            setTimeout(() => {
                btn.innerHTML = original;
                btn.classList.remove('text-white');
            }, 1200);
        });
    </script>
@endpush
