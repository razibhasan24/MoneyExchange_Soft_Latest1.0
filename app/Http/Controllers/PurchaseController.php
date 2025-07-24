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
        $agents = Agent::all();
        $statuses = Status::all();
        $currencies=Currency::all();

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
        $data = $request->all();
        if ($request->hasFile('photo')) {
            $data['photo'] = $request->file('photo')->store('uploads', 'public');
        }
        Purchase::create($data);
        return redirect()->route('purchases.index')->with('success', 'Successfully created!');
    }

    // public function show(Purchase $purchase )
    // {
    //     $statuses=Status:: all();
    //     return view('pages.purchases.view', compact('purchase','statuses'));

    // }
    public function show(Purchase $purchase)
{
    $purchase->load(['agent', 'status', 'details.currency']); // Ensure nested relations are eager loaded
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
