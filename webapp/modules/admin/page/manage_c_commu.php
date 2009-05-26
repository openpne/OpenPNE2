<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// コミュニティ管理
class admin_page_manage_c_commu extends OpenPNE_Action
{
    function execute($requests)
    {
        $c_commu_list = array();
        $list = db_commu_regist_join_list();
        foreach ($list as $c_commu_id) {
            $c_commu_list[] = db_commu_c_commu4c_commu_id($c_commu_id);
        }
        $this->set('c_commu_list', $c_commu_list);
        return 'success';
    }
}

?>
