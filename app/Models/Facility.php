<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Facility extends Model
{
    use SoftDeletes;

    protected $primaryKey = 'facilityId';

    protected $hidden = [
        'created_at', 'updated_at',
    ];

    protected $dates = ['deleted_at'];

    public function hotels()
    {
        return $this->belongsToMany('App\Hotel', 'hotelFacilities', 'facilityId', 'hotelId')->withTimestamps();
    }
}
