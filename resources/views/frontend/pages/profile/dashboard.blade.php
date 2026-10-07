@extends('frontend.frrontend_app')

@section('content')
    <section class="container-fluid py-8">
        <h1 class="text-2xl font-bold text-slate-900 mb-6">My Account</h1>

        @if (session('success'))
            <div class="mb-4 text-sm bg-green-50 text-green-700 border border-green-200 rounded-lg px-4 py-2">
                {{ session('success') }}
            </div>
        @endif

        <div class="grid lg:grid-cols-[260px_1fr] gap-6">
            @include('frontend.pages.profile._sidebar')

            <div class="space-y-6">
                {{-- Stats --}}
                <div class="grid sm:grid-cols-3 gap-4">
                    <div class="card p-5">
                        <p class="text-xs text-slate-500">Total orders</p>
                        <p class="text-2xl font-bold text-slate-900 mt-1">{{ $stats['total'] }}</p>
                    </div>
                    <div class="card p-5">
                        <p class="text-xs text-slate-500">Pending</p>
                        <p class="text-2xl font-bold text-amber-600 mt-1">{{ $stats['pending'] }}</p>
                    </div>
                    <div class="card p-5">
                        <p class="text-xs text-slate-500">Completed</p>
                        <p class="text-2xl font-bold text-green-600 mt-1">{{ $stats['completed'] }}</p>
                    </div>
                </div>

                {{-- Recent orders --}}
                <div class="card p-6">
                    <div class="flex items-center justify-between mb-4">
                        <h2 class="font-semibold text-slate-900">Recent orders</h2>
                        <a href="{{ route('frontend.profile.orders') }}" class="text-sm text-brand-600 hover:underline">View
                            all</a>
                    </div>

                    @forelse ($orders as $order)
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

                        <div class="flex items-center justify-between py-3 border-b border-slate-100 last:border-0">
                            <div>
                                <a href="{{ route('frontend.profile.order', $order->code) }}"
                                    class="font-medium text-slate-800 hover:text-brand-600">
                                    #{{ $order->code }}
                                </a>
                                <p class="text-xs text-slate-500">
                                    {{ \Carbon\Carbon::parse($order->created_at)->format('d M Y') }}
                                    @if ($order->order_details_count ?? false)
                                        · {{ $order->order_details_count }}
                                        item{{ $order->order_details_count > 1 ? 's' : '' }}
                                    @endif
                                </p>
                            </div>
                            <div class="text-right">
                                {{-- grand_total — NOT total --}}
                                <p class="font-semibold">
                                    ৳{{ number_format((float) $order->grand_total) }}
                                </p>
                                <span class="text-xs px-2 py-0.5 rounded-full {{ $badge }}">
                                    {{ ucfirst($status) }}
                                </span>
                            </div>
                        </div>
                    @empty
                        <p class="text-sm text-slate-500 py-6 text-center">
                            You haven't placed any orders yet.
                        </p>
                    @endforelse
                </div>
            </div>
        </div>
    </section>
@endsection
