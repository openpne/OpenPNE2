<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_page_fh_diary_list extends OpenPNE_Action
{
    function execute($requests)
    {
        $u  = $GLOBALS['KTAI_C_MEMBER_ID'];

        // --- リクエスト変数
        $target_c_member_id = $requests['target_c_member_id'];
        $page = $requests['page'];
        $keyword = $requests['keyword'];
        // ----------

        if (!$target_c_member_id || !is_null($keyword)) {
            $target_c_member_id = $u;
        }

        $is_friend = db_friend_is_friend($u, $target_c_member_id);

        if ($target_c_member_id == $u) {
            $type = 'h';
            $this->set("type", $type);
        }

        if (db_member_is_access_block($u, $target_c_member_id)) {
            openpne_redirect('ktai', 'page_h_access_block');
        }

        $target_c_member = db_member_c_member4c_member_id($target_c_member_id);

        //ターゲット情報
        $this->set("target_c_member", db_member_c_member4c_member_id($target_c_member_id));

        // 1ページ当たりに表示する日記の数
        $page_size = 10;
        //ターゲットの詳細な日記リスト
        //検索する場合(自分の日記のみ)
        if ($keyword) {
            $list = p_h_diary_list_all_search_c_diary4c_diary($keyword, $page_size, $page, $u);
        } else {
            $list = p_fh_diary_list_diary_list4c_member_id($target_c_member_id, $page_size, $page, $u);
        }

        $this->set("target_diary_list", $list[0]);
        $this->set("page", $page);
        $this->set("is_prev", $list[1]);
        $this->set("is_next", $list[2]);
        $this->set("total_num", $list[3]);

        $pager = array();
        $pager['start'] = $page_size * ($page - 1) + 1;
        if (($pager['end'] = $page_size * $page) > $list[3]) {
            $pager['end'] = $list[3];
        }
        $this->set('pager', $pager);

        //f or h
        $this->set("INC_NAVI_type", k_p_fh_common_get_type($target_c_member_id, $u));

        //あしあとをつける
        db_ashiato_insert_c_ashiato($target_c_member_id, $u);

        //検索ワード
        $this->set('keyword', $keyword);

        return 'success';
    }
}

?>
