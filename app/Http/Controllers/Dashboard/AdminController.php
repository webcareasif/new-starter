<?php

namespace App\Http\Controllers\Dashboard;

use App\Http\Controllers\Controller;
use App\Models\Admin\Order;
use App\Models\Admin\Product;
use App\Models\Admin\ProductInventory;
use App\Models\Admin\Review;
use App\Models\OrderDetail;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\DB;

class AdminController extends Controller
{

    public function admin_dashboard(Request $request)
    {
        $paid = fn () => Order::where('payment_status', 'paid');

        // ========== KPI CARDS ==========
        $todayRevenue = $paid()->whereDate('created_at', today())->sum('grand_total');
        $ordersToday = Order::whereDate('created_at', today())->count();

        $monthRevenue = $paid()->whereBetween('created_at', [now()->startOfMonth(), now()])->sum('grand_total');
        $previousMonthRevenue = $paid()
            ->whereBetween('created_at', [now()->subMonthNoOverflow()->startOfMonth(), now()->subMonthNoOverflow()->endOfMonth()])
            ->sum('grand_total');
        $revenueGrowth = $previousMonthRevenue > 0
            ? round((($monthRevenue - $previousMonthRevenue) / $previousMonthRevenue) * 100, 1)
            : null;

        $ordersThisMonth = Order::whereBetween('created_at', [now()->startOfMonth(), now()])->count();
        $paidOrdersThisMonth = $paid()->whereBetween('created_at', [now()->startOfMonth(), now()])->count();
        $avgOrderValue = $paidOrdersThisMonth > 0 ? round($monthRevenue / $paidOrdersThisMonth, 2) : 0;

        $totalCustomers = User::count();
        $newCustomersThisMonth = User::whereBetween('created_at', [now()->startOfMonth(), now()])->count();

        // ========== NEEDS ATTENTION ==========
        $orderStatusCounts = Order::select('delivery_status', DB::raw('COUNT(*) as count'))
            ->groupBy('delivery_status')
            ->pluck('count', 'delivery_status');

        $pendingOrders = $orderStatusCounts['pending'] ?? 0;
        $processingOrders = $orderStatusCounts['processing'] ?? 0;
        $lowStockProducts = ProductInventory::whereColumn('stock', '<=', 'low_stock_qty')->where('stock', '>', 0)->count();
        $outOfStockProducts = ProductInventory::where('stock', '<=', 0)->count();

        // ========== SALES CHART (LAST 30 DAYS) ==========
        $start = now()->subDays(29)->startOfDay();
        $dailyRows = Order::where('created_at', '>=', $start)
            ->select(
                DB::raw('DATE(created_at) as day'),
                DB::raw('COUNT(*) as orders'),
                DB::raw("SUM(CASE WHEN payment_status = 'paid' THEN grand_total ELSE 0 END) as revenue")
            )
            ->groupBy('day')
            ->get()
            ->keyBy('day');

        $chartLabels = [];
        $chartRevenue = [];
        $chartOrders = [];
        for ($i = 0; $i < 30; $i++) {
            $date = $start->copy()->addDays($i);
            $row = $dailyRows->get($date->toDateString());
            $chartLabels[] = $date->format('d M');
            $chartRevenue[] = $row ? (float) $row->revenue : 0;
            $chartOrders[] = $row ? (int) $row->orders : 0;
        }

        // ========== LISTS ==========
        $recentOrdersList = Order::with('user')->latest()->take(8)->get();

        $topProducts = OrderDetail::select(
            'product_id',
            DB::raw('SUM(quantity) as total_sold'),
            DB::raw('SUM(price * quantity) as total_revenue')
        )
            ->with('product')
            ->where('created_at', '>=', now()->subDays(30))
            ->groupBy('product_id')
            ->orderBy('total_sold', 'desc')
            ->limit(5)
            ->get();

        $inventoryAlerts = ProductInventory::with('product')
            ->whereColumn('stock', '<=', 'low_stock_qty')
            ->orderBy('stock', 'asc')
            ->limit(5)
            ->get();

        return view('backend.dashboard', compact(
            'todayRevenue',
            'ordersToday',
            'monthRevenue',
            'revenueGrowth',
            'ordersThisMonth',
            'avgOrderValue',
            'totalCustomers',
            'newCustomersThisMonth',
            'orderStatusCounts',
            'pendingOrders',
            'processingOrders',
            'lowStockProducts',
            'outOfStockProducts',
            'chartLabels',
            'chartRevenue',
            'chartOrders',
            'recentOrdersList',
            'topProducts',
            'inventoryAlerts'
        ));
    }


    public function admin_dashboard1(Request $request)
    {
        // ========== STATISTICS ==========

        // Total Sales (Revenue)
        $totalSales = Order::where('payment_status', 'paid')->sum('grand_total');

        // Total Orders
        $totalOrders = Order::count();
        $ordersThisWeek = Order::whereBetween('created_at', [now()->startOfWeek(), now()->endOfWeek()])->count();

        // Total Products
        $totalProducts = Product::count();
        $lowStockProducts = ProductInventory::whereColumn('stock', '<=', 'low_stock_qty')
            ->where('stock', '>', 0)
            ->count();

        // Total Customers
        $totalCustomers = User::count();
        $newCustomers = User::whereMonth('created_at', now()->month)->count();

        // Pending Delivery
        $pendingDelivery = Order::where('delivery_status', 'pending')->count();

        // Refund Requests (orders with refund status)
        $refundRequests = Order::where('payment_status', 'refunded')->count();
        $refundAmount = Order::where('payment_status', 'refunded')->sum('grand_total');

        // Total Visits (unique visitors - from landing page or session tracking)
        $totalVisits = session()->get('total_visits', 12450); // You can implement actual tracking

        // Average Order Value
        $avgOrderValue = $totalOrders > 0 ? round($totalSales / $totalOrders, 2) : 0;

        // ========== PROGRESS CARDS ==========

        // Today's Revenue
        $todayRevenue = Order::whereDate('created_at', today())->where('payment_status', 'paid')->sum('grand_total');
        $todayTarget = 50000; // Set your target
        $todayProgress = $todayTarget > 0 ? min(100, round(($todayRevenue / $todayTarget) * 100)) : 0;

        // Conversion Rate (orders / unique visitors)
        $conversionRate = $totalVisits > 0 ? round(($totalOrders / $totalVisits) * 100, 1) : 0;

        // Return Rate (cancelled orders / total orders)
        $cancelledOrders = Order::where('delivery_status', 'cancelled')->count();
        $returnRate = $totalOrders > 0 ? round(($cancelledOrders / $totalOrders) * 100, 1) : 0;

        // Customer Satisfaction (average rating)
        $avgRating = Review::avg('rating') ?? 0;
        $totalReviews = Review::count();

        // ========== SALES OVERVIEW (Monthly) ==========
        $monthlySales = [];
        for ($i = 1; $i <= 12; $i++) {
            $monthlySales[] = Order::whereMonth('created_at', $i)
                ->whereYear('created_at', date('Y'))
                ->where('payment_status', 'paid')
                ->sum('grand_total');
        }

        // ========== RECENT ACTIVITY ==========
        $recentActivities = [];

        // Recent orders
        $recentOrders = Order::latest()->take(3)->get();
        foreach ($recentOrders as $order) {
            $recentActivities[] = [
                'time' => $order->created_at->diffForHumans(),
                'title' => 'New order placed',
                'description' => "Order #{$order->code} placed",
                'amount' => $order->grand_total,
                'type' => 'order'
            ];
        }

        // Recent payments
        $recentPayments = Order::where('payment_status', 'paid')->latest()->take(3)->get();
        foreach ($recentPayments as $payment) {
            $recentActivities[] = [
                'time' => $payment->updated_at->diffForHumans(),
                'title' => 'Payment received',
                'description' => "Payment received for order #{$payment->code}",
                'amount' => $payment->grand_total,
                'type' => 'payment'
            ];
        }

        // Low stock alerts
        $lowStockProductsList = ProductInventory::with('product')
            ->whereColumn('stock', '<=', 'low_stock_qty')
            ->where('stock', '>', 0)
            ->take(3)
            ->get();
        foreach ($lowStockProductsList as $item) {
            $recentActivities[] = [
                'time' => $item->updated_at->diffForHumans(),
                'title' => 'Low stock alert',
                'description' => "{$item->product->name} has only {$item->stock} units left",
                'type' => 'alert'
            ];
        }

        // Sort activities by time (latest first)
        $recentActivities = collect($recentActivities)->sortByDesc('time')->take(10);

        // ========== TOP CATEGORIES ==========
        $topCategories = DB::table('products')
            ->join('categories', 'products.category_id', '=', 'categories.id')
            ->join('order_details', 'products.id', '=', 'order_details.product_id')
            ->select('categories.category_name', DB::raw('SUM(order_details.quantity) as total_sold'))
            ->groupBy('categories.id', 'categories.category_name')
            ->orderBy('total_sold', 'desc')
            ->limit(4)
            ->get();

        // Calculate percentages
        $totalSold = $topCategories->sum('total_sold');
        foreach ($topCategories as $category) {
            $category->percentage = $totalSold > 0 ? round(($category->total_sold / $totalSold) * 100) : 0;
        }

        // ========== RECENT ORDERS ==========
        $recentOrdersList = Order::with('user')
            ->latest()
            ->take(7)
            ->get();

        // ========== TOP PRODUCTS ==========
        $topProducts = OrderDetail::select(
            'product_id',
            DB::raw('SUM(quantity) as total_sold'),
            DB::raw('SUM(price * quantity) as total_revenue')
        )
            ->with('product')
            ->groupBy('product_id')
            ->orderBy('total_sold', 'desc')
            ->limit(4)
            ->get();

        // ========== COURIER PERFORMANCE ==========
        $courierStats = [
            'Pathao' => ['delivered' => 0, 'total' => 0, 'avg_days' => 2.3, 'on_time' => 94],
            'Steadfast' => ['delivered' => 0, 'total' => 0, 'avg_days' => 2.8, 'on_time' => 89],
            'RedX' => ['delivered' => 0, 'total' => 0, 'avg_days' => 1.9, 'on_time' => 97],
            'Others' => ['delivered' => 0, 'total' => 0, 'avg_days' => 2.5, 'on_time' => 85],
        ];

        // You can update this from shipping tracking data
        $courierStats['Pathao']['delivered'] = Order::where('delivery_status', 'delivered')->where('shipping_type', 'pathao')->count();
        $courierStats['Pathao']['total'] = Order::where('shipping_type', 'pathao')->count();

        // ========== INVENTORY ALERTS ==========
        $inventoryAlerts = ProductInventory::with('product')
            ->whereColumn('stock', '<=', 'low_stock_qty')
            ->where('stock', '>', 0)
            ->orderBy('stock', 'asc')
            ->limit(4)
            ->get();

        // ========== ORDER SUMMARY ==========
        $orderSummary = [
            'pending' => Order::where('delivery_status', 'pending')->count(),
            'processing' => Order::where('delivery_status', 'processing')->count(),
            'shipped' => Order::where('delivery_status', 'shipped')->count(),
            'delivered' => Order::where('delivery_status', 'delivered')->count(),
            'cancelled' => Order::where('delivery_status', 'cancelled')->count(),
        ];

        // ========== REVENUE SUMMARY ==========
        $revenueSummary = [
            'today' => Order::whereDate('created_at', today())->where('payment_status', 'paid')->sum('grand_total'),
            'this_week' => Order::whereBetween('created_at', [now()->startOfWeek(), now()->endOfWeek()])->where('payment_status', 'paid')->sum('grand_total'),
            'this_month' => Order::whereMonth('created_at', now()->month)->where('payment_status', 'paid')->sum('grand_total'),
            'this_year' => Order::whereYear('created_at', date('Y'))->where('payment_status', 'paid')->sum('grand_total'),
            'refund' => Order::where('payment_status', 'refunded')->sum('grand_total'),
        ];

        // ========== RECENT REVIEWS ==========
        $recentReviews = Review::with('user', 'product')
            ->latest()
            ->take(3)
            ->get();

        // ========== POPULAR TAGS ==========
        $popularTags = ['Wireless', 'Bluetooth', 'Smart Watch', 'Headphone', 'Fast Charging', 'Gaming Mouse', 'Phone Case', 'Power Bank', 'USB Cable', 'Keyboard'];

        // ========== MONTHLY LABELS ==========
        $monthlyLabels = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];

        return view('backend.dashboard', compact(
            'totalSales',
            'totalOrders',
            'ordersThisWeek',
            'totalProducts',
            'lowStockProducts',
            'totalCustomers',
            'newCustomers',
            'pendingDelivery',
            'refundRequests',
            'refundAmount',
            'totalVisits',
            'avgOrderValue',
            'todayRevenue',
            'todayProgress',
            'conversionRate',
            'returnRate',
            'avgRating',
            'totalReviews',
            'monthlySales',
            'monthlyLabels',
            'recentActivities',
            'topCategories',
            'recentOrdersList',
            'topProducts',
            'courierStats',
            'inventoryAlerts',
            'orderSummary',
            'revenueSummary',
            'recentReviews',
            'popularTags'
        ));
    }

    function clearCache(Request $request)
    {
        Artisan::call('cache:clear');
        flash(translate('Cache cleared successfully'))->success();
        return back();
    }
}
