<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Models\Admin\Product;
use App\Models\Admin\Wishlist;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class WishlistController extends Controller
{
    /* ----------------------------------------------------------------
     | Session key for guests
     |----------------------------------------------------------------*/
    private const SESSION_KEY = 'guest_wishlist';

    /* ----------------------------------------------------------------
     | GET /wishlist — full page
     |----------------------------------------------------------------*/
    public function index()
    {
        $products = $this->resolveProducts();

        return view('frontend.pages.profile.wishlist', compact('products'));
    }

    /* ----------------------------------------------------------------
     | POST /wishlist/toggle — add or remove
     |----------------------------------------------------------------*/
    public function toggle(Request $request)
    {
        $productId = (int) $request->input('product_id');

        $product = Product::where('is_published', 1)->find($productId);
        if (! $product) {
            return response()->json([
                'success' => false,
                'message' => 'Product not found.',
            ], 404);
        }

        if (Auth::check()) {
            $existing = Wishlist::where('user_id', Auth::id())
                ->where('product_id', $productId)
                ->first();

            if ($existing) {
                $existing->delete();
                $added = false;
            } else {
                Wishlist::create([
                    'user_id'    => Auth::id(),
                    'product_id' => $productId,
                ]);
                $added = true;
            }
        } else {
            $list = session()->get(self::SESSION_KEY, []);
            $list = array_values(array_unique(array_map('intval', $list)));

            if (in_array($productId, $list, true)) {
                $list = array_values(array_diff($list, [$productId]));
                $added = false;
            } else {
                $list[] = $productId;
                $added = true;
            }

            session()->put(self::SESSION_KEY, $list);
        }

        return response()->json([
            'success' => true,
            'added'   => $added,
            'count'   => $this->countValue(),
            'message' => $added ? 'Added to wishlist.' : 'Removed from wishlist.',
        ]);
    }

    /* ----------------------------------------------------------------
     | POST /wishlist/remove
     |----------------------------------------------------------------*/
    public function remove(Request $request)
    {
        $productId = (int) $request->input('product_id');

        if (Auth::check()) {
            Wishlist::where('user_id', Auth::id())
                ->where('product_id', $productId)
                ->delete();
        } else {
            $list = session()->get(self::SESSION_KEY, []);
            $list = array_values(array_diff(array_map('intval', $list), [$productId]));
            session()->put(self::SESSION_KEY, $list);
        }

        return response()->json([
            'success' => true,
            'count'   => $this->countValue(),
        ]);
    }

    /* ----------------------------------------------------------------
     | POST /wishlist/clear
     |----------------------------------------------------------------*/
    public function clear()
    {
        if (Auth::check()) {
            Wishlist::where('user_id', Auth::id())->delete();
        } else {
            session()->forget(self::SESSION_KEY);
        }

        return response()->json(['success' => true, 'count' => 0]);
    }

    /* ----------------------------------------------------------------
     | GET /wishlist/count — for header badge
     |----------------------------------------------------------------*/
    public function count()
    {
        return response()->json(['count' => $this->countValue()]);
    }

    /* ----------------------------------------------------------------
     | Helpers
     |----------------------------------------------------------------*/
    private function countValue(): int
    {
        if (Auth::check()) {
            return Wishlist::where('user_id', Auth::id())->count();
        }

        return count(session()->get(self::SESSION_KEY, []));
    }

    /**
     * Return published products in the wishlist, each decorated
     * with price info + a `wishlisted` flag for the blade.
     */
    private function resolveProducts()
    {
        if (Auth::check()) {
            $ids = Wishlist::where('user_id', Auth::id())
                ->pluck('product_id')
                ->all();
        } else {
            $ids = array_map('intval', session()->get(self::SESSION_KEY, []));
        }

        if (empty($ids)) {
            return collect();
        }

        $products = Product::with(['price', 'inventory', 'category'])
            ->where('is_published', 1)
            ->whereIn('id', $ids)
            ->get();

        foreach ($products as $p) {
            $regular = (float) optional($p->price)->regular_price;
            $sale    = optional($p->price)->sale_price !== null
                ? (float) $p->price->sale_price
                : null;

            $current = ($sale !== null && $sale > 0 && $sale < $regular)
                ? $sale
                : $regular;

            $p->display_price         = $current;
            $p->display_regular_price = $regular;
            $p->discount_percentage   = ($regular > 0 && $current < $regular)
                ? round((($regular - $current) / $regular) * 100)
                : 0;
            $p->thumbnail_url = $p->thumbnail ? uploaded_asset($p->thumbnail) : null;
            $p->in_stock = (int) optional($p->inventory)->stock > 0;
            $p->wishlisted = true;
        }

        return $products;
    }

    /* ----------------------------------------------------------------
     | Called from login — merge guest wishlist into DB
     |----------------------------------------------------------------*/
    public static function mergeGuestWishlist(int $userId): void
    {
        $guestList = session()->pull(self::SESSION_KEY, []);
        if (empty($guestList)) {
            return;
        }

        foreach (array_unique(array_map('intval', $guestList)) as $pid) {
            Wishlist::firstOrCreate([
                'user_id'    => $userId,
                'product_id' => $pid,
            ]);
        }
    }


    public function ids(Request $request)
    {
        $ids = $request->input('ids', []);
        if (! is_array($ids) || empty($ids)) {
            return response()->json(['success' => true, 'ids' => []]);
        }

        $ids = array_values(array_unique(array_map('intval', $ids)));

        if (Auth::check()) {
            $wishlisted = Wishlist::where('user_id', Auth::id())
                ->whereIn('product_id', $ids)
                ->pluck('product_id')
                ->all();
        } else {
            $session = session()->get(self::SESSION_KEY, []);
            $wishlisted = array_values(array_intersect(array_map('intval', $session), $ids));
        }

        return response()->json([
            'success' => true,
            'ids'     => $wishlisted,
        ]);
    }
}
