<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * コミュニティ副管理者に指名メッセージ送信
 */
class pc_do_c_sub_admin_request_insert_c_commu_sub_admin_confirm extends OpenPNE_Action
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
        // targetが副管理者でない
        // targetがコミュニティメンバー
        // 自分へのメッセージ送信ではない
        // すでに管理者交代依頼メッセージ送信済みではない
        // すでに副管理者要請メッセージを送信済みでない

        $status = db_common_commu_status($u, $target_c_commu_id);
        if (!$status['is_commu_admin']) {
            handle_kengen_error();
        }

        $status = db_common_commu_status($target_c_member_id, $target_c_commu_id);
        if ($status['is_commu_sub_admin']) {
            handle_kengen_error();
        }

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

        db_commu_delete_c_commu_sub_admin_confirm4c_commu_id($target_c_commu_id);

        $target_c_commu_sub_admin_confirm_id =
            db_commu_insert_c_commu_sub_admin_confirm($target_c_commu_id, $target_c_member_id, $body);

        //メッセージ
        list($msg_subject, $msg_body) = create_message_commu_sub_admin_request($u, $body, $target_c_commu_id);
        db_message_send_message_syoudaku($u, $target_c_member_id, $msg_subject, $msg_body);

        $p = array('target_c_commu_id' => $target_c_commu_id);
        openpne_redirect('pc', 'page_c_edit_member', $p);
    }
}
?>
