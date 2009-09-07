<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * 日記コメント追加
 */
class ktai_do_fh_diary_insert_c_diary_comment extends OpenPNE_Action
{
    function execute($requests)
    {
        $tail = $GLOBALS['KTAI_URL_TAIL'];
        $u = $GLOBALS['KTAI_C_MEMBER_ID'];

        // --- リクエスト変数
        $target_c_diary_id = $requests['target_c_diary_id'];
        $body = $requests['body'];
        // ----------

        if (is_null($body) || $body === '') {
            $p = array('target_c_diary_id' => $target_c_diary_id, 'msg' => 1);
            openpne_redirect('ktai', 'page_fh_diary', $p);
        }

        //--- 権限チェック

        $c_diary = db_diary_get_c_diary4id($target_c_diary_id);
        $target_c_member_id = $c_diary['c_member_id'];
        $target_c_member = db_member_c_member4c_member_id($target_c_member_id);

        if ($u != $target_c_member_id) {
            // check public_flag
            if (!pne_check_diary_public_flag($target_c_diary_id, $u)) {
                openpne_redirect('ktai', 'page_h_err_diary_access');
            }
            //アクセスブロック設定
            if (db_member_is_access_block($u, $target_c_member_id)) {
                openpne_redirect('ktai', 'page_h_access_block');
            }
        }

        //日記コメント停止設定
        if (OPENPNE_USE_DIARY_COMMENT && !$c_diary['is_comment_input']) {
            $p = array('target_c_diary_id' => $target_c_diary_id);
            openpne_redirect('ktai', 'page_fh_diary', $p);
        }

        if (!db_diary_is_writable_comment4c_diary_id($target_c_diary_id)) {
            $p = array('target_c_diary_id' => $target_c_diary_id, 'msg' => 47);
            openpne_redirect('ktai', 'page_fh_diary', $p);
        }
        //---

        $insert_id = db_diary_insert_c_diary_comment($u, $target_c_diary_id, $body);

        //日記コメント記入履歴追加
        if ($u != $target_c_member_id) {
            db_diary_insert_c_diary_comment_log($u, $target_c_diary_id);
        }
        //日記コメント記入履歴更新
        db_diary_update_c_diary_comment_log($target_c_diary_id);

        //日記コメントが書き込まれたので日記自体を未読扱いにする
        db_diary_update_c_diary_is_checked($target_c_diary_id, 0);

        // お知らせメール送信(携帯へ)
        if ($u != $target_c_member_id) {
            send_diary_comment_info_mail($insert_id, $u);
        }

        if (OPENPNE_USE_POINT_RANK) {
            // コメント者と被コメント者が違う場合にポイント加算
            if ($u != $target_c_member_id) {
                //書いた人にポイント付与
                $point = db_action_get_point4c_action_id(3);
                db_point_add_point($u, $point);

                //書かれた人にポイント付与
                $point = db_action_get_point4c_action_id(2);
                db_point_add_point($target_c_member_id, $point);
            }
        }

        $p = array('target_c_diary_id' => $target_c_diary_id);
        openpne_redirect('ktai', 'page_fh_diary', $p);
    }
}

?>
