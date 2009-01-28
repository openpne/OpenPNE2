<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * Smarty t_implode modifier plugin
 *
 * @param  array  $pieces
 * @param  string $glue
 * @return string
 */
function smarty_modifier_t_implode($pieces, $glue = '')
{
    if (!is_array($pieces)) {
        return $pieces;
    }
    return implode($glue, $pieces);
}

?>
