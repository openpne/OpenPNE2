<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * Smarty t_escape modifier plugin
 *
 * @param  string $string
 * @return string
 */
function smarty_modifier_t_escape($string)
{
    // 配列やオブジェクトの場合にエラーにならないように
    if (!is_string($string)) {
        return $string;
    }
    return htmlspecialchars($string, ENT_QUOTES, 'UTF-8');
}

?>
