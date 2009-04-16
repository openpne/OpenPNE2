<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * 日記を書く
 */
class ktai_do_h_diary_edit_insert_c_diary extends OpenPNE_Action
{
    function execute($requests)
    {
        $tail = $GLOBALS['KTAI_URL_TAIL'];
        $u = $GLOBALS['KTAI_C_MEMBER_ID'];

        // --- リクエスト変数
        $subject = $requests['subject'];
        $body = $requests['body'];
        $public_flag = util_cast_public_flag_diary($requests['public_flag']);
        $target_c_diary_id = $requests['target_c_diary_id'];
        $is_comment_input = $requests['is_comment_input'];
        // ----------

        if (is_null($subject) || $subject === '') {
            $_REQUEST['msg'] = 2;
            openpne_forward('ktai', 'page', 'h_diary_edit');
            exit;
        }

        if (is_null($body) || $body === '') {
            $_REQUEST['msg'] = 1;
            openpne_forward('ktai', 'page', 'h_diary_edit');
            exit;
        }

        if (!$target_c_diary_id) {
            // 新規作成
            $target_c_diary_id = db_diary_insert_c_diary($u, $subject, $body, $public_flag, $is_comment_input);
            if (OPENPNE_USE_POINT_RANK) {
                //日記を書いた人にポイント付与
                $point = db_action_get_point4c_action_id(4);
                db_point_add_point($u, $point);
            }
        } else {
            // 編集
            $c_diary = db_diary_get_c_diary4id($target_c_diary_id);
            if ($c_diary['c_member_id'] != $u) {
                handle_kengen_error();
            }
            db_diary_update_c_diary($target_c_diary_id, $subject, $body, $public_flag, $is_comment_input);
        }

        $p = array('target_c_member_id' => $u);
        openpne_redirect('ktai', 'page_fh_diary_list', $p);
    }
}

?>
