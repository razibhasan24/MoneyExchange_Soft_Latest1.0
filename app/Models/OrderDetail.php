<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class OrderDetail extends Model
{
    protected $fillable = ['order_id', 'currency_id', 'qty', 'rate', 'vat'];

    public $timestamps = false; // Disable timestamps

}