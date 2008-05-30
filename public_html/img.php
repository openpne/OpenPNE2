<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

require_once './config.inc.php';
require_once OPENPNE_WEBAPP_DIR . '/init.inc';

$is_auth = CHECK_IMG_AUTH;

// ファイル名のプレフィックスが module_ である場合は、モジュールの設定によって画像の認証をおこなうかどうかを決定する
list($prefix, $module) = explode('_', $_GET['filename'], 3);
if ($prefix == 'module' && $module) {
    $config = util_get_module_config($module);
    if (isset($config['image']['is_auth'])) {
        $is_auth = (bool)$config['image']['is_auth'];
    }
}

// モジュール毎に決められた認証をおこなっているかどうかのチェック
// CHECK_IMG_AUTH が false であるか、モジュール側の設定で認証をおこなわない場合はチェックしない
if ($is_auth) {
    $module = '';
    if (!($module = get_request_var('m'))) {
        // モジュール名の自動設定
        if (!db_admin_user_exists()) {
            $module = 'setup';
        } elseif (isKtaiUserAgent()) {
            $module = 'ktai';
        } else {
            $module = 'pc';
        }
    }
    $_SERVER['QUERY_STRING'] .= '&a=page_h_toimg';

    if (!$module = _check_module($module)) {
        openpne_display_error('モジュールが見つかりません', true);
    }

    // disable modules
    if (in_array($module, (array)$GLOBALS['_OPENPNE_DISABLE_MODULES'])) {
        openpne_display_error('モジュールが無効になっています', true);
    }
    // maintenace mode
    if (OPENPNE_UNDER_MAINTENANCE &&
        !in_array($module, (array)$GLOBALS['_OPENPNE_MAINTENANCE_MODULES'])) {
        openpne_display_error();
    }
    // init
    if ($init = openpne_ext_search("{$module}/init.inc")) {
        require_once $init;
    }
    //auth
    if ($auth = openpne_ext_search("{$module}/auth.inc")) {
        require_once $auth;
    } else {
        require_once OPENPNE_WEBAPP_DIR . '/lib/auth.inc';
    }
}

// エラー出力を抑制
ini_set('display_errors', false);
ob_start();

// 各種設定
defined('OPENPNE_IMG_JPEG_QUALITY') or define('OPENPNE_IMG_JPEG_QUALITY', 75);
if (!empty($GLOBALS['_OPENPNE_DSN_LIST']['image']['dsn'])) {
    $dsn =  $GLOBALS['_OPENPNE_DSN_LIST']['image']['dsn'];
} else {
    $dsn = $GLOBALS['_OPENPNE_DSN_LIST']['main']['dsn'];
}

require_once 'OpenPNE/Img.php';
$options = array(
    'dsn'          => $dsn,
    'cache_dir'    => OPENPNE_IMG_CACHE_DIR,
    'jpeg_quality' => OPENPNE_IMG_JPEG_QUALITY,
);

if (defined('USE_IMAGEMAGICK')) {
    switch (USE_IMAGEMAGICK) {
    case 0:
        $use_IM = false;
        break;
    case 1:
        $pieces = explode('.', $_GET['filename']);
        $source_format = OpenPNE_Img::check_format(array_pop($pieces));
        $use_IM = ($source_format == 'gif');
        break;
    case 2:
        $use_IM = true;
        break;
    default:
        exit;
    }
} else {
    $use_IM = false;
}

if ($use_IM) {
    require_once 'OpenPNE/Img/ImageMagick.php';
    $img =& new OpenPNE_Img_ImageMagick($options);
} else {
    $img =& new OpenPNE_Img($options);
}
$img->set_requests($_GET);

$img->generate_img() or exit(1);
while (@ob_end_clean());

$img->output_img() or exit(2);

?>
