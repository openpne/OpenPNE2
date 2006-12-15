<?php
/**
 * @copyright 2005-2006 OpenPNE Project
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
        // ----------

        //--- 権限チェック
        //自分がコミュニティ管理者
        //targetが副管理者でない
        //targetがコミュニティメンバー

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
        //---

        db_commu_delete_c_commu_sub_admin_confirm4c_commu_id($target_c_commu_id);

        $target_c_commu_sub_admin_confirm_id =
            db_commu_insert_c_commu_sub_admin_confirm($target_c_commu_id, $target_c_member_id);

        //メッセージ
        $c_member_id_from = $u;
        $c_member_from    = db_common_c_member4c_member_id_LIGHT($c_member_id_from);
        $c_member_to      = $target_c_member_id;
        $c_commu          = _db_c_commu4c_commu_id($target_c_commu_id);

        $subject ="副管理者要請メッセージ";
        $body_disp =
            $c_member_from['nickname']." さんから".$c_commu['name']." コミュニティの副管理者希望メッセージが届いています。\n".
            "\n".
            "この要請について、承認待ちリストから承認または拒否を選択してください。\n";

        do_common_send_message_syoudaku($c_member_id_from, $target_c_member_id, $subject, $body_disp);

        $p = array('target_c_commu_id' => $target_c_commu_id);
        openpne_redirect('pc', 'page_c_edit_member', $p);
    }
}
?>
