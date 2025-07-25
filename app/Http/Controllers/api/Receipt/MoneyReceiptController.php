<?php

namespace App\Http\Controllers\api\Receipt;

use App\Http\Controllers\Controller;
use App\Models\MoneyReceipt;
use App\Models\MoneyReceiptDetail;
use App\Models\MoneyStock;
use Illuminate\Http\Request;

class MoneyReceiptController extends Controller
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
         $mr = new MoneyReceipt();
        // $purchase->supplier_name=$request->supplier_name;
        $mr->receipt_number=$request->receipt_number;
        $mr->transaction_id=$request->transaction_id;
        $mr->customer_id=$request->customer_id;
        $mr->agent_id=$request->agent_id;
        $mr->total_amount=$request->total_amount;
        $mr->payment_method=$request->payment_method;
        $mr->status=$request->status;
        $mr->issued_by=$request->issued_by;
        $mr->issued_date=$request->issued_date;
        $mr->notes=$request->notes;
        $mr-> save();

        $items=$request->items;
    foreach ($items as $item) {
        $details=new MoneyReceiptDetail();
        $details->receipt_id= $mr->id;
        $details->currency_id=$item['currency_id'];
        $details->amount=$item['amount'];
        $details->exchange_rate=$item['exchange_rate'];
        $details->equivalent_amount=$item['equivalent_amount'];
        $details->fee=$item['fee'];
        $details->save();    
        
        
        $stocks=new MoneyStock();
        $stocks->purchase_id=$mr->id;
        $stocks->currency_id=$item['currency_id'];
        $stocks->qty=-$item['amount'];
        $stocks->transaction_type="out";
        $stocks->remarks="Seals";
        $stocks->save();


    }
    return response()->json($mr);
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
