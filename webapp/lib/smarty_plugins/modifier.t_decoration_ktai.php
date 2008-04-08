<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

function smarty_modifier_t_decoration_ktai($string)
{
    $regexp = '/(&lt;|<)(op:.+?)(?:\s+code=(&quot;|")(#[0-9a-f]{3,6})\3)?\s*(&gt;|>)(.*?)\1\/\2\5/ims';
    $converted =  preg_replace_callback($regexp, '_smarty_modifier_t_decoration_convert_ktai', $string);

    return $converted;
}

function _smarty_modifier_t_decoration_convert_ktai($matches)
{
    $tagname = strtolower($matches[2]);
    $colorcode = strtolower($matches[4]);
    $classname = strtr($tagname, ':', '_');
    $value = smarty_modifier_t_decoration_ktai($matches[6]);

    $convert_list = array(
        'op:b' => 'b',
        'op:u' => 'u',
        'op:i' => 'i',
        'op:large' => 'font size="5"',
        'op:small' => 'font size="1"',
        'op:color' => 'font',
    );

    // 文字装飾タグが有効かどうか
    if (!db_decoration_is_enabled4tagname($tagname)) {
        return $matches[0];
    }

    // 変換対象かどうか
    if (!($c_tagname = $convert_list[$tagname])) {
        return $matches[6];
    }

    $opt = '';
    if ($tagname == 'op:color' && $colorcode) {
        $opt = ' color="' . $colorcode . '" ';
    }

    $result = '<' . $c_tagname . $opt . '>' . $value . '</' . $c_tagname . '>';

    return $result;
}

?>
