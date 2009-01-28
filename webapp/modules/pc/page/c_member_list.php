<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_c_member_list extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $target_c_commu_id = $requests['target_c_commu_id'];
        $page = $requests['page'];
        // ----------

        $this->set('inc_navi', fetch_inc_navi("c", $target_c_commu_id));

        //メンバー情報
        $this->set("member", db_member_c_member4c_member_id($u));

        //コミュニティID
        $this->set("c_commu_id", $target_c_commu_id);
        $this->set("c_commu", db_commu_c_commu4c_commu_id($target_c_commu_id));
        $this->set("c_commu_num", db_commu_count_c_commu_member_list4c_commu_id($target_c_commu_id));

        $page_size = 50;

        //コミュニティメンバーリスト
        list($c_member_list, $is_prev, $is_next, $total_num, $start_num, $end_num)
            = db_commu_c_members4c_commu_id($target_c_commu_id, $page_size, $page);

        $this->set("c_member_list", $c_member_list);
        $this->set("is_prev", $is_prev);
        $this->set("is_next", $is_next);
        $this->set("page", $page);
        $this->set("total_num", $total_num);
        $this->set('start_num', $start_num);
        $this->set('end_num', $end_num);

        for ($i=1; $i <= ceil($total_num / $page_size); $i++) {
            $page_num[] = $i;
        }
        $this->set("page_num", $page_num);

        return 'success';
    }
}

?>
