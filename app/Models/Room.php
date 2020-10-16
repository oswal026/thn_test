<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Room extends Model
{
    use SoftDeletes;

    protected $primaryKey = 'roomId';

    protected $hidden = [
        'created_at', 'updated_at',
    ];

    protected $dates = ['deleted_at'];

    public function hotel()
    {
        return $this->belongsTo('App\Models\Hotel','hotelId', 'hotelId');
    }

    public function roomType()
    {
        return $this->belongsTo('App\Models\RoomType','roomTypeId', 'roomTypeId');
    }

    public function bookings()
    {
        return $this->belongsToMany('App\Booking', 'bookingRooms', 'roomId', 'bookingId')->withTimestamps();
    }
}
