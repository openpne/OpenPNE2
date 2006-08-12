<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * メッセージを送る
 */
class pc_do_h_message_insert_message extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $title = $requests['title'];
        $body = $requests['body'];
        $target_c_member_id = $requests['target_c_member_id'];
        // ----------

        //--- 権限チェック
        //自分以外

        if ($target_c_member_id == $u) {
            handle_kengen_error();
        }

        //アクセスブロック設定
        if (p_common_is_access_block($u, $target_c_member_id)) {
            openpne_redirect('pc', 'page_h_access_block');
        }
        //---

        do_common_send_message($u, $target_c_member_id, $title,$body);

        openpne_redirect('pc', 'page_h_message_box');
    }
}

?>
