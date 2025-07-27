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
        $invoices = Invoice::with('details')->orderBy('id', 'desc')->get();
        return response()->json($invoices);
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

        foreach ($request->items as $item) {
            $details = new InvoiceDetail();
            $details->invoice_id = $invoice->id;
            $details->description = $item['description'];
            $details->qty = $item['qty'];
            $details->rate = $item['rate'];
            $details->vat = $item['vat'];
            $details->save();

            $stocks = new MoneyStock();
            $stocks->invoice_id = $invoice->id;
            $stocks->currency_id = $item['currency_id'] ?? 1;
            $stocks->qty = -($item['total_amount'] ?? 0);
            $stocks->transaction_type = "OUT";
            $stocks->remarks = "Sales";
            $stocks->save();
        }

        return response()->json($invoice, 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $invoice = Invoice::with('details')->find($id);

        if (!$invoice) {
            return response()->json(['message' => 'Invoice not found'], 404);
        }

        return response()->json($invoice);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $invoice = Invoice::find($id);

        if (!$invoice) {
            return response()->json(['message' => 'Invoice not found'], 404);
        }

        $invoice->update($request->only(['customer_id', 'invoice_date', 'total_amount', 'status']));

        // Delete old details and stock
        InvoiceDetail::where('invoice_id', $invoice->id)->delete();
        MoneyStock::where('invoice_id', $invoice->id)->delete();

        foreach ($request->items as $item) {
            $details = new InvoiceDetail();
            $details->invoice_id = $invoice->id;
            $details->description = $item['description'];
            $details->qty = $item['qty'];
            $details->rate = $item['rate'];
            $details->vat = $item['vat'];
            $details->save();

            $stocks = new MoneyStock();
            $stocks->invoice_id = $invoice->id;
            $stocks->currency_id = $item['currency_id'] ?? 1;
            $stocks->qty = -($item['total_amount'] ?? 0);
            $stocks->transaction_type = "OUT";
            $stocks->remarks = "Sales Updated";
            $stocks->save();
        }

        return response()->json($invoice);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $invoice = Invoice::find($id);

        if (!$invoice) {
            return response()->json(['message' => 'Invoice not found'], 404);
        }

        InvoiceDetail::where('invoice_id', $id)->delete();
        MoneyStock::where('invoice_id', $id)->delete();
        $invoice->delete();

        return response()->json(['message' => 'Invoice deleted successfully']);
    }
}
