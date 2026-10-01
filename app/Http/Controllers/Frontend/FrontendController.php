<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use Illuminate\Support\Str;
use Auth;
use Illuminate\Http\Request;

class FrontendController extends Controller
{
    public function index()
    {
        return view('frontend.promotion.index');
    }

    public function test()
    {
        return "sdssadfsdsd";
        return view('frontend.test');
    }
}
