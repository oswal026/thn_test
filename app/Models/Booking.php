<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Booking extends Model
{
    use SoftDeletes;

    protected $primaryKey = 'bookingId';

    protected $hidden = [
        'created_at', 'updated_at',
    ];

    protected $dates = ['deleted_at'];

    public function hotel()
    {
        return $this->belongsTo('App\Models\Hotel','hotelId', 'hotelId');
    }

    public function guest()
    {
        return $this->belongsTo('App\Models\Guest','guestId', 'guestId');
    }

    public function bookingStatus()
    {
        return $this->belongsTo('App\Models\BookingStatus','bookingStatusId', 'bookingStatusId');
    }

    public function rooms()
    {
        return $this->belongsToMany('App\Models\Room','bookingRooms', 'bookingId', 'roomId')->as('bookingrooms')->withPivot('bookingRoomQty', 'bookingRoomPrice')->withTimestamps();
    }
}
