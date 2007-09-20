<?php
/**
 * @license  GNU Lesser General Public License (LGPL)
 * @see      Smarty/plugins/modifier.truncate.php
 */

/**
 * Smarty t_truncate modifier plugin
 *
 * @param string $string
 * @param int    $length
 * @param string $etc
 * @param bool   $break_words
 * @return string
 */
function smarty_modifier_t_truncate($string, $length = 80, $etc = '...',
                                  $break_words = true)
{
    if ($length == 0)
        return '';

    $from = array('&amp;', '&lt;', '&gt;', '&quot;', '&#039;');
    $to   = array('&', '<', '>', '"', "'");
    $string = str_replace($from, $to, $string);

    // 全角スペースの連続によりIEでレイアウトが崩れてしまうバグへの対策
    $string = str_replace('　', ' ', $string);

    if (strlen($string) > $length) {
        $length -= strlen($etc);
        if (!$break_words)
            $string = preg_replace('/\s+?(\S+)?$/', '', substr($string, 0, $length+1));

        // 絵文字コードが含まれている場合
        $offset = 0;
        while (preg_match('/\[[a-z]:[0-9]+\]/i', $string, $matches, PREG_OFFSET_CAPTURE, $offset)) {
            if ($matches[0][1] > $length) {
                // 絵文字が切る位置より後ろなら終了
                break;
            }
            $emoji_len = strlen($matches[0][0]);

            // 次の検索の開始位置（絵文字の位置+長さ）
            $offset = $matches[0][1] + $emoji_len;

            // 絵文字は全角1文字と扱い、切る位置を延長
            $length += $emoji_len - 2;
            if ($offset > $length) {
                // 次の検索の開始位置が長さをオーバーしたらその絵文字の前までとする
                $length = $matches[0][1];
                break;
            }
        }

        $string = mb_strimwidth($string, 0, $length) . $etc;
    }
    return htmlspecialchars($string, ENT_QUOTES, 'UTF-8');
}

?>
