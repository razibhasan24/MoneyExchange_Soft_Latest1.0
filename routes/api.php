<?php

use App\Http\Controllers\api\Currency\CurrencyController;
use App\Http\Controllers\api\Customer\CustomerController;
use App\Http\Controllers\api\Invoice\InvoiceController;
use App\Http\Controllers\api\Payment\PaymentController;
use App\Http\Controllers\api\Purchase\PurchaseController;
use App\Http\Controllers\api\Receipt\MoneyReceiptController;
use App\Http\Controllers\api\Sales\OrderController;
use App\Http\Controllers\api\Transaction\TransactionController;
use App\Http\Controllers\api\Stock\StockController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

// Route::get('/user', function (Request $request) {
//     return $request->user();
// })->middleware('auth:sanctum');

Route::get('/stock_balance', [StockController::class, 'stock_balance']);


Route::apiResource('purchases',PurchaseController::class);
Route::apiResource('money_receipts',MoneyReceiptController::class);
Route::apiResource('invoices',InvoiceController::class);
Route::apiResource('orders',OrderController::class);
Route::apiResource('customers',CustomerController::class);
Route::apiResource('currencies',CurrencyController::class);
Route::apiResource('payments',PaymentController::class);
Route::apiResource('transactions',TransactionController::class);
Route::apiResource('money_stocks',StockController::class);