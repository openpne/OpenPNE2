<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

function smarty_modifier_t_decoration($string, $is_strip = false)
{
    $regexp = '/(&lt;|<)(op:.+?)(?:\s+code=(&quot;|")(#[0-9a-f]{3,6})\3)?\s*(&gt;|>)(.*?)\1\/\2\5/ims';

    if ($is_strip) {
        $converted =  preg_replace_callback($regexp, '_smarty_modifier_t_decoration_strip', $string);
    } else {
        $converted =  preg_replace_callback($regexp, '_smarty_modifier_t_decoration_convert', $string);
    }

    return $converted;
}

function _smarty_modifier_t_decoration_convert($matches)
{
    $tagname = strtolower($matches[2]);
    $colorcode = strtolower($matches[4]);
    $classname = strtr($tagname, ':', '_');
    $value = smarty_modifier_t_decoration($matches[6]);

    $opt = '';
    if ($tagname == 'op:color' && $colorcode) {
        $opt = 'style="color:' . $colorcode . '" ';
    }

    $result = '<span ' . $opt . 'class="' . $classname . '">' . $value . '</span>';
    return $result;
}

function _smarty_modifier_t_decoration_strip($matches)
{
    $tagname = $matches[2];
    $value = smarty_modifier_t_decoration($matches[6], true);

    return $value;
}

?>
