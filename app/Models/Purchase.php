<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Purchase extends Model
{
    protected $fillable = ['agent_id', 'status_id', 'purchase_date', 'remarks', 'purchase_total'];

    public $timestamps = false; // Disable timestamps

}