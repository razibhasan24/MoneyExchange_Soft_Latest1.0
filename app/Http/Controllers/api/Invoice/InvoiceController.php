<?php

namespace App\Http\Controllers\api\Invoice;

use App\Http\Controllers\Controller;
use App\Models\Invoice;
use App\Models\InvoiceDetail;
use App\Models\MoneyStock;
use Illuminate\Http\Request;

class InvoiceController extends Controller
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
        $invoice = new Invoice();
        $invoice->customer_id = $request->customer_id;
        $invoice->invoice_date = $request->invoice_date;
        $invoice->total_amount = $request->total_amount;
        $invoice->status = $request->status;
        $invoice->save();


        $items = $request->items;
        foreach ($items as $item) {
            $details = new InvoiceDetail();
            $details->invoice_id = $invoice->id;
            $details->description = $item['description'];
            $details->qty = $item['qty'];
            $details->rate = $item['rate'];
            $details->vat = $item['vat'];
            $details->save();

            // $stocks=new MoneyStock();
            //     $stocks->purchase_id=$invoice->id;
            //     $stocks->currency_id=$item['currency_id'];
            //     $stocks->qty=-$item['total_amount'];
            //     $stocks->transaction_type="out";
            //     $stocks->remarks="Seals";
            //     $stocks->save();
            $stocks = new MoneyStock();
            $stocks->purchase_id = $invoice->id;
            $stocks->currency_id = $item['currency_id'] ?? 1; 
            $stocks->qty = - ($item['total_amount'] ?? 0);
            $stocks->transaction_type = "out";
            $stocks->remarks = "Seals";
            $stocks->save();
        }

        return response()->json($invoice);
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
