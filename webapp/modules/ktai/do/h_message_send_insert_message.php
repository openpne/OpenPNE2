<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_do_h_message_send_insert_message extends OpenPNE_Action
{
    function execute($requests)
    {
        $tail = $GLOBALS['KTAI_URL_TAIL'];
        $u = $GLOBALS['KTAI_C_MEMBER_ID'];

        // --- リクエスト変数
        $subject = $requests['subject'];
        $body = $requests['body'];
        $target_c_member_id = $requests['target_c_member_id'];
        $target_c_message_id = $requests['target_c_message_id'];
        $hensinmoto_c_message_id = $requests['hensinmoto_c_message_id'];
        $save = $requests['save'];
        // ----------

        if (is_null($subject) || $subject === '') {
            $_REQUEST['target_c_message_id'] = $target_c_message_id;
            $_REQUEST['msg'] = 2;
            openpne_forward('ktai', 'page', 'h_message_send');
            exit;
        }

        if (is_null($body) || $body === '') {
            $_REQUEST['target_c_message_id'] = $target_c_message_id;
            $_REQUEST['msg'] = 1;
            openpne_forward('ktai', 'page', 'h_message_send');
            exit;
        }

        //--- 権限チェック
        //自分以外
        if ($target_c_member_id == $u) {
            handle_kengen_error();
        }

        //存在しないメンバー
        $target_member = db_member_c_member4c_member_id($target_c_member_id);
        if (empty($target_member)) {
            handle_kengen_error();
        }

        //アクセスブロック設定
        if (db_member_is_access_block($u, $target_c_member_id)) {
            openpne_redirect('ktai', 'page_h_access_block');
        }

        if ($hensinmoto_c_message_id) {
            $c_message = db_message_c_message4c_message_id($hensinmoto_c_message_id);
            if ($c_message['c_member_id_to'] != $u || !$c_message['is_send']) {
                handle_kengen_error();
            }
        }

        if ($target_c_message_id != $hensinmoto_c_message_id) {
            $c_message = db_message_c_message4c_message_id($target_c_message_id);
            if ($c_message['c_member_id_from'] != $u || $c_message['is_send']) {
                handle_kengen_error();
            }
        }
        //---


        $c_member_id_from = $u;
        $c_member_id_to = $target_c_member_id;

        if (is_null($save)) {
            if (!isset($target_c_message_id)) {
                // 新規メッセージ送信
                db_message_send_message($c_member_id_from, $c_member_id_to, $subject, $body);
            } else {
                // 下書きメッセージ送信
                db_message_update_message_to_is_save($target_c_message_id, $subject, $body, 1);
                do_common_send_message_mail_send($c_member_id_to, $c_member_id_from, $subject, $body, $target_c_message_id);
                do_common_send_message_mail_send_ktai($c_member_id_to, $c_member_id_from, $subject, $body);

                // 返信済みにする
                if (isset($hensinmoto_c_message_id)) {
                    db_message_update_is_hensin($hensinmoto_c_message_id);
                }
            }

            $p = array('box' => 'outbox');
        } else {
            if (!isset($target_c_message_id)) {
                // 下書きメッセージ新規保存
                db_message_insert_message_to_is_save($c_member_id_to, $c_member_id_from, $subject, $body, $hensinmoto_c_message_id);
            } else {
                // 下書きメッセージ更新
                db_message_update_message_to_is_save($target_c_message_id, $subject, $body);
            }

            $p = array('box' => 'savebox');
        }

        openpne_redirect('ktai', 'page_h_message_box', $p);
    }
}

?>
