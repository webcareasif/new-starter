<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Models\Admin\Order;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rules\Password;

class ProfileController extends Controller
{
    public function index()
    {
        $user = Auth::user();

        $orders = Order::where('user_id', $user->id)
            ->latest()
            ->take(5)
            ->get();

        $stats = [
            'total'     => Order::where('user_id', $user->id)->count(),
            'pending'   => Order::where('user_id', $user->id)->count(),
            'completed' => Order::where('user_id', $user->id)->count(),
        ];

        return view('frontend.pages.profile.dashboard', compact('user', 'orders', 'stats'));
    }

    public function edit()
    {
        return view('frontend.pages.profile.edit', ['user' => Auth::user()]);
    }

    public function update(Request $request)
    {
        $user = Auth::user();

        $data = $request->validate([
            'name'    => ['required', 'string', 'max:100'],
            'phone'   => ['required', 'string', 'max:20', 'unique:users,phone,' . $user->id],
            'email'   => ['required', 'email', 'max:150', 'unique:users,email,' . $user->id],
            'address' => ['nullable', 'string', 'max:500'],
        ]);

        $user->update($data);

        return back()->with('success', 'Profile updated successfully.');
    }

    public function updatePassword(Request $request)
    {
        $request->validate([
            'current_password' => ['required', 'current_password'],
            'password'         => ['required', 'confirmed', Password::min(8)],
        ]);

        Auth::user()->update([
            'password' => Hash::make($request->password),
        ]);

        return back()->with('success', 'Password changed successfully.');
    }

    public function orders()
    {
        $orders = Order::where('user_id', Auth::id())
            ->latest()
            ->paginate(10);

        return view('frontend.pages.profile.orders', compact('orders'));
    }

    public function orderDetail(string $code)
    {
        $order = Order::where('user_id', Auth::id())
            ->where('code', $code)
            ->firstOrFail();

        return view('frontend.pages.profile.order-detail', compact('order'));
    }
}
