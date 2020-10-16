<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class BookingStatus extends Model
{
    use SoftDeletes;

    protected $table = 'bookingstatus';

    protected $primaryKey = 'bookingStatusId';

    protected $hidden = [
        'created_at', 'updated_at',
    ];

    protected $dates = ['deleted_at'];

    public function bookings()
    {
        return $this->hasMany('App\Models\Booking','bookingStatusId', 'bookingStatusId');
    }
}
