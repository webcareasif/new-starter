<?php

namespace App\Providers;

use App\Models\Admin\Category;
use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\Schema;
use Illuminate\Pagination\Paginator;
use Illuminate\Support\Facades\URL;
use Illuminate\Support\Facades\View;

class AppServiceProvider extends ServiceProvider
{
  /**
   * Bootstrap any application services.
   *
   * @return void
   */
  public function boot()
  {
    if (env('APP_ENV') === 'production') {
      URL::forceScheme('https');
    }

    View::share(
      'categories',
      Category::orderBy('position')
        ->orderByDesc('id')
        ->get()
    );

    Schema::defaultStringLength(191);
    Paginator::useBootstrap();
  }

  /**
   * Register any application services.
   *
   * @return void
   */
  public function register()
  {
    // We're handling the translator service in our custom TranslationServiceProvider
  }
}
