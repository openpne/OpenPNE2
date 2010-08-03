<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// 画像サーバの場合は強制リダイレクト
if (defined('OPENPNE_IS_IMG_SERVER') && OPENPNE_IS_IMG_SERVER) {
    header('Location: ' . OPENPNE_URL);
    exit;
}

/**
 *  共通の初期化処理
 */
// バージョン番号の取得
include_once OPENPNE_WEBAPP_DIR . '/version.php';

// include_path の設定
include_once OPENPNE_LIB_DIR . '/include/PHP/Compat/Constant/PATH_SEPARATOR.php';
$include_paths = array(
    OPENPNE_LIB_DIR . '/include',
    OPENPNE_WEBAPP_DIR . '/lib',
    ini_get('include_path')
);
ini_set('include_path', implode(PATH_SEPARATOR, $include_paths));

// 定数定義
include_once 'PHP/Compat/Constant/UPLOAD_ERR.php';
include_once 'PHP/Compat/Function/image_type_to_mime_type.php';

// 携帯メールのドメイン名
$GLOBALS['OpenPNE']['KTAI_DOMAINS'] = array(
    'docomo.ne.jp',
    'ezweb.ne.jp',
    'softbank.ne.jp',
    'd.vodafone.ne.jp',
    'h.vodafone.ne.jp',
    't.vodafone.ne.jp',
    'c.vodafone.ne.jp',
    'r.vodafone.ne.jp',
    'k.vodafone.ne.jp',
    'n.vodafone.ne.jp',
    'q.vodafone.ne.jp',
    's.vodafone.ne.jp',
    'pdx.ne.jp',
    'di.pdx.ne.jp',
    'dj.pdx.ne.jp',
    'dk.pdx.ne.jp',
    'wm.pdx.ne.jp',
    'disney.ne.jp',
    'emnet.ne.jp',
    'willcom.com',
);

// Smarty の設定
$GLOBALS['SMARTY'] = (array)$GLOBALS['SMARTY'] + array(
    'template_dir'      => OPENPNE_WEBAPP_DIR . '/templates/',
    'compile_dir'       => OPENPNE_VAR_DIR . '/templates_c/',
    'left_delimiter'    => '({',
    'right_delimiter'   => '})',
    'caching'           => false,
    'debugging'         => false,
    'debug_tpl'         => OPENPNE_WEBAPP_DIR . '/templates/debug.tpl',
    'error_reporting'   => E_ALL ^ E_NOTICE ^ E_DEPRECATED,
);
$GLOBALS['SMARTY']['plugins_dir'] = array(
    OPENPNE_WEBAPP_DIR . '/lib/smarty_plugins/',
    OPENPNE_LIB_DIR . '/smarty_plugins/',
    'plugins'
);

// 外部認証の場合は招待・新規登録はできない
if (OPENPNE_AUTH_MODE == 'slavepne') {
    // 招待用URLがPC・携帯どちらも空の場合は招待不可
    if (!(defined('SLAVEPNE_SYOUTAI_URL_PC') && SLAVEPNE_SYOUTAI_URL_PC) &&
        !(defined('SLAVEPNE_SYOUTAI_URL_KTAI') && SLAVEPNE_SYOUTAI_URL_KTAI)) {
        define('IS_USER_INVITE', false);
    }
    define('IS_CLOSED_SNS', true);
}

// ライブラリ読み込み
require_once 'util.inc.php';
require_once 'db.inc.php';
require_once 'controller.php';
require_once 'OpenPNE/Smarty.php';
require_once 'OpenPNE/Auth.php';

require_once 'OpenPNE/Config.php';

// DBから設定読み込み
$config =& OpenPNE_Config::getInstance();
$config->db_load_config();
// 設定のデフォルト値を適用
$config->bind_default();

session_cache_limiter('none');

// session/cookie 設定
ini_set('session.use_cookies', '1');
ini_set('session.use_only_cookies', '1');

$url = parse_url(OPENPNE_URL);
if (substr($url['path'], -1) != '/') {
    $url['path'] .= '/';
}
ini_set('session.cookie_path', $url['path']);

OpenPNE_Auth::set_session_save_handler();

// magic_quotes_gpc = On の場合の対策
if (get_magic_quotes_gpc()) {
    function strip_magic_slashes($arr)
    {
        return is_array($arr) ?
            array_map('strip_magic_slashes', $arr) :
            stripslashes($arr);
    }

    $_GET     = strip_magic_slashes($_GET);
    $_POST    = strip_magic_slashes($_POST);
    $_REQUEST = strip_magic_slashes($_REQUEST);
}

// http_build_query()
ini_set('arg_separator.output', '&');
include_once 'PHP/Compat/Function/http_build_query.php';

//PC版URLを携帯版に変換して自動リンクするアクション
$GLOBALS['_OPENPNE_PC2KTAI_LINK_ACTION_LIST'] = array(
    'page_fh_diary'         => 'page_fh_diary',
    'page_c_home'           => 'page_c_home',
    'page_c_topic_detail'   => 'page_c_bbs',
    'page_c_event_detail'   => 'page_c_bbs',
    'page_f_home'           => 'page_f_home',
    'page_fh_album'         => 'page_fh_album',
    'page_fh_album_image_show' => 'page_fh_album_image_show',
);

?>
