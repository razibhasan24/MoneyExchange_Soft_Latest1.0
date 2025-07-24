<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class PurchaseDetail extends Model
{
    protected $table = 'purchase_details';

    protected $fillable = [
        'purchase_id',
        'currency_id',
        'qty',
        'rate',
        'vat'
    ];

    public function purchase()
    {
        return $this->belongsTo(Purchase::class, 'purchase_id');
    }

    public function currency()
    {
        return $this->belongsTo(Currency::class);
    }
}
