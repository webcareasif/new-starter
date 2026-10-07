@extends('frontend.frrontend_app')

@section('content')
    <section class="max-w-5xl mx-auto px-4 py-12 grid md:grid-cols-2 card overflow-hidden !p-0 my-10">
        {{-- Left brand panel --}}
        <div class="hidden md:flex flex-col justify-center nl-bg text-white p-10">
            <h1 class="text-3xl font-bold leading-tight">Welcome back to<br>NexioMart</h1>
            <p class="text-brand-100 text-sm mt-3 max-w-xs">Sign in to track orders, save favourites and check out faster.
            </p>
            <ul class="mt-8 space-y-3 text-sm">
                <li class="flex items-center gap-3"><span class="text-brand-100"><svg class="w-4 h-4" viewBox="0 0 24 24"
                            fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                            stroke-linejoin="round">
                            <path d="M20 6 9 17l-5-5" />
                        </svg></span>Track every order in one place</li>
                <li class="flex items-center gap-3"><span class="text-brand-100"><svg class="w-4 h-4" viewBox="0 0 24 24"
                            fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                            stroke-linejoin="round">
                            <path d="M20 6 9 17l-5-5" />
                        </svg></span>Save items to your wishlist</li>
                <li class="flex items-center gap-3"><span class="text-brand-100"><svg class="w-4 h-4" viewBox="0 0 24 24"
                            fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                            stroke-linejoin="round">
                            <path d="M20 6 9 17l-5-5" />
                        </svg></span>Exclusive member offers</li>
            </ul>
        </div>

        {{-- Right form panel --}}
        <div class="p-7 sm:p-10">
            <h2 class="text-xl font-semibold text-slate-900 mb-1">Sign in</h2>
            <p class="text-sm text-slate-500 mb-6">Use your email or mobile number.</p>

            @if (session('success'))
                <div class="mb-4 text-sm bg-green-50 text-green-700 border border-green-200 rounded-lg px-4 py-2">
                    {{ session('success') }}
                </div>
            @endif

            @if ($errors->any())
                <div class="mb-4 text-sm bg-red-50 text-red-700 border border-red-200 rounded-lg px-4 py-2">
                    {{ $errors->first() }}
                </div>
            @endif

            <form method="POST" action="{{ route('frontend.login.submit') }}" class="space-y-4">
                @csrf
                <div>
                    <label class="label" for="login">Email or mobile</label>
                    <input id="login" name="login" type="text" class="field" placeholder="you@example.com"
                        value="{{ old('login') }}" required autofocus>
                </div>
                <div>
                    <label class="label" for="password">Password</label>
                    <input id="password" name="password" type="password" class="field" placeholder="••••••••" required>
                </div>
                <div class="flex justify-between text-xs">
                    <label class="flex items-center gap-2">
                        <input type="checkbox" name="remember" value="1"> Remember me
                    </label>
                    <a href="#" class="text-brand-600 hover:underline">Forgot password?</a>
                </div>
                <button class="btn btn-primary w-full !py-3">Sign in</button>
                <p class="text-xs text-center text-slate-500">
                    New here? <a href="{{ route('frontend.register') }}" class="text-brand-600 hover:underline">Create an
                        account</a>
                </p>
            </form>
        </div>
    </section>
@endsection
