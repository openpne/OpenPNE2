<?php
/**
 * @copyright 2005-2007 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

require_once './config.inc.php';

//SNSにログインしているかどうか
if (CHECK_IMG_AUTH) {
    require_once OPENPNE_WEBAPP_DIR . '/init.inc';
    
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

$file = db_file_c_file4filename($_GET['filename']);
header('Content-Disposition: inline; filename="'.$file['filename'].'"');
header('Content-Length: '. strlen($file['bin']));
header('Content-Type: ' . $file['type']);
echo $file['bin'];

?>
