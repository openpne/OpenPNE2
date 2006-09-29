<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

//繝・ヵ繧ｩ繝ｫ繝医・繝ｼ繧ｸ
$GLOBALS['__Framework']['default_page'] = 'fh_calendar_week';

//<PCKTAI
if (!OPENPNE_ENABLE_KTAI) {
    // disable ktai module
    exit;
}
//>

// User-Agent蛻､蛻･
if (CHECK_KTAI_UA && !isKtaiUserAgent()) {
    openpne_redirect('pc');
}

$biz_dir = OPENPNE_MODULES_BIZ_DIR.'/biz/';  //biz繝｢繧ｸ繝･繝ｼ繝ｫ繝・ぅ繝ｬ繧ｯ繝医Μ縺ｮ螳夂ｾｩ
include($biz_dir.'lib/smarty_functions.php');  //biz繝｢繧ｸ繝･繝ｼ繝ｫ繧医ｊ繝ｩ繧､繝悶Λ繝ｪ繧呈享蛟・
include($biz_dir.'lib/mysql_functions.php');  //biz繝｢繧ｸ繝･繝ｼ繝ｫ繧医ｊ繝ｩ繧､繝悶Λ繝ｪ繧呈享蛟・

// 譁・ｭ励さ繝ｼ繝牙､画鋤
function ktai_convert_encoding($arr)
{
    return is_array($arr) ?
        array_map('ktai_convert_encoding', $arr) :
        mb_convert_encoding($arr, 'UTF-8', 'SJIS-win');
}

// 邨ｵ譁・ｭ怜､画鋤
function ktai_convert_emoji($arr)
{
    return is_array($arr) ?
        array_map('ktai_convert_emoji', $arr) :
        emoji_escape($arr);
}

function ktai_convert($arr)
{
	$arr = ktai_convert_emoji($arr);
	$arr = ktai_convert_encoding($arr);
	return $arr;
}

$_GET     = ktai_convert($_GET);
$_POST    = ktai_convert($_POST);
$_REQUEST = ktai_convert($_REQUEST);

ini_set('session.use_cookies', '0');

function init_ktai_biz_page(&$smarty)
{
    //---- inc_ 繝・Φ繝励Ξ繝ｼ繝育畑 螟画焚 ----//
    $smarty->assign('inc_ktai_header', fetch_inc_ktai_header());
    $smarty->assign('inc_ktai_footer', fetch_inc_ktai_footer());

    //蜈ｨ繝壹・繧ｸ蜈ｱ騾壼､画焚縺ｮ繧｢繧ｵ繧､繝ｳ
    $smarty->assign('msg', k_p_common_msg4msg_id($_REQUEST['msg']));
    $smarty->assign('WORD_FRIEND', WORD_FRIEND);
    $smarty->assign('WORD_MY_FRIEND', WORD_MY_FRIEND);
    $smarty->assign('WORD_FRIEND_HALF', WORD_FRIEND_HALF);
    $smarty->assign('WORD_MY_FRIEND_HALF', WORD_MY_FRIEND_HALF);

    $is_secure = $GLOBALS['__Framework']['is_secure'];
    
    if ($is_secure) {
        $smarty->assign('u', $GLOBALS['KTAI_C_MEMBER_ID']);
        $smarty->assign('tail', $GLOBALS['KTAI_URL_TAIL']);
        @session_start();
        $smarty->assign('PHPSESSID', session_id());
    }

    // set SJIS
    $smarty->setOutputCharset('SJIS');
}

?>
