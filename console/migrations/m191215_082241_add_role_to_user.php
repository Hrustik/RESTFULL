<?php

use yii\db\Migration;

class m191215_082241_add_role_to_user extends Migration
{
    public function up()
    {
        $this->addColumn('user', 'role', $this->integer()->defaultValue(10));
    }

    public function down()
    {
        $this->dropColumn('user', 'role');
    }
}
