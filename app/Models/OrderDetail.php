<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class OrderDetail extends Model
{
    protected $fillable = [
        'order_id',
        'currency_id',
        'qty',
        'rate',
        'vat'
    ];

    public $timestamps = false;

    // Each detail belongs to one Order
    public function order()
    {
        return $this->belongsTo(Order::class);
    }

    // Optional: if you want to access currency info
    public function currency()
    {
        return $this->belongsTo(Currency::class);
    }
}
