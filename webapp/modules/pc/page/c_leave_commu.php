<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_c_leave_commu extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $target_c_commu_id = $requests['target_c_commu_id'];
        // ----------

        $is_admin  = db_commu_is_c_commu_admin($target_c_commu_id, $u);
        $is_member = db_commu_is_c_commu_member($target_c_commu_id, $u);

        if ($is_admin) {
            $p = array('target_c_commu_id' => $target_c_commu_id);
            openpne_redirect('pc', 'page_c_taikai_err_admin', $p);
        }

        if (!$is_member) {
            $p = array('target_c_commu_id' => $target_c_commu_id);
            openpne_redirect('pc', 'page_c_taikai_err_no_member', $p);
        }

        $this->set('inc_navi', fetch_inc_navi("c", $target_c_commu_id));
        $this->set('c_commu', db_commu_c_commu4c_commu_id($target_c_commu_id));

        return 'success';
    }
}

?>
