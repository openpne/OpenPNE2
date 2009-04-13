<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_do_h_commu_update_is_display_topic_home extends OpenPNE_Action
{
    function handleError($errors)
    {
        $_REQUEST['msg'] = array_shift($errors);
        openpne_forward('pc', 'page', 'h_manage_commu', $errors);
        exit;
    }

    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();
        $target_c_commu_id = $requests['target_c_commu_id'];
        $target_is_display_topic_home = $requests['target_is_display_topic_home'];
        $page = $requests['page'];

        db_commu_update_is_display_topic_home($target_c_commu_id, $u, $target_is_display_topic_home);
        $param = array("page" => $page);
        openpne_redirect('pc', 'page_h_manage_commu', $param);
    }
}

?>
