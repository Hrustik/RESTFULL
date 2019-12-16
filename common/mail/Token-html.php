<?php
use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $user common\models\User */

//$resetLink = Yii::$app->urlManager->createAbsoluteUrl(['site/entry-token', 'token' => $user->token]);
$backresetLink = Yii::$app->urlManager->createAbsoluteUrl(['site/entry-token', 'token' => $user->token]);
$resetLink = str_replace("backend","frontend",$backresetLink);
?>
<div class="password-reset">
    <p>Hello <?= Html::encode($user->username) ?>,</p>

    <p>Follow the link below to register:</p>

    <p><?= Html::a(Html::encode($resetLink), $resetLink) ?></p>
</div>
