<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_do_f_invite_insert_c_message_friend_invite extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();


        // --- リクエスト変数
        $target_c_member_id = $requests['target_c_member_id'];
        $body = $requests['body'];
        $c_member_id_list = $requests['c_member_id_list'];
        // ----------

        if (!$c_member_id_list) {
            $p = array(
                'target_c_member_id' => $target_c_member_id,
                'msg' => "紹介先の".WORD_MY_FRIEND."を選択してださい",
            );
            openpne_redirect('pc', 'page_f_invite', $p);
        }

        if (is_null($body) || $body === '') {
            $p = array(
                'target_c_member_id' => $target_c_member_id,
                'msg' => "メッセージを入力してください",
            );
            openpne_redirect('pc', 'page_f_invite', $p);
        }

        //--- 権限チェック
        //フレンド

        foreach ($c_member_id_list as $c_member_id) {
            if (!db_friend_is_friend($c_member_id, $u)) {
                handle_kengen_error();
            }
        }
        //---

        list($msg_subject, $msg_body) =
            create_message_friend_invite($u, $body, $target_c_member_id);

        foreach ($c_member_id_list as $key => $value) {
            db_message_send_message_syoukai_member($u, $value, $msg_subject, $msg_body);
        }

        if (OPENPNE_USE_POINT_RANK) {
            //メンバー紹介をした人にポイント付与
            $point = db_action_get_point4c_action_id(8);
            db_point_add_point($u, $point);
        }

        $p = array('target_c_member_id' => $target_c_member_id);
        openpne_redirect('pc', 'page_f_home', $p);
    }
}

?>
