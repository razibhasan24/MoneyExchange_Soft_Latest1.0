<?php

namespace App\Http\Controllers\api\Payment;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Payment;
use Illuminate\Support\Facades\Storage;

class PaymentController extends Controller
{
    /**
     * Display a listing of the payments.
     */
    public function index()
    {
        $payments = Payment::all();
        return response()->json($payments);
    }

    /**
     * Store a newly created payment.
     */
    public function store(Request $request)
    {
        $validated = $request->validate([
            'transaction_id' => 'required|string|max:100|unique:payments,transaction_id',
            'payment_method' => 'required|string|max:50',
            'payment_reference' => 'nullable|string|max:100',
            'payment_date' => 'required|date',
            'payment_document' => 'nullable|file|mimes:jpg,jpeg,png,pdf|max:2048',
        ]);

        if ($request->hasFile('payment_document')) {
            $path = $request->file('payment_document')->store('payment_documents', 'public');
            $validated['payment_document'] = $path;
        }

        $payment = Payment::create($validated);

        return response()->json($payment, 201);
    }

    /**
     * Display the specified payment.
     */
    public function show(string $id)
    {
        $payment = Payment::find($id);

        if (!$payment) {
            return response()->json(['message' => 'Payment not found'], 404);
        }

        return response()->json($payment);
    }

    /**
     * Update the specified payment.
     */
    public function update(Request $request, string $id)
    {
        $payment = Payment::find($id);

        if (!$payment) {
            return response()->json(['message' => 'Payment not found'], 404);
        }

        $validated = $request->validate([
            'transaction_id' => 'sometimes|required|string|max:100|unique:payments,transaction_id,' . $payment->id,
            'payment_method' => 'sometimes|required|string|max:50',
            'payment_reference' => 'nullable|string|max:100',
            'payment_date' => 'sometimes|required|date',
            'payment_document' => 'nullable|file|mimes:jpg,jpeg,png,pdf|max:2048',
        ]);

        if ($request->hasFile('payment_document')) {
            // Delete old document if exists
            if ($payment->payment_document) {
                Storage::disk('public')->delete($payment->payment_document);
            }

            $path = $request->file('payment_document')->store('payment_documents', 'public');
            $validated['payment_document'] = $path;
        }

        $payment->update($validated);

        return response()->json($payment);
    }

    /**
     * Remove the specified payment.
     */
    public function destroy(string $id)
    {
        $payment = Payment::find($id);

        if (!$payment) {
            return response()->json(['message' => 'Payment not found'], 404);
        }

        if ($payment->payment_document) {
            Storage::disk('public')->delete($payment->payment_document);
        }

        $payment->delete();

        return response()->json(['message' => 'Payment deleted successfully']);
    }
}
