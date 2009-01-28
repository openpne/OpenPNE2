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
        // ----------

        if (is_null($subject) || $subject === '') {
            $p = array('msg' => 2);
            openpne_redirect('ktai', 'page_h_message_send', $p);
        }

        if (is_null($body) || $body === '') {
            $p = array('msg' => 1);
            openpne_redirect('ktai', 'page_h_message_send', $p);
        }

        //--- 権限チェック
        //自分以外

        if ($target_c_member_id == $u) {
            handle_kengen_error();
        }
        //---


        $c_member_id_from = $u;

        db_message_send_message($c_member_id_from, $target_c_member_id, $subject, $body);

        openpne_redirect('ktai', 'page_h_message_box');
    }
}

?>
