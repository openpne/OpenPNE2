<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_fh_comment_list extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $target_c_member_id = $requests['target_c_member_id'];
        $page = $requests['page'];
        // ----------

        if (empty($target_c_member_id)) {
            $target_c_member_id = $u;
        }

        $target_c_member = db_member_c_member4c_member_id($target_c_member_id);
        $this->set("target_member", $target_c_member);

        if ($target_c_member_id == $u) {
            $type = "h";
        } else {
            $type = "f";

            $is_friend = db_friend_is_friend($u, $target_c_member_id);

            // アクセスブロック
            if (db_member_is_access_block($u, $target_c_member_id)) {
                openpne_redirect('pc', 'page_h_access_block');
            }
        }
        $this->set('inc_navi', fetch_inc_navi($type, $target_c_member_id));

        //c_member_id から自分の日記についてるコメントIDリストを取得
        $target_c_diary_comment_id = $this->_p_fh_diary_c_diary_comment_id_list4c_member_id($target_c_member_id, $is_friend, $type);

        $page_size = 50;
        list($c_diary_comment_list, $is_prev, $is_next, $total_num) =
            db_diary_get_c_diary_comment_list4id_list($target_c_diary_comment_id, $page, $page_size, true);

        //最近のコメント一覧用配列(50個まで)
        $this->set("new_comment_list", $c_diary_comment_list);
        $this->set("is_prev", $is_prev);
        $this->set("is_next", $is_next);
        $pager = array();
        $pager['start'] = $page_size * ($page - 1) + 1;
        if (($pager['end'] = $page_size * $page) > $total_num) {
            $pager['end'] = $total_num;
        }
        $this->set('page', $page);
        $this->set('pager', $pager);

        return 'success';
    }

    // c_member_id から自分の日記についてるコメントID(複数)を取得
    // 日記公開範囲を考慮
    function _p_fh_diary_c_diary_comment_id_list4c_member_id($c_member_id, $is_friend, $type)
    {
        if ($type == 'h') {
            return p_fh_diary_c_diary_comment_id_list4c_member_id($c_member_id);
        }

        $sql = "SELECT cdc.c_diary_comment_id FROM c_diary as cd,c_diary_comment as cdc" .
            " WHERE cd.c_member_id = ?".
            " AND cd.c_diary_id = cdc.c_diary_id";

        if ($is_friend) {
            $sql .= " AND cd.public_flag <> 'private'";
        } else {
            $sql .= " AND cd.public_flag = 'public'";
        }

        $params = array(intval($c_member_id));
        return db_get_col($sql, $params);
    }
}

?>
