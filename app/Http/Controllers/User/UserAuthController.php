<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rules\Password;

class UserAuthController extends Controller
{
    public function showLogin()
    {
        return view('frontend.pages.auth.login');
    }

    public function login(Request $request)
    {
        $data = $request->validate([
            'login'    => ['required', 'string'],
            'password' => ['required', 'string'],
        ]);

        // Allow login by email OR phone
        $field = filter_var($data['login'], FILTER_VALIDATE_EMAIL) ? 'email' : 'phone';

        if (! Auth::attempt([$field => $data['login'], 'password' => $data['password']], $request->boolean('remember'))) {
            return back()
                ->withInput($request->only('login'))
                ->withErrors(['login' => 'These credentials do not match our records.']);
        }

        $request->session()->regenerate();

        return redirect()->intended(route('frontend.profile'))
            ->with('success', 'Welcome back, ' . Auth::user()->name . '!');
    }

    public function showRegister()
    {
        return view('frontend.pages.auth.register');
    }

    public function register(Request $request)
    {
        // Normalize inputs BEFORE validation so unique check compares cleanly
        $request->merge([
            'email' => strtolower(trim((string) $request->email)),
            'phone' => preg_replace('/^(?:\+?88)/', '', preg_replace('/[\s\-]/', '', (string) $request->phone)),
        ]);

        $data = $request->validate([
            'name'     => ['required', 'string', 'min:3', 'max:100'],
            'phone'    => ['required', 'regex:/^01[3-9]\d{8}$/', 'unique:users,phone'],
            'email'    => ['required', 'email:rfc', 'max:150', 'unique:users,email'],
            'password' => ['required', 'confirmed', Password::min(8)->letters()->numbers()],
        ], [
            // Bangla custom messages — any field triggers its own message
            'name.required'          => 'আপনার পূর্ণ নাম দিন।',
            'name.min'               => 'নাম কমপক্ষে ৩ অক্ষরের হতে হবে।',

            'phone.required'         => 'মোবাইল নম্বর দিন।',
            'phone.regex'            => 'সঠিক বাংলাদেশি নম্বর দিন (যেমন: 01712345678)।',
            'phone.unique'           => 'এই মোবাইল নম্বর দিয়ে ইতিমধ্যে একটি অ্যাকাউন্ট আছে।',

            'email.required'         => 'ইমেইল দিন।',
            'email.email'            => 'সঠিক ইমেইল ঠিকানা দিন।',
            'email.unique'           => 'এই ইমেইল দিয়ে ইতিমধ্যে একটি অ্যাকাউন্ট আছে।',

            'password.required'      => 'পাসওয়ার্ড দিন।',
            'password.confirmed'     => 'দুইটি পাসওয়ার্ড মিলছে না।',
            'password.min'           => 'পাসওয়ার্ড কমপক্ষে ৮ অক্ষরের হতে হবে।',
            'password.letters'       => 'পাসওয়ার্ডে অন্তত একটি অক্ষর থাকতে হবে।',
            'password.numbers'       => 'পাসওয়ার্ডে অন্তত একটি সংখ্যা থাকতে হবে।',
        ]);

        $user = User::create([
            'name'     => $data['name'],
            'phone'    => $data['phone'],
            'email'    => $data['email'],
            'password' => Hash::make($data['password']),
            'role'     => 'customer',
        ]);

        Auth::login($user);
        $request->session()->regenerate();

        return redirect()->intended(route('frontend.profile'))
            ->with('success', 'NexioMart-এ স্বাগতম, ' . $user->name . '!');
    }

    public function logout(Request $request)
    {
        Auth::logout();
        $request->session()->invalidate();
        $request->session()->regenerateToken();

        return redirect()->route('frontend.home')->with('success', 'You have been logged out.');
    }


    public function checkEmail(Request $request)
    {
        $email = strtolower(trim((string) $request->get('email')));
        if (! filter_var($email, FILTER_VALIDATE_EMAIL)) {
            return response()->json(['exists' => false]);
        }

        return response()->json([
            'exists' => User::where('email', $email)->exists(),
        ]);
    }

    public function checkPhone(Request $request)
    {
        $phone = preg_replace('/^(?:\+?88)/', '', preg_replace('/[\s\-]/', '', (string) $request->get('phone')));
        if (! preg_match('/^01[3-9]\d{8}$/', $phone)) {
            return response()->json(['exists' => false]);
        }

        return response()->json([
            'exists' => User::where('phone', $phone)->exists(),
        ]);
    }
}
