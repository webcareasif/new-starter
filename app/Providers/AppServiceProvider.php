<?php

namespace App\Providers;

use App\Models\Admin\Category;
use App\Models\BusinessSetting;
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

    $allowed = [
      'website_name',
      'site_motto',

      'facebook_link',
      'twitter_link',
      'youtube_link',
      'instagram_link',
      'linkedin_link',

      'maintenance_mode',

      'header_logo',
      'footer_logo',
      'site_icon',

      'helpline_number',
      'contact_email',
      'contact_phone',
      'contact_address',

      'about_us_description',

      'payment_method_images',
      'frontend_copyright_text',

      'base_color',
      'base_hov_color',

      'top_bar_offer',

      'b_opening_hour',
      'b_closing_hour',

      'n_sub_title',
      'fb_page_username',
      'whatsapp_number',

      'otp_for_order',
      'forget_password_otp',
      'phone_verification_otp',

      'is_active_in_co_oder',
    ];

    $settings = BusinessSetting::query()
      ->pluck('value', 'type')
      ->only($allowed)
      ->toArray();

    View::share('settings', $settings);

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
