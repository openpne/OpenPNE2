<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * メッセージ送信
 */
class ktai_do_f_message_send_insert_c_message extends OpenPNE_Action
{
    function execute($requests)
    {
        $tail = $GLOBALS['KTAI_URL_TAIL'];
        $u = $GLOBALS['KTAI_C_MEMBER_ID'];

        // --- リクエスト変数
        $c_member_id_to = $requests['c_member_id_to'];
        $subject = $requests['subject'];
        $body = $requests['body'];
        $save = $requests['save'];
        // ----------

        //--- 権限チェック
        //自分以外

        if ($c_member_id_to == $u) {
            handle_kengen_error();
        }

        // アクセスブロック
        if (db_member_is_access_block($u, $c_member_id_to)) {
            openpne_redirect('ktai', 'page_h_access_block');
        }
        //---

        if (is_null($subject) || $subject === '') {
            $_REQUEST['target_c_member_id'] = $c_member_id_to;
            $_REQUEST['msg'] = 2;
            openpne_forward('ktai', 'page', 'f_message_send');
            exit;
        }

        if (is_null($body) || $body === '') {
            $_REQUEST['target_c_member_id'] = $c_member_id_to;
            $_REQUEST['msg'] = 1;
            openpne_forward('ktai', 'page', 'f_message_send');
            exit;
        }

        if (is_null($save)) {
            // メッセージ送信
            db_message_send_message($u, $c_member_id_to, $subject, $body);
            $p = array('target_c_member_id' => $c_member_id_to);
            openpne_redirect('ktai', 'page_f_home', $p);
        } else {
            // 下書きメッセージ保存
            db_message_insert_message_to_is_save($c_member_id_to, $u, $subject, $body, '0');
            $p = array('box' => 'savebox');
            openpne_redirect('ktai', 'page_h_message_box', $p);
        }

    }
}

?>
