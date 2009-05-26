<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_c_join_err_wait extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $target_c_commu_id = $requests['target_c_commu_id'];
        // ----------

        $this->set('inc_navi', fetch_inc_navi("c", $target_c_commu_id));
        $this->set('c_commu', db_commu_c_commu4c_commu_id($target_c_commu_id));

        return 'success';
    }
}

?>
