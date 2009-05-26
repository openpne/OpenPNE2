<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_fh_delete_comment extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $target_c_diary_id = $requests['target_c_diary_id'];
        $target_c_diary_comment_id = $requests['target_c_diary_comment_id'];
        // ----------

        // target が指定されていない
        if (!$target_c_diary_id) {
            openpne_redirect('pc', 'page_h_err_fh_diary');
        }
        // target の日記が存在しない
        if (!p_common_is_active_c_diary_id($target_c_diary_id)) {
            openpne_redirect('pc', 'page_h_err_fh_diary');
        }

        $target_diary = db_diary_get_c_diary4id($target_c_diary_id);

        // 削除するコメントがが指定されていない
        if (!$target_c_diary_comment_id) {
            $p = array('target_c_diary_id' => $target_c_diary_id);
            openpne_redirect('pc', 'page_fh_diary', $p);
        }
        // コメントIDが不正
        foreach ($target_c_diary_comment_id as $item) {
            $comment = _do_c_diary_comment4c_diary_comment_id($item);
            if ($comment['c_diary_id'] != $target_c_diary_id
                || ($comment['c_member_id'] != $u &&
                    $target_diary['c_member_id'] != $u) ) {
                $p = array('target_c_diary_id' => $target_c_diary_id);
                openpne_redirect('pc', 'page_fh_diary', $p);
            }
        }

        // オブジェクトの振り分け用
        $target_c_member_id = $target_diary['c_member_id'];

        // inc_navi.tpl
        if ($target_c_member_id == $u) {
            $type = 'h';
            $is_diary_admin = true;
        } else {
            $type = 'f';
            $is_diary_admin = false;
        }

        $this->set('inc_navi', fetch_inc_navi($type, $target_c_member_id));
        $this->set('is_diary_admin', $is_diary_admin);

        $this->set('member', db_member_c_member4c_member_id($u));
        $this->set('target_member', db_member_c_member4c_member_id($target_c_member_id));
        $this->set('target_diary', $target_diary);

        //削除するコメント一覧
        $list = db_diary_get_c_diary_comment_list4id_list($target_c_diary_comment_id);
        $this->set('target_diary_comment_list', array_shift($list));

        //削除するコメントID
        $this->set('target_c_diary_comment_id', $target_c_diary_comment_id);

        return 'success';
    }
}

?>
