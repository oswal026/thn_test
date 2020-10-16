<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Guest extends Model
{
    use SoftDeletes;

    protected $table = 'guests';

    protected $primaryKey = 'guestId';

    protected $hidden = [
        'created_at', 'updated_at',
    ];

    protected $dates = ['deleted_at'];

    public function bookings()
    {
        return $this->hasMany('App\Models\Booking','guestId', 'guestId');
    }
}
