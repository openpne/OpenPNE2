<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * フレンドリクエストを送る
 */
class pc_do_f_link_request_insert_c_friend_confirm extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $target_c_member_id = $requests['target_c_member_id'];
        $body = $requests['body'];
        // ----------

        //--- 権限チェック
        //フレンドでない or フレンド承認中でない

        $status = db_friend_status($u, $target_c_member_id);
        if ($status['is_friend']) {
            $p = array('target_c_member_id' => $target_c_member_id);
            openpne_redirect('pc', 'page_f_link_request_err_already', $p);
        } elseif ($status['is_friend_confirm']) {
            $p = array('target_c_member_id' => $target_c_member_id);
            openpne_redirect('pc', 'page_f_link_request_err_wait', $p);
        }

        //アクセスブロック設定
        if (db_member_is_access_block($u, $target_c_member_id)) {
            openpne_redirect('pc', 'page_h_access_block');
        }
        //---


        $c_member_id_from = $u;

        db_friend_insert_c_friend_confirm($c_member_id_from, $target_c_member_id, $body);

        list($subject, $body_disp) = create_message_friend_link_request($c_member_id_from, $body);
        db_message_send_message_syoudaku($c_member_id_from, $target_c_member_id, $subject, $body_disp);

        $p = array('target_c_member_id' => $target_c_member_id);
        openpne_redirect('pc', 'page_f_home', $p);
    }
}

?>
