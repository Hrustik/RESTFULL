<?php

/* @var $this yii\web\View */
/* @var $user common\models\User */

//$resetLink = Yii::$app->urlManager->createAbsoluteUrl(['site/entry-token', 'token' => $user->token]);
$backresetLink = Yii::$app->urlManager->createAbsoluteUrl(['site/entry-token', 'token' => $user->token]);
$resetLink = str_replace("backend","frontend",$backresetLink);
?>
Hello <?= $user->username ?>,

Follow the link below to register:

<?= $resetLink ?>
