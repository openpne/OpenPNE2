<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_page_fh_diary_list extends OpenPNE_Action
{
    function execute($requests)
    {
        $u  = $GLOBALS['KTAI_C_MEMBER_ID'];

        // --- リクエスト変数
        $target_c_member_id = $requests['target_c_member_id'];
        $direc = $requests['direc'];
        $page = $requests['page'];
        // ----------

        if (!$target_c_member_id) $target_c_member_id = $u;

        $is_friend = db_friend_is_friend($u, $target_c_member_id);

        if ($target_c_member_id == $u) {
            $type = 'h';
            $this->set("type", $type);
        }

        if (p_common_is_access_block($u, $target_c_member_id)) {
            openpne_redirect('ktai', 'page_h_access_block');
        }

        $target_c_member = db_common_c_member4c_member_id($target_c_member_id);

        //ターゲット情報
        $this->set("target_c_member", db_common_c_member4c_member_id($target_c_member_id));

        // 1ページ当たりに表示する日記の数
        $page_size = 10;
        $page += $direc;
        //ターゲットの詳細な日記リスト
        $list = $this->_p_fh_diary_list_diary_list4c_member_id($target_c_member_id, $is_friend, $type, $page_size, $page);

        $this->set("target_diary_list", $list[0]);
        $this->set("page", $page);
        $this->set("is_prev", $list[1]);
        $this->set("is_next", $list[2]);

        //f or h
        $this->set("INC_NAVI_type", k_p_fh_common_get_type($target_c_member_id, $u));

        //あしあとをつける
        db_ashiato_insert_c_ashiato($target_c_member_id, $u);

        return 'success';
    }

    /**
     * あるメンバーの日記リストを取得
     * 日記公開範囲を考慮
     * 
     * @param int $c_member_id
     * @param int $page_size
     * @param int $page
     * @return array 日記リスト
     */
    function _p_fh_diary_list_diary_list4c_member_id($c_member_id, $is_friend, $type, $page_size, $page)
    {
        if ($type == 'h') {
            return p_fh_diary_list_diary_list4c_member_id($c_member_id, $page_size, $page);
        }

        $sql   = 'SELECT c_diary.*';
        $from  = ' FROM c_diary INNER JOIN c_member USING (c_member_id)';
        $where = ' WHERE c_diary.c_member_id = ?' ;
        $order = ' ORDER BY c_diary.r_datetime DESC';


        if ($is_friend) {
            $where .= ' AND ((c_diary.public_flag = \'public\') OR (c_diary.public_flag = \'default\' AND c_member.public_flag_diary = \'public\') OR (c_diary.public_flag = \'friend\') OR (c_diary.public_flag = \'default\' AND c_member.public_flag_diary = \'friend\'))';
        } else {
            $where .= ' AND ((c_diary.public_flag = \'public\') OR (c_diary.public_flag = \'default\' AND c_member.public_flag_diary = \'public\'))';
        }

        $sql .= $from . $where . $order;

        $params = array(intval($c_member_id));
        $list = db_get_all_page($sql, $page, $page_size, $params);

        foreach ($list as $key => $c_diary) {
            $list[$key]['num_comment'] = db_diary_count_c_diary_comment4c_diary_id($c_diary['c_diary_id']);
        }

        $sql = 'SELECT COUNT(c_diary.*)' . $from . $where . $order;
        $total_num = db_get_one($sql, $params);

        if ($total_num != 0) {
            $total_page_num =  ceil($total_num / $page_size);
            if ($page >= $total_page_num) {
                $next = false;
            } else {
                $next = true;
            }

            if ($page <= 1) {
                $prev = false;
            } else {
                $prev = true;
            }
        }
        return array($list, $prev, $next);
    }

}

?>
