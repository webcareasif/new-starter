@extends('frontend.frrontend_app')

@section('content')
    <section class="hero-bg border-b border-brand-100">
        <div class="container-fluid py-9 md:py-12">
            <h1 class="text-2xl md:text-3xl font-bold text-brand-900">Refund & Return Policy</h1>
            <p class="text-sm text-slate-600 mt-1.5 max-w-xl">
                Learn how refunds, returns, and exchanges work at NexioMart.
            </p>
            <div class="mt-3">
                <nav class="text-sm text-slate-500 flex items-center gap-1.5 flex-wrap" aria-label="Breadcrumb">
                    <a href="{{ route('frontend.home') }}" class="hover:text-brand-600">Home</a>
                    <span class="text-slate-300">/</span>
                    <span class="text-slate-800 font-medium">Refund Policy</span>
                </nav>
            </div>
        </div>
    </section>

    <section class="container-fluid pt-12 max-w-4xl">
        <div class="card p-8">
            <h2 class="text-xl font-bold text-slate-900">7-Day Return Window</h2>
            <p class="text-slate-600 text-[14px] leading-[1.85] mt-3">
                You may request a return within <strong>7 days</strong> of delivery if the product is damaged,
                defective, or does not match the description.
            </p>

            <h2 class="text-xl font-bold text-slate-900 mt-8">Refund Eligibility</h2>
            <ul class="list-disc pl-5 mt-3 text-slate-600 text-[14px] leading-[1.85] space-y-1.5">
                <li>Item must be unused and in original packaging.</li>
                <li>Proof of purchase (order ID or receipt) is required.</li>
                <li>Refunds are processed within 5–7 business days after inspection.</li>
            </ul>

            <h2 class="text-xl font-bold text-slate-900 mt-8">How to Request a Refund</h2>
            <ol class="list-decimal pl-5 mt-3 text-slate-600 text-[14px] leading-[1.85] space-y-1.5">
                <li>Contact our support team via phone or live chat.</li>
                <li>Provide your order ID and reason for return.</li>
                <li>Ship the item back or schedule a pickup.</li>
                <li>Receive your refund via original payment method or store credit.</li>
            </ol>
        </div>
    </section>
@endsection

@push('scripts')
@endpush
