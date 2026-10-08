<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Models\UserAddress;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class AddressController extends Controller
{
    /** List all addresses of the logged-in user. */
    public function index()
    {
        $addresses = Auth::user()
            ->addresses()
            ->orderByDesc('is_default')
            ->orderByDesc('is_active')
            ->latest()
            ->get();

        return view('frontend.pages.profile.addresses.index', compact('addresses'));
    }

    /** Show create form. */
    public function create()
    {
        return view('frontend.pages.profile.addresses.form', [
            'address' => new UserAddress(['area' => 'inside', 'label' => 'Home']),
        ]);
    }

    /** Store a new address. */
    public function store(Request $request)
    {
        $data = $this->validated($request);
        $data['user_id'] = Auth::id();

        // First address is automatically default + active
        if (Auth::user()->addresses()->count() === 0) {
            $data['is_default'] = true;
            $data['is_active']  = true;
        }

        // If user marks this as default, demote the rest
        if (!empty($data['is_default'])) {
            Auth::user()->addresses()->update(['is_default' => false]);
        }

        UserAddress::create($data);

        return redirect()
            ->route('frontend.addresses.index')
            ->with('success', 'Address added successfully.');
    }

    /** Show edit form. */
    public function edit(UserAddress $address)
    {
        $this->authorizeOwner($address);

        return view('frontend.pages.profile.addresses.form', compact('address'));
    }

    /** Update address. */
    public function update(Request $request, UserAddress $address)
    {
        $this->authorizeOwner($address);

        $data = $this->validated($request);

        if (!empty($data['is_default'])) {
            Auth::user()->addresses()
                ->where('id', '!=', $address->id)
                ->update(['is_default' => false]);

            // default must always be active
            $data['is_active'] = true;
        }

        // Prevent removing the last active default
        if ($address->is_default && empty($data['is_default']) && $address->is_active) {
            // user is trying to unset the default - we demote, but
            // the caller must have set a new default OR we fall back to another
            $another = Auth::user()->addresses()
                ->where('id', '!=', $address->id)
                ->where('is_active', true)
                ->exists();

            if (!$another) {
                return back()->withErrors([
                    'is_default' => 'You must keep at least one default address.',
                ])->withInput();
            }
        }

        $address->update($data);

        // Safety: ensure exactly one default remains
        $this->ensureSingleDefault(Auth::id());

        return redirect()
            ->route('frontend.addresses.index')
            ->with('success', 'Address updated successfully.');
    }

    /** Delete an address. */
    public function destroy(UserAddress $address)
    {
        $this->authorizeOwner($address);

        $wasDefault = $address->is_default;
        $address->delete();

        // Promote another active address to default if needed
        if ($wasDefault) {
            $next = Auth::user()->addresses()->active()->latest()->first();
            $next?->setAsDefault();
        }

        return back()->with('success', 'Address removed.');
    }

    /** Toggle active / inactive. */
    public function toggle(UserAddress $address)
    {
        $this->authorizeOwner($address);

        // Cannot deactivate the default address unless another is promoted
        if ($address->is_default && $address->is_active) {
            $replacement = Auth::user()->addresses()
                ->where('id', '!=', $address->id)
                ->where('is_active', true)
                ->first();

            if (!$replacement) {
                return back()->withErrors([
                    'toggle' => 'You cannot deactivate your only active address.',
                ]);
            }

            $replacement->setAsDefault();
        }

        $address->update(['is_active' => !$address->is_active]);

        return back()->with('success', 'Address status updated.');
    }

    /** Set as default. */
    public function setDefault(UserAddress $address)
    {
        $this->authorizeOwner($address);

        $address->setAsDefault();

        return back()->with('success', 'Default address updated.');
    }

    /* ---------------------------------------------------------- */

    private function validated(Request $request): array
    {
        $data = $request->validate([
            'label'    => ['nullable', 'string', 'max:50'],
            'name'     => ['required', 'string', 'max:100'],
            'phone'    => ['required', 'string', 'max:20'],
            'address'  => ['required', 'string', 'max:500'],
            'area'     => ['required', 'in:inside,outside'],
            'city'     => ['nullable', 'string', 'max:100'],
            'postcode' => ['nullable', 'string', 'max:20'],
            'is_default' => ['nullable', 'boolean'],
            'is_active'  => ['nullable', 'boolean'],
        ]);

        $data['label']       = $data['label'] ?: 'Home';
        $data['is_default']  = (bool) ($data['is_default'] ?? false);
        $data['is_active']   = (bool) ($data['is_active']  ?? true);

        return $data;
    }

    private function authorizeOwner(UserAddress $address): void
    {
        abort_unless($address->user_id === Auth::id(), 403);
    }

    private function ensureSingleDefault(int $userId): void
    {
        $defaults = UserAddress::forUser($userId)
            ->where('is_default', true)
            ->where('is_active', true)
            ->get();

        if ($defaults->count() > 1) {
            // Keep the most recently updated one
            $keep = $defaults->sortByDesc('updated_at')->first();
            UserAddress::forUser($userId)
                ->where('id', '!=', $keep->id)
                ->update(['is_default' => false]);
        } elseif ($defaults->count() === 0) {
            UserAddress::forUser($userId)->active()->latest()->first()?->setAsDefault();
        }
    }
}
