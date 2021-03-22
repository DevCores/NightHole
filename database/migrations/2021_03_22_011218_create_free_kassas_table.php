<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateFreeKassasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('free_kassas', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('order_id');
            $table->string('email');
            $table->string('sign');
            $table->string('count');
            $table->boolean('payment');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('free_kassas');
    }
}
