<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_page_h_message extends OpenPNE_Action
{
    function execute($requests)
    {
        $u  = $GLOBALS['KTAI_C_MEMBER_ID'];
        $tail = $GLOBALS['KTAI_URL_TAIL'];

        // --- リクエスト変数
        $target_c_message_id = $requests['target_c_message_id'];
        $from_h_home = $requests['from_h_home'];
        // ----------

        // メッセージデータ取得
        $c_message = db_message_c_message4c_message_id($target_c_message_id);

        //--- 権限チェック
        if (!util_is_readable_message($u, $target_c_message_id)) {
            handle_kengen_error();
        }
        //---

        // 既読にする
        db_message_update_c_message_is_read4c_message_id($target_c_message_id, $u);

        // メッセージデータ
        //コミュニティおすすめメッセージのURLを置換
        list($c_message['body'], $com_url, $friend_url) = k_p_h_message_ktai_url4url($c_message['body'], $tail);
        //オリジナルファイル名取得
        $c_message['original_filename'] = db_file_original_filename4filename($c_message['filename']);

        $this->set("c_message", $c_message);
        $this->set("com_url", $com_url);
        $this->set("friend_url", $friend_url);

        //送信箱
        if ($c_message['c_member_id_from'] == $u) {
            $box = 'outbox';
        }

        $this->set("next_c_message_id", db_message_get_c_message_next_id4c_message_id($u, $target_c_message_id, $box));
        $this->set("prev_c_message_id", db_message_get_c_message_prev_id4c_message_id($u, $target_c_message_id, $box));

        return 'success';
    }
}

?>
