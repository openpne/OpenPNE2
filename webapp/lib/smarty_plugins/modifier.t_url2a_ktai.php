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
    $parts = parse_url(OPENPNE_URL);
    $openpne_url = $parts['host'] . $parts['path'];

    $url_pattern = sprintf('/(https?:\/\/%s)(?:index.php)?\?m=pc&amp;a=(\w+)((?:[a-zA-Z0-9_=]|&amp;)*)/', preg_quote($openpne_url, '/'));
    return preg_replace_callback($url_pattern, 'smarty_modifier_t_url2a_ktai_callback', $string);
}

function smarty_modifier_t_url2a_ktai_callback($matches)
{
    $raw_url    = $matches[0];
    $host       = $matches[1];
    $raw_action = $matches[2];
    $param      = $matches[3];

    //自動リンクのアクションリストにない場合は変換なし
    if (empty($GLOBALS['_OPENPNE_PC2KTAI_LINK_ACTION_LIST'][$raw_action])) {
        return $raw_url;
    }

    $converted_action = $GLOBALS['_OPENPNE_PC2KTAI_LINK_ACTION_LIST'][$raw_action];
    $param = str_replace('&amp;', '&', $param);

    // 携帯用URLに置換、ksid 追加
    $ktai_url = $host . '?m=ktai&a=' . $converted_action . $param . '&' . $GLOBALS['KTAI_URL_TAIL'];

    // 表示上は page_ 以降を最大40文字で縮める
    $urlstr = $converted_action . $param;

    $length = 40;
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
