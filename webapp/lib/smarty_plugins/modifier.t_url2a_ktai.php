<?php
/**
 * @copyright 2005-2007 OpenPNE Project
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

    $url_pattern = sprintf('/https?:\/\/%s\?m=pc&amp;a=(page_fh_diary(?:[a-zA-Z0-9_=]|&amp;)*)/', preg_quote($openpne_url, '/'));
    return preg_replace_callback($url_pattern, 'smarty_modifier_t_url2a_ktai_callback', $string);
}

function smarty_modifier_t_url2a_ktai_callback($matches)
{
    $url = str_replace('&amp;', '&', $matches[0]);

    // 携帯用URLに置換、ksid 追加
    $ktai_url = str_replace('?m=pc', '?m=ktai', $url) . '&' . $GLOBALS['KTAI_URL_TAIL'];

    // 表示上は page_ 以降を最大40文字で縮める
    $urlstr = str_replace('&amp;', '&', $matches[1]);

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
