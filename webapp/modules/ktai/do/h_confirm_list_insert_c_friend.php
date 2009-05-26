<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * リンク承認
 */
class ktai_do_h_confirm_list_insert_c_friend extends OpenPNE_Action
{
    function execute($requests)
    {
        $tail = $GLOBALS['KTAI_URL_TAIL'];
        $u = $GLOBALS['KTAI_C_MEMBER_ID'];

        // --- リクエスト変数
        $target_c_friend_confirm_id = $requests['target_c_friend_confirm_id'];
        // ----------

        $cfc = db_friend_c_friend_confirm4c_friend_confirm_id($target_c_friend_confirm_id);

        //--- 権限チェック
        //リンク承認を受けている人

        if ($cfc['c_member_id_to'] != $u) {
            handle_kengen_error();
        }
        //---

        if (!db_friend_insert_c_friend4confirm($target_c_friend_confirm_id, $u)) {
            handle_kengen_error();
        }
        do_h_confirm_list_insert_c_friend_mail_send($cfc['c_member_id_from'], $u);

        $p = array(
            'target_c_member_id' => $cfc['c_member_id_from'],
            'msg' => 3,
        );
        openpne_redirect('ktai', 'page_f_message_send', $p);
    }
}

?>
