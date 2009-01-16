<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_c_sub_admin_request_confirm extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $target_c_member_id = $requests['target_c_member_id'];
        $target_c_commu_id = $requests['target_c_commu_id'];
        $body = $requests['body'];
        // ----------

        //--- 権限チェック
        // 自分がコミュニティ管理者
        // 自分がコミュニティ副管理者ではない
        // targetがコミュニティメンバー
        // 自分へのメッセージ送信ではない
        // すでに管理者交代依頼メッセージ送信済みではない
        // すでに副管理者要請メッセージを送信済みでない

        $status = db_common_commu_status($u, $target_c_commu_id);
        if (!$status['is_commu_admin']) {
            handle_kengen_error();
        }
        if ($status['is_commu_sub_admin']) {
            handle_kengen_error();
        }

        $status = db_common_commu_status($target_c_member_id, $target_c_commu_id);
        if (!$status['is_commu_member']) {
            handle_kengen_error();
        }

        if ($u == $target_c_member_id) {
            handle_kengen_error();
        }

        $target_c_commu_admin_confirm_list =
            db_commu_anatani_c_commu_admin_confirm_list4c_member_id($target_c_member_id);
        if (!empty($target_c_commu_admin_confirm_list)) {
            foreach ($target_c_commu_admin_confirm_list as $value) {
                if ($value['c_commu_id'] == $target_c_commu_id) {
                    handle_kengen_error();
                }
            }
        }

        $target_c_commu_sub_admin_confirm_list =
        db_commu_anatani_c_commu_sub_admin_confirm_list4c_member_id($target_c_member_id);
        if (!empty($target_c_commu_sub_admin_confirm_list)) {
            foreach ($target_c_commu_sub_admin_confirm_list as $value) {
                if ($value['c_commu_id'] == $target_c_commu_id) {
                    handle_kengen_error();
                }
            }
        }
        //---

        $this->set('inc_navi', fetch_inc_navi("c", $target_c_commu_id));
        $this->set("target_c_member_id", $target_c_member_id);
        $this->set('target_c_member', db_member_c_member4c_member_id_LIGHT($target_c_member_id));
        $this->set("target_c_commu_id", $target_c_commu_id);
        $this->set("body", $body);

        return 'success';
    }
}

?>
