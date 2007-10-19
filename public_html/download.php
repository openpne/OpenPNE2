<?php
/**
 * @copyright 2005-2007 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

require_once './config.inc.php';

// エラー出力を抑制
ini_set('display_errors', false);
ob_start();

require_once OPENPNE_WEBAPP_DIR . '/init.inc';

//SNSにログインしているかどうか
if (CHECK_IMG_AUTH) {
    session_cache_limiter('public');

    $module = $_GET['m'];
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

// include_path の設定
include_once OPENPNE_LIB_DIR . '/include/PHP/Compat/Constant/PATH_SEPARATOR.php';
$include_paths = array(
    OPENPNE_LIB_DIR . '/include',
    OPENPNE_WEBAPP_DIR . '/lib',
    ini_get('include_path')
);
ini_set('include_path', implode(PATH_SEPARATOR, $include_paths));

// ファイルアップロード機能がオフ
if (!OPENPNE_USE_FILEUPLOAD) {
    openpne_redirect('pc', 'page_h_home');
}

$file = db_file_c_file4filename($_GET['filename']);

// オリジナルファイル名
$original_filename = $file['original_filename'];
if (strpos($_SERVER['HTTP_USER_AGENT'], 'MSIE') !== false) {
    // IE の場合のみ、ファイル名を SJIS に変換
    $original_filename = mb_convert_encoding($original_filename, 'SJIS', 'UTF-8');
}
$original_filename = str_replace(array("\r", "\n"), '', $original_filename);

while (@ob_end_clean());

header('Content-Disposition: attachment; filename="' . $original_filename . '"');
header('Content-Length: '. strlen($file['bin']));
header('Content-Type: application/octet-stream');
echo $file['bin'];
exit;

?>
