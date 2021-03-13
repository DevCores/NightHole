<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateRealmlistsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('realmlists', function (Blueprint $table) {
            $table->increments('id');
            $table->string('name')->default('New World');
            $table->integer('world_id')->default(0);
            $table->string('ip')->default('0.0.0.0');
            $table->string('port')->default(0);
            $table->string('char')->default('characters');
            $table->string('world')->default('world');
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
        Schema::dropIfExists('realmlists');
    }
}
