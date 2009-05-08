<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_c_topic_list extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $c_commu_id = $requests['target_c_commu_id'];
        $page = $requests['page'];
        // ----------


        $page_size = 20;
        $c_commu = db_commu_c_commu4c_commu_id($c_commu_id);

        //コミュニティの存在の有無
        if (!$c_commu) {
            openpne_redirect('pc', 'page_h_err_c_home');
        }

        $this->set('inc_navi', fetch_inc_navi("c", $c_commu_id));

        $this->set("c_commu", $c_commu);
        list($result, $is_prev, $is_next, $total_num, $start_num, $end_num)
            = db_commu_c_topic_list4target_c_commu_id($c_commu_id, $u, $page, $page_size, 0, 1);
        $this->set("c_topic_list", $result);
        $this->set("is_prev", $is_prev);
        $this->set("is_next", $is_next);
        $this->set("page", $page);
        $this->set("total_num", $total_num);
        $this->set('start_num', $start_num);
        $this->set('end_num', $end_num);


        //--- 権限チェック
        $is_c_commu_member = db_commu_is_c_commu_member($c_commu_id, $u);

        if (!$is_c_commu_member && $c_commu['is_open'] == "member") {
            $is_warning = true;
        } else {
            $is_warning = false;
        }
        $this->set("is_warning", $is_warning);
        //---

        $this->set("is_c_commu_admin", db_commu_is_c_commu_admin($c_commu_id, $u));
        $this->set("is_c_commu_member", $is_c_commu_member);

        return 'success';
    }
}

?>
