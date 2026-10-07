@extends('frontend.frrontend_app')

@section('content')
    <section class="container-fluid py-8">
        <a href="{{ route('frontend.profile.orders') }}" class="text-sm text-brand-600 hover:underline">&larr; Back to
            orders</a>
        <h1 class="text-2xl font-bold text-slate-900 mt-2 mb-6">Order #{{ $order->code }}</h1>

        @php
            // আপনার schema-তে grand_total, shipping_cost, coupon_discount আছে — subtotal নেই
            $grandTotal = (float) $order->grand_total;
            $shippingCost = (float) $order->shipping_cost;
            $couponDiscount = (float) $order->coupon_discount;
            $subtotal = $grandTotal - $shippingCost + $couponDiscount;

            $status = $order->delivery_status ?? 'pending';
            $statusBadge = match ($status) {
                'pending' => 'bg-amber-50 text-amber-700',
                'processing' => 'bg-blue-50 text-blue-700',
                'shipped' => 'bg-indigo-50 text-indigo-700',
                'delivered' => 'bg-green-50 text-green-700',
                'cancelled' => 'bg-red-50 text-red-700',
                default => 'bg-slate-100 text-slate-600',
            };
        @endphp

        <div class="grid lg:grid-cols-3 gap-6">
            {{-- Items --}}
            <div class="lg:col-span-2 card p-6">
                <h2 class="font-semibold mb-4">Items</h2>

                @forelse ($order->orderDetails as $item)
                    @php
                        $product = $item->product;
                        $image = $product && $product->thumbnail ? uploaded_asset($product->thumbnail) : null;

                        // variation JSON থেকে label বের করা
                        $variationLabel = null;
                        if (!empty($item->variation)) {
                            $decoded = is_array($item->variation)
                                ? $item->variation
                                : json_decode($item->variation, true);
                            $variationLabel = $decoded['label'] ?? null;
                        }

                        $qty = (int) $item->quantity;
                        $price = (float) $item->price;
                    @endphp

                    <div class="flex gap-3 py-3 border-b border-slate-100 last:border-0">
                        {{-- thumbnail --}}
                        <div
                            class="relative w-14 h-14 rounded-lg overflow-hidden bg-slate-100 shrink-0 grid place-items-center text-slate-300">
                            <svg class="w-6 h-6" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5"
                                stroke-linecap="round" stroke-linejoin="round">
                                <rect x="3" y="3" width="18" height="18" rx="2" />
                                <circle cx="8.5" cy="8.5" r="1.5" />
                                <path d="m21 15-5-5L5 21" />
                            </svg>
                            @if ($image)
                                <img src="{{ $image }}" alt="" width="56" height="56" loading="lazy"
                                    decoding="async" class="absolute inset-0 w-full h-full object-cover bg-slate-100"
                                    onerror="this.remove()">
                            @endif
                        </div>

                        {{-- info --}}
                        <div class="flex-1 min-w-0">
                            <p class="text-sm font-medium text-slate-800 truncate">
                                {{ $product->name ?? 'Item #' . $item->product_id }}
                            </p>
                            <p class="text-xs text-slate-500">
                                @if ($variationLabel)
                                    {{ $variationLabel }} ·
                                @endif
                                @if ($item->sku)
                                    SKU: {{ $item->sku }} ·
                                @endif
                                {{ $qty }} × ৳{{ number_format($price) }}
                            </p>
                        </div>

                        {{-- line total --}}
                        <b class="text-sm shrink-0">৳{{ number_format($qty * $price) }}</b>
                    </div>
                @empty
                    <p class="text-sm text-slate-500 py-4 text-center">No items found in this order.</p>
                @endforelse
            </div>

            {{-- Summary --}}
            <aside class="card p-6 h-fit space-y-3 text-sm">
                <h2 class="font-semibold mb-2">Summary</h2>

                <div class="flex justify-between">
                    <span class="text-slate-500">Subtotal</span>
                    <b>৳{{ number_format($subtotal) }}</b>
                </div>

                @if ($couponDiscount > 0)
                    <div class="flex justify-between text-brand-700">
                        <span>Coupon{{ $order->coupon_code ? ' (' . $order->coupon_code . ')' : '' }}</span>
                        <b>-৳{{ number_format($couponDiscount) }}</b>
                    </div>
                @endif

                <div class="flex justify-between">
                    <span class="text-slate-500">Delivery</span>
                    <b>৳{{ number_format($shippingCost) }}</b>
                </div>

                <div class="flex justify-between border-t border-slate-100 pt-3 text-base">
                    <span class="font-semibold">Total</span>
                    <b class="text-brand-700">৳{{ number_format($grandTotal) }}</b>
                </div>

                <div class="pt-3 border-t border-slate-100">
                    <p class="text-xs text-slate-500 mb-1">Status</p>
                    <span class="text-xs px-2 py-0.5 rounded-full {{ $statusBadge }}">
                        {{ ucfirst($status) }}
                    </span>
                </div>

                <div class="pt-3 border-t border-slate-100">
                    <p class="text-xs text-slate-500 mb-1">Payment</p>
                    <p class="text-sm">
                        {{ ucfirst($order->payment_type ?? 'cod') }} —
                        {{ ucfirst($order->payment_status ?? 'unpaid') }}
                    </p>
                </div>

                <div class="pt-3 border-t border-slate-100">
                    <p class="text-xs text-slate-500 mb-1">Delivery address</p>
                    <p class="text-sm">{{ $order->shipping_address }}</p>
                </div>

                <div class="pt-3 border-t border-slate-100">
                    <p class="text-xs text-slate-500 mb-1">Ordered on</p>
                    <p class="text-sm">
                        {{ \Carbon\Carbon::parse($order->created_at)->format('d M Y, h:i A') }}
                    </p>
                </div>
            </aside>
        </div>
    </section>
@endsection
