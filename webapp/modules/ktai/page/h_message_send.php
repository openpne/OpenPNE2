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
        $this->set('c_friend_list', db_friend_ktai_c_friend_list_random4c_member_id($u));

        // --- リクエスト変数
        $target_c_member_id = $requests['target_c_member_id'];
        $subject = $requests['subject'];
        $body = $requests['body'];
        // ----------

        $form_val = array();
        $form_val['subject'] = $subject;
        $form_val['body'] = $body;
        $form_val['target_c_member_id'] = $target_c_member_id;
        $this->set('form_val', $form_val);

        return 'success';
    }
}

?>
