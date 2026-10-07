<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Models\Admin\Blog;
use App\Models\Admin\Campaign;
use App\Models\Admin\Category;
use App\Models\Admin\Coupon;
use App\Models\Admin\Order;
use App\Models\Admin\Product;
use App\Models\Admin\Slider;
use Illuminate\Support\Str;
use Auth;
use Illuminate\Http\Request;


use App\Models\Admin\ProductVarient;
use App\Models\OrderDetail;
use App\Models\ShippingCost;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Validator;

class FrontendController extends Controller
{


    public function home()
    {
        $with = ['price', 'category', 'inventory', 'reviews', 'variants.attributeRel'];

        /* ---------------- Categories (sidebar + mobile circles + tabs) ---------------- */
        $categories = Category::withCount('products')
            ->latest()
            ->take(8)
            ->get();

        /* ---------------- Sliders ---------------- */
        $sliders = \App\Models\Admin\Slider::orderBy('order')
            ->get()
            ->map(function ($slider) {
                return [
                    'id'              => $slider->id,
                    'title'           => $slider->title,
                    'sub_title'       => $slider->sub_title,
                    'button_name'     => $slider->button_name,
                    'button_link'     => $slider->button_link,
                    'photos'          => $slider->photos,
                    'customer_review' => $slider->customer_review,
                    'star_count'      => $slider->star_count,
                    'description'     => $slider->description,
                ];
            })
            ->toArray();

        /* ---------------- Flash sale: products with a real discount ---------------- */
        $flashProducts = Product::with($with)
            ->where('is_published', 1)
            // ->whereHas('price', function ($q) {
            //     $q->whereNotNull('sale_price')
            //         ->where('sale_price', '>', 0)
            //         ->whereColumn('sale_price', '<', 'regular_price');
            // })
            ->latest()
            ->take(5)
            ->get();

        /* ---------------- Best selling (All tab) ---------------- */
        $bestSelling = Product::with($with)
            ->where('is_published', 1)
            ->orderByDesc('num_of_sale')
            ->take(10)
            ->get();

        /* ---------------- Best selling (one tab per category) ---------------- */
        $bestTabs = $categories->take(5)->map(function ($cat) use ($with) {
            return [
                'slug'     => $cat->slug,
                'name'     => $cat->category_name,
                'products' => Product::with($with)
                    ->where('is_published', 1)
                    ->where('category_id', $cat->id)
                    ->orderByDesc('num_of_sale')
                    ->take(5)
                    ->get(),
            ];
        })->filter(fn($tab) => $tab['products']->count())->values();

        /* ---------------- "Popular in {category}" sections ---------------- */
        $categorySections = $categories
            ->where('products_count', '>', 0)
            ->take(3)
            ->map(function ($cat) use ($with) {
                return [
                    'category' => $cat,
                    'products' => Product::with($with)
                        ->where('is_published', 1)
                        ->where('category_id', $cat->id)
                        ->latest()
                        ->take(5)
                        ->get(),
                ];
            })->values();

        /* ---------------- Customer reviews (from real product reviews) ---------------- */
        $reviewModel  = (new Product)->reviews()->getRelated();
        $testimonials = $reviewModel->newQuery()
            ->with('user')
            ->where('status', 1)
            ->where('rating', '>=', 4)
            ->whereNotNull('comment')
            ->whereRaw('CHAR_LENGTH(comment) >= 20')
            ->orderByDesc('rating')
            ->latest()
            ->take(3)
            ->get();

        return view('frontend.pages.home', compact(
            'categories',
            'sliders',
            'flashProducts',
            'bestSelling',
            'bestTabs',
            'categorySections',
            'testimonials'
        ));
    }

    public function productDetail($slug)
    {
        $product = Product::with([
            'price',
            'category',
            'subcategory',
            'brand',
            'inventory',
            'shipping',
            'seo',
            'taxes',
            'variants.attributeRel',
            'reviews.user',
            'reviews.dummyReview',
        ])
            ->where('slug', $slug)
            ->where('is_published', 1)
            ->firstOrFail();

        /* ---------------- Images ---------------- */
        $photoIds = [];

        if (!empty($product->photos)) {
            $photoIds = is_array($product->photos)
                ? $product->photos
                : json_decode($product->photos, true);

            $photoIds = is_array($photoIds) ? $photoIds : [];
        }

        $thumbnail = $product->thumbnail
            ? uploaded_asset($product->thumbnail)
            : null;

        $galleryImages = [];

        foreach ($photoIds as $photoId) {
            if (!$photoId) {
                continue;
            }

            if ((string) $photoId === (string) $product->thumbnail) {
                continue;
            }

            $image = uploaded_asset($photoId);

            if ($image) {
                $galleryImages[] = $image;
            }
        }

        /* ---------------- Price ---------------- */
        $regularPrice = (float) optional($product->price)->regular_price;

        $salePrice = optional($product->price)->sale_price !== null
            ? (float) $product->price->sale_price
            : null;

        $currentPrice = ($salePrice !== null && $salePrice > 0 && $salePrice < $regularPrice)
            ? $salePrice
            : $regularPrice;

        $discountPercentage = 0;

        if ($regularPrice > 0 && $currentPrice < $regularPrice) {
            $discountPercentage = round(
                (($regularPrice - $currentPrice) / $regularPrice) * 100
            );
        }

        $savingAmount = max(0, $regularPrice - $currentPrice);

        /* ---------------- Reviews ---------------- */
        $reviews = $product->reviews ?? collect();

        $reviewCount = $reviews->count();

        $averageRating = $reviewCount > 0
            ? round((float) $reviews->avg('rating'), 1)
            : 0;

        /* ---------------- Variants ---------------- */
        $variants = $product->variants->map(function ($variant) {
            $attrs = [];

            if (!empty($variant->attribute_value)) {
                $decoded = is_array($variant->attribute_value)
                    ? $variant->attribute_value
                    : json_decode($variant->attribute_value, true);

                if (is_array($decoded)) {
                    $attrs = $decoded;
                }
            }

            $label = !empty($attrs)
                ? implode(' / ', array_values($attrs))
                : (optional($variant->attributeRel)->name ?? 'Option');

            return [
                'id'         => $variant->id,
                'label'      => $label,
                'price'      => (float) $variant->price,
                'stock'      => (int) $variant->quantity,
                'sku'        => $variant->sku,
                'attributes' => $attrs, // ["Color" => "Black", "Age" => "Age 1/2"]
            ];
        })->values();

        /*
     * Group attributes dynamically.
     * ["Color" => ["Black", "DarkOliveGreen"], "Age" => ["Age 1/2", "Age 3/4"]]
     * New attributes (Size, Material...) appear automatically.
     */
        $attributeGroups = [];

        foreach ($variants as $v) {
            foreach ($v['attributes'] as $name => $value) {
                if (!in_array($value, $attributeGroups[$name] ?? [], true)) {
                    $attributeGroups[$name][] = $value;
                }
            }
        }

        /* ---------------- Stock ---------------- */
        // Variant product: total of variant quantities. Simple product: inventory stock.
        $stock = $variants->count()
            ? (int) $variants->sum('stock')
            : (int) optional($product->inventory)->stock;

        $inStock = $stock > 0;

        /* ---------------- Related products ---------------- */
        $relatedProducts = Product::with([
            'price',
            'category',
            'inventory',
            'brand',
            'reviews',
        ])
            ->where('is_published', 1)
            ->where('id', '!=', $product->id)
            ->where('category_id', $product->category_id)
            ->latest()
            ->take(8)
            ->get();

        foreach ($relatedProducts as $relatedProduct) {
            $relatedRegular = (float) optional($relatedProduct->price)->regular_price;

            $relatedSale = optional($relatedProduct->price)->sale_price !== null
                ? (float) $relatedProduct->price->sale_price
                : null;

            $relatedCurrent = ($relatedSale !== null && $relatedSale > 0 && $relatedSale < $relatedRegular)
                ? $relatedSale
                : $relatedRegular;

            $relatedProduct->display_price = $relatedCurrent;
            $relatedProduct->display_regular_price = $relatedRegular;

            $relatedProduct->discount_percentage = (
                $relatedRegular > 0 && $relatedCurrent < $relatedRegular
            )
                ? round((($relatedRegular - $relatedCurrent) / $relatedRegular) * 100)
                : 0;

            $relatedProduct->average_rating = $relatedProduct->reviews->count()
                ? round((float) $relatedProduct->reviews->avg('rating'), 1)
                : 0;

            $relatedProduct->review_count = $relatedProduct->reviews->count();

            $relatedProduct->thumbnail_url = $relatedProduct->thumbnail
                ? uploaded_asset($relatedProduct->thumbnail)
                : null;
        }

        return view(
            'frontend.pages.product-detail',
            compact(
                'product',
                'thumbnail',
                'galleryImages',
                'regularPrice',
                'salePrice',
                'currentPrice',
                'discountPercentage',
                'savingAmount',
                'stock',
                'inStock',
                'reviews',
                'reviewCount',
                'averageRating',
                'variants',
                'attributeGroups',
                'relatedProducts'
            )
        );
    }

    public function allCategoryProducts(Request $request)
    {
        $categorySlug = $request->get('category');
        $category     = null;

        $productsQuery = Product::with([
            'price',
            'category',
            'inventory',
            'brand',
            'reviews',
            'variants.attributeRel',   // for variant modal
        ])
            ->where('is_published', 1);

        /* ---------------- Category ---------------- */
        if ($categorySlug) {
            $category = Category::where('slug', $categorySlug)->firstOrFail();
            $productsQuery->where('category_id', $category->id);
        }

        /* ---------------- Search (?q=) ---------------- */
        $search = trim((string) $request->get('q', ''));

        if ($search !== '') {
            $like = '%' . addcslashes($search, '%_\\') . '%';

            // grouped so the OR conditions don't break the other filters
            $productsQuery->where(function ($w) use ($like) {
                $w->where('products.name', 'like', $like)
                    ->orWhereHas('variants', fn($v) => $v->where('sku', 'like', $like))
                    ->orWhereHas('inventory', fn($i) => $i->where('sku', 'like', $like));
            });
        }

        /* ---------------- Max price ---------------- */
        if ($request->filled('max_price')) {
            $maxPrice = (float) $request->max_price;
            $productsQuery->whereHas('price', function ($q) use ($maxPrice) {
                $q->whereRaw('COALESCE(NULLIF(sale_price, 0), regular_price) <= ?', [$maxPrice]);
            });
        }

        /* ---------------- Rating ---------------- */
        if ($request->filled('rating')) {
            $minRating = (float) $request->rating;
            $productsQuery->withAvg('reviews', 'rating')
                ->having('reviews_avg_rating', '>=', $minRating);
        }

        /* ---------------- In stock (simple + variant products) ---------------- */
        if ($request->boolean('in_stock')) {
            $productsQuery->where(function ($w) {
                $w->whereHas('inventory', fn($q) => $q->where('stock', '>', 0))
                    ->orWhereHas('variants', fn($q) => $q->where('quantity', '>', 0));
            });
        }

        /* ---------------- On sale ---------------- */
        if ($request->boolean('on_sale')) {
            $productsQuery->whereHas('price', function ($q) {
                $q->whereNotNull('sale_price')
                    ->whereColumn('sale_price', '<', 'regular_price');
            });
        }

        /* ---------------- Sorting ---------------- */
        switch ($request->get('sort')) {
            case 'price_low':
                $productsQuery->join('product_prices', 'products.id', '=', 'product_prices.product_id')
                    ->orderByRaw('COALESCE(NULLIF(product_prices.sale_price, 0), product_prices.regular_price) ASC')
                    ->select('products.*');
                break;

            case 'price_high':
                $productsQuery->join('product_prices', 'products.id', '=', 'product_prices.product_id')
                    ->orderByRaw('COALESCE(NULLIF(product_prices.sale_price, 0), product_prices.regular_price) DESC')
                    ->select('products.*');
                break;

            case 'top_rated':
                $productsQuery->withAvg('reviews', 'rating')->orderByDesc('reviews_avg_rating');
                break;

            case 'newest':
            default:
                $productsQuery->latest();
                break;
        }

        $products = $productsQuery->paginate(20)->withQueryString();

        $categories = Category::withCount('products')->latest()->take(8)->get();

        /* ---------------- AJAX ---------------- */
        if ($request->ajax() || $request->wantsJson()) {
            $html = view('frontend.partials.product-results', compact('products'))->render();

            return response()->json([
                'html'  => $html,
                'count' => $products->total(),
                'from'  => $products->firstItem() ?? 0,
                'to'    => $products->lastItem() ?? 0,
            ]);
        }

        return view('frontend.pages.all-products', compact('products', 'category', 'categories', 'search'));
    }

    public function searchSuggestions(Request $request)
    {
        $q = trim((string) $request->get('q', ''));

        if (mb_strlen($q) < 2) {
            return response()->json(['items' => [], 'total' => 0]);
        }

        $escaped = addcslashes($q, '%_\\');
        $like    = '%' . $escaped . '%';

        $base = Product::where('is_published', 1)->where(function ($w) use ($like) {
            $w->where('products.name', 'like', $like)
                ->orWhereHas('variants', fn($v) => $v->where('sku', 'like', $like))
                ->orWhereHas('inventory', fn($i) => $i->where('sku', 'like', $like));
        });

        $total = (clone $base)->count();

        $items = $base->with(['price', 'category', 'inventory', 'variants'])
            ->orderByRaw('CASE WHEN products.name LIKE ? THEN 0 ELSE 1 END', [$escaped . '%'])
            ->limit(6)
            ->get()
            ->map(function ($p) {
                $regular = (float) optional($p->price)->regular_price;
                $sale    = optional($p->price)->sale_price !== null ? (float) $p->price->sale_price : null;
                $current = ($sale !== null && $sale > 0 && $sale < $regular) ? $sale : $regular;

                $hasVariants = $p->variants->count() > 0;
                $stock = $hasVariants
                    ? (int) $p->variants->sum('quantity')
                    : (int) optional($p->inventory)->stock;

                return [
                    'id'           => $p->id,
                    'name'         => $p->name,
                    'url'          => route('frontend.product-details', $p->slug),
                    'image'        => $p->thumbnail ? uploaded_asset($p->thumbnail) : null,
                    'category'     => optional($p->category)->category_name,
                    'price'        => $current,
                    'regular'      => $regular > $current ? $regular : null,
                    'has_variants' => $hasVariants,
                    'in_stock'     => $stock > 0,
                ];
            });

        return response()->json(['items' => $items, 'total' => $total]);
    }

    public function contactUs()
    {
        return view('frontend.pages.contact-us');
    }
    public function aboutUs()
    {
        return view('frontend.pages.about-us');
    }
    public function blogs(Request $request)
    {
        $search = trim((string) $request->get('q', ''));
        $tag    = trim((string) $request->get('tag', ''));

        $query = Blog::query();

        /* ---------------- Search ---------------- */
        if ($search !== '') {
            $like = '%' . addcslashes($search, '%_\\') . '%';

            $query->where(function ($w) use ($like) {
                $w->where('blog_title', 'like', $like)
                    ->orWhere('short_description', 'like', $like);
            });
        }

        /* ---------------- Tag filter (exact tag, tags are comma separated) ---------------- */
        if ($tag !== '') {
            $query->whereRaw('FIND_IN_SET(?, REPLACE(tags, " ", ""))', [$tag]);
        }

        $blogs = $query->latest()->paginate(13)->withQueryString();

        // First post becomes the big featured card, only on page 1 without filters
        $showFeatured = $blogs->currentPage() === 1 && $search === '' && $tag === '';
        $featured     = $showFeatured ? $blogs->first() : null;
        $posts        = $featured
            ? $blogs->getCollection()->slice(1)
            : $blogs->getCollection();

        return view('frontend.pages.blog', compact('blogs', 'featured', 'posts', 'search', 'tag'));
    }

    public function blogDetail($slug)
    {
        $blog = Blog::where('slug', $slug)->firstOrFail();

        $relatedBlogs = Blog::where('id', '!=', $blog->id)
            ->latest()
            ->take(3)
            ->get();

        return view('frontend.pages.blog-detail', compact('blog', 'relatedBlogs'));
    }

    public function trackOrder(Request $request)
    {
        $order    = null;
        $searched = false;

        $orderId = trim((string) $request->get('code', ''));
        $phone   = trim((string) $request->get('phone', ''));

        if ($orderId !== '' || $phone !== '') {
            $searched = true;

            $query = Order::query();

            if ($orderId !== '') {
                $query->where('code', $orderId);
            }

            // if ($phone !== '') {
            //     $query->where('phone_number', $phone);
            // }

            $order = $query->latest()->first();
        }

        // return $order;

        return view('frontend.pages.track-order', compact('order', 'searched', 'orderId', 'phone'));
    }


    /* Delivery charge by area (change as needed) */
    private const SHIPPING = ['inside' => 60, 'outside' => 120];

    public function cart()
    {
        return view('frontend.pages.cart');
    }

    public function checkout()
    {
        $shippingCosts = ShippingCost::where('status', '1')->get();

        // Map to a keyed array: ['inside' => 60, 'outside' => 120]
        $shipping = [];
        foreach ($shippingCosts as $cost) {
            if (stripos($cost->name, 'inside') !== false) {
                $shipping['inside'] = (float) $cost->amount;
            } elseif (stripos($cost->name, 'outside') !== false) {
                $shipping['outside'] = (float) $cost->amount;
            }
        }

        return view('frontend.pages.checkout', [
            'shipping' => $shipping,
            'shippingCosts' => $shippingCosts, // full collection if you need IDs/labels
        ]);
    }

    /**
     * Build trusted cart lines from the browser cart.
     * Prices, names and stock ALWAYS come from the database.
     */
    private function buildLines(array $items): array
    {
        $lines    = [];
        $errors   = [];
        $subtotal = 0;

        foreach (array_slice($items, 0, 50) as $item) {
            $pid = (int) ($item['id'] ?? 0);
            $vid = !empty($item['variantId']) ? (int) $item['variantId'] : null;
            $qty = max(1, min(999, (int) ($item['qty'] ?? 1)));
            $key = $vid ? $pid . '::' . $vid : (string) $pid;

            $product = Product::with(['price', 'inventory'])
                ->where('is_published', 1)
                ->find($pid);

            if (!$product) {
                $errors[] = 'An item in your cart is no longer available.';
                continue;
            }

            /* ---- base price ---- */
            $regular = (float) optional($product->price)->regular_price;
            $sale    = optional($product->price)->sale_price;
            $price   = ($sale !== null && (float) $sale > 0 && (float) $sale < $regular)
                ? (float) $sale : $regular;

            $label = null;
            $sku   = optional($product->inventory)->sku;
            $stock = (int) optional($product->inventory)->stock;
            $image = $product->thumbnail ? uploaded_asset($product->thumbnail) : null;

            /* ---- variant ---- */
            if ($vid) {
                $variant = ProductVarient::where('product_id', $product->id)->find($vid);

                if (!$variant) {
                    $errors[] = "'{$product->name}': the selected option is no longer available.";
                    continue;
                }

                $attrs = is_array($variant->attribute_value)
                    ? $variant->attribute_value
                    : (json_decode($variant->attribute_value, true) ?: []);

                $label = $attrs ? implode(' / ', array_values($attrs)) : null;
                $sku   = $variant->sku;
                $stock = (int) $variant->quantity;
                if ((float) $variant->price > 0) {
                    $price = (float) $variant->price;
                }
                if (!empty($variant->image)) {
                    $image = uploaded_asset($variant->image) ?: $image;
                }
            } elseif ($product->variants()->exists()) {
                $errors[] = "'{$product->name}': please choose an option.";
                continue;
            }

            if ($stock < 1) {
                $errors[] = "'{$product->name}' is out of stock.";
                continue;
            }

            if ($qty > $stock) {
                $errors[] = "'{$product->name}': only {$stock} left in stock (quantity adjusted).";
                $qty = $stock;
            }

            $lineTotal = $price * $qty;
            $subtotal += $lineTotal;

            $lines[] = [
                'key'        => $key,
                'product_id' => $product->id,
                'variant_id' => $vid,
                'name'       => $product->name,
                'label'      => $label,
                'sku'        => $sku,
                'price'      => $price,
                'qty'        => $qty,
                'stock'      => $stock,
                'image'      => $image,
                'line_total' => $lineTotal,
                'slug'       => $product->slug,
            ];
        }

        return compact('lines', 'errors', 'subtotal');
    }

    private function shippingFor(?string $area): array
    {
        $area = $area === 'outside' ? 'outside' : 'inside';
        return [$area, self::SHIPPING[$area]];
    }

    public function orderSuccess($code)
    {
        // only the browser that placed the order can see this page
        abort_unless(session('last_order_code') === $code, 404);

        $order = Order::with(['orderDetails.product'])->where('code', $code)->firstOrFail();

        return view('frontend.pages.order-success', compact('order'));
    }

    private function generateOrderCode(): string
    {
        do {
            $code = 'NX' . now()->format('ymd') . strtoupper(Str::random(5));
        } while (Order::where('code', $code)->exists());

        return $code;
    }

    // ===================================================================== 
    private function resolveCoupon(?string $code, array $lines, float $subtotal): array
    {
        $code = trim((string) $code);

        if ($code === '') {
            return [null, 0.0, null];
        }

        $coupon = Coupon::whereRaw('UPPER(code) = ?', [strtoupper($code)])->first();

        if (!$coupon) {
            return [null, 0.0, 'Invalid coupon code.'];
        }

        /* ---- dates (unix timestamps) ---- */
        $now = now()->timestamp;

        if ($coupon->start_date && $now < (int) $coupon->start_date) {
            return [null, 0.0, 'This coupon is not active yet.'];
        }

        if ($coupon->end_date && $now > (int) $coupon->end_date) {
            return [null, 0.0, 'This coupon has expired.'];
        }

        /* ---- details (JSON) ---- */
        $details = $coupon->details;
        if (is_string($details)) {
            $details = json_decode($details, true);
        }
        $details = is_array($details) ? $details : [];

        $value   = (float) $coupon->discount;
        $percent = $coupon->discount_type === 'percent';

        /* ---- product based: only the listed products get the discount ---- */
        if ($coupon->type === 'product_base') {
            $ids = [];
            foreach ($details as $row) {
                if (is_array($row) && isset($row['product_id'])) {
                    $ids[] = (int) $row['product_id'];
                }
            }

            $discount = 0.0;
            $matched  = false;

            foreach ($lines as $line) {
                if (!in_array((int) $line['product_id'], $ids, true)) {
                    continue;
                }
                $matched = true;

                $d = $percent ? $line['line_total'] * ($value / 100) : $value;
                $discount += min($d, $line['line_total']);
            }

            if (!$matched) {
                return [null, 0.0, 'This coupon does not apply to the items in your cart.'];
            }
        }
        /* ---- cart based: whole subtotal, with min_buy / max_discount ---- */ else {
            $rules = (isset($details[0]) && is_array($details[0])) ? $details[0] : $details;

            $minBuy      = (float) ($rules['min_buy'] ?? 0);
            $maxDiscount = (float) ($rules['max_discount'] ?? 0);

            if ($subtotal < $minBuy) {
                return [null, 0.0, 'Minimum order of ৳' . number_format($minBuy) . ' required for this coupon.'];
            }

            $discount = $percent ? $subtotal * ($value / 100) : $value;

            if ($percent && $maxDiscount > 0 && $discount > $maxDiscount) {
                $discount = $maxDiscount;
            }
        }

        $discount = round(min($discount, $subtotal), 2);

        if ($discount <= 0) {
            return [null, 0.0, 'This coupon cannot be applied to your cart.'];
        }

        return [$coupon, $discount, null];
    }

    public function cartSummary(Request $request)
    {
        $items = $request->input('items', []);
        if (!is_array($items)) {
            $items = [];
        }

        $data = $this->buildLines($items);
        [$area, $shipping] = $this->shippingFor($request->input('area'));

        $discount    = 0.0;
        $coupon      = null;
        $couponError = null;

        if (count($data['lines'])) {
            [$coupon, $discount, $couponError] = $this->resolveCoupon(
                $request->input('coupon'),
                $data['lines'],
                $data['subtotal']
            );
        } else {
            $shipping = 0;
        }

        return response()->json([
            'lines'        => $data['lines'],
            'errors'       => array_values(array_unique($data['errors'])),
            'subtotal'     => $data['subtotal'],
            'shipping'     => $shipping,
            'discount'     => $discount,
            'total'        => max(0, $data['subtotal'] + $shipping - $discount),
            'area'         => $area,
            'coupon'       => $coupon ? ['code' => $coupon->code, 'discount' => $discount] : null,
            'coupon_error' => $couponError,
        ]);
    }

    public function placeOrder(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name'    => 'required|string|max:100',
            'phone'   => ['required', 'regex:/^(?:\+?88)?01[3-9]\d{8}$/'],
            'address' => 'required|string|max:500',
            'area'    => 'required|in:inside,outside',
            'notes'   => 'nullable|string|max:500',
            'coupon'  => 'nullable|string|max:50',
            'items'   => 'required|array|min:1|max:50',
        ], [
            'phone.regex'    => 'Please enter a valid Bangladeshi mobile number.',
            'items.required' => 'Your cart is empty.',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'success' => false,
                'message' => $validator->errors()->first(),
                'errors'  => $validator->errors(),
            ], 422);
        }

        try {
            $order = DB::transaction(function () use ($request) {
                $data = $this->buildLines($request->input('items'));

                if (!count($data['lines']) || count($data['lines']) !== count($request->input('items'))) {
                    throw new \RuntimeException(
                        $data['errors'][0] ?? 'Some items in your cart changed. Please review your cart.'
                    );
                }

                [$area, $shipping] = $this->shippingFor($request->input('area'));

                /* Re-validate the coupon on the server */
                [$coupon, $discount, $couponError] = $this->resolveCoupon(
                    $request->input('coupon'),
                    $data['lines'],
                    $data['subtotal']
                );

                if ($couponError) {
                    throw new \RuntimeException($couponError);
                }

                $grandTotal = max(0, $data['subtotal'] + $shipping - $discount);

                // normalise phone to 01XXXXXXXXX
                $phone = preg_replace('/^(?:\+?88)/', '', $request->phone);

                $order = Order::create([
                    'code'             => $this->generateOrderCode(),
                    'user_id'          => Auth::id(),          // null for guests
                    'name'             => $request->name,
                    'phone_number'     => $phone,
                    'shipping_address' => $request->address,
                    'shipping_type'    => $area,
                    'shipping_cost'    => $shipping,
                    'discount'         => 0,
                    'coupon_code'      => $coupon?->code,
                    'coupon_discount'  => $discount,
                    'grand_total'      => $grandTotal,
                    'payment_type'     => 'cod',
                    'payment_status'   => 'unpaid',
                    'delivery_status'  => 'pending',
                    'order_type'       => 'online',
                    'notes'            => $request->notes,
                ]);

                foreach ($data['lines'] as $line) {
                    OrderDetail::create([
                        'order_id'      => $order->id,
                        'product_id'    => $line['product_id'],
                        'variant_id'    => $line['variant_id'],
                        'sku'           => $line['sku'],
                        'variation'     => $line['variant_id']
                            ? json_encode(['sku' => $line['sku'], 'label' => $line['label']])
                            : null,
                        'price'         => $line['price'],
                        'quantity'      => $line['qty'],
                        'tax'           => 0,
                        'shipping_cost' => 0,
                    ]);
                }

                return $order;
            });

            session(['last_order_code' => $order->code]);

            return response()->json([
                'success'  => true,
                'message'  => 'Order placed successfully!',
                'redirect' => route('frontend.order.success', $order->code),
            ]);
        } catch (\RuntimeException $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 422);
        } catch (\Throwable $e) {
            Log::error('Place order failed: ' . $e->getMessage(), [
                'file' => $e->getFile(),
                'line' => $e->getLine(),
            ]);
            return response()->json([
                'success' => false,
                'message' => 'Something went wrong while placing your order. Please try again.',
            ], 500);
        }
    }

    private function resolveImage($primary, $gallery = null): ?string
    {
        $ids = [$primary];

        if (!empty($gallery)) {
            if (!is_array($gallery)) {
                $decoded = json_decode($gallery, true);
                // photos can be JSON ["1","2"] or a comma list "1,2"
                $gallery = is_array($decoded) ? $decoded : explode(',', (string) $gallery);
            }
            $ids = array_merge($ids, $gallery);
        }

        foreach ($ids as $id) {
            $id = trim((string) $id);
            if ($id === '') {
                continue;
            }

            $url = uploaded_asset($id);

            // skip the placeholder that uploaded_asset() falls back to
            if ($url && stripos($url, 'placeholder') === false) {
                return $url;
            }
        }

        return null; // the blade shows a neat icon instead of a gray box
    }
}
