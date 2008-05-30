<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_page_h_diary_comment_list extends OpenPNE_Action
{
    function execute($requests)
    {
        $u  = $GLOBALS['KTAI_C_MEMBER_ID'];

        // --- リクエスト変数
        $page = $requests['page'];
        // ----------

        $page_size = 10;
        $this->set('page', $page);
        $this->set('page_size', $page_size);

        $list = p_h_diary_comment_list_c_diary_my_comment_list4c_member_id($u, $page, $page_size);
        $this->set("c_diary_my_comment_list", $list[0]);
        $this->set('is_prev', $list[1]);
        $this->set('is_next', $list[2]);

        $pager = array();
        $pager['start'] = ($page_size * ($page - 1)) + 1;
        $pager['end'] = $pager['start'] + count($list[0]) - 1;
        $this->set('pager', $pager);

        return 'success';
    }
}

?>
