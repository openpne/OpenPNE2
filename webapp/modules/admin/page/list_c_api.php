<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// API使用一覧
class admin_page_list_c_api extends OpenPNE_Action
{
    function execute($requests)
    {
        $pager = array();
        $c_api_list = db_admin_get_c_api_all($requests['page'], $requests['page_size'], $pager);

        $this->set("pager", $pager);
        $this->set("c_api_list", $c_api_list);
        return 'success';
    }
}

?>
