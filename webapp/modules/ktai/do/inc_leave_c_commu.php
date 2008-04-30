<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * コミュニティから退会
 */
class ktai_do_inc_leave_c_commu extends OpenPNE_Action
{
    function execute($requests)
    {
        $tail = $GLOBALS['KTAI_URL_TAIL'];
        $u = $GLOBALS['KTAI_C_MEMBER_ID'];

        // --- リクエスト変数
        $target_c_commu_id = $requests['target_c_commu_id'];
        // ----------

        //--- 権限チェック
        //コミュニティメンバー and 管理者でない

        $is_admin  = db_commu_is_c_commu_admin($target_c_commu_id, $u);
        $is_member = db_commu_is_c_commu_member($target_c_commu_id, $u);

        if ($is_admin) {
            ktai_display_error(k_p_common_msg4msg_id(10));
        }
        if (!$is_member) {
            ktai_display_error(k_p_common_msg4msg_id(11));
        }
        //---

        db_commu_delete_c_commu_member($target_c_commu_id, $u);

        $p = array('target_c_commu_id' => $target_c_commu_id);
        openpne_redirect('ktai', 'page_c_home', $p);
    }
}

?>
