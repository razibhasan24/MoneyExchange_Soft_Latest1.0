<?php

namespace App\Http\Controllers\api\Sales;

use App\Http\Controllers\Controller;
use App\Models\MoneyStock;
use App\Models\Order;
use App\Models\OrderDetail;
use Illuminate\Http\Request;

class OrderController extends Controller
{
    public function index()
    {
        $orders = Order::with('orderDetails')->get();
        return response()->json($orders);
    }

    public function store(Request $request)
    {
        $order = new Order();
        $order->customer_id = $request->customer_id;
        $order->order_date = $request->order_date;
        $order->order_total = $request->order_total;
        $order->status_id = $request->status_id;
        $order->paid_amount = $request->paid_amount;
        $order->remarks = $request->remarks;
        $order->save();

        $items = $request->items;
        foreach ($items as $item) {
            $details = new OrderDetail();
            $details->order_id = $order->id;
            $details->currency_id = $item['currency_id'];
            $details->qty = $item['qty']; // Fixed from $items['qty']
            $details->rate = $item['rate'];
            $details->vat = $item['vat'];
            $details->save();

            $stocks = new MoneyStock();
            $stocks->purchase_id = $order->id;
            $stocks->currency_id = $item['currency_id'];
            $stocks->qty = -$item['amount'];
            $stocks->transaction_type = "out";
            $stocks->remarks = "Seals";
            $stocks->save();
        }

        return response()->json($order);
    }

    public function show(string $id)
    {
        $order = Order::with('orderDetails')->find($id);

        if (!$order) {
            return response()->json(['message' => 'Order not found'], 404);
        }

        return response()->json($order);
    }

    public function update(Request $request, string $id)
    {
        $order = Order::find($id);

        if (!$order) {
            return response()->json(['message' => 'Order not found'], 404);
        }

        $order->customer_id = $request->customer_id;
        $order->order_date = $request->order_date;
        $order->order_total = $request->order_total;
        $order->status_id = $request->status_id;
        $order->paid_amount = $request->paid_amount;
        $order->remarks = $request->remarks;
        $order->save();

        // Delete previous order details and stock
        OrderDetail::where('order_id', $id)->delete();
        MoneyStock::where('purchase_id', $id)->delete();

        $items = $request->items;
        foreach ($items as $item) {
            $details = new OrderDetail();
            $details->order_id = $order->id;
            $details->currency_id = $item['currency_id'];
            $details->qty = $item['qty'];
            $details->rate = $item['rate'];
            $details->vat = $item['vat'];
            $details->save();

            $stocks = new MoneyStock();
            $stocks->purchase_id = $order->id;
            $stocks->currency_id = $item['currency_id'];
            $stocks->qty = -$item['amount'];
            $stocks->transaction_type = "out";
            $stocks->remarks = "Seals Updated";
            $stocks->save();
        }

        return response()->json($order);
    }

    public function destroy(string $id)
    {
        $order = Order::find($id);

        if (!$order) {
            return response()->json(['message' => 'Order not found'], 404);
        }

        OrderDetail::where('order_id', $id)->delete();
        MoneyStock::where('purchase_id', $id)->delete();
        $order->delete();

        return response()->json(['message' => 'Order deleted successfully']);
    }
}
