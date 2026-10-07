<?php

use App\Http\Controllers\Frontend\FrontendController;
use App\Http\Controllers\Frontend\ProfileController;
use App\Http\Controllers\Frontend\WishlistController;
use App\Http\Controllers\User\UserAuthController;

Route::get('/', [FrontendController::class, 'home'])->name('frontend.home');
Route::get('/all-products', [FrontendController::class, 'allCategoryProducts'])->name('frontend.all-products');
Route::get('/product/{slug}', [FrontendController::class, 'productDetail'])->name('frontend.product-details');


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



Route::middleware('guest')->group(function () {
    Route::get('/login',    [UserAuthController::class, 'showLogin'])->name('frontend.login');
    Route::post('/login',   [UserAuthController::class, 'login'])->name('frontend.login.submit');
    Route::get('/register', [UserAuthController::class, 'showRegister'])->name('frontend.register');
    Route::post('/register', [UserAuthController::class, 'register'])->name('frontend.register.submit');
    Route::get('/check-email', [UserAuthController::class, 'checkEmail'])
        ->middleware('throttle:30,1')->name('frontend.check.email');

    Route::get('/check-phone', [UserAuthController::class, 'checkPhone'])
        ->middleware('throttle:30,1')->name('frontend.check.phone');
});


Route::middleware('auth')->group(function () {
    Route::post('/logout', [UserAuthController::class, 'logout'])->name('frontend.logout');

    // Profile
    Route::get('/profile',            [ProfileController::class, 'index'])->name('frontend.profile');
    Route::get('/profile/edit',       [ProfileController::class, 'edit'])->name('frontend.profile.edit');
    Route::put('/profile',            [ProfileController::class, 'update'])->name('frontend.profile.update');
    Route::put('/profile/password',   [ProfileController::class, 'updatePassword'])->name('frontend.profile.password');
    Route::get('/profile/orders',     [ProfileController::class, 'orders'])->name('frontend.profile.orders');
    Route::get('/profile/orders/{code}', [ProfileController::class, 'orderDetail'])->name('frontend.profile.order');
});


Route::prefix('wishlist')->name('frontend.wishlist.')->group(function () {
    Route::get('/',          [WishlistController::class, 'index'])->name('index');
    Route::post('/toggle',   [WishlistController::class, 'toggle'])->name('toggle');
    Route::post('/remove',   [WishlistController::class, 'remove'])->name('remove');
    Route::post('/clear',    [WishlistController::class, 'clear'])->name('clear');
    Route::get('/count',     [WishlistController::class, 'count'])->name('count');

    Route::post('/wishlist/ids', [WishlistController::class, 'ids'])
        ->name('ids');
});
