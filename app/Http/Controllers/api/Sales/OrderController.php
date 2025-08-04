<?php

namespace App\Http\Controllers\api\Sales;

use App\Http\Controllers\Controller;
use App\Models\Order;
use App\Models\OrderDetail;
use App\Models\MoneyStock;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class OrderController extends Controller
{
    // ✅ 1. Show all orders
    public function index()
    {
        $orders = Order::with(['details', 'stocks'])->get();
        return response()->json($orders);
    }

    // ✅ 2. Store a new order
    public function store(Request $request)
    {
        $validated = $request->validate([
            'customer_id' => 'required|integer',
            'order_date' => 'required|date',
            'order_total' => 'required|numeric',
            'status_id' => 'required|integer',
            'paid_amount' => 'required|numeric',
            'remarks' => 'nullable|string',
            'items' => 'required|array|min:1',
            'items.*.currency_id' => 'required|integer',
            'items.*.qty' => 'required|numeric|min:0',
            'items.*.rate' => 'required|numeric|min:0',
            'items.*.vat' => 'required|numeric|min:0',
        ]);

        DB::beginTransaction();

        try {
            $order = Order::create([
                'customer_id' => $request->customer_id,
                'order_date' => $request->order_date,
                'order_total' => $request->order_total,
                'status_id' => $request->status_id,
                'paid_amount' => $request->paid_amount,
                'remarks' => $request->remarks,
            ]);

            foreach ($request->items as $item) {
                $order->details()->create([
                    'currency_id' => $item['currency_id'],
                    'qty' => $item['qty'],
                    'rate' => $item['rate'],
                    'vat' => $item['vat'],
                ]);

                $order->stocks()->create([
                    'currency_id' => $item['currency_id'],
                    'qty' => -$item['qty'],
                    'transaction_type' => 'OUT',
                    'remarks' => 'Sales',
                ]);
            }

            DB::commit();
            return response()->json($order->load('details', 'stocks'), 201);

        } catch (\Exception $e) {
            DB::rollBack();
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }

    // ✅ 3. Show a single order
    public function show(string $id)
    {
        $order = Order::with(['details', 'stocks'])->find($id);

        if (!$order) {
            return response()->json(['message' => 'Order not found'], 404);
        }

        return response()->json($order);
    }

    // ✅ 4. Update an order
    public function update(Request $request, string $id)
    {
        $order = Order::find($id);

        if (!$order) {
            return response()->json(['message' => 'Order not found'], 404);
        }

        $validated = $request->validate([
            'customer_id' => 'required|integer',
            'order_date' => 'required|date',
            'order_total' => 'required|numeric',
            'status_id' => 'required|integer',
            'paid_amount' => 'required|numeric',
            'remarks' => 'nullable|string',
            'items' => 'required|array|min:1',
            'items.*.currency_id' => 'required|integer',
            'items.*.qty' => 'required|numeric|min:0',
            'items.*.rate' => 'required|numeric|min:0',
            'items.*.vat' => 'required|numeric|min:0',
        ]);

        DB::beginTransaction();

        try {
            $order->update([
                'customer_id' => $request->customer_id,
                'order_date' => $request->order_date,
                'order_total' => $request->order_total,
                'status_id' => $request->status_id,
                'paid_amount' => $request->paid_amount,
                'remarks' => $request->remarks,
            ]);

            // Delete old details and stocks
            $order->details()->delete();
            $order->stocks()->delete();

            foreach ($request->items as $item) {
                $order->details()->create([
                    'currency_id' => $item['currency_id'],
                    'qty' => $item['qty'],
                    'rate' => $item['rate'],
                    'vat' => $item['vat'],
                ]);

                $order->stocks()->create([
                    'currency_id' => $item['currency_id'],
                    'qty' => -$item['qty'],
                    'transaction_type' => 'OUT',
                    'remarks' => 'Sales (Updated)',
                ]);
            }

            DB::commit();
            return response()->json($order->load('details', 'stocks'));

        } catch (\Exception $e) {
            DB::rollBack();
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }

    // ✅ 5. Delete an order
    public function destroy(string $id)
    {
        $order = Order::find($id);

        if (!$order) {
            return response()->json(['message' => 'Order not found'], 404);
        }

        DB::beginTransaction();

        try {
            $order->details()->delete();
            $order->stocks()->delete();
            $order->delete();

            DB::commit();
            return response()->json(['message' => 'Order deleted successfully']);

        } catch (\Exception $e) {
            DB::rollBack();
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }
}
