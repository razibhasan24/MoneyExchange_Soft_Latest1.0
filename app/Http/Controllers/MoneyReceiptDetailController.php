<?php

namespace App\Http\Controllers;

use App\Models\MoneyReceiptDetail;
use Illuminate\Http\Request;
use App\Models\Receipt;


class MoneyReceiptDetailController extends Controller
{
    public function index()
    {
        $money_receipt_details = MoneyReceiptDetail::orderBy('id','DESC')->paginate(10);
        return view('pages.money_receipt_details.index', compact('money_receipt_details'));
    }

    public function create()
    {
        $receipts = \App\Models\Receipt::all();

        return view('pages.money_receipt_details.create', [
            'mode' => 'create',
            'moneyReceiptDetail' => new MoneyReceiptDetail(),
            'receipts' => $receipts,

        ]);
    }

    public function store(Request $request)
    {
        $data = $request->all();
        if ($request->hasFile('photo')) {
            $data['photo'] = $request->file('photo')->store('uploads', 'public');
        }
        MoneyReceiptDetail::create($data);
        return redirect()->route('money_receipt_details.index')->with('success', 'Successfully created!');
    }

    public function show(MoneyReceiptDetail $moneyReceiptDetail)
    {
        return view('pages.money_receipt_details.view', compact('moneyReceiptDetail'));
    }

    public function edit(MoneyReceiptDetail $moneyReceiptDetail)
    {
        $receipts = \App\Models\Receipt::all();

        return view('pages.money_receipt_details.edit', [
            'mode' => 'edit',
            'moneyReceiptDetail' => $moneyReceiptDetail,
            'receipts' => $receipts,

        ]);
    }

    public function update(Request $request, MoneyReceiptDetail $moneyReceiptDetail)
    {
        $data = $request->all();
        if ($request->hasFile('photo')) {
            $data['photo'] = $request->file('photo')->store('uploads', 'public');
        }
        $moneyReceiptDetail->update($data);
        return redirect()->route('money_receipt_details.index')->with('success', 'Successfully updated!');
    }

    public function destroy(MoneyReceiptDetail $moneyReceiptDetail)
    {
        $moneyReceiptDetail->delete();
        return redirect()->route('money_receipt_details.index')->with('success', 'Successfully deleted!');
    }
}