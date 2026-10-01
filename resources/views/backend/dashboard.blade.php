@extends('backend.layouts.app')

@section('content')
    <div class="container-fluid py-4">

        <style>
            .dash-card {
                border: 0;
                border-radius: 14px;
                box-shadow: 0 4px 18px rgba(15, 23, 42, .06);
                background: #fff;
                height: 100%;
            }

            .dash-card .card-header {
                background: #fff;
                border-bottom: 1px solid #f1f5f9;
                border-radius: 14px 14px 0 0;
                padding: 16px 20px;
            }

            .section-title {
                font-weight: 700;
                font-size: 16px;
                color: #111827;
                margin-bottom: 0;
            }

            .mini-text {
                color: #6b7280;
                font-size: 12px;
            }

            .kpi-card {
                padding: 20px;
            }

            .kpi-label {
                color: #6b7280;
                font-size: 13px;
                font-weight: 500;
            }

            .kpi-value {
                font-size: 26px;
                font-weight: 800;
                color: #111827;
                margin: 6px 0 4px;
            }

            .kpi-icon {
                width: 46px;
                height: 46px;
                border-radius: 12px;
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 24px;
            }

            .ic-indigo { background: #eef2ff; color: #4f46e5; }
            .ic-green { background: #dcfce7; color: #16a34a; }
            .ic-amber { background: #fef3c7; color: #d97706; }
            .ic-pink { background: #fce7f3; color: #db2777; }
            .ic-red { background: #fee2e2; color: #dc2626; }
            .ic-sky { background: #e0f2fe; color: #0284c7; }

            .attention-item {
                display: flex;
                align-items: center;
                gap: 14px;
                padding: 16px 18px;
                border-radius: 14px;
                background: #fff;
                border: 1px solid #eef2f7;
                color: inherit;
                transition: .2s;
                height: 100%;
            }

            .attention-item:hover {
                text-decoration: none;
                color: inherit;
                border-color: #c7d2fe;
                box-shadow: 0 4px 14px rgba(79, 70, 229, .08);
            }

            .attention-item .count {
                font-size: 22px;
                font-weight: 800;
                line-height: 1;
            }

            .badge-soft-success { background: #dcfce7; color: #166534; }
            .badge-soft-warning { background: #fef3c7; color: #92400e; }
            .badge-soft-danger { background: #fee2e2; color: #991b1b; }
            .badge-soft-info { background: #dbeafe; color: #1d4ed8; }
            .badge-soft-secondary { background: #f1f5f9; color: #475569; }

            .product-img {
                width: 40px;
                height: 40px;
                border-radius: 10px;
                background: #f3f4f6;
                overflow: hidden;
                flex-shrink: 0;
            }

            .product-img img {
                width: 100%;
                height: 100%;
                object-fit: cover;
            }

            .status-row {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 6px;
                font-size: 13px;
            }

            .status-row + .progress {
                height: 6px;
                border-radius: 10px;
                margin-bottom: 14px;
            }

            .dash-table th {
                font-size: 12px;
                text-transform: uppercase;
                color: #6b7280;
                font-weight: 600;
                border-top: 0;
            }

            .dash-table td {
                vertical-align: middle;
                font-size: 13px;
            }
        </style>

        @php
            $taka = fn($v) => '৳' . number_format($v, 0);
            $deliveryBadges = [
                'pending' => 'badge-soft-secondary',
                'processing' => 'badge-soft-info',
                'shipped' => 'badge-soft-info',
                'delivered' => 'badge-soft-success',
                'cancelled' => 'badge-soft-danger',
            ];
            $statusColors = [
                'pending' => 'bg-secondary',
                'processing' => 'bg-info',
                'shipped' => 'bg-primary',
                'delivered' => 'bg-success',
                'cancelled' => 'bg-danger',
            ];
            $totalStatusOrders = max(1, $orderStatusCounts->sum());
        @endphp

        <!-- Header -->
        <div class="d-flex justify-content-between align-items-center mb-4 flex-wrap">
            <div>
                <h2 class="fw-bold mb-0">{{ translate('Dashboard') }}</h2>
                <small class="text-muted">{{ now()->format('l, d M Y') }}</small>
            </div>
            <div class="mt-2">
                <a href="{{ route('orders.index') }}" class="btn btn-light shadow-sm mr-2">
                    <i class="las la-shopping-cart"></i> {{ translate('Orders') }}
                </a>
                <a href="{{ route('reports.orders') }}" class="btn btn-light shadow-sm mr-2">
                    <i class="las la-chart-bar"></i> {{ translate('Reports') }}
                </a>
                <a href="{{ route('products.create') }}" class="btn btn-primary px-4">
                    <i class="las la-plus"></i> {{ translate('Add Product') }}
                </a>
            </div>
        </div>

        <!-- KPI Cards -->
        <div class="row">
            <div class="col-xl-3 col-md-6 mb-4">
                <div class="dash-card kpi-card">
                    <div class="d-flex justify-content-between">
                        <div>
                            <div class="kpi-label">{{ translate("Today's Revenue") }}</div>
                            <div class="kpi-value">{{ $taka($todayRevenue) }}</div>
                            <small class="text-muted">{{ number_format($ordersToday) }} {{ translate('orders today') }}</small>
                        </div>
                        <div class="kpi-icon ic-indigo"><i class="las la-wallet"></i></div>
                    </div>
                </div>
            </div>

            <div class="col-xl-3 col-md-6 mb-4">
                <div class="dash-card kpi-card">
                    <div class="d-flex justify-content-between">
                        <div>
                            <div class="kpi-label">{{ translate('This Month Revenue') }}</div>
                            <div class="kpi-value">{{ $taka($monthRevenue) }}</div>
                            @if (is_null($revenueGrowth))
                                <small class="text-muted">{{ translate('No sales last month') }}</small>
                            @else
                                <small class="{{ $revenueGrowth >= 0 ? 'text-success' : 'text-danger' }}">
                                    <i class="las {{ $revenueGrowth >= 0 ? 'la-arrow-up' : 'la-arrow-down' }}"></i>
                                    {{ abs($revenueGrowth) }}%
                                </small>
                                <small class="text-muted">{{ translate('vs last month') }}</small>
                            @endif
                        </div>
                        <div class="kpi-icon ic-green"><i class="las la-chart-line"></i></div>
                    </div>
                </div>
            </div>

            <div class="col-xl-3 col-md-6 mb-4">
                <div class="dash-card kpi-card">
                    <div class="d-flex justify-content-between">
                        <div>
                            <div class="kpi-label">{{ translate('Orders This Month') }}</div>
                            <div class="kpi-value">{{ number_format($ordersThisMonth) }}</div>
                            <small class="text-muted">{{ translate('Avg. order') }} {{ $taka($avgOrderValue) }}</small>
                        </div>
                        <div class="kpi-icon ic-amber"><i class="las la-shopping-bag"></i></div>
                    </div>
                </div>
            </div>

            <div class="col-xl-3 col-md-6 mb-4">
                <div class="dash-card kpi-card">
                    <div class="d-flex justify-content-between">
                        <div>
                            <div class="kpi-label">{{ translate('Customers') }}</div>
                            <div class="kpi-value">{{ number_format($totalCustomers) }}</div>
                            <small class="text-success">+{{ number_format($newCustomersThisMonth) }}</small>
                            <small class="text-muted">{{ translate('new this month') }}</small>
                        </div>
                        <div class="kpi-icon ic-pink"><i class="las la-users"></i></div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Needs Attention -->
        <div class="row">
            <div class="col-xl-3 col-md-6 mb-4">
                <a href="{{ route('orders.index', ['delivery_status' => 'pending']) }}" class="attention-item">
                    <div class="kpi-icon ic-amber"><i class="las la-clock"></i></div>
                    <div>
                        <div class="count">{{ number_format($pendingOrders) }}</div>
                        <small class="text-muted">{{ translate('Pending orders to confirm') }}</small>
                    </div>
                </a>
            </div>
            <div class="col-xl-3 col-md-6 mb-4">
                <a href="{{ route('orders.index', ['delivery_status' => 'processing']) }}" class="attention-item">
                    <div class="kpi-icon ic-sky"><i class="las la-box"></i></div>
                    <div>
                        <div class="count">{{ number_format($processingOrders) }}</div>
                        <small class="text-muted">{{ translate('Processing, ready to ship') }}</small>
                    </div>
                </a>
            </div>
            <div class="col-xl-3 col-md-6 mb-4">
                <a href="{{ route('reports.product-stocks') }}" class="attention-item">
                    <div class="kpi-icon ic-amber"><i class="las la-exclamation-triangle"></i></div>
                    <div>
                        <div class="count">{{ number_format($lowStockProducts) }}</div>
                        <small class="text-muted">{{ translate('Products low on stock') }}</small>
                    </div>
                </a>
            </div>
            <div class="col-xl-3 col-md-6 mb-4">
                <a href="{{ route('reports.product-stocks') }}" class="attention-item">
                    <div class="kpi-icon ic-red"><i class="las la-ban"></i></div>
                    <div>
                        <div class="count">{{ number_format($outOfStockProducts) }}</div>
                        <small class="text-muted">{{ translate('Products out of stock') }}</small>
                    </div>
                </a>
            </div>
        </div>

        <!-- Sales Chart & Order Status -->
        <div class="row">
            <div class="col-lg-8 mb-4">
                <div class="card dash-card">
                    <div class="card-header">
                        <h5 class="section-title">{{ translate('Sales Overview') }}</h5>
                        <span class="mini-text">{{ translate('Paid revenue and orders, last 30 days') }}</span>
                    </div>
                    <div class="card-body">
                        <div style="height: 300px;">
                            <canvas id="salesChart"></canvas>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-4 mb-4">
                <div class="card dash-card">
                    <div class="card-header">
                        <h5 class="section-title">{{ translate('Order Status') }}</h5>
                        <span class="mini-text">{{ translate('All orders by delivery status') }}</span>
                    </div>
                    <div class="card-body">
                        @foreach ($statusColors as $status => $color)
                            @php $count = $orderStatusCounts[$status] ?? 0; @endphp
                            <div class="status-row">
                                <span>{{ translate(ucfirst($status)) }}</span>
                                <strong>{{ number_format($count) }}</strong>
                            </div>
                            <div class="progress">
                                <div class="progress-bar {{ $color }}"
                                    style="width: {{ ($count / $totalStatusOrders) * 100 }}%"></div>
                            </div>
                        @endforeach
                    </div>
                </div>
            </div>
        </div>

        <!-- Recent Orders & Side Lists -->
        <div class="row">
            <div class="col-lg-8 mb-4">
                <div class="card dash-card">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <div>
                            <h5 class="section-title">{{ translate('Recent Orders') }}</h5>
                            <span class="mini-text">{{ translate('Latest customer orders') }}</span>
                        </div>
                        <a href="{{ route('orders.index') }}" class="btn btn-sm btn-outline-primary">{{ translate('View All') }}</a>
                    </div>
                    <div class="card-body table-responsive p-0">
                        <table class="table dash-table mb-0">
                            <thead>
                                <tr>
                                    <th class="pl-4">{{ translate('Order') }}</th>
                                    <th>{{ translate('Customer') }}</th>
                                    <th>{{ translate('Amount') }}</th>
                                    <th>{{ translate('Payment') }}</th>
                                    <th>{{ translate('Status') }}</th>
                                    <th class="pr-4">{{ translate('Date') }}</th>
                                </tr>
                            </thead>
                            <tbody>
                                @forelse ($recentOrdersList as $order)
                                    <tr>
                                        <td class="pl-4">
                                            <a href="{{ route('orders.show', $order->id) }}"><strong>#{{ $order->code }}</strong></a>
                                        </td>
                                        <td>{{ $order->user->name ?? translate('Guest') }}</td>
                                        <td>{{ $taka($order->grand_total) }}</td>
                                        <td>
                                            @if ($order->payment_status == 'paid')
                                                <span class="badge badge-soft-success">{{ translate('Paid') }}</span>
                                            @else
                                                <span class="badge badge-soft-warning">{{ translate('Unpaid') }}</span>
                                            @endif
                                        </td>
                                        <td>
                                            <span class="badge {{ $deliveryBadges[$order->delivery_status] ?? 'badge-soft-secondary' }}">
                                                {{ translate(ucfirst($order->delivery_status)) }}
                                            </span>
                                        </td>
                                        <td class="pr-4 text-muted">{{ $order->created_at->format('d M, h:i A') }}</td>
                                    </tr>
                                @empty
                                    <tr>
                                        <td colspan="6" class="text-center text-muted py-4">{{ translate('No orders yet') }}</td>
                                    </tr>
                                @endforelse
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <div class="col-lg-4 mb-4">
                <!-- Top Products -->
                <div class="card dash-card mb-4" style="height: auto;">
                    <div class="card-header">
                        <h5 class="section-title">{{ translate('Top Products') }}</h5>
                        <span class="mini-text">{{ translate('Best sellers, last 30 days') }}</span>
                    </div>
                    <div class="card-body">
                        @forelse ($topProducts as $item)
                            <div class="d-flex align-items-center mb-3">
                                <div class="product-img mr-3">
                                    <img src="{{ uploaded_asset(optional($item->product)->thumbnail) }}"
                                        alt="{{ optional($item->product)->name }}">
                                </div>
                                <div class="flex-grow-1" style="min-width: 0;">
                                    <div class="text-truncate"><strong>{{ optional($item->product)->name ?? translate('Deleted product') }}</strong></div>
                                    <small class="text-muted">{{ number_format($item->total_sold) }} {{ translate('sold') }}</small>
                                </div>
                                <strong class="text-primary ml-2">{{ $taka($item->total_revenue) }}</strong>
                            </div>
                        @empty
                            <p class="text-muted mb-0">{{ translate('No sales in the last 30 days') }}</p>
                        @endforelse
                    </div>
                </div>

                <!-- Low Stock -->
                <div class="card dash-card" style="height: auto;">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <div>
                            <h5 class="section-title">{{ translate('Low Stock') }}</h5>
                            <span class="mini-text">{{ translate('Restock these soon') }}</span>
                        </div>
                        <a href="{{ route('reports.product-stocks') }}" class="btn btn-sm btn-outline-primary">{{ translate('View All') }}</a>
                    </div>
                    <div class="card-body">
                        @forelse ($inventoryAlerts as $alert)
                            <div class="d-flex justify-content-between align-items-center mb-2">
                                <span class="text-truncate mr-2">{{ optional($alert->product)->name ?? translate('Deleted product') }}</span>
                                <span class="badge {{ $alert->stock <= 0 ? 'badge-soft-danger' : 'badge-soft-warning' }}">
                                    {{ $alert->stock <= 0 ? translate('Out of stock') : $alert->stock . ' ' . translate('left') }}
                                </span>
                            </div>
                        @empty
                            <p class="text-success mb-0"><i class="las la-check-circle"></i> {{ translate('All products are well stocked') }}</p>
                        @endforelse
                    </div>
                </div>
            </div>
        </div>

    </div>
@endsection

@section('script')
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
        new Chart(document.getElementById('salesChart'), {
            type: 'bar',
            data: {
                labels: @json($chartLabels),
                datasets: [{
                        label: 'Revenue',
                        data: @json($chartRevenue),
                        backgroundColor: 'rgba(79, 70, 229, 0.75)',
                        borderRadius: 6,
                        yAxisID: 'y'
                    },
                    {
                        label: 'Orders',
                        data: @json($chartOrders),
                        type: 'line',
                        borderColor: '#16a34a',
                        backgroundColor: '#16a34a',
                        borderWidth: 2,
                        pointRadius: 2,
                        tension: 0.35,
                        yAxisID: 'y1'
                    }
                ]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                interaction: {
                    mode: 'index',
                    intersect: false
                },
                plugins: {
                    legend: {
                        position: 'bottom'
                    },
                    tooltip: {
                        callbacks: {
                            label: function(ctx) {
                                return ctx.dataset.yAxisID === 'y' ?
                                    'Revenue: ৳' + ctx.raw.toLocaleString() :
                                    'Orders: ' + ctx.raw;
                            }
                        }
                    }
                },
                scales: {
                    x: {
                        grid: {
                            display: false
                        },
                        ticks: {
                            maxTicksLimit: 10
                        }
                    },
                    y: {
                        beginAtZero: true,
                        ticks: {
                            callback: v => '৳' + v.toLocaleString()
                        }
                    },
                    y1: {
                        beginAtZero: true,
                        position: 'right',
                        grid: {
                            drawOnChartArea: false
                        },
                        ticks: {
                            precision: 0
                        }
                    }
                }
            }
        });
    </script>
@endsection
