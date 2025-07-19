<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Authority extends Model
{
    protected $fillable = ['name', 'description', 'status', 'created_at', 'updated_at'];


}