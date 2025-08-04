<?php

namespace App\Http\Controllers\api\Receipt;

use App\Http\Controllers\Controller;
use App\Models\MoneyReceipt;
use App\Models\MoneyReceiptDetail;
use App\Models\MoneyStock;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class MoneyReceiptController extends Controller
{
    // ✅ 1. List all money receipts
    public function index()
    {
        $receipts = MoneyReceipt::with(['details', 'stocks'])->get();
        return response()->json($receipts);
    }

    // ✅ 2. Store a new money receipt
    public function store(Request $request)
    {
        $validated = $request->validate([
            'receipt_number' => 'required|string',
            'transaction_id' => 'required|string',
            'customer_id' => 'required|integer',
            'agent_id' => 'nullable|integer',
            'total_amount' => 'required|numeric',
            'payment_method' => 'required|string',
            'status' => 'required|string',
            'issued_by' => 'required|string',
            'issued_date' => 'required|date',
            'notes' => 'nullable|string',
            'items' => 'required|array|min:1',
            'items.*.currency_id' => 'required|integer',
            'items.*.amount' => 'required|numeric|min:0',
            'items.*.exchange_rate' => 'required|numeric|min:0',
            'items.*.equivalent_amount' => 'required|numeric|min:0',
            'items.*.fee' => 'nullable|numeric|min:0',
        ]);

        DB::beginTransaction();

        try {
            $mr = MoneyReceipt::create($request->only([
                'receipt_number', 'transaction_id', 'customer_id', 'agent_id',
                'total_amount', 'payment_method', 'status',
                'issued_by', 'issued_date', 'notes'
            ]));

            foreach ($request->items as $item) {
                $mr->details()->create([
                    'currency_id' => $item['currency_id'],
                    'amount' => $item['amount'],
                    'exchange_rate' => $item['exchange_rate'],
                    'equivalent_amount' => $item['equivalent_amount'],
                    'fee' => $item['fee'] ?? 0,
                ]);

                $mr->stocks()->create([
                    'currency_id' => $item['currency_id'],
                    'qty' => -$item['amount'],
                    'transaction_type' => 'OUT',
                    'remarks' => 'Receipt (Sales)',
                ]);
            }

            DB::commit();
            return response()->json($mr->load('details', 'stocks'), 201);

        } catch (\Exception $e) {
            DB::rollBack();
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }

    // ✅ 3. Show a specific receipt
    public function show(string $id)
    {
        $receipt = MoneyReceipt::with(['details', 'stocks'])->find($id);

        if (!$receipt) {
            return response()->json(['message' => 'Receipt not found'], 404);
        }

        return response()->json($receipt);
    }

    // ✅ 4. Update an existing receipt
    public function update(Request $request, string $id)
    {
        $receipt = MoneyReceipt::find($id);

        if (!$receipt) {
            return response()->json(['message' => 'Receipt not found'], 404);
        }

        $validated = $request->validate([
            'receipt_number' => 'required|string',
            'transaction_id' => 'required|string',
            'customer_id' => 'required|integer',
            'agent_id' => 'nullable|integer',
            'total_amount' => 'required|numeric',
            'payment_method' => 'required|string',
            'status' => 'required|string',
            'issued_by' => 'required|string',
            'issued_date' => 'required|date',
            'notes' => 'nullable|string',
            'items' => 'required|array|min:1',
            'items.*.currency_id' => 'required|integer',
            'items.*.amount' => 'required|numeric|min:0',
            'items.*.exchange_rate' => 'required|numeric|min:0',
            'items.*.equivalent_amount' => 'required|numeric|min:0',
            'items.*.fee' => 'nullable|numeric|min:0',
        ]);

        DB::beginTransaction();

        try {
            $receipt->update($request->only([
                'receipt_number', 'transaction_id', 'customer_id', 'agent_id',
                'total_amount', 'payment_method', 'status',
                'issued_by', 'issued_date', 'notes'
            ]));

            // পুরাতন ডাটা ডিলিট
            $receipt->details()->delete();
            $receipt->stocks()->delete();

            foreach ($request->items as $item) {
                $receipt->details()->create([
                    'currency_id' => $item['currency_id'],
                    'amount' => $item['amount'],
                    'exchange_rate' => $item['exchange_rate'],
                    'equivalent_amount' => $item['equivalent_amount'],
                    'fee' => $item['fee'] ?? 0,
                ]);

                $receipt->stocks()->create([
                    'currency_id' => $item['currency_id'],
                    'qty' => -$item['amount'],
                    'transaction_type' => 'OUT',
                    'remarks' => 'Receipt Updated',
                ]);
            }

            DB::commit();
            return response()->json($receipt->load('details', 'stocks'));

        } catch (\Exception $e) {
            DB::rollBack();
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }

    // ✅ 5. Delete a receipt
    public function destroy(string $id)
    {
        $receipt = MoneyReceipt::find($id);

        if (!$receipt) {
            return response()->json(['message' => 'Receipt not found'], 404);
        }

        DB::beginTransaction();

        try {
            $receipt->details()->delete();
            $receipt->stocks()->delete();
            $receipt->delete();

            DB::commit();
            return response()->json(['message' => 'Receipt deleted successfully']);

        } catch (\Exception $e) {
            DB::rollBack();
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }
}
