@extends('frontend.frrontend_app')

@section('content')
    <section class="hero-bg border-b border-brand-100">
        <div class="container-fluid py-9 md:py-12">
            <h1 class="text-2xl md:text-3xl font-bold text-brand-900">About NexioMart</h1>
            <p class="text-sm text-slate-600 mt-1.5 max-w-xl">A Bangladeshi online store built around honest prices and
                reliable service.</p>
            <div class="mt-3">
                <nav class="text-sm text-slate-500 flex items-center gap-1.5 flex-wrap" aria-label="Breadcrumb"><a
                        href="{{ route('frontend.home') }}" class="hover:text-brand-600">Home</a><span
                        class="text-slate-300">/</span><span class="text-slate-800 font-medium">About</span></nav>
            </div>
        </div>
    </section>
    <section class="container-fluid pt-12 grid lg:grid-cols-2 gap-10 items-center">
        <div class="aspect-[4/3] rounded-2xl overflow-hidden">
            <div class="ph xl" style="background:linear-gradient(135deg,#e3f1e5,#cfe6d3)"><span>🏬</span></div>
        </div>
        <div>
            <h2 class="text-2xl font-bold text-slate-900">We started NexioMart to make online shopping feel safe</h2>
            <p class="text-slate-600 text-[14px] leading-[1.85] mt-4">Too many shoppers in Bangladesh have received products
                that did not match the photos. We set out to fix that: genuine items, prices shown up front, cash on
                delivery
                and a seven-day return window.</p>
            <p class="text-slate-600 text-[14px] leading-[1.85] mt-3">Today we ship to all 64 districts from our warehouse
                in Dhaka, and we are still a team that reads every review.</p><a href="shop.html"
                class="btn btn-primary mt-6">Start Shopping</a>
        </div>
    </section>
    <section class="container-fluid mt-14">
        <div class="nl-bg rounded-2xl p-8 grid grid-cols-2 md:grid-cols-4 gap-6">
            <div class="text-center">
                <p class="text-3xl font-bold text-white">50K+</p>
                <p class="text-xs text-brand-100 mt-1">Happy customers</p>
            </div>
            <div class="text-center">
                <p class="text-3xl font-bold text-white">2,500+</p>
                <p class="text-xs text-brand-100 mt-1">Products listed</p>
            </div>
            <div class="text-center">
                <p class="text-3xl font-bold text-white">64</p>
                <p class="text-xs text-brand-100 mt-1">Districts delivered</p>
            </div>
            <div class="text-center">
                <p class="text-3xl font-bold text-white">4.8/5</p>
                <p class="text-xs text-brand-100 mt-1">Average rating</p>
            </div>
        </div>
    </section>
    <section class="container-fluid mt-14">
        <h2 class="section-title mb-6">What we stand for</h2>
        <div class="grid md:grid-cols-3 gap-5">
            <div class="card p-6"><span class="w-12 h-12 rounded-xl bg-brand-50 text-brand-600 grid place-items-center"><svg
                        class="w-6 h-6" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"
                        stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                        <path
                            d="M20 13c0 5-3.5 7.5-7.66 8.95a1 1 0 0 1-.67-.01C7.5 20.5 4 18 4 13V6a1 1 0 0 1 1-1c2 0 4.5-1.2 6.24-2.72a1.17 1.17 0 0 1 1.52 0C14.51 3.81 17 5 19 5a1 1 0 0 1 1 1z" />
                        <path d="m9 12 2 2 4-4" />
                    </svg></span>
                <h3 class="font-semibold text-slate-900 mt-4">Genuine products</h3>
                <p class="text-[13px] text-slate-500 mt-1.5 leading-relaxed">Every item is sourced from brands or verified
                    suppliers and checked before dispatch.</p>
            </div>
            <div class="card p-6"><span class="w-12 h-12 rounded-xl bg-brand-50 text-brand-600 grid place-items-center"><svg
                        class="w-6 h-6" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"
                        stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                        <path d="M14 18V6a2 2 0 0 0-2-2H4a2 2 0 0 0-2 2v11a1 1 0 0 0 1 1h2" />
                        <path d="M15 18H9" />
                        <path d="M19 18h2a1 1 0 0 0 1-1v-3.65a1 1 0 0 0-.22-.624l-3.48-4.35A1 1 0 0 0 17.52 8H14" />
                        <circle cx="17" cy="18" r="2" />
                        <circle cx="7" cy="18" r="2" />
                    </svg></span>
                <h3 class="font-semibold text-slate-900 mt-4">Delivery you can plan around</h3>
                <p class="text-[13px] text-slate-500 mt-1.5 leading-relaxed">Clear delivery estimates and live tracking from
                    the warehouse to your door.</p>
            </div>
            <div class="card p-6"><span class="w-12 h-12 rounded-xl bg-brand-50 text-brand-600 grid place-items-center"><svg
                        class="w-6 h-6" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"
                        stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                        <path
                            d="M3 11h3a2 2 0 0 1 2 2v3a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-5Zm0 0a9 9 0 1 1 18 0m0 0v5a2 2 0 0 1-2 2h-1a2 2 0 0 1-2-2v-3a2 2 0 0 1 2-2h3Z" />
                        <path d="M21 16v2a4 4 0 0 1-4 4h-5" />
                    </svg></span>
                <h3 class="font-semibold text-slate-900 mt-4">People who pick up</h3>
                <p class="text-[13px] text-slate-500 mt-1.5 leading-relaxed">Our support team answers calls and chats every
                    day, in Bangla and English.</p>
            </div>
        </div>
    </section>
    <section class="container-fluid mt-14">
        <h2 class="section-title mb-6">Meet the team</h2>
        <div class="grid grid-cols-2 lg:grid-cols-4 gap-5">
            <div class="card p-5 text-center">
                <div class="w-24 h-24 mx-auto rounded-full overflow-hidden">
                    <div class="ph " style="background:linear-gradient(135deg,#e3f1e5,#cfe6d3)"><span>👨‍💼</span></div>
                </div>
                <h3 class="font-semibold text-slate-900 mt-4 text-sm">Rafiq Ahmed</h3>
                <p class="text-xs text-slate-500">Founder & CEO</p>
            </div>
            <div class="card p-5 text-center">
                <div class="w-24 h-24 mx-auto rounded-full overflow-hidden">
                    <div class="ph " style="background:linear-gradient(135deg,#fbe9ee,#f6d3dd)"><span>👩‍💼</span></div>
                </div>
                <h3 class="font-semibold text-slate-900 mt-4 text-sm">Tasnim Akter</h3>
                <p class="text-xs text-slate-500">Head of Operations</p>
            </div>
            <div class="card p-5 text-center">
                <div class="w-24 h-24 mx-auto rounded-full overflow-hidden">
                    <div class="ph " style="background:linear-gradient(135deg,#e6eef9,#d3e0f4)"><span>👨</span></div>
                </div>
                <h3 class="font-semibold text-slate-900 mt-4 text-sm">Imran Hossain</h3>
                <p class="text-xs text-slate-500">Head of Logistics</p>
            </div>
            <div class="card p-5 text-center">
                <div class="w-24 h-24 mx-auto rounded-full overflow-hidden">
                    <div class="ph " style="background:linear-gradient(135deg,#fdeee3,#f9dcc6)"><span>👩</span></div>
                </div>
                <h3 class="font-semibold text-slate-900 mt-4 text-sm">Farzana Yasmin</h3>
                <p class="text-xs text-slate-500">Customer Care Lead</p>
            </div>
        </div>
    </section>
@endsection

@push('scripts')
@endpush
