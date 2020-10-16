<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Hotel extends Model
{
    use SoftDeletes;

    protected $primaryKey = 'hotelId';

    protected $hidden = [
        'created_at', 'updated_at',
    ];

    protected $dates = ['deleted_at'];

    public function rooms()
    {
        return $this->hasMany('App\Models\Room','hotelId', 'hotelId');
    }

    public function bookings()
    {
        return $this->hasMany('App\Models\Booking','hotelId', 'hotelId');
    }

    public function facilities()
    {
        return $this->belongsToMany('App\Models\Facility','hotelFacilities', 'hotelId', 'facilityId')->as('hotelfacilities')->withTimestamps();
    }
}
