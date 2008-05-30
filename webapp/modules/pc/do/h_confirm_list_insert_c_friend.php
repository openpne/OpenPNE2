<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * リンク承認
 */
class pc_do_h_confirm_list_insert_c_friend extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $target_c_friend_confirm_id = $requests['target_c_friend_confirm_id'];
        // ----------

        //--- 権限チェック
        //リンク承認を受けているメンバー

        $cfc = db_friend_c_friend_confirm4c_friend_confirm_id($target_c_friend_confirm_id);

        if ($cfc['c_member_id_to'] != $u) {
            handle_kengen_error();
        }
        // -----

        if (!db_friend_insert_c_friend4confirm($target_c_friend_confirm_id, $u)) {
            handle_kengen_error();
        }

        do_h_confirm_list_insert_c_friend_mail_send($cfc['c_member_id_from'], $u);

        $msg = WORD_FRIEND.'登録が完了しました';
        $p = array(
            'target_c_member_id' => $cfc['c_member_id_from'],
            'msg' => $msg,
        );
        openpne_redirect('pc', 'page_f_message_send', $p);
    }
}

?>
