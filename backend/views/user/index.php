<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\UserSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Пользователи';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="user-index">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'username',
            'first_name',
            'last_name',
            [
                'attribute'=>'sex',
                'filter'=>array("1"=>"Мужской","2"=>"Женский"),
                'value' => function ($data) {
                    if ($data->sex == 1) {
                        return 'Мужчина';
                    }else  {
                        return 'Женщина';
                    }
                },
            ],
            'email:email',
            'created_at:date',
            [
                'label' => 'Адреса',
                'format' => 'raw',
                'value' => function($data){
                    return Html::a(
                        'Перейти',
                        '/backend/web/address?user_id='.$data->id,
                        [
                            'title' => 'Смелей вперед!',
                            'target' => '_blank'
                        ]
                    );
                }
            ],


            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
