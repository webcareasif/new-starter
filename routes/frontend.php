<?php

use App\Http\Controllers\Frontend\FrontendController;


Route::get('/', [FrontendController::class, 'home'])->name('frontend.home');
Route::get('/products', [FrontendController::class, 'allCategoryProducts'])->name('frontend.all-products');
Route::get('/all-products', [FrontendController::class, 'allCategoryProducts'])->name('frontend.all-products');
Route::get('/product/{slug}', [FrontendController::class, 'productDetail'])->name('frontend.product-details');

Route::get('/search/suggestions', [FrontendController::class, 'searchSuggestions'])
    ->middleware('throttle:60,1')
    ->name('frontend.search-suggestions');
