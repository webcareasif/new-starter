@php($inputId = $inputId ?? 'q')

<form action="{{ route('frontend.all-products') }}" method="GET" role="search" autocomplete="off" data-search-form
    class="relative {{ $formClass ?? '' }}">
    <label class="sr-only" for="{{ $inputId }}">Search products</label>

    <input id="{{ $inputId }}" name="q" type="search" value="{{ request('q') }}"
        placeholder="Search for products..." data-search-input role="combobox" aria-expanded="false"
        aria-controls="{{ $inputId }}-list" aria-autocomplete="list"
        class="field !rounded-r-none {{ $inputClass ?? '' }}">

    <button type="submit" class="bg-brand-600 hover:bg-brand-700 text-white px-4 rounded-r-[10px]" aria-label="Search">
        <svg class="w-4 h-4" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"
            stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
            <circle cx="11" cy="11" r="8" />
            <path d="m21 21-4.3-4.3" />
        </svg>
    </button>

    <div id="{{ $inputId }}-list" data-search-dropdown role="listbox"
        class="hidden absolute left-0 right-0 top-full mt-2 bg-white border border-slate-100 rounded-xl shadow-xl overflow-hidden z-50">
    </div>
</form>
