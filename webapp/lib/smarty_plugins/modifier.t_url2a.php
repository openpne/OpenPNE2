<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * Smarty t_url2a modifier plugin
 *
 * @param  string $string
 * @return string
 */
function smarty_modifier_t_url2a($string)
{
    // "(&quot;) と '(&#039;) を元に戻す
    $search = array('&quot;', '&#039;');
    $replace = array('"', "'");
    $string = str_replace($search, $replace, $string);

    $url_pattern = '/https?:\/\/[\w\-.,:;\~\^\/?\@&=+\$%#!]+/';
    $replace = '<a href="${0}" target="_blank">${0}</a>';
    $string = preg_replace($url_pattern, $replace, $string);

    return $string;
}

?>
