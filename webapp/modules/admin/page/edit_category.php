<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// コミュニティカテゴリ変更
class admin_page_edit_category extends OpenPNE_Action
{
    function execute($requests)
    {
        $v = array();

        $v['c_commu_category_parent_list'] = db_admin_c_commu_category_parent_list();
        $v['c_commu_category_list'] = db_admin_c_commu_category_list();

        $this->set($v);
        return 'success';
    }
}

?>
