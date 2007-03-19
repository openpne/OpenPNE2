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
    // "(&quot;) と '(&#039;) を元に戻す
    $search = array('&quot;', '&#039;');
    $replace = array('"', "'");
    $string = str_replace($search, $replace, $string);

    // "(&amp;) と '(&#038;) を元に戻す
    $search = array('&amp;', '&#038;;');
    $replace = array('&', "&");
    $string = str_replace($search, $replace, $string);

    $url_pattern = '/https?:\/\/(.*)\?m=ktai&a=page_[\w\-.,:;\~\^\/?\@&=+\$%#!()]+/';
    return preg_replace_callback($url_pattern, 'smarty_modifier_t_url2a_ktai_callback', $string);
}

function smarty_modifier_t_url2a_ktai_callback($matches)
{
    $target = str_replace('https://', '', OPENPNE_URL);
    $target = str_replace('http://', '', $target);
    if ($matches[1] == $target) {
        return pne_url2a($matches[0]);
    } else {
        return $matches[0];
    }
}

?>
