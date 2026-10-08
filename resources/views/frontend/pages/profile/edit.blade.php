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

                        {{-- Current password --}}
                        <div>
                            <label class="label" for="current_password">Current password</label>
                            <div class="relative">
                                <input id="current_password" name="current_password" type="password" class="field pr-11"
                                    required>
                                <button type="button" data-toggle-password="#current_password"
                                    class="absolute right-3 top-1/2 -translate-y-1/2 text-slate-400 hover:text-slate-600 focus:outline-none"
                                    aria-label="Show password" aria-pressed="false">
                                    {{-- Eye (show) --}}
                                    <svg data-eye-open xmlns="http://www.w3.org/2000/svg" width="18" height="18"
                                        viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"
                                        stroke-linecap="round" stroke-linejoin="round">
                                        <path d="M2 12s3.5-7 10-7 10 7 10 7-3.5 7-10 7S2 12 2 12Z" />
                                        <circle cx="12" cy="12" r="3" />
                                    </svg>
                                    {{-- Eye-off (hide) --}}
                                    <svg data-eye-closed xmlns="http://www.w3.org/2000/svg" width="18" height="18"
                                        viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"
                                        stroke-linecap="round" stroke-linejoin="round" class="hidden">
                                        <path d="M9.88 9.88a3 3 0 1 0 4.24 4.24" />
                                        <path
                                            d="M10.73 5.08A10.94 10.94 0 0 1 12 5c6.5 0 10 7 10 7a13.16 13.16 0 0 1-1.67 2.68" />
                                        <path
                                            d="M6.61 6.61A13.526 13.526 0 0 0 2 12s3.5 7 10 7a9.74 9.74 0 0 0 5.39-1.61" />
                                        <line x1="2" y1="2" x2="22" y2="22" />
                                    </svg>
                                </button>
                            </div>
                            @error('current_password')
                                <p class="text-xs text-red-600 mt-1">{{ $message }}</p>
                            @enderror
                        </div>

                        {{-- New password --}}
                        <div>
                            <label class="label" for="password">New password</label>
                            <div class="relative">
                                <input id="password" name="password" type="password" class="field pr-11" required>
                                <button type="button" data-toggle-password="#password"
                                    class="absolute right-3 top-1/2 -translate-y-1/2 text-slate-400 hover:text-slate-600 focus:outline-none"
                                    aria-label="Show password" aria-pressed="false">
                                    <svg data-eye-open xmlns="http://www.w3.org/2000/svg" width="18" height="18"
                                        viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"
                                        stroke-linecap="round" stroke-linejoin="round">
                                        <path d="M2 12s3.5-7 10-7 10 7 10 7-3.5 7-10 7S2 12 2 12Z" />
                                        <circle cx="12" cy="12" r="3" />
                                    </svg>
                                    <svg data-eye-closed xmlns="http://www.w3.org/2000/svg" width="18" height="18"
                                        viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"
                                        stroke-linecap="round" stroke-linejoin="round" class="hidden">
                                        <path d="M9.88 9.88a3 3 0 1 0 4.24 4.24" />
                                        <path
                                            d="M10.73 5.08A10.94 10.94 0 0 1 12 5c6.5 0 10 7 10 7a13.16 13.16 0 0 1-1.67 2.68" />
                                        <path
                                            d="M6.61 6.61A13.526 13.526 0 0 0 2 12s3.5 7 10 7a9.74 9.74 0 0 0 5.39-1.61" />
                                        <line x1="2" y1="2" x2="22" y2="22" />
                                    </svg>
                                </button>
                            </div>
                            @error('password')
                                <p class="text-xs text-red-600 mt-1">{{ $message }}</p>
                            @enderror
                        </div>

                        {{-- Confirm new password --}}
                        <div>
                            <label class="label" for="password_confirmation">Confirm new password</label>
                            <div class="relative">
                                <input id="password_confirmation" name="password_confirmation" type="password"
                                    class="field pr-11" required>
                                <button type="button" data-toggle-password="#password_confirmation"
                                    class="absolute right-3 top-1/2 -translate-y-1/2 text-slate-400 hover:text-slate-600 focus:outline-none"
                                    aria-label="Show password" aria-pressed="false">
                                    <svg data-eye-open xmlns="http://www.w3.org/2000/svg" width="18" height="18"
                                        viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"
                                        stroke-linecap="round" stroke-linejoin="round">
                                        <path d="M2 12s3.5-7 10-7 10 7 10 7-3.5 7-10 7S2 12 2 12Z" />
                                        <circle cx="12" cy="12" r="3" />
                                    </svg>
                                    <svg data-eye-closed xmlns="http://www.w3.org/2000/svg" width="18" height="18"
                                        viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"
                                        stroke-linecap="round" stroke-linejoin="round" class="hidden">
                                        <path d="M9.88 9.88a3 3 0 1 0 4.24 4.24" />
                                        <path
                                            d="M10.73 5.08A10.94 10.94 0 0 1 12 5c6.5 0 10 7 10 7a13.16 13.16 0 0 1-1.67 2.68" />
                                        <path
                                            d="M6.61 6.61A13.526 13.526 0 0 0 2 12s3.5 7 10 7a9.74 9.74 0 0 0 5.39-1.61" />
                                        <line x1="2" y1="2" x2="22" y2="22" />
                                    </svg>
                                </button>
                            </div>
                        </div>

                        <button class="btn btn-dark">Update password</button>
                    </form>
                </div>
            </div>
        </div>
    </section>

    @push('scripts')
        <script>
            document.addEventListener('DOMContentLoaded', function() {
                document.querySelectorAll('[data-toggle-password]').forEach(function(btn) {
                    btn.addEventListener('click', function() {
                        const input = document.querySelector(this.dataset.togglePassword);
                        if (!input) return;

                        const isHidden = input.type === 'password';
                        input.type = isHidden ? 'text' : 'password';

                        // Swap icons
                        const eyeOpen = this.querySelector('[data-eye-open]');
                        const eyeClosed = this.querySelector('[data-eye-closed]');
                        if (eyeOpen) eyeOpen.classList.toggle('hidden', isHidden === false);
                        if (eyeClosed) eyeClosed.classList.toggle('hidden', isHidden === true);

                        // Accessibility
                        this.setAttribute('aria-pressed', isHidden ? 'true' : 'false');
                        this.setAttribute('aria-label', isHidden ? 'Hide password' : 'Show password');
                    });
                });
            });
        </script>
    @endpush
@endsection
