<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateRoomTypesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('roomTypes', function (Blueprint $table) {
            $table->increments('roomTypeId');
            $table->string('roomTypeName', 100);
            $table->string('roomTypeDescription', 255)->nullable();
            $table->integer('roomTypeSleeps');
            $table->tinyInteger('roomTypeSmokingIsAllowed')->default(1);
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
        Schema::dropIfExists('roomTypes');
    }
}
