<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

require_once './config.inc.php';

// エラー出力を抑制
ini_set('display_errors', false);
ob_start();

// include_path の設定
include_once OPENPNE_LIB_DIR . '/include/PHP/Compat/Constant/PATH_SEPARATOR.php';
$include_paths = array(
    OPENPNE_WEBAPP_DIR . '/lib',
    OPENPNE_LIB_DIR . '/include',
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

if (defined('USE_IMAGEMAGICK') && USE_IMAGEMAGICK) {
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
