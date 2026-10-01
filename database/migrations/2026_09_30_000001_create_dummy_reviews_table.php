<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateDummyReviewsTable extends Migration
{
    /**
     * Admin-created review templates, not tied to a product or customer.
     * Selecting one on a product copies it into `reviews` as a real, approved
     * review linked back via reviews.dummy_review_id.
     */
    public function up()
    {
        Schema::create('dummy_reviews', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->string('avatar')->nullable();
            $table->unsignedTinyInteger('rating')->default(5);
            $table->text('comment')->nullable();
            $table->boolean('status')->default(true);
            $table->unsignedInteger('sort_order')->default(0);
            $table->timestamps();
        });

        Schema::table('reviews', function (Blueprint $table) {
            $table->foreignId('dummy_review_id')->nullable()->after('user_id')
                ->constrained('dummy_reviews')->cascadeOnDelete();
            $table->unique(['product_id', 'dummy_review_id']);
        });
    }

    public function down()
    {
        Schema::table('reviews', function (Blueprint $table) {
            $table->dropForeign(['dummy_review_id']);
            $table->dropUnique(['product_id', 'dummy_review_id']);
            $table->dropColumn('dummy_review_id');
        });

        Schema::dropIfExists('dummy_reviews');
    }
}
