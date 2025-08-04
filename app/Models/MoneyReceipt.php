<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class MoneyReceipt extends Model
{
    public function details()
    {
        return $this->hasMany(MoneyReceiptDetail::class, 'receipt_id', 'id');
    }
    protected $table = 'money_receipts';

    public function stocks()
{
    return $this->hasMany(MoneyStock::class, 'receipt_id'); 
}

}
