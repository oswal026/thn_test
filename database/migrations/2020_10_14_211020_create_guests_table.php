<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateGuestsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('guests', function (Blueprint $table) {
            $table->increments('guestId');
            $table->string('guestFirstName', 45);
            $table->string('guestLastName', 45);
            $table->string('guestDni', 45);
            $table->string('guestEmail', 45);
            $table->string('guestPhone', 45);
            $table->string('guestAddress', 255)->nullable();
            $table->string('guestPostCode', 45)->nullable();
            $table->string('guestCountry', 45)->nullable();
            $table->string('guestCity', 45)->nullable();
            $table->string('guestProvince', 45)->nullable();
            $table->string('guestLocality', 45)->nullable();
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
        Schema::dropIfExists('guests');
    }
}
