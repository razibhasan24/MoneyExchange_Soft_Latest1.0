<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Payment extends Model
{
    protected $fillable = ['user_id', 'amount', 'currency', 'transaction_id', 'payment_method', 'payment_status', 'payment_date', 'invoice_no', 'description', 'created_at', 'updated_at'];
      
    public $timestamps = false;

}