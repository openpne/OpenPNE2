<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_page_f_message_send extends OpenPNE_Action
{
    function execute($requests)
    {
        $u  = $GLOBALS['KTAI_C_MEMBER_ID'];

        // --- リクエスト変数
        $target_c_member_id = $requests['target_c_member_id'];
        $subject = $requests['subject'];
        $body = $requests['body'];
        // ----------

        if (db_member_is_access_block($u, $target_c_member_id)) {
            openpne_redirect('ktai', 'page_h_access_block');
        }

        if ($target_c_member_id == $u) {  // 自分にメッセージは送れない
            handle_kengen_error();
        }

        //ターゲットの情報
        $this->set("target_c_member", db_member_c_member4c_member_id_LIGHT($target_c_member_id));

        $form_val = array();
        $form_val['subject'] = $subject;
        $form_val['body'] = $body;
        $this->set("form_val", $form_val);

        return 'success';
    }
}

?>
