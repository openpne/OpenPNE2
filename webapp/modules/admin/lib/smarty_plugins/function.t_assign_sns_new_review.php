<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

function smarty_function_t_assign_sns_new_review($params, &$smarty)
{
    if (empty($params['var'])) {
        return array();
    }

    $result = array_shift(monitor_review_list('', 5, 1));

    $smarty->assign($params['var'], $result);
}
?>
