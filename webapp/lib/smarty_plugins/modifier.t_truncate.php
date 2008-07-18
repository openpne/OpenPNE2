<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * 指定された幅で文字列を切り取る
 *
 * @param string $string
 * @param int    $width
 * @param string $etc
 * @param int    $rows
 * @param bool   $is_html
 * @return string
 */
function smarty_modifier_t_truncate($string, $width = 80, $etc = '', $rows = 1, $is_html = true)
{
    $rows = (int)$rows;
    if (!($rows > 0)) {
        $rows = 1;
    }

    // 特殊文字を変換
    $trans = array(
        // 改行削除
        "\r\n" => ' ',
        "\r" => ' ',
        "\n" => ' ',
    );

    // HTMLとして表示する際の特殊文字を変換
    if ($is_html) {
        $trans += array(
            // htmlspecialchars
            '&amp;' => '&',
            '&lt;' => '<',
            '&gt;' => '>',
            '&quot;' => '"',
            '&#039;' => "'",
            // 全角スペースの連続によりIEでレイアウトが崩れてしまう不具合への対策
            '　' => ' ',
        );
    }
    $string = strtr($string, $trans);

    // 複数行対応
    $result = array();
    $p_string = $string;
    for ($i = 1; $i <= $rows; $i++) {
        // 最終行のみ $etc を反映
        if ($i === $rows) {
            $p_etc = $etc;
        } else {
            $p_etc = '';
        }

        if ($i > 0) {
            // 前行の分を切り取り
            $p_string = substr($p_string, strlen($result[$i - 1]));
            if (!$p_string) {
                break;
            }
        }

        $result[$i] .= smarty_modifier_t_truncate_callback($p_string, $width, $p_etc);
    }
    $string = implode("\n", $result);

    if ($is_html) {
        $string = htmlspecialchars($string, ENT_QUOTES, 'UTF-8');
    }

    return nl2br($string);
}

function smarty_modifier_t_truncate_callback($string, $width, $etc = '')
{
    // 入力文字列の幅が大きい場合は切り取り
    if (mb_strwidth($string) > $width) {
        $width = $width - mb_strwidth($etc);

        // 絵文字対応
        $offset = 0;
        $tmp_string = $string;
        while (preg_match('/\[[ies]:[0-9]{1,3}\]/', $tmp_string, $matches, PREG_OFFSET_CAPTURE)) {
            $emoji_str = $matches[0][0];
            $emoji_pos = $matches[0][1] + $offset;
            $emoji_len = strlen($emoji_str);
            $emoji_width = $emoji_len; // ASCIIなのでstrlenでOK

            // 絵文字直前までの文字列の幅
            $substr_width = mb_strwidth(substr($string, 0, $emoji_pos));

            // 絵文字がwidth位置より後ろ
            if ($substr_width >= $width) {
                break;
            }

            // 絵文字分を足してちょうどwidthと等しい
            if ($substr_width + 2 == $width) {
                $width = $substr_width + $emoji_width;
                break;
            }

            // 絵文字分を足すとwidthより大きい
            if ($substr_width + 2 > $width) {
                $width = $substr_width;
                break;
            }

            // 絵文字分を足してもwidthより小さい
            $offset = $emoji_pos + $emoji_len;
            $width = $width + $emoji_width - 2;

            $tmp_string = substr($string, $offset);
        }

        $string = mb_strimwidth($string, 0, $width) . $etc;
    }

    return $string;
}

?>
