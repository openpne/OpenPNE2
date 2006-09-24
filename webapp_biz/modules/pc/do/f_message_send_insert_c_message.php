<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_0.txt PHP License 3.0
 */

/**
 * メッセージ送信
 */
class pc_do_f_message_send_insert_c_message extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $c_member_id_to = $requests['c_member_id_to'];
        $subject = $requests['subject'];
        $body = $requests['body'];
        // ----------

        $msg1 = "";
        $msg2 = "";

        if (null == $subject) {
            $msg1 = "件名を入力してください";
        }
        if (null == $body){
            $msg2 = "メッセージを入力してください";
        }

        if ($msg1 || $msg2) {
            $p = array(
                'target_c_member_id' => $c_member_id_to,
                'target_c_message_id' => $requests['target_c_message_id'],
                'jyusin_c_message_id' => $requests['jyusin_c_message_id'],
                'body' => $requests['body'],
                'subject' => $requests['subject'],
                'msg1' => $msg1,
                'msg2' => $msg2,
            );
            openpne_redirect('pc', 'page_f_message_send', $p);
        }

        //修正
        if ($requests['no']) {
            $p = array(
                'target_c_member_id' => $c_member_id_to,
                'target_c_message_id' => $requests['target_c_message_id'],
                'jyusin_c_message_id' => $requests['jyusin_c_message_id'],
                'body' => $requests['body'],
                'subject' => $requests['subject'],
            );
            openpne_redirect('pc', 'page_f_message_send', $p);
        }

        //--- 権限チェック
        //送信先が自分以外

        if ($c_member_id_to == $u) {
            handle_kengen_error();
        }

        //アクセスブロック設定
        if (p_common_is_access_block($u, $c_member_id_to)) {
            openpne_redirect('pc', 'page_h_access_block');
        }
        //---

        //返信済みにする
        if ($requests['jyusin_c_message_id']) {
            do_update_is_hensin($requests['jyusin_c_message_id']);
        }

        //下書き保存が存在しない
        if ($requests['target_c_message_id'] == $requests['jyusin_c_message_id']) {
            do_common_send_message($u, $c_member_id_to, $subject, $body);
        } else {
            update_message_to_is_save($requests['target_c_message_id'], $subject, $body, 1);
        }

        // ---bizここから
        $biz_dir = OPENPNE_MODULES_BIZ_DIR.'/biz/';  //bizモジュールディレクトリの定義
        include_once($biz_dir.'lib/mysql_functions.php');  //bizモジュールよりライブラリを拝借

        if(biz_isKtaiMessage($c_member_id_to))
            biz_sendKtaiMessage($u, $c_member_id_to, $subject, $body);
        // ---bizここまで


        $p = array('msg' => 1);
        openpne_redirect('pc', 'page_h_reply_message', $p);
    }
}

?>
