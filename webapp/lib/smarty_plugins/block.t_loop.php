<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * Smarty {t_loop}{/t_loop} block plugin
 * substitute for {foreach}{/foreach}
 *
 * @param array $params
 *     from : array
 *     start: int
 *     max  : int
 *     item : text
 * @param  string $content
 * @param  object &$smarty
 * @param  bool   &$repeat
 * @return string
 */
function smarty_block_t_loop($params, $content, &$smarty, &$repeat)
{
    static $i = 0;

    // start
    if (intval($params['start']) > 0) {
        $start = intval($params['start']);
    } else {
        $start = 0;
    }

    // item
    if (empty($params['item'])) {
        $item = 'item';
    } else {
        $item = $params['item'];
    }

    // main
    if (is_null($content)) { // initialize
        $i = $start;

        if (!isset($params['from'][$i])) {
            $repeat = false;
        } else {
            $smarty->assign($item, $params['from'][$i++]);
            $repeat = true;
        }
    } else {
        $max = $start + $params['num'];

        if ($i >= $max) {
            $repeat = false;
            if ($i > $max) $content = '';
            unset($i);
        } else {
            $repeat = true;
            // assign the next one
            $smarty->assign($item, $params['from'][$i++]);
        }
        return $content;
    }
}

?>
