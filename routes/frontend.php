<?php

use App\Http\Controllers\Frontend\FrontendController;


Route::get('/', [FrontendController::class, 'home'])->name('frontend.home');
Route::get('/all-products', [FrontendController::class, 'allCategoryProducts'])->name('frontend.all-products');
Route::get('/product/{slug}', [FrontendController::class, 'productDetail'])->name('frontend.product-details');

Route::get('/contact-us', [FrontendController::class, 'contactUs'])->name('frontend.contact-us');
Route::get('/about-us', [FrontendController::class, 'aboutUs'])->name('frontend.about-us');
Route::get('/blogs', [FrontendController::class, 'blogs'])->name('frontend.blogs');
Route::get('/blog/{slug}', [FrontendController::class, 'blogDetail'])->name('blog.detail');










Route::get('/search/suggestions', [FrontendController::class, 'searchSuggestions'])
    ->middleware('throttle:60,1')
    ->name('frontend.search-suggestions');
