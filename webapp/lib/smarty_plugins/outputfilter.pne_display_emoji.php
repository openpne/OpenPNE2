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
        // input, textarea, option, img, head を退避
        $patterns = array(
            '/<input[^>]+>/is',
            '/<textarea.*?<\/textarea>/is',
            '/<option.*?<\/option>/is',
            '/<img[^>]+>/is',
            '/<head.*?<\/head>/is',
        );

        list ($list, $tpl_output) = _smarty_outputfilter_pne_display_emoji_replace($patterns, $tpl_output);
    }

    // 絵文字変換
    $tpl_output = emoji_convert($tpl_output);

    if (empty($GLOBALS['__Framework']['carrier'])) {
        // input, textarea, option, img, head を元に戻す
        $tpl_output = str_replace(array_keys($list), array_values($list), $tpl_output);
    }

    return $tpl_output;
}

function _smarty_outputfilter_pne_display_emoji_replace($patterns, $subject)
{
    $i = 0;
    $list = array();

    foreach ($patterns as $pattern) {
        if (preg_match_all($pattern, $subject, $matches)) {
            foreach ($matches[0] as $match) {
                $replacement = '<<<NOEMOJI:'.$i.'>>>';
                $list[$replacement] = $match;
                $i++;
            }
        }
    }

    $subject = str_replace(array_values($list), array_keys($list), $subject);

    return array($list, $subject);
}

?>
