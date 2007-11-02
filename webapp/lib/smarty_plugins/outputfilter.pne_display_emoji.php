<?php

/**
 * 「[c:NNN]」形式の絵文字コードをHTML表示用に変換するアウトプットフィルタ
 */
function smarty_outputfilter_pne_display_emoji($tpl_output, &$smarty)
{
    global $list;
    $list = array();

    if (empty($GLOBALS['__Framework']['carrier'])) {
        // input, textarea を退避
        $regexp = '/<input[^>]+>/is';
        $tpl_output = preg_replace_callback($regexp, '_smarty_outputfilter_pne_display_emoji_callback', $tpl_output);

        $regexp = '/<textarea[^>]+>.*?<\/textarea>/is';
        $tpl_output = preg_replace_callback($regexp, '_smarty_outputfilter_pne_display_emoji_callback', $tpl_output);
    }

    // 絵文字変換
    $tpl_output = emoji_convert($tpl_output);

    if (empty($GLOBALS['__Framework']['carrier'])) {
        // input, textarea を元に戻す
        $tpl_output = str_replace(array_keys($list), array_values($list), $tpl_output);
    }

    return $tpl_output;
}

function _smarty_outputfilter_pne_display_emoji_callback($matches)
{
    global $list;
    static $i = 0;

    $replacement = '<<<NOEMOJI:'.$i.'>>>';
    $list[$replacement] = $matches[0];
    $i++;

    return $replacement;
}

?>
