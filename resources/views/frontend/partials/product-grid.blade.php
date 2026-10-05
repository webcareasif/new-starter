<p class="text-sm text-slate-500">
    Showing <b class="text-slate-800">{{ $products->firstItem() ?? 0 }}–{{ $products->lastItem() ?? 0 }}</b>
    of {{ $products->total() }} products
</p>

@if ($products->count())
    <div id="productGrid" class="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-4 xl:grid-cols-5 gap-4">
        @foreach ($products as $product)
            @php
                $regularPrice = (float) ($product->price->regular_price ?? 0);
                $salePriceRaw = $product->price->sale_price ?? null;
                $salePrice =
                    $salePriceRaw !== null && (float) $salePriceRaw < $regularPrice
                        ? (float) $salePriceRaw
                        : $regularPrice;
                $discountPercentage =
                    $regularPrice > 0 && $salePrice < $regularPrice
                        ? round((($regularPrice - $salePrice) / $regularPrice) * 100)
                        : 0;

                $productName = $product->name ?? 'Product';
                $productSlug = $product->slug ?? '#';
                $productCat = $product->category->category_name ?? 'Uncategorized';
                $productImage = $product->thumbnail ? uploaded_asset($product->thumbnail) : null;
                $productStock = (int) ($product->inventory->stock ?? 0);
                $productInStock = $productStock > 0;
            @endphp

            <article class="card pcard overflow-hidden flex flex-col">
                {{-- ... your existing product card markup ... --}}
            </article>
        @endforeach
    </div>

    <div class="flex justify-center mt-10">
        {{ $products->links() }}
    </div>
@else
    <div class="py-20 text-center">
        <p class="text-slate-500">No products found.</p>
    </div>
@endif
