<?php


namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    protected $fillable = [
        'customer_id',
        'order_date',
        'order_total',
        'status_id',
        'paid_amount',
        'remarks'
    ];

    public $timestamps = false;

    // Order has many OrderDetails
    public function details()
    {
        return $this->hasMany(OrderDetail::class);
    }

    // Order has many MoneyStocks (for sales outflow)
    public function stocks()
    {
        return $this->hasMany(MoneyStock::class);
    }
}
