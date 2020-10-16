<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateRoomsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('rooms', function (Blueprint $table) {
            $table->increments('roomId');
            $table->string('roomDescription', 45);
            $table->integer('roomFloor');
            $table->tinyInteger('roomIsAvailable')->default(1);
            $table->integer('roomTypeId')->unsigned();
            $table->foreign('roomTypeId')->references('roomTypeId')->on('roomTypes');
            $table->integer('hotelId')->unsigned();
            $table->foreign('hotelId')->references('hotelId')->on('hotels');
            $table->timestamps();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('rooms');
    }
}
