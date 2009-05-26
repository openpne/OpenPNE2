<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

function smarty_function_t_assign_sns_new_topic($params, &$smarty)
{
    if (empty($params['var'])) {
        return array();
    }

    $result = monitor_new_topic_list(5);

    $smarty->assign($params['var'], $result);
}

?>
