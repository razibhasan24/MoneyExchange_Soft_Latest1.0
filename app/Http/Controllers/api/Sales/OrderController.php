<?php

namespace App\Http\Controllers\api\Sales;

use App\Http\Controllers\Controller;
use App\Models\MoneyStock;
use App\Models\Order;
use App\Models\OrderDetail;
use Illuminate\Http\Request;

class OrderController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $order=new Order();
        $order->customer_id=$request->customer_id;
        $order->order_date=$request->order_date;
        $order->order_total=$request->order_total;
        $order->status_id=$request->status_id;
        $order->paid_amount=$request->paid_amount;
        $order->remarks=$request->remarks;
        $order->save();

            
        $items=$request->items;
        foreach ($items as $item) {
            $details=new OrderDetail();
            $details->order_id=$order->id;
            $details->currency_id=$item['currency_id'];
            $details->qty=$items['qty'];
            $details->rate=$item['rate'];
            $details->vat=$item['vat'];
            $details->save();


            $stocks=new MoneyStock();
                $stocks->purchase_id=$order->id;
                $stocks->currency_id=$item['currency_id'];
                $stocks->qty=-$item['amount'];
                $stocks->transaction_type="out";
                $stocks->remarks="Seals";
                $stocks->save();

        }
        
        return response()->json($order);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
