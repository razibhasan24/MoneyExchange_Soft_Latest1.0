<?php

namespace App\Http\Controllers\api\Purchase;

use App\Http\Controllers\Controller;
use App\Models\MoneyStock;
use App\Models\Purchase;
use App\Models\PurchaseDetail;
use Illuminate\Http\Request;

class PurchaseController extends Controller
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
        
        $purchase =new Purchase();
        $purchase->agent_id=$request->agent_id;
        $purchase->status_id = $request->status_id;
        $purchase->purchase_date=$request->purchase_date;
        $purchase->remarks=$request->remarks;
        $purchase->purchase_total=$request->purchase_total;
        $purchase->save();


         $items=$request->items;

       foreach ($items as $item) {
        $details=new PurchaseDetail();
        $details->purchase_id=$purchase->id;
        $details->currency_id=$item['currency_id'];
        $details->qty=$item['qty'];
        $details->rate=$item['rate'];
        $details->vat=$item['vat'];
        $details->save();


        $stocks=new MoneyStock();
        $stocks->purchase_id=$purchase->id;
        $stocks->currency_id=$item['currency_id'];
        $stocks->qty=$item['qty'];
        $stocks->transaction_type="IN";
        $stocks->remarks='Purchase';
        $stocks->save();

      }


       return response()->json($purchase);
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
