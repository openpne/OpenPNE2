<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

function smarty_modifier_t_decoration($string, $is_strip = false)
{
    $regexp = '/(&lt;|<)(\/?)(op:.+?)(?:\s+code=(&quot;|")(#[0-9a-f]{3,6})\4)?\s*(&gt;|>)/i';

    if ($is_strip) {
        $converted = preg_replace($regexp, '', $string);
    } else {
        $converted = preg_replace_callback($regexp, '_smarty_modifier_t_decoration_convert', $string);
    }

    return $converted;
}

function _smarty_modifier_t_decoration_convert($matches)
{
    $is_endtag = $matches[2];
    if ($is_endtag) {
        return '</span>';
    }
    $tagname = strtolower($matches[3]);
    $colorcode = strtolower($matches[5]);
    $classname = strtr($tagname, ':', '_');

    $opt = '';
    if ($tagname == 'op:color' && $colorcode) {
        $opt = 'style="color:' . $colorcode . '" ';
    }

    $result = '<span ' . $opt . 'class="' . $classname . '">';
    return $result;
}

?>
