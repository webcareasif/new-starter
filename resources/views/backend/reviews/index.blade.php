@extends('backend.layouts.app')

@section('content')
    <div class="aiz-titlebar text-left mt-2 mb-3">
        <div class="row align-items-center">
            <div class="col-md-6">
                <h1 class="h3">{{ translate('Product Reviews (Dummy)') }}</h1>
            </div>
            <div class="col-md-6 text-md-right">
                <button type="button" id="btn-add-new" class="btn btn-primary" onclick="toggleForm()">
                    <span>{{ translate('Add New') }}</span>
                </button>
            </div>
        </div>
    </div>

    {{-- Review Form (hidden by default, slides down on Add / Edit) --}}
    <div id="review-form-wrapper"
        style="max-height:0; overflow:hidden; transition: max-height 0.5s cubic-bezier(0.4,0,0.2,1), opacity 0.4s ease; opacity:0; margin-bottom:2rem;">
        <form id="review-form"
            action="{{ $edit_item ? route('dummy-reviews.update', $edit_item->id) : route('dummy-reviews.store') }}"
            method="POST">
            @csrf
            @if ($edit_item)
                @method('PUT')
            @endif

            <div class="card shadow-sm border-0 rounded-3 mb-4">
                <div class="card-header d-flex justify-content-between align-items-center">
                    <h5 class="mb-0" id="form-title">
                        {{ $edit_item ? translate('Edit Review') : translate('Add Review') }}
                    </h5>
                    <button type="button" class="btn btn-secondary btn-sm" onclick="hideForm()">
                        {{ translate('Cancel') }}
                    </button>
                </div>

                <div class="card-body" style="max-height:500px; overflow-y:auto;">
                    {{-- Reviewer Name --}}
                    <div class="form-group row mb-3">
                        <label class="col-md-3 col-form-label">{{ translate('Reviewer Name') }} <span
                                class="text-danger">*</span></label>
                        <div class="col-md-9">
                            <input type="text" name="name" class="form-control"
                                value="{{ old('name', $edit_item->name ?? '') }}" placeholder="e.g. Rahim Uddin" required>
                        </div>
                    </div>

                    {{-- Rating --}}
                    <div class="form-group row mb-3">
                        <label class="col-md-3 col-form-label">{{ translate('Rating') }} <span
                                class="text-danger">*</span></label>
                        <div class="col-md-9">
                            @php $currentRating = (int) old('rating', $edit_item->rating ?? 5); @endphp
                            <select name="rating" class="form-control" required>
                                @for ($i = 5; $i >= 1; $i--)
                                    <option value="{{ $i }}" {{ $currentRating === $i ? 'selected' : '' }}>
                                        {{ str_repeat('★', $i) . str_repeat('☆', 5 - $i) }} ({{ $i }})
                                    </option>
                                @endfor
                            </select>
                        </div>
                    </div>

                    {{-- Comment --}}
                    <div class="form-group row mb-3">
                        <label class="col-md-3 col-form-label">{{ translate('Comment') }}</label>
                        <div class="col-md-9">
                            <textarea name="comment" rows="4" class="form-control" placeholder="{{ translate('Write the review text') }}">{{ old('comment', $edit_item->comment ?? '') }}</textarea>
                        </div>
                    </div>

                    {{-- Avatar --}}
                    <div class="form-group row mb-3">
                        <label class="col-md-3 col-form-label">{{ translate('Avatar') }}</label>
                        <div class="col-md-9">
                            <div class="input-group" data-toggle="aizuploader" data-type="image">
                                <div class="input-group-prepend">
                                    <div class="input-group-text bg-soft-secondary font-weight-medium">
                                        {{ translate('Browse') }}
                                    </div>
                                </div>
                                <div class="form-control file-amount">{{ translate('Choose File') }}</div>
                                <input type="hidden" name="avatar" class="selected-files"
                                    value="{{ old('avatar', $edit_item->avatar ?? '') }}">
                            </div>
                            <div class="file-preview box sm">
                                @if ($edit_item && $edit_item->avatar)
                                    <div class="d-inline-block mr-1 mb-1">
                                        <img src="{{ uploaded_asset($edit_item->avatar) }}"
                                            style="max-height:80px; border-radius:4px;">
                                    </div>
                                @endif
                            </div>
                        </div>
                    </div>

                    {{-- Sort Order --}}
                    <div class="form-group row mb-3">
                        <label class="col-md-3 col-form-label">{{ translate('Sort Order') }}</label>
                        <div class="col-md-9">
                            <input type="number" name="sort_order" class="form-control"
                                value="{{ old('sort_order', $edit_item->sort_order ?? 0) }}" min="0">
                        </div>
                    </div>

                    {{-- Status --}}
                    <div class="form-group row mb-3">
                        <label class="col-md-3 col-form-label">{{ translate('Active') }}</label>
                        <div class="col-md-9">
                            <label class="aiz-switch aiz-switch-success mb-0 mt-2">
                                <input type="checkbox" name="status" value="1"
                                    {{ old('status', $edit_item ? $edit_item->status : true) ? 'checked' : '' }}>
                                <span></span>
                            </label>
                        </div>
                    </div>
                </div>

                {{-- Submit --}}
                <div class="card-footer d-flex justify-content-end">
                    <button type="submit" class="btn btn-primary">
                        {{ $edit_item ? translate('Update') : translate('Add Review') }}
                    </button>
                </div>
            </div>
        </form>
    </div>

    {{-- Reviews List --}}
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header row gutters-5">
                    <div class="col text-center text-md-left">
                        <h5 class="mb-md-0 h6">{{ translate('All Dummy Reviews') }}</h5>
                    </div>
                    <div class="col-md-4">
                        <form id="sort_reviews" action="" method="GET">
                            <div class="input-group input-group-sm">
                                <input type="text" class="form-control" name="search"
                                    @isset($sort_search) value="{{ $sort_search }}" @endisset
                                    placeholder="{{ translate('Search name or comment & Enter') }}">
                            </div>
                        </form>
                    </div>
                </div>
                <div class="card-body">
                    <table class="table aiz-table mb-0">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>{{ translate('Avatar') }}</th>
                                <th>{{ translate('Name') }}</th>
                                <th>{{ translate('Rating') }}</th>
                                <th data-breakpoints="md">{{ translate('Comment') }}</th>
                                <th data-breakpoints="md">{{ translate('Products') }}</th>
                                <th data-breakpoints="md">{{ translate('Sort') }}</th>
                                <th>{{ translate('Active') }}</th>
                                <th class="text-right">{{ translate('Actions') }}</th>
                            </tr>
                        </thead>
                        <tbody>
                            @forelse ($reviews as $item)
                                <tr>
                                    <td>{{ ($reviews->currentPage() - 1) * $reviews->perPage() + $loop->iteration }}</td>
                                    <td>
                                        @if ($item->avatar)
                                            <img src="{{ uploaded_asset($item->avatar) }}"
                                                style="height:40px; width:40px; object-fit:cover; border-radius:50%;">
                                        @else
                                            <span
                                                class="avatar avatar-sm bg-soft-primary text-primary d-inline-flex align-items-center justify-content-center"
                                                style="height:40px; width:40px; border-radius:50%;">
                                                {{ strtoupper(mb_substr($item->name, 0, 1)) }}
                                            </span>
                                        @endif
                                    </td>
                                    <td>{{ $item->name }}</td>
                                    <td class="text-nowrap">{!! $item->rating_stars !!}</td>
                                    <td>{{ \Illuminate\Support\Str::limit($item->comment, 80) }}</td>
                                    <td><span class="badge badge-inline badge-info">{{ $item->products_count }}</span>
                                    </td>
                                    <td>{{ $item->sort_order }}</td>
                                    <td>
                                        <label class="aiz-switch aiz-switch-success mb-0">
                                            <input type="checkbox" value="{{ $item->id }}"
                                                onchange="updateStatus(this)" {{ $item->status ? 'checked' : '' }}>
                                            <span></span>
                                        </label>
                                    </td>
                                    <td class="text-right">
                                        <button type="button" class="btn btn-icon btn-soft-primary btn-sm btn-circle"
                                            onclick="editReview({{ $item->id }})" title="{{ translate('Edit') }}">
                                            <i class="las la-edit"></i>
                                        </button>
                                        <button type="button"
                                            class="btn btn-soft-danger btn-icon btn-circle btn-sm confirm-delete"
                                            data-href="{{ route('dummy-reviews.destroy', $item->id) }}"
                                            title="{{ translate('Delete') }}">
                                            <i class="las la-trash"></i>
                                        </button>
                                    </td>
                                </tr>
                            @empty
                            @endforelse
                        </tbody>
                    </table>
                    <div class="aiz-pagination mt-3">
                        {{ $reviews->appends(request()->input())->links() }}
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@section('modal')
    @include('modals.delete_modal')
@endsection

@section('script')
    <script type="text/javascript">
        let isFormVisible = {{ $edit_item ? 'true' : 'false' }};

        // Show form with slide-down animation
        function showForm() {
            const wrapper = document.getElementById('review-form-wrapper');
            wrapper.style.opacity = '0';
            wrapper.style.maxHeight = '0';
            void wrapper.offsetHeight;
            wrapper.style.maxHeight = (wrapper.scrollHeight + 100) + 'px';
            wrapper.style.overflow = 'visible';
            wrapper.style.opacity = '1';
            isFormVisible = true;

            setTimeout(() => {
                wrapper.scrollIntoView({
                    behavior: 'smooth',
                    block: 'start'
                });
            }, 100);
        }

        // Hide form with slide-up animation
        function hideForm() {
            const wrapper = document.getElementById('review-form-wrapper');
            wrapper.style.maxHeight = '0';
            wrapper.style.overflow = 'hidden';
            wrapper.style.opacity = '0';
            isFormVisible = false;
        }

        // Toggle form visibility
        function toggleForm() {
            if (isFormVisible) {
                hideForm();
            } else {
                resetFormToCreate();
                showForm();
            }
        }

        // Edit button — redirect with ?edit=id
        function editReview(id) {
            window.location.href = '{{ route('dummy-reviews.index') }}?edit=' + id;
        }

        // Reset form fields for "Add New" mode
        function resetFormToCreate() {
            const form = document.getElementById('review-form');
            form.action = '{{ route('dummy-reviews.store') }}';

            const methodInput = form.querySelector('input[name="_method"]');
            if (methodInput) methodInput.remove();

            document.getElementById('form-title').textContent = '{{ translate('Add Review') }}';
            form.querySelector('input[name="name"]').value = '';
            form.querySelector('textarea[name="comment"]').value = '';
            form.querySelector('select[name="rating"]').value = '5';
            form.querySelector('input[name="sort_order"]').value = '0';
            form.querySelector('input[name="status"]').checked = true;
            form.querySelector('input[name="avatar"]').value = '';
            const previewBox = form.querySelector('.file-preview');
            if (previewBox) previewBox.innerHTML = '';
        }

        // Active toggle
        function updateStatus(el) {
            $.post('{{ route('dummy-reviews.update-status') }}', {
                _token: '{{ csrf_token() }}',
                id: el.value,
                status: el.checked ? 1 : 0
            }).done(function() {
                AIZ.plugins.notify('success', '{{ translate('Status updated successfully') }}');
            }).fail(function() {
                el.checked = !el.checked;
                AIZ.plugins.notify('danger', '{{ translate('Something went wrong') }}');
            });
        }

        // Delete confirmation
        $(document).on('click', '.confirm-delete', function(e) {
            e.preventDefault();
            var url = $(this).data('href');
            $('#delete-modal').modal('show');
            $('#delete-form').attr('action', url);
        });

        // Auto-show form on page load if in edit mode or validation failed
        document.addEventListener('DOMContentLoaded', function() {
            @if ($edit_item || $errors->any())
                setTimeout(showForm, 150);
            @endif
        });
    </script>
@endsection
