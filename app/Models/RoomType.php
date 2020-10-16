<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class RoomType extends Model
{
    use SoftDeletes;

    protected $table = 'roomTypes';

    protected $primaryKey = 'roomTypeId';

    protected $hidden = [
        'created_at', 'updated_at',
    ];

    protected $dates = ['deleted_at'];

//    public function rooms()
//    {
//        return $this->hasMany('App\Models\Room','roomTypeId', 'roomTypeId');
//    }
}
