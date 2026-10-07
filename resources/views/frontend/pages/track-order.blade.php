@extends('frontend.frrontend_app')

@section('content')
    <section class="hero-bg border-b border-brand-100">
        <div class="container-fluid py-9 md:py-12">
            <h1 class="text-2xl md:text-3xl font-bold text-brand-900">Track Your Order</h1>
            <p class="text-sm text-slate-600 mt-1.5 max-w-xl">Enter your order code or phone number to see the latest status.
            </p>
            <div class="mt-3">
                <nav class="text-sm text-slate-500 flex items-center gap-1.5 flex-wrap" aria-label="Breadcrumb">
                    <a href="{{ url('/') }}" class="hover:text-brand-600">Home</a>
                    <span class="text-slate-300">/</span>
                    <span class="text-slate-800 font-medium">Track Order</span>
                </nav>
            </div>
        </div>
    </section>

    <section class="container-fluid pt-10 pb-16 max-w-3xl mx-auto">
        {{-- Search form --}}
        <form action="{{ route('frontend.track.order') }}" method="GET" class="card p-6 md:p-8">
            <div class="grid md:grid-cols-2 gap-4">
                <div>
                    <label for="code" class="block text-sm font-medium text-slate-700 mb-1.5">Order Code</label>
                    <input type="text" name="code" id="code" value="{{ $orderId ?? '' }}"
                        placeholder="e.g. ORD-6AC4957680234-6533"
                        class="w-full rounded-lg border border-slate-200 px-4 py-2.5 text-sm focus:border-brand-600 focus:ring-0 outline-none">
                </div>
                <div>
                    <label for="phone" class="block text-sm font-medium text-slate-700 mb-1.5">Phone Number</label>
                    <input type="text" name="phone" id="phone" value="{{ $phone ?? '' }}"
                        placeholder="e.g. 01XXXXXXXXX"
                        class="w-full rounded-lg border border-slate-200 px-4 py-2.5 text-sm focus:border-brand-600 focus:ring-0 outline-none">
                </div>
            </div>
            <button type="submit" class="btn btn-primary btn-sm mt-5">Track Order</button>
        </form>

        {{-- Result --}}
        @if ($searched)
            @if ($order)
                @php
                    // Status badge colours
                    $statusColors = [
                        'pending' => 'bg-amber-100 text-amber-700',
                        'confirmed' => 'bg-blue-100 text-blue-700',
                        'processing' => 'bg-blue-100 text-blue-700',
                        'on_delivery' => 'bg-indigo-100 text-indigo-700',
                        'shipped' => 'bg-indigo-100 text-indigo-700',
                        'delivered' => 'bg-green-100 text-green-700',
                        'cancelled' => 'bg-red-100 text-red-700',
                        'returned' => 'bg-rose-100 text-rose-700',
                    ];
                    $statusKey = strtolower($order->delivery_status ?? 'pending');
                    $statusClass = $statusColors[$statusKey] ?? 'bg-slate-100 text-slate-700';

                    // Payment badge
                    $paymentClass =
                        strtolower($order->payment_status) === 'paid'
                            ? 'bg-green-100 text-green-700'
                            : 'bg-amber-100 text-amber-700';

                    // Timeline steps
                    $steps = ['pending', 'confirmed', 'on_delivery', 'delivered'];
                    $currentIndex = array_search($statusKey, $steps);
                    if ($currentIndex === false) {
                        $currentIndex = in_array($statusKey, ['cancelled', 'returned']) ? 0 : 0;
                    }

                    // Resolve display date
                    $placedAt = $order->created_at ? \Carbon\Carbon::parse($order->created_at) : null;

                    // Safe display values (name/phone/email may be null in your data)
                    $customerName = $order->name ?: $order->user->name ?? 'Customer';
                    $customerPhone = $order->phone_number ?: $order->user->phone ?? '—';
                    $customerEmail = $order->email_address ?: $order->user->email ?? null;
                @endphp

                <div class="card p-6 md:p-8 mt-6">
                    <div class="flex items-center justify-between flex-wrap gap-3">
                        <div>
                            <p class="text-xs text-slate-500">Order Code</p>
                            <p class="font-semibold text-slate-900 break-all">{{ $order->code }}</p>
                        </div>
                        <div>
                            <p class="text-xs text-slate-500">Placed On</p>
                            <p class="font-semibold text-slate-900">
                                {{ $placedAt ? $placedAt->format('d M Y') : '—' }}
                            </p>
                        </div>
                        <div>
                            <p class="text-xs text-slate-500">Total</p>
                            <p class="font-semibold text-slate-900">৳{{ number_format((float) $order->grand_total, 2) }}</p>
                        </div>
                        <span class="px-3 py-1 rounded-full text-xs font-medium {{ $statusClass }}">
                            {{ ucwords(str_replace('_', ' ', $order->delivery_status)) }}
                        </span>
                    </div>

                    {{-- Status timeline --}}
                    <div class="mt-7 grid grid-cols-4 gap-2 text-center text-xs">
                        @foreach ($steps as $i => $step)
                            <div>
                                <div
                                    class="w-8 h-8 mx-auto rounded-full grid place-items-center
                                    {{ $i <= $currentIndex ? 'bg-brand-600 text-white' : 'bg-slate-100 text-slate-400' }}">
                                    {{ $i + 1 }}
                                </div>
                                <p
                                    class="mt-2 {{ $i <= $currentIndex ? 'text-slate-900 font-medium' : 'text-slate-400' }}">
                                    {{ ucwords(str_replace('_', ' ', $step)) }}
                                </p>
                            </div>
                        @endforeach
                    </div>

                    {{-- Shipping info --}}
                    <div class="mt-7 pt-5 border-t border-slate-100 grid md:grid-cols-2 gap-4 text-sm">
                        <div>
                            <p class="text-xs text-slate-500">Customer</p>
                            <p class="text-slate-900 font-medium">{{ $customerName }}</p>
                        </div>
                        <div>
                            <p class="text-xs text-slate-500">Phone</p>
                            <p class="text-slate-900 font-medium">{{ $customerPhone }}</p>
                        </div>
                        @if ($customerEmail)
                            <div class="md:col-span-2">
                                <p class="text-xs text-slate-500">Email</p>
                                <p class="text-slate-900 font-medium">{{ $customerEmail }}</p>
                            </div>
                        @endif
                        <div class="md:col-span-2">
                            <p class="text-xs text-slate-500">Shipping Address</p>
                            <p class="text-slate-900 font-medium">{{ $order->shipping_address ?: '—' }}</p>
                        </div>
                        <div>
                            <p class="text-xs text-slate-500">Payment Method</p>
                            <p class="text-slate-900 font-medium">
                                {{ ucwords(str_replace('_', ' ', $order->payment_type)) }}
                            </p>
                        </div>
                        <div>
                            <p class="text-xs text-slate-500">Payment Status</p>
                            <span
                                class="inline-block mt-0.5 px-2.5 py-0.5 rounded-full text-xs font-medium {{ $paymentClass }}">
                                {{ ucfirst($order->payment_status) }}
                            </span>
                        </div>
                        @if ($order->courier_tracking_code)
                            <div>
                                <p class="text-xs text-slate-500">Courier Tracking Code</p>
                                <p class="text-slate-900 font-medium">{{ $order->courier_tracking_code }}</p>
                            </div>
                        @endif
                        @if ($order->notes)
                            <div class="md:col-span-2">
                                <p class="text-xs text-slate-500">Notes</p>
                                <p class="text-slate-900 font-medium">{{ $order->notes }}</p>
                            </div>
                        @endif
                    </div>
                </div>
            @else
                <div class="card p-6 md:p-8 mt-6 text-center">
                    <p class="text-slate-600">No order found for the details you provided. Please check and try again.</p>
                </div>
            @endif
        @endif
    </section>
@endsection

@push('scripts')
@endpush
