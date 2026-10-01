<?php

use App\Http\Controllers\Frontend\FrontendController;


Route::get('/', [FrontendController::class, 'test'])->name('frontend.test');
Route::get('/1', [FrontendController::class, 'test'])->name('frontend.test');
Route::get('/test', [FrontendController::class, 'test'])->name('frontend.test');
