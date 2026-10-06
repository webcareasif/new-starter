<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Models\Admin\Blog;
use App\Models\Admin\Campaign;
use App\Models\Admin\Category;
use App\Models\Admin\Product;
use App\Models\Admin\Slider;
use Illuminate\Support\Str;
use Auth;
use Illuminate\Http\Request;

class FrontendController extends Controller
{


    public function home()
    {
        // relations needed by the product card partial
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

        $blogs = $query->latest()->paginate(9)->withQueryString();

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
}
