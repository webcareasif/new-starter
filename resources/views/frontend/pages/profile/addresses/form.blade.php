@extends('frontend.frrontend_app')

@section('content')
    <section class="container-fluid py-8">
        <div class="grid lg:grid-cols-[260px_1fr] gap-6">
            @include('frontend.pages.profile._sidebar')

            <div>
                <h1 class="text-2xl font-bold text-slate-900 mb-5">
                    {{ $address->exists ? 'Edit Address' : 'Add New Address' }}
                </h1>

                @if ($errors->any())
                    <div class="text-sm bg-red-50 text-red-700 border border-red-200 rounded-lg px-4 py-2 mb-4">
                        {{ $errors->first() }}
                    </div>
                @endif

                @php
                    $vLabel = old('label', $address->label ?? 'Home');
                    $vName = old('name', $address->name ?? '');
                    $vPhone = old('phone', $address->phone ?? '');
                    $vAddress = old('address', $address->address ?? '');
                    $vArea = old('area', $address->area ?? 'inside');
                    $vCity = old('city', $address->city ?? '');
                    $vPostcode = old('postcode', $address->postcode ?? '');
                    $vIsDefault = (bool) old('is_default', $address->is_default ?? false);
                    $vIsActive = (bool) old('is_active', $address->exists ? $address->is_active : true);
                @endphp

                <form method="POST"
                    action="{{ $address->exists ? route('frontend.addresses.update', $address) : route('frontend.addresses.store') }}"
                    class="card p-6 space-y-5">
                    @csrf
                    @if ($address->exists)
                        @method('PUT')
                    @endif

                    <div class="grid sm:grid-cols-2 gap-4">
                        <div>
                            <label class="label mb-1 block" for="label">Label</label>
                            <input id="label" name="label" type="text" maxlength="50" value="{{ $vLabel }}"
                                placeholder="Home, Office, etc."
                                class="w-full border border-slate-200 rounded-lg px-3 py-2.5 text-sm outline-none focus:border-brand-600">
                        </div>
                        <div>
                            <label class="label mb-1 block" for="name">Full Name *</label>
                            <input id="name" name="name" type="text" required maxlength="100"
                                value="{{ $vName }}"
                                class="w-full border border-slate-200 rounded-lg px-3 py-2.5 text-sm outline-none focus:border-brand-600">
                        </div>
                    </div>

                    <div>
                        <label class="label mb-1 block" for="phone">Mobile Number *</label>
                        <input id="phone" name="phone" type="tel" required maxlength="20"
                            value="{{ $vPhone }}" placeholder="01XXXXXXXXX"
                            class="w-full border border-slate-200 rounded-lg px-3 py-2.5 text-sm outline-none focus:border-brand-600">
                    </div>

                    <div>
                        <label class="label mb-1 block" for="address">Full Address *</label>
                        <textarea id="address" name="address" rows="3" required maxlength="500"
                            class="w-full border border-slate-200 rounded-lg px-3 py-2.5 text-sm outline-none focus:border-brand-600">{{ $vAddress }}</textarea>
                    </div>

                    <div class="grid sm:grid-cols-3 gap-4">
                        <div>
                            <label class="label mb-1 block" for="area">Delivery Area *</label>
                            <select id="area" name="area" required
                                class="w-full border border-slate-200 rounded-lg px-3 py-2.5 text-sm outline-none focus:border-brand-600">
                                <option value="inside" {{ $vArea === 'inside' ? 'selected' : '' }}>Inside Dhaka</option>
                                <option value="outside" {{ $vArea === 'outside' ? 'selected' : '' }}>Outside Dhaka</option>
                            </select>
                        </div>
                        <div>
                            <label class="label mb-1 block" for="city">City</label>
                            <input id="city" name="city" type="text" maxlength="100" value="{{ $vCity }}"
                                class="w-full border border-slate-200 rounded-lg px-3 py-2.5 text-sm outline-none focus:border-brand-600">
                        </div>
                        <div>
                            <label class="label mb-1 block" for="postcode">Postcode</label>
                            <input id="postcode" name="postcode" type="text" maxlength="20" value="{{ $vPostcode }}"
                                class="w-full border border-slate-200 rounded-lg px-3 py-2.5 text-sm outline-none focus:border-brand-600">
                        </div>
                    </div>

                    <div class="flex items-center gap-6 pt-2">
                        <label class="flex items-center gap-2 text-sm">
                            <input type="checkbox" name="is_default" value="1" {{ $vIsDefault ? 'checked' : '' }}>
                            Set as default address
                        </label>
                        <label class="flex items-center gap-2 text-sm">
                            <input type="checkbox" name="is_active" value="1" {{ $vIsActive ? 'checked' : '' }}>
                            Active
                        </label>
                    </div>

                    <div class="flex gap-3 pt-2">
                        <button type="submit" class="btn btn-primary">
                            {{ $address->exists ? 'Save changes' : 'Add address' }}
                        </button>
                        <a href="{{ route('frontend.addresses.index') }}" class="btn btn-outline">Cancel</a>
                    </div>
                </form>
            </div>
        </div>
    </section>
@endsection
