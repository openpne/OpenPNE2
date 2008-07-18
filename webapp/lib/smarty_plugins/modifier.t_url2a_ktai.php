<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * Smarty t_url2a_ktai modifier plugin
 *
 * @param  string $string
 * @return string
 */
function smarty_modifier_t_url2a_ktai($string)
{
    $url_pattern = '/https?:\/\/(?:[a-zA-Z0-9_\-\/.,:;~?@=+$%#!()]|&amp;)+/';
    return preg_replace_callback($url_pattern, 'smarty_modifier_t_url2a_ktai_callback', $string);
}

function smarty_modifier_t_url2a_ktai_callback($matches)
{
    $raw_url = $matches[0];

    $openpne_url = '';
    if (strpos($raw_url, OPENPNE_URL) === 0) {
        $openpne_url = OPENPNE_URL;
    } elseif (OPENPNE_USE_PARTIAL_SSL && strpos($raw_url, OPENPNE_SSL_URL) === 0) {
        $openpne_url = OPENPNE_SSL_URL;
    }

    if (!$openpne_url) {
        return $raw_url;
    }

    $url_pattern = sprintf('/^%s(?:index.php)?\?m=pc&amp;a=(\w+)((?:[a-zA-Z0-9_=]|&amp;)*)$/', preg_quote($openpne_url, '/'));

    $openpne_url_matches = array();
    if (!preg_match($url_pattern, $raw_url, $openpne_url_matches)) {
        return $raw_url;
    }
    $action = $openpne_url_matches[1];
    $param = $openpne_url_matches[2];

    //自動リンクのアクションリストにない場合は変換なし
    if (empty($GLOBALS['_OPENPNE_PC2KTAI_LINK_ACTION_LIST'][$action])) {
        return $raw_url;
    }

    $converted_action = $GLOBALS['_OPENPNE_PC2KTAI_LINK_ACTION_LIST'][$action];
    $param = str_replace('&amp;', '&', $param);

    // 携帯用URLに置換、ksid 追加
    $ktai_url = openpne_gen_url_head('ktai', $converted_action, false) . '?m=ktai&a=' . $converted_action . $param . '&' . $GLOBALS['KTAI_URL_TAIL'];

    // page_ より後ろを最大50文字に縮めて表示
    $urlstr = $converted_action . $param;
    $urlstr = preg_replace('/^page_/', '', $urlstr);

    $length = 50;
    $etc = '..';

    if (strlen($urlstr) > $length) {
        $length -= strlen($etc);
        $urlstr = substr($urlstr, 0, $length) . $etc;
    }

    $ktai_url = htmlspecialchars($ktai_url, ENT_QUOTES, 'UTF-8');
    $urlstr = htmlspecialchars($urlstr, ENT_QUOTES, 'UTF-8');

    return sprintf('<a href="%s">%s</a>', $ktai_url, $urlstr);
}

?>
