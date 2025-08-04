<?php

namespace App\Http\Controllers\api\Currency;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Currency;
use Illuminate\Support\Facades\Storage;

class CurrencyController extends Controller
{
    /**
     * Display a listing of currencies.
     */
    public function index()
    {
        $currencies = Currency::all();
        return response()->json($currencies);
    }

    /**
     * Store a newly created currency.
     */
    public function store(Request $request)
    {
        $validated = $request->validate([
            'currency_code' => 'required|string|max:10|unique:currencies,currency_code',
            'currency_name' => 'required|string|max:100',
            'symbol' => 'required|string|max:10',
            'photo' => 'nullable|file|mimes:jpg,jpeg,png|max:2048',
        ]);

        if ($request->hasFile('photo')) {
            $path = $request->file('photo')->store('currency_photos', 'public');
            $validated['photo'] = $path;
        }

        $currency = Currency::create($validated);

        return response()->json($currency, 201);
    }

    /**
     * Display the specified currency.
     */
    public function show(string $id)
    {
        $currency = Currency::find($id);

        if (!$currency) {
            return response()->json(['message' => 'Currency not found'], 404);
        }

        return response()->json($currency);
    }

    /**
     * Update the specified currency.
     */
    public function update(Request $request, string $id)
    {
        $currency = Currency::find($id);

        if (!$currency) {
            return response()->json(['message' => 'Currency not found'], 404);
        }

        $validated = $request->validate([
            'currency_code' => 'sometimes|required|string|max:10|unique:currencies,currency_code,' . $currency->id,
            'currency_name' => 'sometimes|required|string|max:100',
            'symbol' => 'sometimes|required|string|max:10',
            'photo' => 'nullable|file|mimes:jpg,jpeg,png|max:2048',
        ]);

        if ($request->hasFile('photo')) {
            if ($currency->photo) {
                Storage::disk('public')->delete($currency->photo);
            }
            $path = $request->file('photo')->store('currency_photos', 'public');
            $validated['photo'] = $path;
        }

        $currency->update($validated);

        return response()->json($currency);
    }

    /**
     * Remove the specified currency.
     */
    public function destroy(string $id)
    {
        $currency = Currency::find($id);

        if (!$currency) {
            return response()->json(['message' => 'Currency not found'], 404);
        }

        if ($currency->photo) {
            Storage::disk('public')->delete($currency->photo);
        }

        $currency->delete();

        return response()->json(['message' => 'Currency deleted successfully']);
    }
}
