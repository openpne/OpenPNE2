<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_h_diary_list_friend extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $page = $requests['page'];
        // ----------

        $this->set('inc_navi', fetch_inc_navi("h"));

        //日記一覧
        $page_size = 50;
        $this->set("page_size", $page_size);

        $lst = p_h_diary_list_friend_h_diary_list_friend4c_member_id($u, $page_size, $page);
        $this->set("h_diary_list_friend", $lst[0]);
        $this->set("is_prev", $lst[1]);
        $this->set("is_next", $lst[2]);
        $this->set("total_num", $lst[3]);

        $this->set("page", $page);
        $pager = array();
        $pager['start'] = $page_size * ($page - 1) + 1;
        if (($pager['end'] = $page_size * $page) > $lst[3]) {
            $pager['end'] = $lst[3];
        }
        $this->set('pager', $pager);

        if ($page == 1) {
            // rss_cache
            $limit = 20;
            $this->set('c_rss_cache_list', db_rss_list_friend_c_rss_cache_list($u, $limit));
        }

        return 'success';
    }
}

?>
