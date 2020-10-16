<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateBookingsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('bookings', function (Blueprint $table) {
            $table->increments('bookingId');
            $table->dateTime('bookingFrom');
            $table->dateTime('bookingTo');
            $table->integer('bookingStatusId')->unsigned();
            $table->foreign('bookingStatusId')->references('bookingStatusId')->on('bookingStatus');
            $table->integer('hotelId')->unsigned();
            $table->foreign('hotelId')->references('hotelId')->on('hotels');
            $table->integer('guestId')->unsigned();
            $table->foreign('guestId')->references('guestId')->on('guests');
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
        Schema::dropIfExists('bookings');
    }
}
