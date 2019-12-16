<?php

use yii\db\Migration;

/**
 * Handles the creation of table `favorites`.
 */
class m191215_124539_create_favorites_table extends Migration
{
    /**
     * @inheritdoc
     */
    public function up()
    {
        $this->createTable('user_favorites', [
            'id' => $this->primaryKey(),
            'advertisement_id' => $this->integer()->notNull(),
            'user_id' => $this->integer()->notNull(),
        ]);

        $this->createIndex(
            'idx-user_favorites-advertisement_id',
            'user_favorites',
            'advertisement_id'
        );

        $this->addForeignKey(
            'fk-user_favorites-board_id',
            'user_favorites',
            'advertisement_id',
            'advertisement',
            'id',
            'CASCADE'
        );

        $this->createIndex(
            'idx-user_favorites-user_id',
            'user_favorites',
            'user_id'
        );

        $this->addForeignKey(
            'fk-user_favorites-user_id',
            'user_favorites',
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
        $this->dropTable('user_favorites');

        $this->dropForeignKey(
            'fk-user_favorites-advertisement_id',
            'user_favorites'
        );

        $this->dropIndex(
            'idx-user_favorites-advertisement_id',
            'user_favorites'
        );

        $this->dropForeignKey(
            'fk-user_favorites-user_id',
            'user_favorites'
        );

        $this->dropIndex(
            'idx-user_favorites-user_id',
            'user_favorites'
        );
    }
}
