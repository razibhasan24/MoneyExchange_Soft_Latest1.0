<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class MoneyReceiptDetail extends Model
{
    public function receipt()
    {

        return $this->belongsTo(MoneyReceipt::class, 'receipt_id', 'id');
    }
     protected $table = 'money_receipt_details';
}

