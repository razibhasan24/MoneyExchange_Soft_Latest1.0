<?php

namespace App\Http\Controllers;

use App\Models\OrderDetail;
use Illuminate\Http\Request;
use App\Models\Purchase;
use App\Models\Currency;


class OrderDetailController extends Controller
{
    public function index()
    {
        $order_details = OrderDetail::orderBy('id','DESC')->paginate(10);
        return view('pages.order_details.index', compact('order_details'));
    }

    public function create()
    {
        $purchases = \App\Models\Purchase::all();
        $currencies = \App\Models\Currency::all();

        return view('pages.order_details.create', [
            'mode' => 'create',
            'orderDetail' => new OrderDetail(),
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
        OrderDetail::create($data);
        return redirect()->route('order_details.index')->with('success', 'Successfully created!');
    }

    public function show(OrderDetail $order_details)
    {
        return view('pages.order_details.view', compact('orderDetail'));
    }

    public function edit(OrderDetail $orderDetail)
    {
        $purchases = \App\Models\Purchase::all();
        $currencies = \App\Models\Currency::all();

        return view('pages.order_details.edit', [
            'mode' => 'edit',
            'orderDetail' => $orderDetail,
            'purchases' => $purchases,
            'currencies' => $currencies,

        ]);
    }

    public function update(Request $request, OrderDetail $orderDetail)
    {
        $data = $request->all();
        if ($request->hasFile('photo')) {
            $data['photo'] = $request->file('photo')->store('uploads', 'public');
        }
        $orderDetail->update($data);
        return redirect()->route('order_details.index')->with('success', 'Successfully updated!');
    }

    public function destroy(OrderDetail $orderDetail)
    {
        $orderDetail->delete();
        return redirect()->route('order_details.index')->with('success', 'Successfully deleted!');
    }
}
