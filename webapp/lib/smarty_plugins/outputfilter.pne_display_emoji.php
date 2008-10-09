<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * 「[c:NNN]」形式の絵文字コードをHTML表示用に変換するアウトプットフィルタ
 */
function smarty_outputfilter_pne_display_emoji($tpl_output, &$smarty)
{
    $list = array();

    if (empty($GLOBALS['__Framework']['carrier'])) {
        // 置換用に文字列を退避
        list($list, $tpl_output) = util_replace_patterns_to_marker($tpl_output);
    }

    // 絵文字変換
    $tpl_output = emoji_convert($tpl_output);

    if (empty($GLOBALS['__Framework']['carrier'])) {
        // 退避した文字列を元に戻す
        $tpl_output = str_replace(array_keys($list), array_values($list), $tpl_output);
    }

    return $tpl_output;
}

?>
