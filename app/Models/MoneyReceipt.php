<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class MoneyReceipt extends Model
{
    public $timestamps =false;

    protected $table = 'money_receipts';

    protected $fillable = [
        'receipt_number', 
        'customer_id', 
        'total_amount',
        'created_at',
        'updated_at',
        'transaction_id',
       
    ];

    public function details()
    {
        return $this->hasMany(MoneyReceiptDetail::class, 'receipt_id', 'id');
    }

    public function stocks()
    {
        return $this->hasMany(MoneyStock::class, 'receipt_id');
    }
}