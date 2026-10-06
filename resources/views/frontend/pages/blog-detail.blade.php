@extends('frontend.frrontend_app')

@section('content')
    <article class="max-w-3xl mx-auto px-4 pt-8">
        {{-- Breadcrumb --}}
        <nav class="text-sm text-slate-500 flex items-center gap-1.5 flex-wrap" aria-label="Breadcrumb">
            <a href="{{ url('/') }}" class="hover:text-brand-600">Home</a>
            <span class="text-slate-300">/</span>
            <a href="{{ route('blog.index') }}" class="hover:text-brand-600">Blog</a>
            <span class="text-slate-300">/</span>
            <span class="text-slate-800 font-medium">{{ \Illuminate\Support\Str::limit($blog->blog_title, 40) }}</span>
        </nav>

        {{-- Category / first tag --}}
        <p class="text-xs text-brand-600 font-medium mt-6">
            {{ $blog->tags ? explode(',', $blog->tags)[0] : 'Blog' }}
        </p>

        {{-- Title --}}
        <h1 class="text-3xl md:text-4xl font-bold text-slate-900 mt-2 leading-tight">
            {{ $blog->blog_title }}
        </h1>

        {{-- Author meta --}}
        <div class="flex items-center gap-3 mt-5 text-xs text-slate-500">
            <span class="w-9 h-9 rounded-full bg-brand-100 grid place-items-center">✍️</span>
            <span>
                <b class="text-slate-800">NexioMart Team</b> ·
                {{ $blog->created_at->format('d M Y') }} ·
                {{ max(1, (int) ceil(str_word_count(strip_tags($blog->long_description)) / 200)) }} min read
            </span>
        </div>

        {{-- Main image --}}
        <div class="aspect-[16/9] rounded-2xl overflow-hidden mt-7">
            <div class="ph xl" style="background:linear-gradient(135deg,#f6efe4,#ecdfc9)">
                @if ($blog->main_image)
                    <img src="{{ uploaded_asset($blog->main_image) }}" alt="{{ $blog->blog_title }}"
                        class="w-full h-full object-cover">
                @elseif ($blog->thumbnail)
                    <img src="{{ uploaded_asset($blog->thumbnail) }}" alt="{{ $blog->blog_title }}"
                        class="w-full h-full object-cover">
                @else
                    <span>📝</span>
                @endif
            </div>
        </div>

        {{-- Body content --}}
        <div class="prose-nm mt-8">
            {!! $blog->long_description !!}
        </div>

        {{-- Share --}}
        @php
            $shareUrl = urlencode(url()->current());
            $shareTitle = urlencode($blog->blog_title);
        @endphp
        <div class="mt-10 pt-6 border-t border-slate-100 flex items-center justify-between">
            <span class="text-sm font-medium">Share this article</span>
            <div class="flex gap-3 text-slate-600">
                <a href="https://www.facebook.com/sharer/sharer.php?u={{ $shareUrl }}" target="_blank" rel="noopener"
                    aria-label="facebook"
                    class="w-9 h-9 rounded-full border border-slate-200 grid place-items-center hover:text-brand-600 hover:border-brand-600">
                    <svg class="w-4 h-4" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"
                        stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                        <path d="M18 2h-3a5 5 0 0 0-5 5v3H7v4h3v8h4v-8h3l1-4h-4V7a1 1 0 0 1 1-1h3z" />
                    </svg>
                </a>
                <a href="https://www.linkedin.com/sharing/share-offsite/?url={{ $shareUrl }}" target="_blank"
                    rel="noopener" aria-label="linkedin"
                    class="w-9 h-9 rounded-full border border-slate-200 grid place-items-center hover:text-brand-600 hover:border-brand-600">
                    <svg class="w-4 h-4" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"
                        stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                        <path d="M16 8a6 6 0 0 1 6 6v7h-4v-7a2 2 0 0 0-2-2 2 2 0 0 0-2 2v7h-4v-7a6 6 0 0 1 6-6z" />
                        <rect width="4" height="12" x="2" y="9" />
                        <circle cx="4" cy="4" r="2" />
                    </svg>
                </a>
                <a href="mailto:?subject={{ $shareTitle }}&body={{ $shareUrl }}" aria-label="mail"
                    class="w-9 h-9 rounded-full border border-slate-200 grid place-items-center hover:text-brand-600 hover:border-brand-600">
                    <svg class="w-4 h-4" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"
                        stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                        <rect width="20" height="16" x="2" y="4" rx="2" />
                        <path d="m22 7-8.97 5.7a1.94 1.94 0 0 1-2.06 0L2 7" />
                    </svg>
                </a>
            </div>
        </div>
    </article>

    {{-- Related posts --}}
    @if ($relatedBlogs->count())
        <section class="container-fluid mt-14">
            <h2 class="section-title mb-5">Keep reading</h2>
            <div class="grid md:grid-cols-3 gap-5">
                @foreach ($relatedBlogs as $related)
                    <article class="card overflow-hidden group">
                        <a href="{{ route('blog.detail', $related->slug) }}" class="block aspect-[16/10]">
                            <div class="ph lg" style="background:linear-gradient(135deg,#fdeee3,#f9dcc6)">
                                @if ($related->thumbnail)
                                    <img src="{{ asset('uploads/blogs/' . $related->thumbnail) }}"
                                        alt="{{ $related->blog_title }}" class="w-full h-full object-cover">
                                @else
                                    <span>📝</span>
                                @endif
                            </div>
                        </a>
                        <div class="p-4">
                            <p class="text-[11px] text-brand-600 font-medium">
                                {{ $related->tags ? explode(',', $related->tags)[0] : 'Blog' }}
                            </p>
                            <h3 class="font-semibold text-slate-900 mt-1 leading-snug">
                                <a href="{{ route('blog.detail', $related->slug) }}" class="hover:text-brand-600">
                                    {{ \Illuminate\Support\Str::limit($related->blog_title, 60) }}
                                </a>
                            </h3>
                            <p class="text-[11px] text-slate-400 mt-3 flex items-center gap-1.5">
                                <svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                    stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                                    <rect width="18" height="18" x="3" y="4" rx="2" />
                                    <path d="M16 2v4M8 2v4M3 10h18" />
                                </svg>
                                {{ $related->created_at->format('d M Y') }}
                            </p>
                        </div>
                    </article>
                @endforeach
            </div>
        </section>
    @endif
@endsection

@push('scripts')
@endpush
