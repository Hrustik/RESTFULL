<?php

use yii\db\Migration;

/**
 * Handles the creation of table `board`.
 */
class m191214_111812_create_board_table extends Migration
{
    /**
     * @inheritdoc
     */
    public function up()
    {
        $this->createTable('board', [
            'id' => $this->primaryKey(),
            'name' => $this->string(),
            'description' => $this->text(),
        ]);
    }

    /**
     * @inheritdoc
     */
    public function down()
    {
        $this->dropTable('board');
    }
}
