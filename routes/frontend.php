<?php

use App\Http\Controllers\Frontend\FrontendController;


Route::get('/', [FrontendController::class, 'home'])->name('frontend.home');
Route::get('/all-products', [FrontendController::class, 'allCategoryProducts'])->name('frontend.all-products');
Route::get('/product/{slug}', [FrontendController::class, 'productDetail'])->name('frontend.product-details');

// Route::get('checkout', [FrontendController::class, 'checkout'])->name('frontend.checkout');
// Route::get('cart', [FrontendController::class, 'cart'])->name('frontend.cart');

Route::get('/contact-us', [FrontendController::class, 'contactUs'])->name('frontend.contact-us');
Route::get('/about-us', [FrontendController::class, 'aboutUs'])->name('frontend.about-us');
Route::get('/blogs', [FrontendController::class, 'blogs'])->name('frontend.blogs');
Route::get('/blog/{slug}', [FrontendController::class, 'blogDetail'])->name('blog.detail');
Route::get('/track-order', [FrontendController::class, 'trackOrder'])->name('frontend.track.order');


Route::get('/cart', [FrontendController::class, 'cart'])->name('frontend.cart');
Route::get('/checkout', [FrontendController::class, 'checkout'])->name('frontend.checkout');

Route::post('/cart/summary', [FrontendController::class, 'cartSummary'])
    ->middleware('throttle:60,1')->name('frontend.cart.summary');

Route::post('/checkout', [FrontendController::class, 'placeOrder'])
    ->middleware('throttle:10,1')->name('frontend.checkout.place');

Route::get('/order-success/{code}', [FrontendController::class, 'orderSuccess'])
    ->name('frontend.order.success');







Route::get('/search/suggestions', [FrontendController::class, 'searchSuggestions'])
    ->middleware('throttle:60,1')
    ->name('frontend.search-suggestions');
