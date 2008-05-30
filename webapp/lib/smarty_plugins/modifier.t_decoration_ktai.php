<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

function smarty_modifier_t_decoration_ktai($string)
{
    $regexp = '/(&lt;|<)(\/?)(op:.+?)(?:\s+code=(&quot;|")(#[0-9a-f]{3,6})\4)?\s*(&gt;|>)/i';
    $converted = preg_replace_callback($regexp, '_smarty_modifier_t_decoration_convert_ktai', $string);

    return $converted;
}

function _smarty_modifier_t_decoration_convert_ktai($matches)
{
    $is_endtag = $matches[2];
    $tagname = strtolower($matches[3]);
    $colorcode = strtolower($matches[5]);
    $classname = strtr($tagname, ':', '_');

    $convert_list = array(
        'op:b' => 'b',
        'op:u' => 'u',
        'op:i' => 'i',
        'op:large' => 'font',
        'op:small' => 'font',
        'op:color' => 'font',
    );

    // 文字装飾タグが有効かどうか
    if (!db_decoration_is_enabled4tagname($tagname)) {
        return $matches[0];
    }

    // 変換対象かどうか
    if (!array_key_exists($tagname, $convert_list)) {
        return $value;
    }

    $c_tagname = $convert_list[$tagname];

    if ($is_endtag) {
        return '</' . $c_tagname . '>';
    }

    $opt = '';

    if ($tagname == 'op:color' && $colorcode) {
        $opt = ' color="' . $colorcode . '"';
    }

    if ($tagname == 'op:large') {
        $opt = ' size="5"';
    }

    if ($tagname == 'op:small') {
        $opt = ' size="1"';
    }

    $result = '<' . $c_tagname . $opt . '>';

    return $result;
}

?>
