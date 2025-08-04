<?php

namespace App\Http\Controllers\api\Customer;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Customer;
use Illuminate\Support\Facades\Storage;

class CustomerController extends Controller
{
    /**
     * Display a listing of the customers.
     */
    public function index()
    {
        $customers = Customer::all();
        return response()->json($customers, 200);
    }

    /**
     * Store a newly created customer in storage.
     */
    public function store(Request $request)
    {
        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'id_type' => 'required|string|max:100',
            'id_number' => 'required|string|max:100|unique:customers,id_number',
            'phone' => 'required|string|max:20',
            'address' => 'required|string',
            'id_proof_document' => 'nullable|file|mimes:jpg,jpeg,png,pdf|max:2048',
        ]);

        if ($request->hasFile('id_proof_document')) {
            $path = $request->file('id_proof_document')->store('id_proofs', 'public');
            $validated['id_proof_document'] = $path;
        }

        $customer = Customer::create($validated);

        return response()->json($customer, 201);
    }

    /**
     * Display the specified customer.
     */
    public function show(string $id)
    {
        $customer = Customer::find($id);

        if (!$customer) {
            return response()->json(['message' => 'Customer not found'], 404);
        }

        return response()->json($customer);
    }

    /**
     * Update the specified customer in storage.
     */
    public function update(Request $request, string $id)
    {
        $customer = Customer::find($id);

        if (!$customer) {
            return response()->json(['message' => 'Customer not found'], 404);
        }

        $validated = $request->validate([
            'name' => 'sometimes|required|string|max:255',
            'id_type' => 'sometimes|required|string|max:100',
            'id_number' => 'sometimes|required|string|max:100|unique:customers,id_number,' . $customer->id,
            'phone' => 'sometimes|required|string|max:20',
            'address' => 'sometimes|required|string',
            'id_proof_document' => 'nullable|file|mimes:jpg,jpeg,png,pdf|max:2048',
        ]);

        if ($request->hasFile('id_proof_document')) {
            // Delete old file if exists
            if ($customer->id_proof_document) {
                Storage::disk('public')->delete($customer->id_proof_document);
            }

            $path = $request->file('id_proof_document')->store('id_proofs', 'public');
            $validated['id_proof_document'] = $path;
        }

        $customer->update($validated);

        return response()->json($customer);
    }

    /**
     * Remove the specified customer from storage.
     */
    public function destroy(string $id)
    {
        $customer = Customer::find($id);

        if (!$customer) {
            return response()->json(['message' => 'Customer not found'], 404);
        }

        if ($customer->id_proof_document) {
            Storage::disk('public')->delete($customer->id_proof_document);
        }

        $customer->delete();

        return response()->json(['message' => 'Customer deleted successfully']);
    }
}
