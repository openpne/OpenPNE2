<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_page_c_topic_list extends OpenPNE_Action
{
    function execute($requests)
    {
        $u  = $GLOBALS['KTAI_C_MEMBER_ID'];

        // --- リクエスト変数
        $c_commu_id = $requests['target_c_commu_id'];
        $page = $requests['page'];
        // ----------

        //--- 権限チェック
        //掲示板閲覧権限
        if (!db_commu_is_c_commu_view4c_commu_idAc_member_id($c_commu_id, $u)) {
            handle_kengen_error();
        }

        $page_size = 10;

        $this->set('c_commu', db_commu_c_commu4c_commu_id($c_commu_id));

        list($result, $is_prev, $is_next, $total_num, $start_num, $end_num)
            = db_commu_c_topic_list4target_c_commu_id($c_commu_id, $u, $page, $page_size, 0, 1);
        $this->set("c_topic_list", $result);
        $this->set("is_prev", $is_prev);
        $this->set("is_next", $is_next);
        $this->set("page", $page);
        $this->set("total_num", $total_num);
        $this->set('start_num', $start_num);
        $this->set('end_num', $end_num);

        return 'success';
    }
}

?>
