<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\InvoiceDetail;

class Invoice extends Model
{
    protected $fillable = ['customer_id', 'invoice_date', 'total_amount', 'status'];

    public $timestamps = false;

    // Define the relationship
    public function details()
    {
        return $this->belongsTo(InvoiceDetail::class);
    }
}
