<?php

namespace App\Http\Controllers;

use App\Models\PurchaseDetail;
use Illuminate\Http\Request;
use App\Models\Purchase;
use App\Models\Currency;


class PurchaseDetailController extends Controller
{
    public function index()
    {
        $invoice_details = PurchaseDetail::orderBy('id','DESC')->paginate(10);
        return view('pages.invoice_details.index', compact('invoice_details'));
    }

    public function create()
    {
        $purchases = \App\Models\Purchase::all();
        $currencies = \App\Models\Currency::all();

        return view('pages.invoice_details.create', [
            'mode' => 'create',
            'purchaseDetail' => new PurchaseDetail(),
            'purchases' => $purchases,
            'currencies' => $currencies,

        ]);
    }

    public function store(Request $request)
    {
        $data = $request->all();
        if ($request->hasFile('photo')) {
            $data['photo'] = $request->file('photo')->store('uploads', 'public');
        }
        PurchaseDetail::create($data);
        return redirect()->route('invoice_details.index')->with('success', 'Successfully created!');
    }

    public function show(PurchaseDetail $purchaseDetail)
    {
        return view('pages.invoice_details.view', compact('purchaseDetail'));
    }

    public function edit(PurchaseDetail $purchaseDetail)
    {
        $purchases = \App\Models\Purchase::all();
        $currencies = \App\Models\Currency::all();

        return view('pages.invoice_details.edit', [
            'mode' => 'edit',
            'purchaseDetail' => $purchaseDetail,
            'purchases' => $purchases,
            'currencies' => $currencies,

        ]);
    }

    public function update(Request $request, PurchaseDetail $purchaseDetail)
    {
        $data = $request->all();
        if ($request->hasFile('photo')) {
            $data['photo'] = $request->file('photo')->store('uploads', 'public');
        }
        $purchaseDetail->update($data);
        return redirect()->route('invoice_details.index')->with('success', 'Successfully updated!');
    }

    public function destroy(PurchaseDetail $purchaseDetail)
    {
        $purchaseDetail->delete();
        return redirect()->route('invoice_details.index')->with('success', 'Successfully deleted!');
    }
}
