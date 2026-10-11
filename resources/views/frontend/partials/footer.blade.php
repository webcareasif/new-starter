<footer class="bg-brand-50/60 border-t border-brand-100 mt-16">

    <div
        class="container-fluid py-12 grid grid-cols-2 gap-x-6 gap-y-9
               lg:gap-10 lg:grid-cols-[1.4fr_1fr_1fr_1.2fr_1fr]
               text-sm text-slate-600">

        {{-- =========================================================
            1. BRAND / ABOUT
        ========================================================== --}}
        <div class="col-span-2 lg:col-span-1">

            {{-- Logo --}}
            <a href="{{ route('frontend.home') }}" class="flex items-center gap-2 sm:gap-2.5 shrink-0"
                aria-label="{{ get_setting('website_name') ?? 'Home' }}">

                @if (get_setting('footer_logo'))

                    <img src="{{ uploaded_asset(get_setting('footer_logo')) }}"
                        alt="{{ get_setting('website_name') ?? 'Website Logo' }}"
                        class="w-auto h-12 sm:h-14 object-contain" onerror="this.onerror=null;this.style.display='none';">
                @else
                    <span class="leading-none">

                        <span
                            class="block text-[1.15rem] sm:text-[1.3rem]
                                     font-bold text-brand-900">
                            {{ get_setting('website_name') ?? 'Website' }}
                        </span>

                        @if (get_setting('site_motto'))
                            <span class="block text-[10px] text-slate-500 mt-1">
                                {{ get_setting('site_motto') }}
                            </span>
                        @endif

                    </span>

                @endif

            </a>


            {{-- About Description --}}
            @if (get_setting('about_us_description'))
                <div class="mt-4 max-w-[280px] leading-relaxed text-[13px]">

                    {!! get_setting('about_us_description') !!}

                </div>
            @endif


            {{-- Social Links --}}
            <div class="flex gap-4 mt-5 text-slate-800">

                {{-- Facebook --}}
                @if (get_setting('facebook_link'))
                    <a href="{{ get_setting('facebook_link') }}" target="_blank" rel="noopener noreferrer"
                        aria-label="Facebook" class="hover:text-brand-600 transition">
                        <svg class="w-[18px] h-[18px]" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                            stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                            <path d="M18 2h-3a5 5 0 0 0-5 5v3H7v4h3v8h4v-8h3l1-4h-4V7a1 1 0 0 1 1-1h3z" />
                        </svg>
                    </a>
                @endif


                {{-- YouTube --}}
                @if (get_setting('youtube_link'))
                    <a href="{{ get_setting('youtube_link') }}" target="_blank" rel="noopener noreferrer"
                        aria-label="YouTube" class="hover:text-brand-600 transition">
                        <svg class="w-[18px] h-[18px]" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                            stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                            <path
                                d="M2.5 17a24.12 24.12 0 0 1 0-10 2 2 0 0 1 1.4-1.4 49.56 49.56 0 0 1 16.2 0A2 2 0 0 1 21.5 7a24.12 24.12 0 0 1 0 10 2 2 0 0 1-1.4 1.4 49.55 49.55 0 0 1-16.2 0A2 2 0 0 1 2.5 17" />
                            <path d="m10 15 5-3-5-3z" />
                        </svg>
                    </a>
                @endif


                {{-- Instagram --}}
                @if (get_setting('instagram_link'))
                    <a href="{{ get_setting('instagram_link') }}" target="_blank" rel="noopener noreferrer"
                        aria-label="Instagram" class="hover:text-brand-600 transition">
                        <svg class="w-[18px] h-[18px]" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                            stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                            <rect width="20" height="20" x="2" y="2" rx="5" />
                            <path d="M16 11.37A4 4 0 1 1 12.63 8 4 4 0 0 1 16 11.37z" />
                            <line x1="17.5" x2="17.51" y1="6.5" y2="6.5" />
                        </svg>
                    </a>
                @endif


                {{-- LinkedIn --}}
                @if (get_setting('linkedin_link'))
                    <a href="{{ get_setting('linkedin_link') }}" target="_blank" rel="noopener noreferrer"
                        aria-label="LinkedIn" class="hover:text-brand-600 transition">
                        <svg class="w-[18px] h-[18px]" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                            stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                            <path d="M16 8a6 6 0 0 1 6 6v7h-4v-7a2 2 0 0 0-2-2 2 2 0 0 0-2 2v7h-4v-7a6 6 0 0 1 6-6z" />
                            <rect width="4" height="12" x="2" y="9" />
                            <circle cx="4" cy="4" r="2" />
                        </svg>
                    </a>
                @endif

            </div>

        </div>


        {{-- =========================================================
            2. QUICK LINKS
        ========================================================== --}}
        <div>

            <h4 class="font-semibold text-slate-900 mb-4">
                Quick Links
            </h4>

            <ul class="space-y-2.5 text-[13px]">

                <li>
                    <a href="{{ route('frontend.home') }}" class="hover:text-brand-600 transition">
                        Home
                    </a>
                </li>

                <li>
                    <a href="{{ route('frontend.all-products') }}" class="hover:text-brand-600 transition">
                        Shop
                    </a>
                </li>

                <li>
                    <a href="{{ route('frontend.all-products') }}" class="hover:text-brand-600 transition">
                        Categories
                    </a>
                </li>

                <li>
                    <a href="{{ route('frontend.all-products') }}" class="hover:text-brand-600 transition">
                        Offers
                    </a>
                </li>

                @if (Route::has('frontend.blog'))
                    <li>
                        <a href="{{ route('frontend.blog') }}" class="hover:text-brand-600 transition">
                            Blog
                        </a>
                    </li>
                @endif

                @if (Route::has('frontend.track-order'))
                    <li>
                        <a href="{{ route('frontend.track-order') }}" class="hover:text-brand-600 transition">
                            Track Order
                        </a>
                    </li>
                @endif

            </ul>

        </div>


        {{-- =========================================================
            3. CUSTOMER SERVICE
        ========================================================== --}}
        <div>

            <h4 class="font-semibold text-slate-900 mb-4">
                Customer Service
            </h4>

            <ul class="space-y-2.5 text-[13px]">

                @if (Route::has('frontend.about-us'))
                    <li>
                        <a href="{{ route('frontend.about-us') }}" class="hover:text-brand-600 transition">
                            About Us
                        </a>
                    </li>
                @endif


                @if (Route::has('frontend.return-refund'))
                    <li>
                        <a href="{{ route('frontend.return-refund') }}" class="hover:text-brand-600 transition">
                            Return & Refund
                        </a>
                    </li>
                @endif


                @if (Route::has('frontend.shipping-policy'))
                    <li>
                        <a href="{{ route('frontend.shipping-policy') }}" class="hover:text-brand-600 transition">
                            Shipping Policy
                        </a>
                    </li>
                @endif


                @if (Route::has('frontend.terms'))
                    <li>
                        <a href="{{ route('frontend.terms') }}" class="hover:text-brand-600 transition">
                            Terms & Conditions
                        </a>
                    </li>
                @endif


                @if (Route::has('frontend.privacy-policy'))
                    <li>
                        <a href="{{ route('frontend.privacy-policy') }}" class="hover:text-brand-600 transition">
                            Privacy Policy
                        </a>
                    </li>
                @endif


                @if (Route::has('frontend.contact-us'))
                    <li>
                        <a href="{{ route('frontend.contact-us') }}" class="hover:text-brand-600 transition">
                            Contact Us
                        </a>
                    </li>
                @endif

            </ul>

        </div>


        {{-- =========================================================
            4. CONTACT INFORMATION
        ========================================================== --}}
        <div class="col-span-2 sm:col-span-1">

            <h4 class="font-semibold text-slate-900 mb-4">
                Contact Us
            </h4>

            <ul class="space-y-3 text-[13px]">


                {{-- Phone --}}
                @if (get_setting('contact_phone'))
                    <li class="flex gap-3">

                        <span class="text-brand-600 shrink-0">

                            <svg class="w-4 h-4" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"
                                aria-hidden="true">
                                <path
                                    d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6 19.79 19.79 0 0 1-3.07-8.67A2 2 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72c.127.96.361 1.903.7 2.81a2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45c.907.339 1.85.573 2.81.7A2 2 0 0 1 22 16.92z" />
                            </svg>

                        </span>

                        <a href="tel:{{ preg_replace('/[^0-9+]/', '', get_setting('contact_phone')) }}"
                            class="hover:text-brand-600">
                            {{ get_setting('contact_phone') }}
                        </a>

                    </li>
                @endif


                {{-- Email --}}
                @if (get_setting('contact_email'))
                    <li class="flex gap-3">

                        <span class="text-brand-600 shrink-0">

                            <svg class="w-4 h-4" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"
                                aria-hidden="true">
                                <rect width="20" height="16" x="2" y="4" rx="2" />
                                <path d="m22 7-8.97 5.7a1.94 1.94 0 0 1-2.06 0L2 7" />
                            </svg>

                        </span>

                        <a href="mailto:{{ get_setting('contact_email') }}" class="hover:text-brand-600 break-all">
                            {{ get_setting('contact_email') }}
                        </a>

                    </li>
                @endif


                {{-- Address --}}
                @if (get_setting('contact_address'))
                    <li class="flex gap-3">

                        <span class="text-brand-600 mt-0.5 shrink-0">

                            <svg class="w-4 h-4" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"
                                aria-hidden="true">
                                <path d="M20 10c0 6-8 12-8 12s-8-6-8-12a8 8 0 0 1 16 0Z" />
                                <circle cx="12" cy="10" r="3" />
                            </svg>

                        </span>

                        <span>
                            {{ get_setting('contact_address') }}
                        </span>

                    </li>
                @endif

            </ul>

        </div>


        {{-- =========================================================
            5. PAYMENT METHODS
        ========================================================== --}}
        <div class="col-span-2 sm:col-span-1">

            <h4 class="font-semibold text-slate-900 mb-4">
                Payment Methods
            </h4>


            @if (get_setting('payment_method_images'))
                <div class="rounded-xl bg-white border border-slate-200 p-3">

                    <img src="{{ uploaded_asset(get_setting('payment_method_images')) }}" alt="Payment Methods"
                        class="w-full max-w-[220px] h-auto object-contain"
                        onerror="this.onerror=null;this.style.display='none';">

                </div>
            @else
                {{-- Fallback --}}
                <div class="flex flex-wrap gap-2">

                    <span
                        class="px-3 py-1.5 rounded-md bg-white border border-slate-200
                                 text-[12px] font-bold text-blue-800 italic">
                        VISA
                    </span>

                    <span
                        class="px-3 py-1.5 rounded-md bg-white border border-slate-200
                                 text-[12px] font-bold text-orange-600">
                        Master
                    </span>

                    <span
                        class="px-3 py-1.5 rounded-md bg-white border border-slate-200
                                 text-[12px] font-bold text-pink-600">
                        bKash
                    </span>

                    <span
                        class="px-3 py-1.5 rounded-md bg-white border border-slate-200
                                 text-[12px] font-bold text-orange-500">
                        Nagad
                    </span>

                    <span
                        class="px-3 py-1.5 rounded-md bg-white border border-slate-200
                                 text-[12px] font-bold text-brand-700">
                        COD
                    </span>

                </div>
            @endif

        </div>

    </div>


    {{-- =============================================================
        COPYRIGHT
    ============================================================= --}}
    <div class="border-t border-brand-100">

        <div
            class="container-fluid py-4 flex flex-col sm:flex-row
                   justify-between gap-2 text-xs text-slate-500">

            {{-- Copyright --}}
            <p>
                © {{ date('Y') }}

                {{ get_setting('frontend_copyright_text') ?? get_setting('website_name') }}

            </p>


            {{-- Motto --}}
            @if (get_setting('site_motto'))
                <p>
                    {{ get_setting('site_motto') }}
                </p>
            @endif

        </div>

    </div>

</footer>
