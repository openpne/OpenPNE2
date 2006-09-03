<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_c_event_invite extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $c_commu_topic_id = $requests['target_c_commu_topic_id'];
        // ----------

        $c_topic = c_event_detail_c_topic4c_commu_topic_id($c_commu_topic_id);
        $c_commu_id = $c_topic['c_commu_id'];

        //--- 権限チェック
        if (!_db_is_c_event_member($c_commu_topic_id, $u)) {
            handle_kengen_error();
        }
        //---


        $this->set("host", OPENPNE_URL);

        $this->set('inc_navi', fetch_inc_navi("c", $c_commu_id));
        $this->set("c_commu_id", $c_commu_id);
        $this->set("c_commu_topic_id", $c_commu_topic_id);
        //フレンドリストをアサインする
        $this->set("c_friend_list", p_f_home_c_friend_list4c_member_id($u));

        return 'success';
    }
}

?>
