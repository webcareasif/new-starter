@extends('frontend.frrontend_app')

@section('content')
    <section class="container-fluid py-8">
        <div class="grid lg:grid-cols-[260px_1fr] gap-6">
            @include('frontend.pages.profile._sidebar')

            <div>
                <div class="flex items-center justify-between mb-5">
                    <h1 class="text-2xl font-bold text-slate-900">My Addresses</h1>
                    <a href="{{ route('frontend.addresses.create') }}" class="btn btn-primary">+ Add Address</a>
                </div>

                @if (session('success'))
                    <div class="text-sm bg-green-50 text-green-700 border border-green-200 rounded-lg px-4 py-2 mb-4">
                        {{ session('success') }}
                    </div>
                @endif

                @if ($errors->any())
                    <div class="text-sm bg-red-50 text-red-700 border border-red-200 rounded-lg px-4 py-2 mb-4">
                        {{ $errors->first() }}
                    </div>
                @endif

                @if ($addresses->isEmpty())
                    <div class="card p-10 text-center">
                        <p class="text-slate-500">You haven't added any addresses yet.</p>
                        <a href="{{ route('frontend.addresses.create') }}" class="btn btn-primary mt-4">Add your first
                            address</a>
                    </div>
                @else
                    <div class="grid md:grid-cols-2 gap-4">
                        @foreach ($addresses as $address)
                            <div class="card p-5 {{ $address->is_active ? '' : 'opacity-60' }}"
                                style="{{ $address->is_default ? 'background: rgb(244, 249, 244)' : '' }}">
                                <div class="flex items-start justify-between gap-3">
                                    <div class="min-w-0">
                                        <div class="flex items-center gap-2 flex-wrap">
                                            <span
                                                class="text-xs font-semibold px-2 py-0.5 rounded-full bg-slate-100 text-slate-700">
                                                {{ $address->label }}
                                            </span>
                                            @if ($address->is_default)
                                                <span
                                                    class="text-xs font-semibold px-2 py-0.5 rounded-full bg-brand-100 text-brand-700">
                                                    Default
                                                </span>
                                            @endif
                                            @if ($address->is_active)
                                                <span
                                                    class="text-xs font-semibold px-2 py-0.5 rounded-full bg-green-100 text-green-700">
                                                    Active
                                                </span>
                                            @else
                                                <span
                                                    class="text-xs font-semibold px-2 py-0.5 rounded-full bg-red-100 text-red-700">
                                                    Inactive
                                                </span>
                                            @endif
                                        </div>

                                        <p class="font-semibold text-slate-900 mt-2">{{ $address->name }}</p>
                                        <p class="text-sm text-slate-600">{{ $address->phone }}</p>
                                        <p class="text-sm text-slate-600 mt-1">{{ $address->address }}</p>
                                        <p class="text-xs text-slate-500 mt-1">
                                            {{ $address->area === 'inside' ? 'Inside Dhaka' : 'Outside Dhaka' }}
                                            @if ($address->city)
                                                · {{ $address->city }}
                                            @endif
                                        </p>
                                    </div>

                                    {{-- Active toggle --}}
                                    <form method="POST" action="{{ route('frontend.addresses.toggle', $address) }}">
                                        @csrf @method('PATCH')
                                        <button type="submit"
                                            class="text-xs font-medium px-2.5 py-1 rounded-lg border
                                                {{ $address->is_active
                                                    ? 'border-slate-200 text-slate-600 hover:bg-slate-50'
                                                    : 'border-brand-200 text-brand-700 hover:bg-brand-50' }}">
                                            {{ $address->is_active ? 'Deactivate' : 'Activate' }}
                                        </button>
                                    </form>
                                </div>

                                <div class="flex items-center gap-3 mt-4 pt-4 border-t border-slate-100 text-sm">
                                    @unless ($address->is_default)
                                        <form method="POST" action="{{ route('frontend.addresses.default', $address) }}">
                                            @csrf @method('PATCH')
                                            <button class="text-brand-600 hover:underline" type="submit">Set as
                                                default</button>
                                        </form>
                                    @endunless

                                    <a href="{{ route('frontend.addresses.edit', $address) }}"
                                        class="text-slate-600 hover:underline">Edit</a>
                                    @if (!$address->is_default)
                                        <form method="POST" action="{{ route('frontend.addresses.destroy', $address) }}"
                                            onsubmit="return confirm('Delete this address?');" class="ml-auto">
                                            @csrf @method('DELETE')
                                            <button type="submit" class="text-red-600 hover:underline">Delete</button>
                                        </form>
                                    @endif
                                </div>
                            </div>
                        @endforeach
                    </div>
                @endif
            </div>
        </div>
    </section>
@endsection
