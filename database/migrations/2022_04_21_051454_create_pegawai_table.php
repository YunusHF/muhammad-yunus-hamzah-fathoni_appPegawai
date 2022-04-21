<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePegawaiTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('pegawai', function (Blueprint $table) {
            $table->engine = 'InnoDB';
            $table->string('nip', 20);
            $table->string('nama', 100);
            $table->enum('jenis_kelamin', ['L', 'P']);
            $table->unsignedBigInteger('unit_kerja');
            $table->foreign('unit_kerja')->references('id')->on('unitkerja');
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
        Schema::dropIfExists('pegawai');
    }
}
