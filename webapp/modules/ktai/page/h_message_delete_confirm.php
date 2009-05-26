<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_page_h_message_delete_confirm extends OpenPNE_Action
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

        if ($c_message['c_member_id_to'] == $u) {  // 受信メッセージ
            if (empty($c_message['is_deleted_to'])) {
                handle_kengen_error();  // メッセージがごみ箱にない場合は権限エラー
            }
        } elseif ($c_message['c_member_id_from'] == $u) {  // 送信メッセージ
            if (empty($c_message['is_deleted_from'])) {
                handle_kengen_error();  // メッセージがごみ箱にない場合は権限エラー
            }
        }

        $this->set("c_message_id", $c_message_id);

        return 'success';
    }
}

?>
