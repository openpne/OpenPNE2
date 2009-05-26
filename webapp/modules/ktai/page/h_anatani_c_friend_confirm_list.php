<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_page_h_anatani_c_friend_confirm_list extends OpenPNE_Action
{
    function execute($requests)
    {
        $u  = $GLOBALS['KTAI_C_MEMBER_ID'];

        // --- リクエスト変数
        $page = $requests['page'];
        // ----------

        //ターゲット情報
        $this->set("target_c_member", db_member_c_member4c_member_id_LIGHT($u));
        // 1ページ当たりに表示する数
        $page_size = 5;
        //ターゲットの詳細なリスト
        $list = db_friend_ktai_anatani_c_friend_confirm_list4c_member_id_with_pager($u, $page_size, $page);
        $total_num = db_friend_count_c_anatani_friend_confirm($u);
        $this->set("c_friend_confirm_list", $list[0]);
        $this->set("page", $page);
        $this->set("is_prev", $list[1]);
        $this->set("is_next", $list[2]);
        $this->set('total_num', $total_num);

        $pager = array();
        $pager['start'] = ($page_size * ($page - 1)) + 1;
        $pager['end'] = $pager['start'] + count($list[0]) - 1;
        $this->set('pager', $pager);

        return 'success';
    }
}

?>
