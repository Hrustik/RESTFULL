<?php
namespace frontend\models;
use common\models\User;
use yii\base\Model;
use Yii;
/**
 * Signup form
 */
class Profile extends Model
{
    public $username;
    public $email;
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            ['username', 'filter', 'filter' => 'trim'],
            ['username', 'unique', 'targetClass' => '\common\models\User', 'skipOnEmpty' => true, 'message' => 'This username has already been taken.'],
            ['username', 'string', 'min' => 2, 'max' => 255],
            ['email', 'email'],
            ['email', 'string', 'max' => 255, 'skipOnEmpty' => true],
            ['email', 'unique', 'targetClass' => '\common\models\User', 'message' => 'This email address has already been taken.'],
        ];
    }
    /**
     * Signs user up.
     *
     * @return User|null the saved model or null if saving fails
     */
    public function profileSave()
    {
        if ($this->validate()) {
            $user = User::findOne(Yii::$app->user->id);
            $user->username = isset($this->username) ? $this->username : $user->username;
            $user->email = !empty($this->email) ? $this->email : $user->email;

            if ($user->save()) {
                return $user;
            }
        }
        return null;
    }
}