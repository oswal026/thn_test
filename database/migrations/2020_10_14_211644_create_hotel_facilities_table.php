<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateHotelFacilitiesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('hotelFacilities', function (Blueprint $table) {
            $table->integer('facilityId')->unsigned();
            $table->foreign('facilityId')->references('facilityId')->on('facilities');
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
        Schema::dropIfExists('hotelFacilities');
    }
}
