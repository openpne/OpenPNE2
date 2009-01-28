<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * フレンド紹介文入力・編集
 */
class ktai_do_f_intro_edit_update_c_friend extends OpenPNE_Action
{
    function execute($requests)
    {
        $u  = $GLOBALS['KTAI_C_MEMBER_ID'];
        $tail = $GLOBALS['KTAI_URL_TAIL'];

        // --- リクエスト変数
        $target_c_member_id = $requests['target_c_member_id'];
        $body = $requests['body'];
        // ----------

        //TODO: 空のとき削除でもよいのでは？
        if (!$body) {
            $p = array('target_c_member_id' => $target_c_member_id, 'msg' => 33);
            openpne_redirect('ktai', 'page_f_intro_edit', $p);
        }

        //--- 権限チェック
        //フレンド

        $status = db_friend_status($u, $target_c_member_id);
        if (!$status['is_friend']) {
            handle_kengen_error();
        }
        //---

        if (OPENPNE_USE_POINT_RANK) {
            //紹介文を書いた人にポイント付与
            if (!db_friend_intro_body4c_member_id($u, $target_c_member_id)){
                $point = db_action_get_point4c_action_id(5);
                db_point_add_point($u, $point);
            }
        }

        db_friend_update_c_friend_intro($u, $target_c_member_id, $body);

        // メール送信
        do_f_intro_edit_update_c_friend_send_mail($u, $target_c_member_id);

        $p = array('target_c_member_id' => $target_c_member_id);
        openpne_redirect('ktai', 'page_fh_intro', $p);
    }
}

?>
