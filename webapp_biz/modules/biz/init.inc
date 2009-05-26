<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

//ライブラリの読み込み
$biz_lib_dir = dirname(__FILE__) . '/lib';
require_once($biz_lib_dir . '/mysql_functions.php');  //MySQLを使用する関数群の定義されたライブラリ
require_once($biz_lib_dir . '/misc_functions.php');  //配列操作関数群の定義されたライブラリ
require_once($biz_lib_dir . '/smarty_functions.php');  //配列操作関数群の定義されたライブラリ

//デフォルトページ
$GLOBALS['__Framework']['default_page'] = 'h_home';
$GLOBALS['__Framework']['default_normal'] = 'login_do_login';

//<PCKTAI
if (defined('OPENPNE_ENABLE_PC') && !OPENPNE_ENABLE_PC) {
    // disable pc module
    exit;
}
//>


function init_biz_page(&$smarty)
{
    $smarty->register_resource("pc",
        array("pc_get_template",
            "pc_get_timestamp",
            "pc_get_secure",
            "pc_get_trusted")
    );

    $is_secure = $GLOBALS['__Framework']['is_secure'];

    if ($is_secure) {
        @session_start();
        $smarty->assign('PHPSESSID', md5(session_id()));
        $smarty->assign('before_after', 'after');
        if (OPENPNE_USE_API) {
            $smarty->assign('api_params', api_get_params($GLOBALS['AUTH']->uid()));
        }
    } else {
        $smarty->assign('before_after', 'before');
    }

    // INC_HEADER_* (inc_header.tpl)

    if (SNS_TITLE) {
        $title = SNS_TITLE;
    } else {
        $title = SNS_NAME;
    }
    $smarty->assign('INC_HEADER_title', $title);
    $smarty->assign('INC_HEADER_inc_html_head', p_common_c_siteadmin4target_pagename('inc_html_head'));
    $smarty->assign('INC_HEADER_inc_custom_css', p_common_c_siteadmin4target_pagename('inc_custom_css'));
    $smarty->assign('INC_HEADER_color_config', util_get_color_config());
    $smarty->assign('INC_HEADER_top_banner', db_banner_get_top_banner($is_secure));
    $smarty->assign('INC_HEADER_page_name', $GLOBALS['__Framework']['current_action']);
    $smarty->assign('INC_HEADER_top_banner_html_before', p_common_c_siteadmin4target_pagename('top_banner_html_before'));
    $smarty->assign('INC_HEADER_top_banner_html_after', p_common_c_siteadmin4target_pagename('top_banner_html_after'));
    if ($is_secure) {
        $smarty->assign('INC_HEADER_global_navi', util_get_c_navi('global'));
    }
    $smarty->assign('INC_HEADER_inc_page_top', p_common_c_siteadmin4target_pagename('inc_page_top'));
    $smarty->assign('INC_HEADER_inc_page_top2', p_common_c_siteadmin4target_pagename('inc_page_top2'));

    // INC_FOOTER_* (inc_footer.tpl)

    if ($is_secure) {
        $name = 'inc_page_footer_after';
    } else {
        $name = 'inc_page_footer_before';
    }
    $smarty->assign('INC_FOOTER_inc_page_footer', p_common_c_siteadmin4target_pagename($name));
    $smarty->assign('INC_FOOTER_inc_page_bottom', p_common_c_siteadmin4target_pagename('inc_page_bottom'));
    $smarty->assign('INC_FOOTER_inc_page_bottom2', p_common_c_siteadmin4target_pagename('inc_page_bottom2'));
    $smarty->assign('INC_FOOTER_inc_side_banner', db_banner_get_side_banner($is_secure));
    $smarty->assign('INC_FOOTER_side_banner_html_before', p_common_c_siteadmin4target_pagename('side_banner_html_before'));
    $smarty->assign('INC_FOOTER_side_banner_html_after', p_common_c_siteadmin4target_pagename('side_banner_html_after'));
}

function init_biz_do()
{
    $is_secure = $GLOBALS['__Framework']['is_secure'];

    if ($is_secure) {
        if ($_REQUEST['sessid'] !== md5(session_id())) {
            openpne_display_error('前の画面を再読み込みして、操作をやり直してください');
        }
    }
}

?>
