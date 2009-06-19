<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_h_message extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $target_c_message_id = $requests['target_c_message_id'];
        $from_h_home = $requests['from_h_home'];
        $form_val['subject'] = $requests['subject'];
        $form_val['body'] = $requests['body'];
        $box = $requests['box'];
        $jyusin_c_message_id = $requests['jyusin_c_message_id'];
        // ----------

        $form_val['target_c_message_id'] = $target_c_message_id;

        $this->set('inc_navi', fetch_inc_navi("h"));

        // 既読にする
        db_message_update_c_message_is_read4c_message_id($target_c_message_id, $u);

        //---- 受信・送信、閲覧権限のチェック ----//
        // メッセージデータ取得
        $c_message = db_message_c_message4c_message_id2($target_c_message_id, $u);
        $c_message['original_filename'] = db_file_original_filename4filename($c_message['filename']);

        if ($c_message['c_member_id_from'] == $u && $box === 'inbox') {
            $box = 'outbox';
        }

        if ($c_message['c_member_id_to'] == $u && $box === 'outbox') {
            $box = 'inbox';
        }

        if (!$form_val['subject'])
            $form_val['subject'] = "Re:".$c_message['subject'];

        //--- 権限チェック
        if (!util_is_readable_message($u, $target_c_message_id)) {
            handle_kengen_error();
        }
        //---

        // is_syoudakuがあれば承認待ちリストへリダイレクト
        if ($c_message['is_syoudaku'] && $from_h_home == 1) {
            openpne_redirect('pc', 'page_h_confirm_list');
        }

        //---- ページ本体表示用 変数 ----//

        // メッセージデータ
        $this->set("c_message", $c_message);
        $this->set("form_val", $form_val);
        $this->set("jyusin_c_message_id", $jyusin_c_message_id);

        $this->set("next_c_message_id", db_message_get_c_message_next_id4c_message_id($u, $target_c_message_id, $box));
        $this->set("prev_c_message_id", db_message_get_c_message_prev_id4c_message_id($u, $target_c_message_id, $box));


        //ボックス判定
        $this->set("box", $box);

        //---- ページ表示 ----//
        return 'success';
    }
}

?>
