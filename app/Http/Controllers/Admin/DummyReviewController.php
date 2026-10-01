<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Admin\DummyReview;
use Illuminate\Http\Request;

class DummyReviewController extends Controller
{
    public function index(Request $request)
    {
        $sort_search = $request->search;

        $reviews = DummyReview::withCount('products')
            ->when($sort_search, function ($q) use ($sort_search) {
                $q->where(function ($sub) use ($sort_search) {
                    $sub->where('name', 'like', '%' . $sort_search . '%')
                        ->orWhere('comment', 'like', '%' . $sort_search . '%');
                });
            })
            ->orderBy('sort_order')
            ->latest()
            ->paginate(15);

        $edit_item = $request->filled('edit') ? DummyReview::find($request->edit) : null;

        return view('backend.reviews.index', compact('reviews', 'edit_item', 'sort_search'));
    }

    public function store(Request $request)
    {
        DummyReview::create($this->validated($request));

        flash(translate('Review created successfully.'))->success();
        return redirect()->route('dummy-reviews.index');
    }

    public function update(Request $request, $id)
    {
        $review = DummyReview::findOrFail($id);
        $review->update($this->validated($request));

        // keep the real reviews copied from this one in sync
        $review->reviews()->update([
            'rating'  => $review->rating,
            'comment' => $review->comment,
        ]);

        flash(translate('Review updated successfully.'))->success();
        return redirect()->route('dummy-reviews.index');
    }

    public function destroy($id)
    {
        DummyReview::findOrFail($id)->delete();

        flash(translate('Review deleted successfully.'))->success();
        return redirect()->route('dummy-reviews.index');
    }

    public function updateStatus(Request $request)
    {
        $review = DummyReview::findOrFail($request->id);
        $review->status = (bool) $request->status;
        $review->save();

        return response()->json(['success' => true]);
    }

    private function validated(Request $request)
    {
        $data = $request->validate([
            'name' => 'required|string|max:255',
            'avatar' => 'nullable|string|max:255',
            'rating' => 'required|integer|min:1|max:5',
            'comment' => 'nullable|string',
            'sort_order' => 'nullable|integer|min:0',
        ]);

        $data['status'] = $request->has('status');
        $data['sort_order'] = $data['sort_order'] ?? 0;

        return $data;
    }
}
