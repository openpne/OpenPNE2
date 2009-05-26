<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_page_h_message_trash_confirm extends OpenPNE_Action
{
    function execute($requests)
    {
        $u  = $GLOBALS['KTAI_C_MEMBER_ID'];

        // --- リクエスト変数
        $c_message_id = $requests['c_message_id'];
        // ----------

        $c_message = db_message_c_message4c_message_id($c_message_id);

        if (!util_is_readable_message($u, $c_message_id)) {
            handle_kengen_error();
        }

        // メッセージがすでに $u のごみ箱にある場合は権限エラー
        if ($c_message['c_member_id_to'] == $u
            && !empty($c_message['is_deleted_to'])) {  // 受信メッセージ
            handle_kengen_error();
        } elseif($c_message['c_member_id_from'] == $u
            && !empty($c_message['is_deleted_from'])) {  // 送信メッセージ
            handle_kengen_error();
        }

        $this->set("c_message_id", $c_message_id);

        return 'success';
    }
}

?>
