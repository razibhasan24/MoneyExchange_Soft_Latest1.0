<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class MoneyStock extends Model
{
    protected $fillable = ['currency_id', 'qty', 'transaction_type', 'remarks', 'purchase_id'];

    public $timestamps = false; // Disable timestamps

    public function currency(){
        return $this->belongsTo(Currency::class);
    }
}