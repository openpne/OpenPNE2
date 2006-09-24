<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_0.txt PHP License 3.0
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

    //文言系
    $smarty->assign('WORD_FRIEND', WORD_FRIEND);
    $smarty->assign('WORD_MY_FRIEND', WORD_MY_FRIEND);
    $smarty->assign('WORD_FRIEND_HALF', WORD_FRIEND_HALF);
    $smarty->assign('WORD_MY_FRIEND_HALF', WORD_MY_FRIEND_HALF);
    
    $is_secure = $GLOBALS['__Framework']['is_secure'];

    //---- inc_ テンプレート用 変数 ----//
    $smarty->assign('inc_html_header', fetch_inc_html_header());
    $smarty->assign('inc_page_footer', fetch_inc_page_footer($is_secure));
    $smarty->assign('inc_extension_pagelayout_top', p_common_c_siteadmin4target_pagename('inc_page_top'));
    $smarty->assign('inc_extension_pagelayout_bottom', p_common_c_siteadmin4target_pagename('inc_page_bottom'));
    $smarty->assign('inc_side_banner', db_banner_get_side_banner($is_secure));
    $smarty->assign('side_banner_html_before', p_common_c_siteadmin4target_pagename('side_banner_html_before'));
    $smarty->assign('side_banner_html_after', p_common_c_siteadmin4target_pagename('side_banner_html_after'));

    if ($is_secure) {
        $smarty->assign('inc_page_header', fetch_inc_page_header());
        @session_start();
        $smarty->assign('PHPSESSID', md5(session_id()));
        $smarty->assign('before_after', 'after');
        if (OPENPNE_USE_API) {
            $smarty->assign('api_params', api_get_params($GLOBALS['AUTH']->uid()));
        }
    } else {
        $smarty->assign('before_after', 'before');
    }


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
