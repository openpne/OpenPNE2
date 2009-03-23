<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */


//デフォルトページ
$GLOBALS['__Framework']['default_page'] = 'h_home';

//<PCKTAI
if (!OPENPNE_ENABLE_KTAI) {
    // disable ktai module
    exit;
}
//>

// User-Agent判別
if (CHECK_KTAI_UA && !isKtaiUserAgent()) {
    openpne_redirect('pc');
}

// IPアドレスチェック
if (CHECK_KTAI_IP && !is_ktai_ip()) {
    openpne_redirect('pc');
}

$agent = new OpenPNE_KtaiUA();
if ($agent->is_docomo()) {
    $GLOBALS['__Framework']['carrier'] = 'i';
} elseif ($agent->is_au()) {
    $GLOBALS['__Framework']['carrier'] = 'e';
} elseif ($agent->is_vodafone()) {
    $GLOBALS['__Framework']['carrier'] = 's';
} elseif ($agent->is_willcom()) {
    $GLOBALS['__Framework']['carrier'] = 'w';
} elseif ($agent->is_emobile()) {
    $GLOBALS['__Framework']['carrier'] = 'em';
}

// 文字コード変換
function ktai_convert_encoding($arr)
{
    return is_array($arr) ?
        array_map('ktai_convert_encoding', $arr) :
        mb_convert_encoding($arr, 'UTF-8', 'SJIS-win');
}

// 絵文字変換
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

function init_ktai_page(&$smarty)
{
    //---- inc_ テンプレート用 変数 ----//
    $smarty->assign('inc_ktai_header', fetch_inc_ktai_header());
    $smarty->assign('inc_ktai_footer', fetch_inc_ktai_footer());

    //全ページ共通変数のアサイン
    $smarty->assign('msg', k_p_common_msg4msg_id($_REQUEST['msg']));
    $smarty->assign('ktai_color_config', util_get_color_config_ktai());

    $is_secure = $GLOBALS['__Framework']['is_secure'];

    if ($is_secure) {
        $smarty->assign('u', $GLOBALS['KTAI_C_MEMBER_ID']);
        $smarty->assign('tail', $GLOBALS['KTAI_URL_TAIL']);
        @session_start();
        $smarty->assign('PHPSESSID', session_id());
    }

    if ($is_secure) {
        $u = $GLOBALS['AUTH']->uid();
        $smarty->assign('C_MEMBER_CONFIG', util_get_c_member_config($u));
    }

    // set SJIS
    $smarty->setOutputCharset('SJIS');
}

function init_ktai_do()
{
    $is_secure = $GLOBALS['__Framework']['is_secure'];

    // 連続投稿確認
    if ($is_secure) {
        $u = $GLOBALS['AUTH']->uid();
        $module = $GLOBALS['__Framework']['current_module'];
        $action = 'do_' . $GLOBALS['__Framework']['current_action'];

        if (!util_do_post_interval_ok($module, $action, $u)) {
            openpne_display_error();
        }
    }

}

?>
