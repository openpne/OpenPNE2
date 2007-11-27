<?php
/**
 * @copyright 2005-2007 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

//モジュールネーム
define('ADMIN_BIZ_MODULE_NAME', 'admin_biz');

// admin モジュール initialize 処理

// auth関連設定
session_name('OpenPNEadmin');
isset($GLOBALS['OpenPNE']['admin']['session_lifetime'])
    or $GLOBALS['OpenPNE']['admin']['session_lifetime'] = 0;
isset($GLOBALS['OpenPNE']['admin']['session_idletime'])
    or $GLOBALS['OpenPNE']['admin']['session_idletime'] = 0;

// ライブラリ読み込み
$module_lib_dir = dirname(__FILE__) . '/lib';
require_once $module_lib_dir . '/db_admin.php';
require_once $module_lib_dir . '/etc_admin.php';
require_once $module_lib_dir . '/hash_admin.php';
require_once $module_lib_dir . '/biz_admin.php';

$biz_dir = OPENPNE_MODULES_BIZ_DIR.'/biz/';  //bizモジュールディレクトリの定義
include($biz_dir.'lib/mysql_functions.php');

// デフォルトページ
$GLOBALS['__Framework']['default_page'] = 'top';
// デフォルトタイプ
$GLOBALS['__Framework']['default_type'] = 'page';

// ハッシュから action名を取得
$hash_tbl =& AdminHashTable::singleton();
$action = $hash_tbl->action($action, $type);

//allでのみアクセスできるページ
$GLOBALS['_OPENPNE_ADMIN_AUTH_ACTIONS'] = array(
'page_insert_c_admin_user',
'page_list_c_admin_user',
'page_passwd',
'do_delete_c_admin_user',
'do_insert_c_admin_user',
'do_passwd',
'do_update_c_commu_is_regist_join',
'do_update_is_login_rejected',
);

function init_admin_biz_page(&$smarty)
{
    $is_secure = $GLOBALS['__Framework']['is_secure'];
    $smarty->assign('inc_header', admin_fetch_inc_header($is_secure));
    $smarty->assign('inc_footer', admin_fetch_inc_footer($is_secure));
    $v['module_name'] = ADMIN_BIZ_MODULE_NAME;
    $smarty->assign($v);
    $smarty->assign_by_ref('hash_tbl', AdminHashTable::singleton());

    if ($is_secure) {
        @session_start();
        $smarty->assign('PHPSESSID', md5(session_id()));

        $auth_type = admin_get_auth_type();
        $smarty->assign('auth_type', $auth_type);
        $act = sprintf('page_%s', $GLOBALS['__Framework']['current_action']);
        if ($auth_type != 'all' && in_array($act, $GLOBALS['_OPENPNE_ADMIN_AUTH_ACTIONS'])) {
            admin_biz_client_redirect('top', '指定されたページにはアクセスできません');
        }
    }
}

function init_admin_biz_do()
{
    $is_secure = $GLOBALS['__Framework']['is_secure'];

    if ($is_secure) {
        @session_start();
        if ($_REQUEST['sessid'] !== md5(session_id())) {
            openpne_display_error('前の画面を再読み込みして、操作をやり直してください');
        }
        $auth_type = admin_get_auth_type();
        $act = sprintf('do_%s', $GLOBALS['__Framework']['current_action']);
        if ($auth_type != 'all' && in_array($act, $GLOBALS['_OPENPNE_ADMIN_AUTH_ACTIONS'])) {
            admin_biz_client_redirect('top', '指定されたページにはアクセスできません');
        }
    }
}

?>
