<?php

namespace App\Http\Controllers;

use App\Models\Purchase;
use Illuminate\Http\Request;
use App\Models\Agent;
use App\Models\Status;
use App\Models\Currency;
use App\Models\MoneyStock;
use App\Models\PurchaseDetail;

class PurchaseController extends Controller
{
    public function index()
    {
        $purchases = Purchase::orderBy('id','DESC')->paginate(10);
        return view('pages.purchases.index', compact('purchases'));
    }

    public function create()
    {
        $agents = \App\Models\Agent::all();
        $statuses = \App\Models\Status::all();
        $currencies=\App\Models\Currency::all();

        return view('pages.purchases.create', [
            'mode' => 'create',
            'purchase' => new Purchase(),
            'agents' => $agents,
            'statuses' => $statuses,
            'currencies'=>$currencies,

        ]);
    }

    public function store(Request $request)
    {


        $purchase =new Purchase();
        $purchase->agent_id=$request->agent_id;
        $purchase->status_id=$request->status_id;
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
        $stocks->remarks=$item['remarks'];
        $stocks->save();



      }


       return response()->json($purchase);

        // $data = $request->all();
        // if ($request->hasFile('photo')) {
        //     $data['photo'] = $request->file('photo')->store('uploads', 'public');
        // }
        // Purchase::create($data);
        // return redirect()->route('purchases.index')->with('success', 'Successfully created!');
    }

    public function show(Purchase $purchase)
    {
        return view('pages.purchases.view', compact('purchase'));
    }

    public function edit(Purchase $purchase)
    {
        $agents = \App\Models\Agent::all();
        $statuses = \App\Models\Status::all();

        return view('pages.purchases.edit', [
            'mode' => 'edit',
            'purchase' => $purchase,
            'agents' => $agents,
            'statuses' => $statuses,

        ]);
    }

    public function update(Request $request, Purchase $purchase)
    {
        $data = $request->all();
        if ($request->hasFile('photo')) {
            $data['photo'] = $request->file('photo')->store('uploads', 'public');
        }
        $purchase->update($data);
        return redirect()->route('purchases.index')->with('success', 'Successfully updated!');
    }

    public function destroy(Purchase $purchase)
    {
        $purchase->delete();
        return redirect()->route('purchases.index')->with('success', 'Successfully deleted!');
    }
}
