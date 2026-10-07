@extends('frontend.frrontend_app')

@section('content')
    <section class="container-fluid py-8">
        <h1 class="text-2xl font-bold text-slate-900 mb-6">Edit Profile</h1>

        <div class="grid lg:grid-cols-[260px_1fr] gap-6">
            @include('frontend.pages.profile._sidebar')

            <div class="space-y-6">
                @if (session('success'))
                    <div class="text-sm bg-green-50 text-green-700 border border-green-200 rounded-lg px-4 py-2">
                        {{ session('success') }}
                    </div>
                @endif

                {{-- Basic info --}}
                <div class="card p-6">
                    <h2 class="font-semibold text-slate-900 mb-4">Basic information</h2>
                    <form method="POST" action="{{ route('frontend.profile.update') }}" class="space-y-4">
                        @csrf @method('PUT')
                        <div>
                            <label class="label" for="name">Full name</label>
                            <input id="name" name="name" type="text" class="field"
                                value="{{ old('name', $user->name) }}" required>
                            @error('name')
                                <p class="text-xs text-red-600 mt-1">{{ $message }}</p>
                            @enderror
                        </div>
                        <div>
                            <label class="label" for="phone">Mobile number</label>
                            <input id="phone" name="phone" type="tel" class="field"
                                value="{{ old('phone', $user->phone) }}" required>
                            @error('phone')
                                <p class="text-xs text-red-600 mt-1">{{ $message }}</p>
                            @enderror
                        </div>
                        <div>
                            <label class="label" for="email">Email</label>
                            <input id="email" name="email" type="email" class="field"
                                value="{{ old('email', $user->email) }}" required>
                            @error('email')
                                <p class="text-xs text-red-600 mt-1">{{ $message }}</p>
                            @enderror
                        </div>
                        <div>
                            <label class="label" for="address">Default address</label>
                            <textarea id="address" name="address" rows="3" class="field">{{ old('address', $user->address ?? '') }}</textarea>
                        </div>
                        <button class="btn btn-primary">Save changes</button>
                    </form>
                </div>

                {{-- Password --}}
                <div class="card p-6">
                    <h2 class="font-semibold text-slate-900 mb-4">Change password</h2>
                    <form method="POST" action="{{ route('frontend.profile.password') }}" class="space-y-4">
                        @csrf @method('PUT')
                        <div>
                            <label class="label" for="current_password">Current password</label>
                            <input id="current_password" name="current_password" type="password" class="field" required>
                            @error('current_password')
                                <p class="text-xs text-red-600 mt-1">{{ $message }}</p>
                            @enderror
                        </div>
                        <div>
                            <label class="label" for="password">New password</label>
                            <input id="password" name="password" type="password" class="field" required>
                        </div>
                        <div>
                            <label class="label" for="password_confirmation">Confirm new password</label>
                            <input id="password_confirmation" name="password_confirmation" type="password" class="field"
                                required>
                        </div>
                        <button class="btn btn-dark">Update password</button>
                    </form>
                </div>
            </div>
        </div>
    </section>
@endsection
