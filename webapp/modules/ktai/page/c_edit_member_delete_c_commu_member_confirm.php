<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_page_c_edit_member_delete_c_commu_member_confirm extends OpenPNE_Action
{
    function execute($requests)
    {
        $u  = $GLOBALS['KTAI_C_MEMBER_ID'];

        // --- リクエスト変数
        $target_c_commu_id = $requests['target_c_commu_id'];
        $target_c_member_id = $requests['target_c_member_id'];
        // ----------

        //--- 権限チェック
        //コミュニティ管理者
        //targetメンバーが管理者(＝自分)でない

        $status = db_common_commu_status($u, $target_c_commu_id);
        if (!$status['is_commu_admin']) {
            handle_kengen_error();
        }

        $status = db_common_commu_status($target_c_member_id, $target_c_commu_id);
        if ($status['is_commu_admin']) {
            handle_kengen_error();
        }

        if ($target_c_member_id == $u) {
            handle_kengen_error();
        }
        //---

        $this->set('target_c_member', db_member_c_member4c_member_id($target_c_member_id));
        $this->set("c_commu", db_commu_c_commu4c_commu_id_k($target_c_commu_id));
        $this->set("target_c_commu_id", $target_c_commu_id);
        $this->set("target_c_member_id", $target_c_member_id);

        return 'success';
    }
}

?>
