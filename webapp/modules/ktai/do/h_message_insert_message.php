<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * メッセージを送る(返信用)
 */
class ktai_do_h_message_insert_message extends OpenPNE_Action
{
    function execute($requests)
    {
        $tail = $GLOBALS['KTAI_URL_TAIL'];
        $u = $GLOBALS['KTAI_C_MEMBER_ID'];

        // --- リクエスト変数
        $subject = $requests['subject'];
        $body = $requests['body'];
        $target_c_member_id = $requests['target_c_member_id'];
        $target_c_message_id = $requests['c_message_id'];
        $save = $requests['save'];
        // ----------

        if (is_null($subject) || $subject === '') {
            $p = array('target_c_message_id' => $target_c_message_id, 'msg' => 2);
            openpne_redirect('ktai', 'page_h_message', $p);
        }

        if (is_null($body) || $body === '') {
            $p = array('target_c_message_id' => $target_c_message_id, 'msg' => 1);
            openpne_redirect('ktai', 'page_h_message', $p);
        }

        //--- 権限チェック
        //自分以外
        if ($target_c_member_id == $u) {
            handle_kengen_error();
        }

        //target_c_messageが自分宛
        $target_c_message = db_message_c_message4c_message_id($target_c_message_id);
        if ($target_c_message['c_member_id_to'] != $u) {
            handle_kengen_error();
        }

        // アクセスブロック
        if (db_member_is_access_block($u, $target_c_member_id)) {
            openpne_redirect('ktai', 'page_h_access_block');
        }
        //---


        if (is_null($save)) {
            //返信済みにする
            db_message_update_is_hensin($target_c_message_id);

            db_message_send_message($u, $target_c_member_id, $subject, $body);
        }
        else {
            // 下書きメッセージ保存
            db_message_insert_message_to_is_save($target_c_member_id, $u, $subject, $body, $target_c_message_id);
        }

        openpne_redirect('ktai', 'page_h_message_box');
    }
}

?>
