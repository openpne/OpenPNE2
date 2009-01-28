<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// フリーページ一覧
class admin_page_list_c_free_page extends OpenPNE_Action
{
    function execute($requests)
    {
        $pager = array();
        $list  = db_admin_get_c_free_page_all($requests['page'], $requests['page_size'], $pager);

        $this->set("pager", $pager);
        $this->set("c_free_page_list", $list);
        return 'success';
    }
}

?>
