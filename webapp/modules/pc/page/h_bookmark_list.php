<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_h_bookmark_list extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $page = $requests['page'];
        // ----------

        $page_size = 20;

        $this->set('inc_navi', fetch_inc_navi('h'));
        $list = db_bookmark_list($u, $page, $page_size);
        $this->set('c_members', $list[0]);
        $this->set("is_prev", $list[1]);
        $this->set("is_next", $list[2]);
        $this->set('c_members_num', $list[3]);
        $this->set("page", $page);
        $pager_index = array(
            'displaying_first' => ($page - 1) * $page_size + 1,
            'displaying_last' => ($page - 1) * $page_size + count($list[0]),
        );
        $this->set("pager_index", $pager_index);

        return 'success';
    }
}

?>
