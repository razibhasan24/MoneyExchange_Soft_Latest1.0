<?php
namespace App\Http\Controllers\api\Stock;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\MoneyStock;

class StockController extends Controller
{
// Stock_balance Controller
        public function stock_balance()
        {
            // Get all MoneyStock records with their related currency
            $stocks = MoneyStock::with('currency')->get();

            // Group by currency_id and sum qty
            $groupedStocks = $stocks->groupBy('currency_id')->map(function ($group) {
                return [
                    'currency_id' => $group->first()->currency_id,
                    'currency_name' => optional($group->first()->currency)->currency_name,
                    'qty' => $group->sum('qty'),
                ];
            })->values(); // Reset array keys for clean JSON

            // Return as JSON
            return response()->json([
                'success' => true,
                'data' => $groupedStocks,
            ]);
        }


// GET /api/stocks
public function index()
{
return response()->json(MoneyStock::all(), 200);
}

// POST /api/stocks
public function store(Request $request)
{
$validated = $request->validate([
'currency_id' => 'required|integer',
'qty' => 'required|numeric',
'transaction_type' => 'required|string',
'remarks' => 'nullable|string',
'purchase_id' => 'nullable|integer',
'order_id' => 'nullable|integer',
'receipt_id' => 'nullable|integer',
]);

$stock = MoneyStock::create($validated);
return response()->json($stock, 201);
}

// GET /api/stocks/{id}
public function show($id)
{
$stock = MoneyStock::find($id);
if (!$stock) {
return response()->json(['message' => 'Not Found'], 404);
}

return response()->json($stock, 200);
}

// PUT /api/stocks/{id}
public function update(Request $request, $id)
{
$stock = MoneyStock::find($id);
if (!$stock) {
return response()->json(['message' => 'Not Found'], 404);
}

$validated = $request->validate([
'currency_id' => 'sometimes|required|integer',
'qty' => 'sometimes|required|numeric',
'transaction_type' => 'sometimes|required|string',
'remarks' => 'nullable|string',
'purchase_id' => 'nullable|integer',
'order_id' => 'nullable|integer',
'receipt_id' => 'nullable|integer',
]);

$stock->update($validated);
return response()->json($stock, 200);
}

// DELETE /api/stocks/{id}
public function destroy($id)
{
$stock = MoneyStock::find($id);
if (!$stock) {
return response()->json(['message' => 'Not Found'], 404);
}

$stock->delete();
return response()->json(['message' => 'Deleted successfully'], 200);
}
}