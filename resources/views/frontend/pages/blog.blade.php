@extends('frontend.frrontend_app')

@section('content')
    <section class="hero-bg border-b border-brand-100">
        <div class="container-fluid py-9 md:py-12">
            <h1 class="text-2xl md:text-3xl font-bold text-brand-900">Our Blog</h1>
            <p class="text-sm text-slate-600 mt-1.5 max-w-xl">Tips, guides and buying advice for a better lifestyle.</p>
            <div class="mt-3">
                <nav class="text-sm text-slate-500 flex items-center gap-1.5 flex-wrap" aria-label="Breadcrumb">
                    <a href="{{ url('/') }}" class="hover:text-brand-600">Home</a>
                    <span class="text-slate-300">/</span>
                    <span class="text-slate-800 font-medium">Blog</span>
                </nav>
            </div>
        </div>
    </section>

    <section class="container-fluid pt-10">
        @if ($featured)
            <a href="{{ route('blog.detail', $featured->slug) }}" class="card overflow-hidden grid md:grid-cols-2 group">
                <div class="ph xl" style="background:linear-gradient(135deg,#f6efe4,#ecdfc9)">

                    <img src="{{ uploaded_asset($featured->thumbnail) }}" alt="{{ $featured->name ?? 'Product Image' }}"
                        class="w-full h-full object-cover" style="height: 250px"
                        onerror="this.onerror=null; this.src='https://placehold.co/400x400';">

                </div>
                <div class="p-7 md:p-10 flex flex-col justify-center">
                    <p class="text-xs text-brand-600 font-medium">
                        {{ $featured->tags ? explode(',', $featured->tags)[0] : 'Blog' }} ·
                        {{ $featured->created_at->format('d M Y') }}
                    </p>
                    <h2 class="text-2xl font-bold text-slate-900 mt-2 leading-snug group-hover:text-brand-600">
                        {{ $featured->blog_title }}</h2>
                    <p class="text-[14px] text-slate-600 mt-3 leading-relaxed">
                        {{ \Illuminate\Support\Str::limit($featured->short_description, 160) }}</p>
                    <span class="btn btn-primary btn-sm self-start mt-5">Read article</span>
                </div>
            </a>
        @endif

        <div class="grid md:grid-cols-4 gap-5 mt-8">
            @forelse ($posts as $post)
                <article class="card overflow-hidden group">
                    <a href="{{ route('blog.detail', $post->slug) }}" class="block aspect-[16/10]">
                        <div class="ph lg" style="background:linear-gradient(135deg,#fdeee3,#f9dcc6)">
                            @if ($post->thumbnail)
                                <img src="{{ uploaded_asset($post->thumbnail) }}" alt="{{ $post->blog_title }}"
                                    class="w-full h-full object-cover">
                            @else
                                <span>📝</span>
                            @endif
                        </div>
                    </a>
                    <div class="p-4">
                        <p class="text-[11px] text-brand-600 font-medium">
                            {{ $post->tags ? explode(',', $post->tags)[0] : 'Blog' }}</p>
                        <h3 class="font-semibold text-slate-900 mt-1 leading-snug">
                            <a href="{{ route('blog.detail', $post->slug) }}" class="hover:text-brand-600">
                                {{ \Illuminate\Support\Str::limit($post->blog_title, 60) }}</a>
                        </h3>
                        <p class="text-[11px] text-slate-400 mt-3 flex items-center gap-1.5">
                            <svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                                <rect width="18" height="18" x="3" y="4" rx="2" />
                                <path d="M16 2v4M8 2v4M3 10h18" />
                            </svg>
                            {{ $post->created_at->format('d M Y') }}
                        </p>
                    </div>
                </article>
            @empty
                <p class="col-span-full text-center text-slate-500 py-10">No blog posts found.</p>
            @endforelse
        </div>

        <div class="flex justify-center gap-2 mt-10">
            {{ $blogs->links('frontend.partials.pagination') }}
        </div>
    </section>
@endsection

@push('scripts')
@endpush
