<?php

namespace common\models;

use Yii;

class Advertisement extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'advertisement';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['name', 'board_id'], 'required'],
            [['description', 'name'], 'string'],
            [['board_id', 'user_id'], 'integer'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'name' => 'Name',
            'description' => 'Description',
            'board_id' => 'Board ID',
            'user_id' => 'User ID',
        ];
    }
}
