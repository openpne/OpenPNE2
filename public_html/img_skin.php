<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

require_once './config.inc.php';

// include_path の設定
include_once OPENPNE_LIB_DIR . '/include/PHP/Compat/Constant/PATH_SEPARATOR.php';
$include_paths = array(
    OPENPNE_LIB_DIR . '/include',
    OPENPNE_WEBAPP_DIR . '/lib',
    ini_get('include_path')
);
ini_set('include_path', implode(PATH_SEPARATOR, $include_paths));
require_once OPENPNE_WEBAPP_DIR . '/lib/OpenPNE/DB.php';
require_once OPENPNE_WEBAPP_DIR . '/lib/db/common.php';
require_once OPENPNE_WEBAPP_DIR . '/lib/db/etc.php';

$_GET['filename'] = db_get_c_skin_filename4skinname($_GET['filename']);

// エラー出力を抑制
ini_set('display_errors', false);
ob_start();

// include_path の設定
include_once OPENPNE_LIB_DIR . '/include/PHP/Compat/Constant/PATH_SEPARATOR.php';
$include_paths = array(
    OPENPNE_LIB_DIR . '/include',
    OPENPNE_WEBAPP_DIR . '/lib',
    ini_get('include_path')
);
ini_set('include_path', implode(PATH_SEPARATOR, $include_paths));

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
