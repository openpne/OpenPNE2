<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * コミュニティ参加リクエスト
 */
class pc_do_c_join_request_insert_c_commu_member_confirm extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $target_c_commu_id = $requests['target_c_commu_id'];
        $body = $requests['body'];
        // ----------

        //--- 権限チェック
        //コミュニティメンバーでない or 参加承認中でない

        $status = db_common_commu_status($u, $target_c_commu_id);
        if ($status['is_commu_member'] ||
            $status['is_commu_member_confirm']) {
            handle_kengen_error();
        }
        //---


        $c_member_id_from = $u;

        db_commu_insert_c_commu_member_confirm($target_c_commu_id, $c_member_id_from, $body);

        //メッセージ
        $c_commu = db_commu_c_commu4c_commu_id($target_c_commu_id);

        list($subject, $body_disp) = create_message_commu_join_request($c_member_id_from, $body, $target_c_commu_id);
        db_message_send_message_syoudaku($c_member_id_from, $c_commu['c_member_id_admin'], $subject, $body_disp);
        if ($c_commu['c_member_id_sub_admin']) {
            db_message_send_message_syoudaku($c_member_id_from, $c_commu['c_member_id_sub_admin'], $subject, $body_disp);
        }
        $p = array('target_c_commu_id' => $target_c_commu_id);
        openpne_redirect('pc', 'page_c_home', $p);
    }
}

?>
