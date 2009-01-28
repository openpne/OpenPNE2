<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

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

// 管理画面向け smarty plugins
$GLOBALS['SMARTY']['plugins_dir'][] = $module_lib_dir . '/smarty_plugins/';

// デフォルトページ
$GLOBALS['__Framework']['default_page'] = 'top';

// ハッシュから action名を取得
$hash_tbl =& AdminHashTable::singleton();
$action = $hash_tbl->action($action, $type);

// ホワイトリスト
$GLOBALS['_OPENPNE_ADMIN_AUTH_ACTIONS'] = array(
// 「メンバーリスト関連部分」以外全て
'_type' => array(
'do_delete_c_album',
'do_delete_c_album_image',
'do_delete_c_banner',
'do_delete_c_cmd_caster',
'do_delete_c_commu_category',
'do_delete_c_commu_category_parent',
'do_delete_c_file4c_file_id',
'do_delete_c_free_page',
'do_delete_c_holiday',
'do_delete_c_image',
'do_delete_c_image4c_image_id',
'do_delete_c_navi',
'do_delete_c_profile',
'do_delete_c_profile_option',
'do_delete_c_rank',
'do_delete_kakikomi_c_commu',
'do_delete_kakikomi_c_commu_topic',
'do_delete_kakikomi_c_commu_topic_comment',
'do_delete_kakikomi_c_diary',
'do_delete_kakikomi_c_diary_comment',
'do_delete_kakikomi_c_review',
'do_delete_mail',
'do_delete_skin_image',
'do_download_xml',
'do_edit_album_limit',
'do_edit_c_admin_info',
'do_file_download',
'do_import_c_member',
'do_insert_c_banner',
'do_insert_c_cmd_caster',
'do_insert_c_commu_category',
'do_insert_c_commu_category_parent',
'do_insert_c_free_page',
'do_insert_c_holiday',
'do_insert_c_image',
'do_insert_c_profile',
'do_insert_c_profile_option',
'do_insert_c_rank',
'do_insert_html',
'do_login',
'do_logout',
'do_send_invites',
'do_update_c_action',
'do_update_c_admin_config',
'do_update_c_admin_config_use_ktai_logo',
'do_update_c_admin_config_word',
'do_update_c_admin_user_password',
'do_update_c_api',
'do_update_c_banner',
'do_update_c_cmd',
'do_update_c_cmd_caster',
'do_update_c_cmd_caster_cmd',
'do_update_c_commu_category',
'do_update_c_commu_category_parent',
'do_update_c_commu_is_regist_join',
'do_update_c_deco',
'do_update_c_free_page',
'do_update_c_holiday',
'do_update_c_navi',
'do_update_c_profile',
'do_update_c_profile_option',
'do_update_c_rank',
'do_update_c_siteadmin_css',
'do_update_c_sns_config',
'do_update_c_sns_config_ktai',
'do_update_entry_point',
'do_update_limit_domain',
'do_update_mail',
'do_update_mail_send',
'do_update_profile_sort_order',
'do_update_side_banner_html',
'do_update_skin_image',
'do_update_skin_theme',
'do_update_top_banner_html',
'page_access_analysis_day',
'page_access_analysis_member',
'page_access_analysis_month',
'page_access_analysis_page',
'page_access_analysis_target_commu',
'page_access_analysis_target_diary',
'page_access_analysis_target_member',
'page_access_analysis_target_topic',
'page_commu_list',
'page_delete_album_confirm',
'page_delete_album_image_confirm',
'page_delete_c_banner_confirm',
'page_delete_c_file_confirm',
'page_delete_c_free_page_confirm',
'page_delete_c_image_confirm',
'page_delete_c_profile',
'page_delete_c_rank_confirm',
'page_delete_commu',
'page_delete_diary',
'page_delete_diary_comment',
'page_delete_review',
'page_delete_topic',
'page_delete_topic_comment',
'page_diary_comment_list',
'page_diary_list',
'page_download_xml',
'page_edit_admin_password',
'page_edit_album_image_list',
'page_edit_album_limit',
'page_edit_album_list',
'page_edit_c_admin_config',
'page_edit_c_admin_config_word',
'page_edit_c_admin_info',
'page_edit_c_banner',
'page_edit_c_holiday',
'page_edit_c_image',
'page_edit_c_navi',
'page_edit_c_profile',
'page_edit_c_sns_config',
'page_edit_c_sns_config_ktai',
'page_edit_category',
'page_edit_deco',
'page_edit_entry_point',
'page_edit_mail',
'page_edit_mail_send',
'page_edit_skin_image',
'page_import_c_member',
'page_insert_c_banner',
'page_insert_c_profile',
'page_insert_html',
'page_limit_domain',
'page_list_c_api',
'page_list_c_cmd',
'page_list_c_cmd_caster',
'page_list_c_file',
'page_list_c_free_page',
'page_list_c_image',
'page_list_c_rank',
'page_login',
'page_manage_c_commu',
'page_review_list',
'page_send_invites',
'page_send_invites_confirm',
'page_top',
'page_topic_comment_list',
'page_topic_list',
'page_update_c_banner',
'page_update_c_free_page',
'page_update_c_profile',
'page_update_c_rank',
'page_user_analysis_date_day',
'page_user_analysis_date_month',
'page_user_analysis_generation',
),

// 「メンバー管理」「SNS内データ閲覧部分」以外全て
'normal_type' => array(
'do_delete_c_banner',
'do_delete_c_cmd_caster',
'do_delete_c_commu_category',
'do_delete_c_commu_category_parent',
'do_delete_c_free_page',
'do_delete_c_holiday',
'do_delete_c_navi',
'do_delete_c_profile',
'do_delete_c_profile_option',
'do_delete_c_rank',
'do_delete_mail',
'do_delete_skin_image',
'do_edit_album_limit',
'do_edit_c_admin_info',
'do_insert_c_banner',
'do_insert_c_cmd_caster',
'do_insert_c_commu_category',
'do_insert_c_commu_category_parent',
'do_insert_c_free_page',
'do_insert_c_holiday',
'do_insert_c_profile',
'do_insert_c_profile_option',
'do_insert_c_rank',
'do_insert_html',
'do_login',
'do_logout',
'do_update_c_action',
'do_update_c_admin_config',
'do_update_c_admin_config_use_ktai_logo',
'do_update_c_admin_config_word',
'do_update_c_admin_user_password',
'do_update_c_api',
'do_update_c_banner',
'do_update_c_cmd',
'do_update_c_cmd_caster',
'do_update_c_cmd_caster_cmd',
'do_update_c_commu_category',
'do_update_c_commu_category_parent',
'do_update_c_commu_is_regist_join',
'do_update_c_deco',
'do_update_c_free_page',
'do_update_c_holiday',
'do_update_c_navi',
'do_update_c_profile',
'do_update_c_profile_option',
'do_update_c_rank',
'do_update_c_siteadmin_css',
'do_update_c_sns_config',
'do_update_c_sns_config_ktai',
'do_update_entry_point',
'do_update_limit_domain',
'do_update_mail',
'do_update_mail_send',
'do_update_profile_sort_order',
'do_update_side_banner_html',
'do_update_skin_image',
'do_update_skin_theme',
'do_update_top_banner_html',
'page_delete_c_banner_confirm',
'page_delete_c_free_page_confirm',
'page_delete_c_profile',
'page_delete_c_rank_confirm',
'page_edit_admin_password',
'page_edit_album_limit',
'page_edit_c_admin_config',
'page_edit_c_admin_config_word',
'page_edit_c_admin_info',
'page_edit_c_banner',
'page_edit_c_holiday',
'page_edit_c_navi',
'page_edit_c_profile',
'page_edit_c_sns_config',
'page_edit_c_sns_config_ktai',
'page_edit_category',
'page_edit_deco',
'page_edit_entry_point',
'page_edit_mail',
'page_edit_mail_send',
'page_edit_skin_image',
'page_insert_c_banner',
'page_insert_c_profile',
'page_insert_html',
'page_limit_domain',
'page_list_c_api',
'page_list_c_cmd',
'page_list_c_cmd_caster',
'page_list_c_free_page',
'page_list_c_rank',
'page_login',
'page_manage_c_commu',
'page_top',
'page_update_c_banner',
'page_update_c_free_page',
'page_update_c_profile',
'page_update_c_rank',
),
);

function init_admin_page(&$smarty)
{
    $is_secure = $GLOBALS['__Framework']['is_secure'];
    $smarty->assign('inc_header', admin_fetch_inc_header($is_secure));
    $smarty->assign('inc_footer', admin_fetch_inc_footer($is_secure));
    $v['module_name'] = ADMIN_MODULE_NAME;
    $smarty->assign($v);
    $smarty->assign_by_ref('hash_tbl', AdminHashTable::singleton());

    if ($is_secure) {
        @session_start();
        $smarty->assign('PHPSESSID', md5(session_id()));

        $auth_type = admin_get_auth_type();
        $smarty->assign('auth_type', $auth_type);
        $act = sprintf('page_%s', $GLOBALS['__Framework']['current_action']);
        if ($auth_type != 'all' && !in_array($act, $GLOBALS['_OPENPNE_ADMIN_AUTH_ACTIONS'][$auth_type.'_type'])) {
            admin_client_redirect('top', '指定されたページにはアクセスできません');
        }
    }
}

function init_admin_do()
{
    $is_secure = $GLOBALS['__Framework']['is_secure'];

    if ($is_secure) {
        @session_start();
        if ($_REQUEST['sessid'] !== md5(session_id())) {
            openpne_display_error('前の画面を再読み込みして、操作をやり直してください');
        }
        $auth_type = admin_get_auth_type();
        $act = sprintf('do_%s', $GLOBALS['__Framework']['current_action']);
        if ($auth_type != 'all' && !in_array($act, $GLOBALS['_OPENPNE_ADMIN_AUTH_ACTIONS'][$auth_type.'_type'])) {
            admin_client_redirect('top', '指定されたページにはアクセスできません');
        }
    }
}

?>
