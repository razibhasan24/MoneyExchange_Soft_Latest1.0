<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class PurchaseDetail extends Model
{
    protected $fillable = ['purchase_id', 'currency_id', 'qty', 'rate', 'vat'];

    public $timestamps = false; // Disable timestamps

}