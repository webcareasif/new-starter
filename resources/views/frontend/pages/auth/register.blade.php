@extends('frontend.frrontend_app')

@section('content')
    <section class="max-w-5xl mx-auto px-4 py-12 grid md:grid-cols-2 card overflow-hidden !p-0 my-10">
        {{-- Left panel: same as before --}}
        <div class="hidden md:flex flex-col justify-center nl-bg text-white p-10">
            <h1 class="text-3xl font-bold leading-tight">Join<br>NexioMart</h1>
            <p class="text-brand-100 text-sm mt-3 max-w-xs">Create your account for faster checkout and order tracking.</p>
        </div>

        <div class="p-7 sm:p-10">
            <h2 class="text-xl font-semibold text-slate-900 mb-1">Create account</h2>
            <p class="text-sm text-slate-500 mb-6">It only takes a minute.</p>

            {{-- Top summary: shows ALL errors, not just first --}}
            @if ($errors->any())
                <div class="mb-4 text-sm bg-red-50 text-red-700 border border-red-200 rounded-lg px-4 py-3 space-y-1">
                    @foreach ($errors->all() as $error)
                        <p>• {{ $error }}</p>
                    @endforeach
                </div>
            @endif

            <form method="POST" action="{{ route('frontend.register.submit') }}" class="space-y-4" id="registerForm"
                novalidate>
                @csrf

                {{-- Name --}}
                <div>
                    <label class="label" for="name">Full name</label>
                    <input id="name" name="name" type="text"
                        class="field @error('name') !border-red-400 @enderror" placeholder="Your name"
                        value="{{ old('name') }}" required autofocus>
                    @error('name')
                        <p class="text-xs text-red-600 mt-1">{{ $message }}</p>
                    @enderror
                </div>

                {{-- Phone --}}
                <div>
                    <label class="label" for="phone">Mobile number</label>
                    <input id="phone" name="phone" type="tel"
                        class="field @error('phone') !border-red-400 @enderror" placeholder="01XXXXXXXXX"
                        value="{{ old('phone') }}" required maxlength="14">
                    @error('phone')
                        <p class="text-xs text-red-600 mt-1">{{ $message }}</p>
                    @enderror
                </div>

                {{-- Email --}}
                <div>
                    <label class="label" for="email">Email</label>
                    <input id="email" name="email" type="email"
                        class="field @error('email') !border-red-400 @enderror" placeholder="you@example.com"
                        value="{{ old('email') }}" required>
                    @error('email')
                        <p class="text-xs text-red-600 mt-1">{{ $message }}</p>
                    @enderror
                </div>

                {{-- Password --}}
                <div>
                    <label class="label" for="password">Password</label>
                    <input id="password" name="password" type="password"
                        class="field @error('password') !border-red-400 @enderror" placeholder="At least 8 characters"
                        required>
                    @error('password')
                        <p class="text-xs text-red-600 mt-1">{{ $message }}</p>
                    @enderror
                </div>

                {{-- Confirm --}}
                <div>
                    <label class="label" for="password_confirmation">Confirm password</label>
                    <input id="password_confirmation" name="password_confirmation" type="password" class="field"
                        placeholder="Re-enter password" required>
                </div>

                <button class="btn btn-primary w-full !py-3" id="regBtn" type="submit">
                    Create account
                </button>

                <p class="text-xs text-center text-slate-500">
                    Already have an account?
                    <a href="{{ route('frontend.login') }}" class="text-brand-600 hover:underline">Sign in</a>
                </p>
            </form>
        </div>
    </section>

    @push('scripts')
        <script>
            (function() {
                const form = document.getElementById('registerForm');
                const btn = document.getElementById('regBtn');
                const nameIn = document.getElementById('name');
                const phoneIn = document.getElementById('phone');
                const emailIn = document.getElementById('email');
                const passIn = document.getElementById('password');
                const confIn = document.getElementById('password_confirmation');

                const emailRe = /^[^\s@]+@[^\s@]+\.[^\s@]{2,}$/;
                const phoneRe = /^01[3-9]\d{8}$/;

                // Live feedback for duplicate — as user types
                let emailTimer = null;
                emailIn.addEventListener('blur', async () => {
                    const v = emailIn.value.trim().toLowerCase();
                    emailIn.value = v;
                    if (!emailRe.test(v)) return;

                    try {
                        const res = await fetch('{{ route('frontend.check.email') }}?email=' +
                            encodeURIComponent(v), {
                                headers: {
                                    'Accept': 'application/json'
                                }
                            });
                        const d = await res.json();
                        if (d.exists) {
                            showInline(emailIn, 'এই ইমেইল দিয়ে ইতিমধ্যে একটি অ্যাকাউন্ট আছে।');
                        }
                    } catch (e) {
                        /* silent */
                    }
                });

                let phoneTimer = null;
                phoneIn.addEventListener('blur', async () => {
                    const v = phoneIn.value.replace(/[\s\-]/g, '');
                    phoneIn.value = v;
                    if (!phoneRe.test(v)) return;

                    try {
                        const res = await fetch('{{ route('frontend.check.phone') }}?phone=' +
                            encodeURIComponent(v), {
                                headers: {
                                    'Accept': 'application/json'
                                }
                            });
                        const d = await res.json();
                        if (d.exists) {
                            showInline(phoneIn, 'এই মোবাইল নম্বর দিয়ে ইতিমধ্যে একটি অ্যাকাউন্ট আছে।');
                        }
                    } catch (e) {
                        /* silent */
                    }
                });

                function showInline(input, msg) {
                    let el = input.parentElement.querySelector('.js-dup');
                    if (!el) {
                        el = document.createElement('p');
                        el.className = 'js-dup text-xs text-red-600 mt-1';
                        input.parentElement.appendChild(el);
                    }
                    el.textContent = msg;
                    input.classList.add('!border-red-400');
                }

                form.addEventListener('submit', function(e) {
                    // remove old dup messages
                    form.querySelectorAll('.js-dup').forEach(n => n.remove());

                    if (!nameIn.value.trim() || !phoneIn.value.trim() || !emailIn.value.trim() || !passIn.value) {
                        e.preventDefault();
                        return;
                    }
                    btn.disabled = true;
                    btn.textContent = 'Creating account...';
                });
            })();
        </script>
    @endpush
@endsection
