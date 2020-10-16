<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateBookingRoomsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('bookingRooms', function (Blueprint $table) {
            $table->integer('bookingRoomQty');
            $table->decimal('bookingRoomPrice',15,2);
            $table->integer('roomId')->unsigned();
            $table->foreign('roomId')->references('roomId')->on('rooms');
            $table->integer('bookingId')->unsigned();
            $table->foreign('bookingId')->references('bookingId')->on('bookings');
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
        Schema::dropIfExists('bookingRooms');
    }
}
