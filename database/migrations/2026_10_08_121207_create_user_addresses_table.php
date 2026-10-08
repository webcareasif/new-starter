<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('user_addresses', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->constrained()->cascadeOnDelete();

            // Which kind of address this is
            $table->string('label', 50)->default('Home'); // Home, Office, etc.

            $table->string('name', 100);
            $table->string('phone', 20);
            $table->string('address', 500);

            $table->enum('area', ['inside', 'outside'])->default('inside');

            // Optional extras
            $table->string('city', 100)->nullable();
            $table->string('postcode', 20)->nullable();

            // Status flags
            $table->boolean('is_active')->default(true);
            $table->boolean('is_default')->default(false);

            $table->timestamps();

            $table->index(['user_id', 'is_active']);
            $table->index(['user_id', 'is_default']);
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('user_addresses');
    }
};
