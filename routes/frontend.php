<?php

use App\Http\Controllers\Frontend\FrontendController;


Route::get('/', [FrontendController::class, 'home'])->name('frontend.home');
Route::get('/all-products', [FrontendController::class, 'allProducts'])->name('frontend.all-products');
Route::get('/product/{slug}', [FrontendController::class, 'productDetail'])->name('frontend.product-details');
