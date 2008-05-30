<?php

// auth関連設定
session_name('OpenPNEadmin');
isset($GLOBALS['OpenPNE']['admin']['session_lifetime'])
    or $GLOBALS['OpenPNE']['admin']['session_lifetime'] = 0;
isset($GLOBALS['OpenPNE']['admin']['session_idletime'])
    or $GLOBALS['OpenPNE']['admin']['session_idletime'] = 0;

// ライブラリ読み込み
$admin_lib_dir = OPENPNE_MODULES_DIR . '/admin/lib';
require_once $admin_lib_dir . '/db_admin.php';
require_once $admin_lib_dir . '/etc_admin.php';
require_once $admin_lib_dir . '/hash_admin.php';


// DBアクセスライブラリ
$db_portal = openpne_ext_search('portal/lib/db_portal.php');
require_once $db_portal;

// 暫定的に定義
define('PORTAL_MODULE_NAME', 'portal');

// ポータル設定
define('PORTAL_CONFIG_USE_PORTAL', 'USE_PORTAL');
define('PORTAL_CONFIG_LAYOUT_TYPE', 'LAYOUT_TYPE');
define('PORTAL_CONFIG_COLOR_TYPE', 'COLOR_TYPE');
define('PORTAL_CONFIG_HEAD_TEXT', 'HEAD_TEXT');
define('PORTAL_CONFIG_HEAD_TEXT_TYPE', 'HEAD_TEXT_TYPE');
define('PORTAL_CONFIG_HEAD_TEXT_TYPE_SNS', '0');
define('PORTAL_CONFIG_HEAD_TEXT_TYPE_MANUAL', '1');
define('PORTAL_CONFIG_CUSTOM_CSS', 'CUSTOM_CSS');
define('PORTAL_CONFIG_META_DESCRIPTION', 'META_DESCRIPTION');
define('PORTAL_CONFIG_META_KEYWORDS', 'META_KEYWORDS');

// レイアウト設定
define('PORTAL_LAYOUT_COMMUNITY', 'COMMUNITY');
define('PORTAL_LAYOUT_REVIEW', 'REVIEW');
define('PORTAL_LAYOUT_ACCESS_RANKING', 'ACCESS_RANKING');
define('PORTAL_LAYOUT_COMMUNITY_RANKING', 'COMMUNITY_RANKING');
define('PORTAL_LAYOUT_EVENT', 'EVENT');
define('PORTAL_LAYOUT_RSS1', 'RSS1');
define('PORTAL_LAYOUT_RSS2', 'RSS2');
define('PORTAL_LAYOUT_RSS3', 'RSS3');
define('PORTAL_LAYOUT_RSS4', 'RSS4');
define('PORTAL_LAYOUT_RSS5', 'RSS5');
define('PORTAL_LAYOUT_FREE1', 'FREE1');
define('PORTAL_LAYOUT_FREE2', 'FREE2');
define('PORTAL_LAYOUT_FREE3', 'FREE3');
define('PORTAL_LAYOUT_FREE4', 'FREE4');
define('PORTAL_LAYOUT_FREE5', 'FREE5');
define('PORTAL_LAYOUT_LINK', 'LINK');
define('PORTAL_LAYOUT_NOUSE', 99);

// デフォルトページ
$GLOBALS['__Framework']['default_page'] = 'user_top';

function init_portal_page(&$smarty)
{
    $is_secure = $GLOBALS['__Framework']['is_secure'];

    // エラーメッセージ
    $ini_files = array(
        openpne_ext_search('portal/validate/error_msg.ini'),
    );
    $validator =& new OpenPNE_Validator_Common();
    $valid_result = $validator->common_validate($ini_files);
    $error_msg = $valid_result[1]['error_msg'];
    $smarty->assign('error_msg', $error_msg);

    $current_action = $GLOBALS['__Framework']['current_action'];
    $module = '';
    $v['module_name'] = PORTAL_MODULE_NAME;

    // pcモジュールの設定を適用するアクション
    $pc_action_list = array('user_top', 'preview');

    // ktaiモジュールの設定を適用するアクション
    $ktai_action_list = array('portal_user_top_ktai');

    // カスタムヘッダ領域にテンプレート挿入
    $custom_header = $smarty->ext_fetch('inc_portal_header.tpl');

    $smarty->assign('inc_header', admin_fetch_inc_header($is_secure, $custom_header));
    $smarty->assign('inc_footer', admin_fetch_inc_footer($is_secure));
    $smarty->assign($v);
    $smarty->assign_by_ref('hash_tbl', AdminHashTable::singleton());

    if ($is_secure) {
        @session_start();
        $smarty->assign('PHPSESSID', md5(session_id()));
    }

    // 特定モジュールの init.inc を読み込む
    if (in_array($current_action, $pc_action_list)) {
        $module = 'pc';
    } elseif (in_array($current_action, $ktai_action_list)) {
        $module = 'ktai';
    }

    if ($module) {
        if ($init = openpne_ext_search("{$module}/init.inc")) {
            require_once $init;
        }

        $init_func = "init_{$module}_page";
        if (function_exists($init_func)) {
            if (isset($smarty)) {
                $init_func($smarty);
            } else {
                $init_func();
            }
        }

    }
}

function init_portal_do()
{
    $is_secure = $GLOBALS['__Framework']['is_secure'];

    if ($is_secure) {
        @session_start();
        if ($_REQUEST['sessid'] !== md5(session_id())) {
            openpne_display_error('前の画面を再読み込みして、操作をやり直してください');
        }
    }
}

/**
 *
 * ポータル設定画面用リダイレクトを行います。
 *
 */
function portal_client_redirect($p, $msg = '', $tail = '')
{
    if (OPENPNE_ADMIN_URL) {
        $url = OPENPNE_ADMIN_URL;
    } else {
        $url = openpne_gen_url_head('admin', 'page_' . $p, true);
    }
    if (need_ssl_param('admin', 'page_' . $p)) {
        if ($tail) {
            $tail .= '&';
        }
        $tail .= 'ssl_param=1';
    }

    $hash_tbl =& AdminHashTable::singleton();

    $m = PORTAL_MODULE_NAME;
    $p = $hash_tbl->hash($p);

    $url .= "?m=$m&a=page_$p";
    if ($tail) $url .= "&$tail";
    if ($msg)  $url .= '&msg=' . urlencode($msg);

    client_redirect_absolute($url);
}

?>
