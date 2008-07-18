<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_h_bookmark_diary_blog_list extends OpenPNE_Action
{
    function execute($requests)
    {
        //ブックマークフィードしない
        if (!USE_BOOKMARK_FEED) {
            openpne_redirect('pc', 'page_h_home');
        }

        // --- リクエスト変数
        $page = $requests['page'];
        // ----------

        $u = $GLOBALS['AUTH']->uid();
        $this->set('inc_navi', fetch_inc_navi('h'));

        //日記一覧
        $page_size = 50;
        $this->set('page_size', $page_size);

        $lst = db_bookmark_diary_list_with_pager($u, $page_size, $page);
        $this->set('bookmark_diary_list', $lst[0]);
        $this->set('is_prev', $lst[1]);
        $this->set('is_next', $lst[2]);
        $this->set('total_num', $lst[3]);

        $this->set('page', $page);
        $pager = array();
        $pager['start'] = $page_size * ($page - 1) + 1;
        if (($pager['end'] = $page_size * $page) > $lst[3]) {
            $pager['end'] = $lst[3];
        }
        $this->set('pager', $pager);

        if ($page == 1) {
            //お気に入りの最新ブログ
            $this->set('bookmark_blog_list', db_bookmark_blog_list($u, 10));
        }

        return 'success';
    }
}

?>
