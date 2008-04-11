<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * Smarty to_sjis modifier plugin
 *
 * @param string $string
 * @return string
 */
function smarty_modifier_to_sjis($string)
{
    return mb_convert_encoding($string, 'SJIS-win', 'UTF-8');
}

?>
