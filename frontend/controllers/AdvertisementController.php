<?php
namespace frontend\controllers;

use common\models\Advertisement;
use Yii;
use yii\rest\ActiveController;
use yii\rest\Controller;
use common\models\User;
use frontend\models\SignupForm;
use frontend\models\Profile;
use yii\filters\VerbFilter;
use yii\web\Response;
use yii\filters\ContentNegotiator;

class AdvertisementController extends ActiveController
{
    public $modelClass = 'common\models\Advertisement';

    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'create' => ['post'],
                    'index'  => ['get'],
                    'delete' => ['delete'],
                    'update' => ['put'],
                ],
            ],
            [
                'class' => ContentNegotiator::className(),
                'formats' => [
                    'application/json' => Response::FORMAT_JSON,
                    'application/xml' => Response::FORMAT_XML,
                ],
            ],
        ];
    }

    public function actions()
    {
        $actions = parent::actions();
        unset($actions['create'], $actions['index'], $actions['delete'], $actions['update']);
        //unset($actions['delete'], $actions['update'], $actions['options']);
        return $actions;
    }

    public function actionIndex(){
        if(Yii::$app->request->get('type_board')){
            return Advertisement::find()->where('board_id = '.Yii::$app->request->get('type_board'))->all();
        }else{
            return Advertisement::find()->all();
        }
    }

    public function actionCreate(){
        $model = new Advertisement();
        if ($model->load(Yii::$app->request->post()) ){
            if($model->validate()){
                $model->user_id = Yii::$app->user->id ? Yii::$app->user->id : null;
                $model->save();
                return "Advert successfully created";
            }else{
                return $model->errors;
            }


        }else{
            return "Data not load";
        }
    }

    /**
     * @param $id
     * @return string
     * @throws \Exception
     * @var $advert Advertisement[]
     */
    public function actionDelete($id){
        $advert = Advertisement::findOne($id);
        if($advert) {
            if ((!Yii::$app->user->isGuest && Yii::$app->user->id === $advert->user_id) || User::isAdmin(User::getUsername(Yii::$app->user->id))) {
                $advert->delete();
                return "deleted";
            } else {
                return "You don't have permission to delete this record";
            }
        }else{
            return "record not found!";
        }

    }

    public function actionUpdate($id){
        $advert = Advertisement::findOne($id);
        if((!Yii::$app->user->isGuest && Yii::$app->user->id === $advert->user_id) || User::isAdmin(User::getUsername(Yii::$app->user->id))){
            if($advert->load(Yii::$app->request->post())){
                $advert->save();
            }

            return "updated";
        }else{
            return "You don't have permission to update this record";
        }
    }
}