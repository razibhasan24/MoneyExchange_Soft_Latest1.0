<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class MoneyStock extends Model
{
    protected $fillable = [
        'currency_id',
        'qty',
        'transaction_type',
        'remarks',
        'purchase_id', // for purchases
        'order_id'     // for sales
    ];

    public $timestamps = false;

    // If used for sales
    public function order()
    {
        return $this->belongsTo(Order::class);
    }

    // Optional: for purchases
    public function purchase()
    {
        return $this->belongsTo(Purchase::class);
    }

      public function receipt()
    {
        return $this->belongsTo(MoneyReceipt::class, 'receipt_id');
    }

    public function currency()
    {
        return $this->belongsTo(Currency::class);
    }
}
