<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Currency;
use App\Models\Invoice;
use App\Models\Purchase;
use App\Models\Customer;
use App\Models\MoneyStock;
use App\Models\Order;
use App\Models\Payment;
use App\Models\Transaction;

class SummaryController extends Controller
{
    public function index()
    {
        $invoiceCount = Invoice::count();
        $purchaseCount = Purchase::count();
        $customerCount = Customer::count();
        $receiptsCount= MoneyStock::count();
        $ordersCount= Order::count();
        $paymentCount=Payment::count();
        $transactionCount=Transaction::count();
        $currencyCount=Currency::count();


      

        return view('pages.Summary.summary', compact(
            'invoiceCount',
            'purchaseCount',
            'customerCount',
            'receiptsCount',
            'ordersCount',
            'paymentCount',
            'transactionCount',
            'currencyCount'
       
        ));
    }
}