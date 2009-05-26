<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_c_event_member_list extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $c_commu_topic_id = $requests['target_c_commu_topic_id'];
        $page = $requests['page'];
        // ----------

        $c_topic = db_commu_c_topic4c_commu_topic_id_2($c_commu_topic_id);
        $c_commu_id = $c_topic['c_commu_id'];

        //--- 権限チェック
        if (!db_commu_is_c_commu_view4c_commu_idAc_member_id($c_commu_id, $u)) {
            handle_kengen_error();
        }
        //---

        $this->set('c_commu', db_commu_c_commu4c_commu_id($c_commu_id));
        $this->set('c_topic', $c_topic);

        $this->set('inc_navi', fetch_inc_navi('c', $c_commu_id));
        $this->set('page', $page);
        $page_size = 50;
        $c_event_member_list = db_commu_c_event_member_list4c_commu_topic_id($c_commu_topic_id, $page, $page_size);
        $total_c_event_member = db_commu_count_c_event_member_list4c_commu_topic_id($c_commu_topic_id);

        $start_num = ($page-1) * $page_size + 1;
        $end_num = $page * $page_size;
        if ($end_num > $total_c_event_member) {
            $end_num = $total_c_event_member;
        }

        $end_page = ceil($total_c_event_member / $page_size);
        for ($i=1; $i <= $end_page; $i++) {
            $page_num[] = $i;
        }
        $this->set("page_num", $page_num);

        $this->set('c_event_member_list', $c_event_member_list);
        $this->set('total_c_event_member', $total_c_event_member);

        $this->set('is_prev', ($start_num != 1));
        $this->set('is_next', ($end_num != $total_c_event_member));

        $this->set('start_num', $start_num);
        $this->set('end_num', $end_num);
        return 'success';
    }
}

?>
