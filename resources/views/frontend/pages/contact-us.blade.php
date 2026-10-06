@extends('frontend.frrontend_app')

@section('content')
    <section class="hero-bg border-b border-brand-100">
        <div class="container-fluid py-9 md:py-12">
            <h1 class="text-2xl md:text-3xl font-bold text-brand-900">Contact Us</h1>
            <p class="text-sm text-slate-600 mt-1.5 max-w-xl">Questions about an order or a product? Send us a message.</p>
            <div class="mt-3">
                <nav class="text-sm text-slate-500 flex items-center gap-1.5 flex-wrap" aria-label="Breadcrumb"><a
                        href="{{ route('frontend.home') }}" class="hover:text-brand-600">Home</a><span
                        class="text-slate-300">/</span><span class="text-slate-800 font-medium">Contact Us</span></nav>
            </div>
        </div>
    </section>
    <section class="container-fluid pt-10 grid lg:grid-cols-[1fr_1.3fr] gap-8">
        <div class="space-y-6">
            <div class="card p-6 space-y-5">
                <div class="flex gap-4"><span
                        class="w-11 h-11 rounded-xl bg-brand-50 text-brand-600 grid place-items-center shrink-0"><svg
                            class="w-5 h-5" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"
                            stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                            <path
                                d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6 19.79 19.79 0 0 1-3.07-8.67A2 2 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72c.127.96.361 1.903.7 2.81a2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45c.907.339 1.85.573 2.81.7A2 2 0 0 1 22 16.92z" />
                        </svg></span>
                    <div><b class="text-sm text-slate-900">Call us</b>
                        <p class="text-[13px] text-slate-500 mt-0.5">01316 690 209 · Sat–Thu, 9am–9pm</p>
                    </div>
                </div>
                <div class="flex gap-4"><span
                        class="w-11 h-11 rounded-xl bg-brand-50 text-brand-600 grid place-items-center shrink-0"><svg
                            class="w-5 h-5" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"
                            stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                            <path d="M20 10c0 6-8 12-8 12s-8-6-8-12a8 8 0 0 1 16 0Z" />
                            <circle cx="12" cy="10" r="3" />
                        </svg></span>
                    <div><b class="text-sm text-slate-900">Visit</b>
                        <p class="text-[13px] text-slate-500 mt-0.5">House 12, Road 5, Uttara, Dhaka 1230</p>
                    </div>
                </div>
                <div class="flex gap-4"><span
                        class="w-11 h-11 rounded-xl bg-brand-50 text-brand-600 grid place-items-center shrink-0"><svg
                            class="w-5 h-5" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"
                            stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                            <circle cx="12" cy="12" r="10" />
                            <path d="M12 6v6l4 2" />
                        </svg></span>
                    <div><b class="text-sm text-slate-900">Support hours</b>
                        <p class="text-[13px] text-slate-500 mt-0.5">Saturday to Thursday, 9:00 am – 9:00 pm</p>
                    </div>
                </div>
            </div>
            <div class="rounded-2xl overflow-hidden aspect-[16/9] border border-slate-200">
                <div class="ph lg" style="background:linear-gradient(135deg,#e4f4ef,#cde9e0)"><span>🗺️</span></div>
            </div>
        </div>
        <form data-demo data-msg="Message sent. We'll reply within one working day." class="card p-6 sm:p-8">
            <h2 class="font-semibold text-slate-900 text-lg mb-5">Send a message</h2>
            <div class="grid sm:grid-cols-2 gap-4">
                <div class=""><label class="label">Your name</label><input type="text" class="field"
                        placeholder="" required>
                </div>
                <div class=""><label class="label">Mobile number</label><input type="tel" class="field"
                        placeholder="" required></div>
                <div class="sm:col-span-2"><label class="label">Email</label><input type="email" class="field"
                        placeholder="" required></div>
                <div class="sm:col-span-2"><label class="label">Subject</label><input type="text" class="field"
                        placeholder="" required></div>
                <div class="sm:col-span-2"><label class="label">Message</label>
                    <textarea rows="6" class="field" required></textarea>
                </div>
            </div><button class="btn btn-primary !py-3 mt-5">Send Message</button>
        </form>
    </section>
@endsection

@push('scripts')
@endpush
