<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_fh_diary_comment_confirm extends OpenPNE_Action
{
    function handleError($errors)
    {
        $_REQUEST['msg'] = array_shift($errors);
        openpne_forward('pc', 'page', 'fh_diary', $errors);
        exit;
    }

    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $target_c_diary_id = $requests['target_c_diary_id'];
        $body = $requests['body'];
        // ----------

        $target_diary = db_diary_get_c_diary4id($target_c_diary_id);
        $target_c_member_id = $target_diary['c_member_id'];

        if (!$target_c_member_id) {
            $target_c_member_id = $u;
        }

        if ($target_c_member_id == $u) {
            $type = 'h';

        } else {
            $type = 'f';
            $target_c_member = db_common_c_member4c_member_id($target_c_member_id);

            //日記の公開範囲設定
            if (($target_c_member['public_flag_diary'] == "friend" &&
                 !db_friend_is_friend($u, $target_c_member_id))) {
                openpne_redirect('pc', 'page_h_err_diary_access');
            }

            // アクセスブロック
            if (p_common_is_access_block($u, $target_c_member_id)) {
                openpne_redirect('pc', 'page_h_access_block');
            }
        }

        $this->set('inc_navi', fetch_inc_navi($type, $target_c_member_id));
        $form_val = array(
            "target_c_diary_id" => $target_c_diary_id,
            "body" => $body,
        );

        $this->set("form_val", $form_val);
        return 'success';
    }
}

?>
