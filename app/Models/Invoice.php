<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Invoice extends Model
{
    use HasFactory;
     public $timestamps = false; 

    protected $fillable = [
        'customer_id',
        'invoice_date',
        'total_amount',
        'status',
    ];
    
    // Relationship with InvoiceDetail (optional: use 'items' or 'details')
    public function details()
    {
        return $this->hasMany(InvoiceDetail::class);
    }

    // Optional alias for 'items' if used in other places
    public function items()
    {
        return $this->hasMany(InvoiceDetail::class);
    }

    // Relationship with MoneyStock (if needed)
    public function moneyStocks()
    {
        return $this->hasMany(MoneyStock::class);
    }
}