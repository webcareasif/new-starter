@extends('frontend.frrontend_app')

@section('content')
    <section class="container-fluid py-12 max-w-2xl mx-auto text-center">
        <div class="mx-auto w-16 h-16 rounded-full bg-brand-50 text-brand-600 grid place-items-center mb-4">
            <svg class="w-8 h-8" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                stroke-linejoin="round">
                <path d="M20 6 9 17l-5-5" />
            </svg>
        </div>
        <h1 class="text-2xl font-bold text-slate-900">Thank you, {{ $order->name }}!</h1>
        <p class="text-slate-500 mt-2">Your order has been placed. We'll call you to confirm it shortly.</p>

        <div class="card p-5 mt-8 text-left">
            <div class="flex justify-between text-sm mb-4">
                <span class="text-slate-500">Order number</span>
                <b class="text-slate-900">{{ $order->code }}</b>
            </div>

            <ul class="divide-y divide-slate-100 text-sm">
                @foreach ($order->orderDetails as $d)
                    @php $label = $d->variation ? (json_decode($d->variation, true)['label'] ?? null) : null; @endphp
                    <li class="flex justify-between gap-3 py-2.5">
                        <span>
                            {{ $d->product->name ?? 'Product' }}
                            @if ($label)
                                <span class="text-xs text-slate-500">({{ $label }})</span>
                            @endif
                            <span class="text-slate-500">× {{ $d->quantity }}</span>
                        </span>
                        <b>৳{{ number_format($d->price * $d->quantity) }}</b>
                    </li>
                @endforeach
            </ul>

            <div class="border-t border-slate-100 mt-3 pt-3 space-y-1.5 text-sm">
                <div class="flex justify-between"><span
                        class="text-slate-500">Delivery</span><b>৳{{ number_format($order->shipping_cost) }}</b></div>
                <div class="flex justify-between text-base"><span class="font-semibold">Total (COD)</span><b
                        class="text-brand-700">৳{{ number_format($order->grand_total) }}</b></div>
            </div>

            <div class="border-t border-slate-100 mt-4 pt-4 text-sm text-slate-600">
                <p><b>Deliver to:</b> {{ $order->shipping_address }}</p>
                <p class="mt-1"><b>Phone:</b> {{ $order->phone_number }}</p>
            </div>
        </div>

        <div class="flex justify-center gap-3 mt-8">
            <a href="{{ route('frontend.track.order', ['code' => $order->code]) }}" class="btn btn-outline">Track Order</a>
            <a href="{{ route('frontend.all-products') }}" class="btn btn-primary">Continue Shopping</a>
        </div>
    </section>
@endsection
