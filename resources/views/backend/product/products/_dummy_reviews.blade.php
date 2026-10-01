{{-- Admin-created (dummy) reviews to show on this product --}}
@php $selected_dummy_reviews = old('dummy_reviews', $selected_dummy_reviews ?? []); @endphp
<div class="card">
    <div class="card-header">
        <h5 class="mb-0 h6">{{ translate('Product Reviews') }}</h5>
        <a href="{{ route('dummy-reviews.index') }}" target="_blank" class="btn btn-soft-primary btn-xs">
            <i class="las la-plus"></i> {{ translate('Manage Reviews') }}
        </a>
    </div>
    <div class="card-body">
        <input type="hidden" name="dummy_reviews_submitted" value="1">
        <div class="form-group row mb-0">
            <label class="col-md-3 col-from-label">{{ translate('Select Reviews') }}</label>
            <div class="col-md-8">
                <select class="form-control aiz-selectpicker" name="dummy_reviews[]" multiple
                        data-live-search="true" data-actions-box="true" data-selected-text-format="count"
                        title="{{ translate('Select reviews') }}">
                    @foreach ($dummyReviews ?? [] as $dummyReview)
                        <option value="{{ $dummyReview->id }}"
                                data-subtext="{{ str_repeat('★', $dummyReview->rating) }} — {{ \Illuminate\Support\Str::limit($dummyReview->comment, 40) }}"
                                {{ in_array($dummyReview->id, $selected_dummy_reviews) ? 'selected' : '' }}>
                            {{ $dummyReview->name }}
                        </option>
                    @endforeach
                </select>
                @if (empty($dummyReviews) || count($dummyReviews) === 0)
                    <small class="text-muted">{{ translate('No active reviews yet. Add some from Manage Reviews.') }}</small>
                @endif
            </div>
        </div>
    </div>
</div>
