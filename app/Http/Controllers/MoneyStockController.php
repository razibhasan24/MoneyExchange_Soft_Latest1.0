<?php

namespace App\Http\Controllers;

use App\Models\MoneyStock;
use Illuminate\Http\Request;
use App\Models\Currency;
use App\Models\Purchase;


class MoneyStockController extends Controller

{
    //stock balance
    public function stock_balance()
    {
        // Get all MoneyStock records with their related currency
        $stocks = MoneyStock::with('currency')->get();

        // Group by currency_id and sum qty
        $groupedStocks = $stocks->groupBy('currency_id')->map(function ($group) {
            return [
                'currency_id' => $group->first()->currency_id,
                'currency_name' => optional($group->first()->currency)->currency_name, // safe access
                'qty' => $group->sum('qty'),
            ];
        });

        return view('pages.money_stocks.balance', ['groupedStocks' => $groupedStocks]);
    }


    public function index()
    {
        $money_stocks = MoneyStock::orderBy('id', 'DESC')->paginate(10);
        return view('pages.money_stocks.index', compact('money_stocks'));
    }

    public function create()
    {
        $currencies = Currency::all();
        $purchases = Purchase::all();

        return view('pages.money_stocks.create', [
            'mode' => 'create',
            'moneyStock' => new MoneyStock(),
            'currencies' => $currencies,
            'purchases' => $purchases,

        ]);
    }

    public function store(Request $request)
    {
        $data = $request->all();
        if ($request->hasFile('photo')) {
            $data['photo'] = $request->file('photo')->store('uploads', 'public');
        }
        MoneyStock::create($data);
        return redirect()->route('money_stocks.index')->with('success', 'Successfully created!');
    }

    public function show(MoneyStock $moneyStock)
    {
        return view('pages.money_stocks.view', compact('moneyStock'));
    }

    public function edit(MoneyStock $moneyStock)
    {
        $currencies = Currency::all();
        $purchases = Purchase::all();

        return view('pages.money_stocks.edit', [
            'mode' => 'edit',
            'moneyStock' => $moneyStock,
            'currencies' => $currencies,
            'purchases' => $purchases,

        ]);
    }

    public function update(Request $request, MoneyStock $moneyStock)
    {
        $data = $request->all();
        if ($request->hasFile('photo')) {
            $data['photo'] = $request->file('photo')->store('uploads', 'public');
        }
        $moneyStock->update($data);
        return redirect()->route('money_stocks.index')->with('success', 'Successfully updated!');
    }

    public function destroy(MoneyStock $moneyStock)
    {
        $moneyStock->delete();
        return redirect()->route('money_stocks.index')->with('success', 'Successfully deleted!');
    }
}
