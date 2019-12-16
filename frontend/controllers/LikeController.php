<?php
namespace frontend\controllers;

use common\models\Advertisement;
use Yii;
use yii\rest\Controller;
use common\models\Like;
use yii\filters\VerbFilter;
use yii\web\Response;
use yii\filters\ContentNegotiator;

class LikeController extends Controller{


    public function beforeAction($action)
    {
        if(Yii::$app->user->isGuest){
            return false;
        }else{
            return parent::beforeAction($action);
        }
    }

    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'advertisement' => ['post'],
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

    public function actionAdvertisement($id){
        if(Advertisement::find($id)->exists()){
            if(Like::find()->where('user_id = '.Yii::$app->user->id. ' and advertisement_id = '.$id)->exists()){
                return "Your like already exist";
            }else{
                $model = new Like();
                $model->user_id = Yii::$app->user->id;
                $model->advertisement_id = $id;
                $model->save();

                return "Liked";
            }
        }else{
            return "Advertisement not found";
        }
    }
}