<?php
/**
 * @copyright 2005-2007 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

function smarty_function_t_assign_rss($params, &$smarty)
{
    if (empty($params['var'])) {
        return;
    }
    if (empty($params['url'])) {
        return;
    }

    require_once 'OpenPNE/RSS.php';
    $rss = new OpenPNE_RSS();
    if (!$items = $rss->fetch($params['url'])) {
        $rss_data = array();
    } else {
        $rss_data = $items;
    }
    $smarty->assign($params['var'], $rss_data);
}

?>
