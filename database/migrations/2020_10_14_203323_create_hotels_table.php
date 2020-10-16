<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateHotelsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('hotels', function (Blueprint $table) {
            $table->increments('hotelId')->index('hotel_id_index');
            $table->string('hotelName', 45);
            $table->longText('hotelDescription')->nullable();
            $table->string('hotelEmail', 45);
            $table->string('hotelPhone', 45);
            $table->string('hotelAddress', 255);
            $table->string('hotelPostCode', 45);
            $table->string('hotelCountry', 45);
            $table->string('hotelCity', 45);
            $table->string('hotelProvince', 45);
            $table->string('hotelLocality', 45);
            $table->string('hotelUrl', 45)->nullable();
            $table->decimal('hotelRate', 15,2);
            $table->tinyInteger('hotelIsActive')->default(1);
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
        Schema::dropIfExists('hotels');
    }
}
