<?php

use yii\db\Migration;

class m191214_124405_add_name_to_advertisement extends Migration
{
    public function up()
    {
        $this->addColumn('advertisement', 'name', $this->string());
    }

    public function down()
    {
        $this->dropColumn('advertisement', 'name');
    }
}
