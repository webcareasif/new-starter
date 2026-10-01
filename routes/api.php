<?php


Route::group(['prefix' => 'v1'], function () {
    Route::get('helth_check', function () {
        return response()->json([
            'data' => [],
            'success' => true,
            'status' => 200,
            'message' => 'API is healthy'
        ]);
    });
});
