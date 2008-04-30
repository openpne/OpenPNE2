<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_page_c_delete_image_confirm extends OpenPNE_Action
{
    function execute($requests)
    {
        $u  = $GLOBALS['KTAI_C_MEMBER_ID'];

        // --- リクエスト変数
        $target_c_commu_id = $requests['target_c_commu_id'];
        // ----------

        $c_commu = db_commu_c_commu4c_commu_id($target_c_commu_id);

        //--- 権限チェック
        $status = db_common_commu_status($u, $target_c_commu_id);
        if (!$status['is_commu_admin'] && !$status['is_commu_sub_admin']) {
            handle_kengen_error();
        }
        //---

        if (empty($c_commu['image_filename'])) {
            handle_kengen_error();
        }

        $this->set('c_commu', $c_commu);

        return 'success';
    }
}

?>
