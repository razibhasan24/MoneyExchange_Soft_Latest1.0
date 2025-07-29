<?php

use App\Http\Controllers\api\Invoice\InvoiceController;
use App\Http\Controllers\api\Purchase\PurchaseController;
use App\Http\Controllers\api\Receipt\MoneyReceiptController;
use App\Http\Controllers\api\Sales\OrderController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

// Route::get('/user', function (Request $request) {
//     return $request->user();
// })->middleware('auth:sanctum');


Route::apiResource('purchases',PurchaseController::class);
Route::apiResource('money_receipts',MoneyReceiptController::class);
Route::apiResource('invoice',InvoiceController::class);
Route::apiResource('orders',OrderController::class);
