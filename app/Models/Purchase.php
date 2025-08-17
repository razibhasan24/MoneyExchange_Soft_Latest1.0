<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Purchase extends Model
{
    protected $fillable = ['agent_id', 'status_id', 'purchase_date', 'remarks', 'purchase_total'];

    public $timestamps = false;

    // ➤ Add this to fix the error
    public function stocks()
    {
        return $this->hasMany(MoneyStock::class);
    }

    public function details()
    {
        return $this->hasMany(PurchaseDetail::class);
    }
    public function agent()
    {
        return $this->belongsTo(Agent::class);  
    }
    public function status()
    {
        return $this->belongsTo(Status::class); 
    }
}