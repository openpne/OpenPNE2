<?php
/**
 * @copyright 2005-2007 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// アクション一覧
class admin_page_list_c_action extends OpenPNE_Action
{
    function execute($requests)
    {
        $pager = array();
        $c_action_list = db_admin_get_c_action_all($requests['page'], $requests['page_size'], $pager);

        $this->set("pager", $pager);
        $this->set("c_action_list", $c_action_list);
        return 'success';
    }
}

?>
