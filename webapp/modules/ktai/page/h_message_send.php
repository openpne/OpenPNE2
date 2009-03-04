<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_page_h_message_send extends OpenPNE_Action
{
    function execute($requests)
    {
        $u  = $GLOBALS['KTAI_C_MEMBER_ID'];

        //ランダム５０人のフレンド
        $this->set("c_friend_list", db_friend_ktai_c_friend_list_random4c_member_id($u));

        // --- リクエスト変数
        $form_val['target_c_message_id'] = $requests['target_c_message_id'];
        // ----------

        //メッセージIDから情報を取り出す
        if (isset($form_val['target_c_message_id'])) {
            $c_message = db_message_c_message4c_message_id($form_val['target_c_message_id']);

            $form_val['body'] = $c_message['body'];
            $form_val['subject'] = $c_message['subject'];
            $form_val['target_c_message_id'] = $c_message['c_message_id'];
            $form_val['hensinmoto_c_message_id'] = $c_message['hensinmoto_c_message_id'];
            $this->set("form_val", $form_val);

            if (isset($c_message['c_member_id_to'])) {
                $this->set("target_c_member", db_member_c_member4c_member_id_LIGHT($c_message['c_member_id_to']));
            }
        }

        return 'success';
    }
}

?>
