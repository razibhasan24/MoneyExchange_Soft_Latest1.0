<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    protected $fillable = ['customer_id', 'order_date', 'order_total', 'status_id', 'paid_amount', 'remarks', 'created_at', 'updated_at'];


}