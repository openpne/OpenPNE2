<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_do_h_friend_update_is_display_friend_home extends OpenPNE_Action
{
    function handleError($errors)
    {
        $_REQUEST['msg'] = array_shift($errors);
        openpne_forward('pc', 'page', 'h_manage_friend', $errors);
        exit;
    }

    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();
        $target_c_member_id = $requests['target_c_member_id'];
        $target_is_display_friend_home = $requests['target_is_display_friend_home'];
        $page = $requests['page'];

        db_friend_update_is_display_friend_home($u, $target_c_member_id, $target_is_display_friend_home);
        $param = array("page" => $page);
        openpne_redirect('pc', 'page_h_manage_friend', $param);
    }
}

?>
