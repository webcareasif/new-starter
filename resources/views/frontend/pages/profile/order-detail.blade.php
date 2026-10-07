@extends('frontend.frrontend_app')

@section('content')
    <section class="container-fluid py-8">
        <a href="{{ route('frontend.profile.orders') }}" class="text-sm text-brand-600 hover:underline">&larr; Back to
            orders</a>
        <h1 class="text-2xl font-bold text-slate-900 mt-2 mb-6">Order #{{ $order->code }}</h1>

        <div class="grid lg:grid-cols-3 gap-6">
            <div class="lg:col-span-2 card p-6">
                <h2 class="font-semibold mb-4">Items</h2>
                @foreach ($order->items as $item)
                    <div class="flex justify-between py-3 border-b border-slate-100 last:border-0">
                        <div>
                            <p class="text-sm font-medium">{{ $item->name }}</p>
                            <p class="text-xs text-slate-500">{{ $item->qty }} × ৳{{ number_format($item->price) }}</p>
                        </div>
                        <b class="text-sm">৳{{ number_format($item->qty * $item->price) }}</b>
                    </div>
                @endforeach
            </div>

            <aside class="card p-6 h-fit space-y-3 text-sm">
                <h2 class="font-semibold mb-2">Summary</h2>
                <div class="flex justify-between"><span
                        class="text-slate-500">Subtotal</span><b>৳{{ number_format($order->subtotal) }}</b></div>
                @if ($order->discount > 0)
                    <div class="flex justify-between text-brand-700">
                        <span>Discount</span><b>-৳{{ number_format($order->discount) }}</b>
                    </div>
                @endif
                <div class="flex justify-between"><span
                        class="text-slate-500">Delivery</span><b>৳{{ number_format($order->shipping) }}</b></div>
                <div class="flex justify-between border-t border-slate-100 pt-3 text-base">
                    <span class="font-semibold">Total</span><b
                        class="text-brand-700">৳{{ number_format($order->total) }}</b>
                </div>
                <div class="pt-3 border-t border-slate-100">
                    <p class="text-xs text-slate-500 mb-1">Status</p>
                    <span class="text-xs px-2 py-0.5 rounded-full bg-slate-100">{{ ucfirst($order->status) }}</span>
                </div>
                <div class="pt-3 border-t border-slate-100">
                    <p class="text-xs text-slate-500 mb-1">Delivery address</p>
                    <p class="text-sm">{{ $order->address }}</p>
                </div>
            </aside>
        </div>
    </section>
@endsection
