<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_page_c_event_member_list extends OpenPNE_Action
{
    function execute($requests)
    {
        $u  = $GLOBALS['KTAI_C_MEMBER_ID'];
        $pw = $GLOBALS['KTAI_PASSWD'];

        // --- リクエスト変数
        $target_c_commu_topic_id = $requests['target_c_commu_topic_id'];
        $direc = $requests['direc'];
        $page = $requests['page'];
        // ----------

        $c_topic = db_commu_c_topic4c_commu_topic_id_2($target_c_commu_topic_id);
        $c_commu_id = $c_topic['c_commu_id'];

        $page += $direc;
        $page_size=20;

        //ページ
        $this->set("page", $page);

        //メンバのリスト
        $list = k_p_db_commu_c_event_member_list4c_commu_topic_id($target_c_commu_topic_id, $page_size, $page);
        $this->set("c_event_member_list", $list[0]);
        $this->set('is_prev', $list[1]);
        $this->set('is_next', $list[2]);

        //コミュニティID
        $this->set("c_commu_id", $c_commu_id);
        //イベントID
        $this->set("c_commu_topic_id", $target_c_commu_topic_id);
        //コミュニティのメンバ数
        $this->set("count_member", k_p_count_db_commu_c_event_member_list4c_commu_topic_id($target_c_commu_topic_id));

        return 'success';
    }
}
?>
