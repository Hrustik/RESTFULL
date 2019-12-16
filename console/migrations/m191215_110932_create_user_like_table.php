<?php

use yii\db\Migration;

/**
 * Handles the creation of table `user_like`.
 */
class m191215_110932_create_user_like_table extends Migration
{
    /**
     * @inheritdoc
     */
    public function up()
    {
        $this->createTable('user_like', [
            'id' => $this->primaryKey(),
            'advertisement_id' => $this->integer()->notNull(),
            'user_id' => $this->integer()->notNull(),
        ]);

        $this->createIndex(
            'idx-user_like-advertisement_id',
            'user_like',
            'advertisement_id'
        );

        $this->addForeignKey(
            'fk-user_like-board_id',
            'user_like',
            'advertisement_id',
            'advertisement',
            'id',
            'CASCADE'
        );

        $this->createIndex(
            'idx-user_like-user_id',
            'user_like',
            'user_id'
        );

        $this->addForeignKey(
            'fk-user_like-user_id',
            'user_like',
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
        $this->dropTable('user_like');

        $this->dropForeignKey(
            'fk-user_like-advertisement_id',
            'user_like'
        );

        $this->dropIndex(
            'idx-user_like-advertisement_id',
            'user_like'
        );

        $this->dropForeignKey(
            'fk-user_like-user_id',
            'user_like'
        );

        $this->dropIndex(
            'idx-user_like-user_id',
            'user_like'
        );
    }
}
