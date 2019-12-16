<?php

use yii\db\Migration;

/**
 * Handles the creation of table `advertisement`.
 */
class m191214_115136_create_advertisement_table extends Migration
{
    /**
     * @inheritdoc
     */
    public function up()
    {
        $this->createTable('advertisement', [
            'id' => $this->primaryKey(),
            'description' => $this->text(),
            'board_id' => $this->integer(),
            'user_id' => $this->integer(),
        ]);

        $this->createIndex(
            'idx-advertisement-board_id',
            'advertisement',
            'board_id'
        );

        $this->addForeignKey(
            'fk-advertisement-board_id',
            'advertisement',
            'board_id',
            'board',
            'id',
            'CASCADE'
        );

        $this->createIndex(
            'idx-advertisement-user_id',
            'advertisement',
            'user_id'
        );

        $this->addForeignKey(
            'fk-advertisement-user_id',
            'advertisement',
            'user_id',
            'user',
            'id',
            'CASCADE'
        );
    }

    /**
     * @inheritdoc
     */
    public function down()
    {
        $this->dropTable('advertisement');

        $this->dropForeignKey(
            'fk-advertisement-board_id',
            'advertisement'
        );

        $this->dropIndex(
            'idx-advertisement-board_id',
            'advertisement'
        );

        $this->dropForeignKey(
            'fk-advertisement-user_id',
            'advertisement'
        );

        $this->dropIndex(
            'idx-advertisement-user_id',
            'advertisement'
        );
    }
}
