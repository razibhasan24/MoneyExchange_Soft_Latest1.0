<?php

use App\Http\Controllers\MoneyStockController;
use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('pages.Home.dashboard');
});

Route::get('stock_balance', [MoneyStockController::class,'stock_balance'])->name('stock_balance');
Route::resource('currencies', App\Http\Controllers\CurrencyController::class);
Route::resource('transactions', App\Http\Controllers\TransactionController::class);
Route::resource('payments', App\Http\Controllers\PaymentController::class);
Route::resource('customers', App\Http\Controllers\CustomerController::class);
Route::resource('purchases', App\Http\Controllers\PurchaseController::class);
Route::resource('purchase_details', App\Http\Controllers\PurchaseDetailController::class);
Route::resource('agents', App\Http\Controllers\AgentController::class);
Route::resource('authorities', App\Http\Controllers\AuthorityController::class);
Route::resource('companies', App\Http\Controllers\CompanyController::class);
Route::resource('exchange_rates', App\Http\Controllers\ExchangeRateController::class);
Route::resource('invoices', App\Http\Controllers\InvoiceController::class);
Route::resource('invoice_details', App\Http\Controllers\InvoiceDetailController::class);
Route::resource('transactions', App\Http\Controllers\TransactionController::class);
Route::resource('statuses', App\Http\Controllers\StatusController::class);
Route::resource('orders', App\Http\Controllers\OrderController::class);
Route::resource('order_details', App\Http\Controllers\OrderDetailController::class);
Route::resource('money_stocks', App\Http\Controllers\MoneyStockController::class);

Route::resource('money_receipts', App\Http\Controllers\MoneyReceiptController::class);
Route::resource('money_receipt_details', App\Http\Controllers\MoneyReceiptDetailController::class);