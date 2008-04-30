<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * コミュ副管理者承認
 */
class ktai_do_h_confirm_list_update_c_commu_sub_admin_confirm extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['KTAI_C_MEMBER_ID'];


        // --- リクエスト変数
        $target_c_commu_sub_admin_confirm_id = $requests['target_c_commu_sub_admin_confirm_id'];
        // ----------

        //--- 権限チェック
        //コミュニティ副管理者を受けているメンバー
        //コミュニティ管理者でない

        $sub_admin_confirm = db_c_commu_sub_admin_confirm4c_commu_sub_admin_confirm_id($target_c_commu_sub_admin_confirm_id);

        if ($sub_admin_confirm['c_member_id_to'] != $u) {
            handle_kengen_error();
        }

        if ($sub_admin_confirm['c_member_id_admin'] == $u) {
            handle_kengen_error();
        }
        // -----


        db_commu_update_c_commu_c_member_id_sub_admin($sub_admin_confirm['c_commu_id'], $u);

        $p = array('msg' => 3);
        openpne_redirect('ktai', 'page_h_confirm_list', $p);
    }
}

?>
