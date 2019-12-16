<?php
namespace frontend\controllers;

use common\models\Advertisement;
use Yii;
use yii\rest\Controller;
use common\models\Favorites;
use yii\filters\VerbFilter;
use yii\web\Response;
use yii\filters\ContentNegotiator;
use yii\helpers\ArrayHelper;

class FavoritesController extends Controller{


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
                    'advertisement' => ['post', 'get'],
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

    public function actionAdvertisement($id=false){
        if($id && Yii::$app->request->isPost){
            if(Advertisement::find($id)->exists()){
                if(Favorites::find()->where('user_id = '.Yii::$app->user->id. ' and advertisement_id = '.$id)->exists()){
                    return "Already exists in favorites";
                }else{
                    $model = new Favorites();
                    $model->user_id = Yii::$app->user->id;
                    $model->advertisement_id = $id;
                    $model->save();

                    return "Added to favorites";
                }
            }else{
                return "Advertisement not found";
            }
        }elseif(Yii::$app->request->isGet && $id === false){
            $ids = ArrayHelper::getColumn(Favorites::find()->select('advertisement_id')->where('user_id = '.Yii::$app->user->id)->all(), 'advertisement_id');
            return Advertisement::find()->where(['id' => $ids])->all();
        }
    }
}