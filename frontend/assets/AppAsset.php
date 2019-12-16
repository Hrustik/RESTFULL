<?php

namespace frontend\assets;

use yii\web\AssetBundle;

/**
 * Main frontend application asset bundle.
 */
class AppAsset extends AssetBundle
{
    public $basePath = '@webroot';
    public $baseUrl = '@web';
    public $css = [
        '/design/css/main.css',
    ];

    public $js = [
        '/design/js/ie/html5shiv.min.js',
        '/design/js/ie/respond.min.js',
        '/design/js/main.js',
    ];

    public $depends = [
        'yii\web\YiiAsset',
        'yii\bootstrap\BootstrapPluginAsset', 
    ];
}
