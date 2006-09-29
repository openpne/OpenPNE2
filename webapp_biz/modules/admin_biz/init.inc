<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

//繝｢繧ｸ繝･繝ｼ繝ｫ繝阪・繝
define('ADMIN_BIZ_MODULE_NAME', 'admin_biz');

// admin 繝｢繧ｸ繝･繝ｼ繝ｫ initialize 蜃ｦ逅・

// auth髢｢騾｣險ｭ螳・
session_name('OpenPNEadmin');
isset($GLOBALS['OpenPNE']['admin']['session_lifetime'])
    or $GLOBALS['OpenPNE']['admin']['session_lifetime'] = 0;
isset($GLOBALS['OpenPNE']['admin']['session_idletime'])
    or $GLOBALS['OpenPNE']['admin']['session_idletime'] = 0;

// 繝ｩ繧､繝悶Λ繝ｪ隱ｭ縺ｿ霎ｼ縺ｿ
$module_lib_dir = dirname(__FILE__) . '/lib';
require_once $module_lib_dir . '/db_admin.php';
require_once $module_lib_dir . '/etc_admin.php';
require_once $module_lib_dir . '/hash_admin.php';
require_once $module_lib_dir . '/biz_admin.php';

$biz_dir = OPENPNE_MODULES_BIZ_DIR.'/biz/';  //biz繝｢繧ｸ繝･繝ｼ繝ｫ繝・ぅ繝ｬ繧ｯ繝医Μ縺ｮ螳夂ｾｩ
include($biz_dir.'lib/mysql_functions.php');

// 繝・ヵ繧ｩ繝ｫ繝医・繝ｼ繧ｸ
$GLOBALS['__Framework']['default_page'] = 'top';
// 繝・ヵ繧ｩ繝ｫ繝医ち繧､繝・
$GLOBALS['__Framework']['default_type'] = 'page';

// 繝上ャ繧ｷ繝･縺九ｉ action蜷阪ｒ蜿門ｾ・
$hash_tbl =& AdminHashTable::singleton();
$action = $hash_tbl->action($action, $type);

//all縺ｧ縺ｮ縺ｿ繧｢繧ｯ繧ｻ繧ｹ蜃ｺ譚･繧九・繝ｼ繧ｸ
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
            admin_biz_client_redirect('top', '謖・ｮ壹＆繧後◆繝壹・繧ｸ縺ｫ縺ｯ繧｢繧ｯ繧ｻ繧ｹ縺ｧ縺阪∪縺帙ｓ');
        }
    }
}

function init_admin_biz_do()
{
    $is_secure = $GLOBALS['__Framework']['is_secure'];

    if ($is_secure) {
        @session_start();
        if ($_REQUEST['sessid'] !== md5(session_id())) {
            openpne_display_error('蜑阪・逕ｻ髱｢繧貞・隱ｭ縺ｿ霎ｼ縺ｿ縺励※縲∵桃菴懊ｒ繧・ｊ逶ｴ縺励※縺上□縺輔＞');
        }
        $auth_type = admin_get_auth_type();
        $act = sprintf('do_%s', $GLOBALS['__Framework']['current_action']);
        if ($auth_type != 'all' && in_array($act, $GLOBALS['_OPENPNE_ADMIN_AUTH_ACTIONS'])) {
            admin_biz_client_redirect('top', '謖・ｮ壹＆繧後◆繝壹・繧ｸ縺ｫ縺ｯ繧｢繧ｯ繧ｻ繧ｹ縺ｧ縺阪∪縺帙ｓ');
        }
    }
}

?>
