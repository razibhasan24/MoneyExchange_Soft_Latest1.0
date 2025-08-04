<?php

namespace App\Http\Controllers\api\Transaction;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Transaction;

class TransactionController extends Controller
{
    /**
     * Display a listing of the transactions.
     */
    public function index()
    {
        $transactions = Transaction::all();
        return response()->json($transactions);
    }

    /**
     * Store a newly created transaction.
     */
    public function store(Request $request)
    {
        $validated = $request->validate([
            'customer_id' => 'required|integer|exists:customers,id',
            'agent_id' => 'required|integer|exists:agents,id',
            'transaction_date' => 'required|date',
            'total_amount_paid' => 'required|numeric|min:0',
            'total_received' => 'required|numeric|min:0',
            'status' => 'required|string|max:50',
            'payment_method' => 'required|string|max:50',
            'remarks' => 'nullable|string',
        ]);

        $transaction = Transaction::create($validated);

        return response()->json($transaction, 201);
    }

    /**
     * Display the specified transaction.
     */
    public function show(string $id)
    {
        $transaction = Transaction::find($id);

        if (!$transaction) {
            return response()->json(['message' => 'Transaction not found'], 404);
        }

        return response()->json($transaction);
    }

    /**
     * Update the specified transaction.
     */
    public function update(Request $request, string $id)
    {
        $transaction = Transaction::find($id);

        if (!$transaction) {
            return response()->json(['message' => 'Transaction not found'], 404);
        }

        $validated = $request->validate([
            'customer_id' => 'sometimes|required|integer|exists:customers,id',
            'agent_id' => 'sometimes|required|integer|exists:agents,id',
            'transaction_date' => 'sometimes|required|date',
            'total_amount_paid' => 'sometimes|required|numeric|min:0',
            'total_received' => 'sometimes|required|numeric|min:0',
            'status' => 'sometimes|required|string|max:50',
            'payment_method' => 'sometimes|required|string|max:50',
            'remarks' => 'nullable|string',
        ]);

        $transaction->update($validated);

        return response()->json($transaction);
    }

    /**
     * Remove the specified transaction.
     */
    public function destroy(string $id)
    {
        $transaction = Transaction::find($id);

        if (!$transaction) {
            return response()->json(['message' => 'Transaction not found'], 404);
        }

        $transaction->delete();

        return response()->json(['message' => 'Transaction deleted successfully']);
    }
}
