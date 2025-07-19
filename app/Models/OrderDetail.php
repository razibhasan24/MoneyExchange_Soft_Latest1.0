<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class OrderDetail extends Model
{
    protected $fillable = ['purchase_id', 'currency_id', 'qty', 'vat', 'discount'];

    public $timestamps = false; // Disable timestamps

}