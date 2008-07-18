<?php
/**
 * @copyright 2005-2008 OpenPNE Project
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
    $url_pattern = '/https?:\/\/(?:[a-zA-Z0-9_\-\/.,:;~?@=+$%#!()]|&amp;)+/';
    return preg_replace_callback($url_pattern, 'smarty_modifier_t_url2a_callback', $string);
}

function smarty_modifier_t_url2a_callback($matches)
{
    $url = str_replace('&amp;', '&', $matches[0]);
    return pne_url2a($url);
}

?>
