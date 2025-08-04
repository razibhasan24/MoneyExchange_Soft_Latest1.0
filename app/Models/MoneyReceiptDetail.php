<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class MoneyReceiptDetail extends Model
{
    protected $fillable = [
        'receipt_id', 'currency_id', 'amount',
        'exchange_rate', 'equivalent_amount', 'fee'
    ];

    public $timestamps = false;


    public function receipt()
    {
        return $this->belongsTo(MoneyReceipt::class, 'receipt_id');
    }


    public function currency()
    {
        return $this->belongsTo(Currency::class);
    }
}
