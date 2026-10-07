@extends('frontend.frrontend_app')

@section('content')
    <section class="container-fluid py-8">
        <h1 class="text-2xl font-bold text-slate-900 mb-6">My Orders</h1>

        <div class="grid lg:grid-cols-[260px_1fr] gap-6">
            @include('frontend.pages.profile._sidebar')

            <div class="card p-6">
                @forelse ($orders as $order)
                    <a href="{{ route('frontend.profile.order', $order->code) }}"
                        class="flex items-center justify-between py-4 border-b border-slate-100 last:border-0 hover:bg-slate-50 -mx-3 px-3 rounded-lg">
                        <div>
                            <p class="font-medium text-slate-800">Order #{{ $order->code }}</p>
                            <p class="text-xs text-slate-500">
                                {{ \Carbon\Carbon::parse($order->created_at)->format('d M Y, h:i A') }}
                            </p>
                        </div>
                        <div class="text-right">
                            {{-- grand_total — NOT total --}}
                            <p class="font-semibold">৳{{ number_format((float) $order->grand_total) }}</p>

                            {{-- delivery_status — NOT status --}}
                            @php
                                $status = $order->delivery_status ?? 'pending';
                                $badge = match ($status) {
                                    'pending' => 'bg-amber-50 text-amber-700',
                                    'processing' => 'bg-blue-50 text-blue-700',
                                    'shipped' => 'bg-indigo-50 text-indigo-700',
                                    'delivered' => 'bg-green-50 text-green-700',
                                    'cancelled' => 'bg-red-50 text-red-700',
                                    default => 'bg-slate-100 text-slate-600',
                                };
                            @endphp
                            <span class="text-xs px-2 py-0.5 rounded-full {{ $badge }}">
                                {{ ucfirst($status) }}
                            </span>
                        </div>
                    </a>
                @empty
                    <p class="text-sm text-slate-500 py-10 text-center">No orders yet.</p>
                @endforelse

                <div class="mt-4">{{ $orders->links() }}</div>
            </div>
        </div>
    </section>
@endsection
