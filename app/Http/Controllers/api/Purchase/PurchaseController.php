<?php

namespace App\Http\Controllers\api\Purchase;

use App\Http\Controllers\Controller;
use App\Models\Purchase;
use App\Models\PurchaseDetail;
use App\Models\MoneyStock;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class PurchaseController extends Controller
{
    // ✅ 1. List all purchases
    public function index()
    {
        $purchases = Purchase::with(['details', 'stocks'])->get();
        return response()->json($purchases);
    }

    // ✅ 2. Store a new purchase
 public function store(Request $request)
{
    $validated = $request->validate([
        'agent_id' => 'required|integer',
        'status_id' => 'required|integer',
        'purchase_date' => 'required|date',
        'remarks' => 'nullable|string',
        'purchase_total' => 'required|string',
        'items' => 'required|array|min:1',
        'items.*.currency_id' => 'required|integer',
        'items.*.qty' => 'required|numeric|min:0',
        'items.*.rate' => 'required|numeric|min:0',
        'items.*.vat' => 'required|numeric|min:0',
    ]);

    DB::beginTransaction();

    try {
        $purchase = Purchase::create([
            'agent_id' => $request->agent_id,
            'status_id' => $request->status_id,
            'purchase_date' => $request->purchase_date,
            'remarks' => $request->remarks,
            'purchase_total' => $request->purchase_total,
        ]);

        foreach ($validated['items'] as $item) {
            $purchase->details()->create([
                'currency_id' => $item['currency_id'],
                'qty' => $item['qty'],
                'rate' => $item['rate'],
                'vat' => $item['vat'],
            ]);

            $purchase->stocks()->create([
                'currency_id' => $item['currency_id'],
                'qty' => $item['qty'],
                'transaction_type' => 'IN',
                'remarks' => 'Purchase',
            ]);
        }

        DB::commit();
        return response()->json($purchase->load('details', 'stocks'), 201);

    } catch (\Exception $e) {
        DB::rollBack();
        return response()->json(['error' => $e->getMessage()], 500);
    }
}


    // ✅ 3. Show a single purchase
    public function show(string $id)
    {
        $purchase = Purchase::with(['details', 'stocks'])->find($id);

        if (!$purchase) {
            return response()->json(['message' => 'Purchase not found'], 404);
        }

        return response()->json($purchase);
    }

    // ✅ 4. Update a purchase
    public function update(Request $request, string $id)
    {
        $purchase = Purchase::find($id);

        if (!$purchase) {
            return response()->json(['message' => 'Purchase not found'], 404);
        }

        $validated = $request->validate([
            'agent_id' => 'required|integer',
            'status_id' => 'required|integer',
            'purchase_date' => 'required|date',
            'remarks' => 'nullable|string',
            'purchase_total' => 'required|numeric',
            'items' => 'required|array|min:1',
            'items.*.currency_id' => 'required|integer',
            'items.*.qty' => 'required|numeric|min:0',
            'items.*.rate' => 'required|numeric|min:0',
            'items.*.vat' => 'required|numeric|min:0',
        ]);

        DB::beginTransaction();

        try {
            $purchase->update([
                'agent_id' => $request->agent_id,
                'status_id' => $request->status_id,
                'purchase_date' => $request->purchase_date,
                'remarks' => $request->remarks,
                'purchase_total' => $request->purchase_total,
            ]);

            
            $purchase->details()->delete();
            $purchase->stocks()->delete();

            foreach ($request->items as $item) {
                $purchase->details()->create([
                    'currency_id' => $item['currency_id'],
                    'qty' => $item['qty'],
                    'rate' => $item['rate'],
                    'vat' => $item['vat'],
                ]);

                $purchase->stocks()->create([
                    'currency_id' => $item['currency_id'],
                    'qty' => $item['qty'],
                    'transaction_type' => 'IN',
                    'remarks' => 'Purchase (Updated)',
                ]);
            }

            DB::commit();
            return response()->json($purchase->load('details', 'stocks'));

        } catch (\Exception $e) {
            DB::rollBack();
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }

   
    public function destroy(string $id)
    {
        $purchase = Purchase::find($id);

        if (!$purchase) {
            return response()->json(['message' => 'Purchase not found'], 404);
        }

        DB::beginTransaction();

        try {
            $purchase->details()->delete();
            $purchase->stocks()->delete();
            $purchase->delete();

            DB::commit();
            return response()->json(['message' => 'Purchase deleted successfully']);

        } catch (\Exception $e) {
            DB::rollBack();
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }
}