<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * コミュ参加承認
 */
class ktai_do_h_confirm_list_insert_c_commu_member extends OpenPNE_Action
{
    function execute($requests)
    {
        $tail = $GLOBALS['KTAI_URL_TAIL'];
        $u = $GLOBALS['KTAI_C_MEMBER_ID'];

        // --- リクエスト変数
        $target_c_commu_member_confirm_id = $requests['target_c_commu_member_confirm_id'];
        // ----------

        //--- 権限チェック
        //コミュ参加承認を受けている人

        $cmc = db_commu_c_commu_member_confirm4c_commu_member_confirm_id($target_c_commu_member_confirm_id);

        if ($cmc['c_member_id_admin'] != $u && $cmc['c_member_id_sub_admin'] != $u) {
            handle_kengen_error();
        }
        //---

        db_commu_insert_c_commu_member($target_c_commu_member_confirm_id);

        $p = array('msg' => 3);
        openpne_redirect('ktai', 'page_h_confirm_list', $p);
    }
}

?>
