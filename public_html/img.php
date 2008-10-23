<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

require_once './config.inc.php';

// エラー出力を抑制
ini_set('display_errors', false);
ob_start();

// モジュール毎に決められた認証をおこなっているかどうかのチェック
if (defined('CHECK_IMG_AUTH') && CHECK_IMG_AUTH) {
    require_once OPENPNE_WEBAPP_DIR . '/init.inc';

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

    $params = '&a=page_h_toimg';
    if (isKtaiUserAgent()) {
        $params .= '&m=ktai';
    } else {
        $params .= '&m=pc';
    }
    $_SERVER['QUERY_STRING'] .= $params;

    if (!$module = _check_module($module)) {
        openpne_display_error('モジュールが見つかりません', true);
    }

    // disable modules
    if (in_array($module, (array)$GLOBALS['_OPENPNE_DISABLE_MODULES'])) {
        openpne_display_error('モジュールが無効になっています', true);
    }

    if (OPENPNE_UNDER_MAINTENANCE &&
        !in_array($module, (array)$GLOBALS['_OPENPNE_MAINTENANCE_MODULES'])) {
        openpne_display_error();
    }

    if ($init = openpne_ext_search("{$module}/init.inc")) {
        require_once $init;
    }

    // 読み込む auth.inc を決定
    $auth = openpne_ext_search("{$module}/auth.inc");
    if (!$auth) {
        $auth = OPENPNE_WEBAPP_DIR . '/lib/auth.inc';
    }

    // ファイル名が module_ または b_ ではじまる場合、認証をおこなうかどうかのチェック
    list($img_prefix, $img_second_prefix) = explode('_', $_GET['filename'], 3);
    if ($img_prefix == 'module' && $img_second_prefix) {
        $module_config = util_get_module_config($img_second_prefix);
        if (!isset($module_config['image']['is_auth']) || $module_config['image']['is_auth']) {
            require_once $auth;
        }
    } elseif ($img_prefix == 'b') {
        if (db_banner_is_after_auth_banner($img_second_prefix)) {
            require_once $auth;
        }
    } else {
        require_once $auth;
    }
} else {
    // include_path の設定
    include_once OPENPNE_LIB_DIR . '/include/PHP/Compat/Constant/PATH_SEPARATOR.php';
    $include_paths = array(
        OPENPNE_LIB_DIR . '/include',
        OPENPNE_WEBAPP_DIR . '/lib',
        ini_get('include_path')
    );
    ini_set('include_path', implode(PATH_SEPARATOR, $include_paths));
}

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
