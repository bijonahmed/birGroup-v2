<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class PathaoToken extends Model
{
    protected $fillable = [
        'environment',
        'access_token',
        'refresh_token',
        'expires_in',
        'expires_at',
    ];

    protected $casts = [
        'expires_at' => 'datetime',
    ];
}