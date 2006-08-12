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

    if (strlen($string) > $length) {
        $length -= strlen($etc);
        if (!$break_words)
            $string = preg_replace('/\s+?(\S+)?$/', '', substr($string, 0, $length+1));

        $string = mb_strimwidth($string, 0, $length) . $etc;
    }
    return htmlspecialchars($string, ENT_QUOTES, 'UTF-8');
}

?>
