<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_page_h_diary_list_friend extends OpenPNE_Action
{
    function execute($requests)
    {
        $u  = $GLOBALS['KTAI_C_MEMBER_ID'];

        // --- リクエスト変数
        $page = $requests['page'];
        // ----------

        //日記一覧
        $page_size = 10;
        $this->set("page_size", $page_size);
        $this->set("page", $page);

        $list = p_h_diary_list_friend_h_diary_list_friend4c_member_id($u, $page_size, $page);
        $this->set("h_diary_list_friend", $list[0]);
        $this->set("is_prev", $list[1]);
        $this->set("is_next", $list[2]);
        $this->set("total_num", $list[3]);

        $pager = array();
        $pager['start'] = ($page_size * ($page - 1)) + 1;
        $pager['end'] = $pager['start'] + count($list[0]) - 1;
        $this->set('pager', $pager);

        return 'success';
    }
}
?>
