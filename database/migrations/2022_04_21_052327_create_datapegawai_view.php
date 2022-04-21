<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateDatapegawaiView extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        \DB::statement($this->createView());
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        \DB::statement($this->dropView());
    }

    
    /**
     * Reverse the migrations.
     *
     * @return void
     */
    private function createView(): string
    {
        return <<<SQL
            CREATE VIEW datapegawai AS
                SELECT
                    pegawai.nip,
                    pegawai.nama,
                    pegawai.jenis_kelamin,
                    unitkerja.nama_unit,
                    unitkerja.alamat
                FROM pegawai, unitkerja
                WHERE pegawai.unit_kerja = unitkerja.id;
            SQL;
    }

   

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    private function dropView(): string
    {
        return <<<SQL
            DROP VIEW IF EXISTS `datapegawai`;
            SQL;
    }
}
