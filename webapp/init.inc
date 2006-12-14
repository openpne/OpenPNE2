<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// 認証タイプ
if (!defined('LOGIN_NAME_TYPE')) {
    define('LOGIN_NAME_TYPE', 0);
}

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

// 新規登録フラグ用定数
define('OPENPNE_REGIST_FROM_NONE'  , 0); // 新規登録不可
define('OPENPNE_REGIST_FROM_PC'    , 1); // PCからのみ登録可
define('OPENPNE_REGIST_FROM_KTAI'  , 2); // 携帯からのみ登録可
define('OPENPNE_REGIST_FROM_PCKTAI', 3); // PC携帯から登録可

// フレンド状態フラグ用定数(削除予定)
define('STATUS_F_LINK_FLAT', "1");    // フレンドリクエスト(承認送信画面)
define('STATUS_F_LINK_WAIT', "2");    // フレンドリクエスト(リンク承認待ち)
define('STATUS_F_LINK_ALREADY', "3"); // フレンドリクエスト(フレンドリンク済)

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
    'tejimaya.com',
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
    'default_modifiers' => array('@t_escape'),
    'error_reporting'   => E_ALL ^ E_NOTICE,
);
$GLOBALS['SMARTY']['plugins_dir'] = array(
    OPENPNE_WEBAPP_DIR . '/lib/smarty_plugins/',
    OPENPNE_LIB_DIR . '/smarty_plugins/',
    'plugins'
);

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

// cookie 設定
ini_set('session.use_cookies', '1');
ini_set('session.use_only_cookies', '1');

$url = parse_url(OPENPNE_URL);
if (substr($url['path'], -1) != '/') {
    $url['path'] .= '/';
}
ini_set('session.cookie_path', $url['path']);

// セッション情報をDBに保存
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

isset($GLOBALS['OpenPNE']['common']['session_lifetime'])
    or $GLOBALS['OpenPNE']['common']['session_lifetime'] = 0;
isset($GLOBALS['OpenPNE']['common']['session_idletime'])
    or $GLOBALS['OpenPNE']['common']['session_idletime'] = 0;

ini_set('arg_separator.output', '&');

// ファンクションキャッシュ有効期限用定数
define('OPENPNE_FUNCTION_CACHE_LIFETIME_FAST', 300);
define('OPENPNE_FUNCTION_CACHE_LIFETIME_SHORT' , 1200);
define('OPENPNE_FUNCTION_CACHE_LIFETIME_LONG' , 3600);


?>
