<?php
/**
 * @copyright 2005-2007 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * 指定された幅で文字列を切り取る
 *
 * @param string $string
 * @param int    $width
 * @param string $etc
 * @return string
 */
function smarty_modifier_t_truncate($string, $width = 80, $etc = '...')
{
    // 特殊文字を変換
    $trans = array(
        // htmlspecialchars
        '&amp;' => '&',
        '&lt;' => '<',
        '&gt;' => '>',
        '&quot;' => '"',
        '&#039;' => "'",
        // 全角スペースの連続によりIEでレイアウトが崩れてしまう不具合への対策
        '　' => ' ',
        // 改行削除
        "\r\n" => ' ',
        "\r" => ' ',
        "\n" => ' ',
    );
    $string = strtr($string, $trans);

    // 入力文字列の幅が大きい場合は切り取り
    if (mb_strwidth($string) > $width) {
        $width = $width - mb_strwidth($etc);

        // 絵文字対応
        $offset = 0;
        while (preg_match('/\[[a-z]:[0-9]+\]/i', $string, $matches, PREG_OFFSET_CAPTURE, $offset)) {
            $emoji_str = $matches[0][0];
            $emoji_pos = $matches[0][1];
            $emoji_len = strlen($emoji_str);
            $emoji_width = $emoji_len; // ASCIIなのでstrlenでOK
            
            $substr_width = mb_strwidth(substr($string, 0, $emoji_pos));
            
            // 絵文字がwidth位置より後ろ
            if ($substr_width >= $width) {
                break;
            }

            // 絵文字分を足してちょうどwidthと等しい
            if ($substr_width + 2 == $width) {
                $width = $width + $emoji_width;
                break;
            }

            // 絵文字分を足すとwidthより大きい
            if ($substr_width + 2 > $width) {
                $width = $substr_width;
                break;
            }

            // 絵文字分を足してもwidthより小さい
            $offset = $matches[0][1] + $emoji_len;
            $width = $width + $emoji_width - 2;
        }

        $string = mb_strimwidth($string, 0, $width) . $etc;
    }

    return htmlspecialchars($string, ENT_QUOTES, 'UTF-8');
}

?>
