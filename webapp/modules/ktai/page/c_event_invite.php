<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_page_c_event_invite extends OpenPNE_Action
{
    function execute($requests)
    {
        $u  = $GLOBALS['KTAI_C_MEMBER_ID'];

        // --- リクエスト変数
        $target_c_commu_topic_id = $requests['target_c_commu_topic_id'];
        // ----------

        $c_commu = db_commu_c_commu4c_commu_topic_id($target_c_commu_topic_id);
        $c_commu_id = $c_commu['c_commu_id'];
        if (!db_commu_is_c_commu_view4c_commu_idAc_member_id($c_commu_id, $u)) {
            handle_kengen_error();
        }

        $target_c_commu_topic = db_commu_c_topic4c_commu_topic_id_2($target_c_commu_topic_id);
        if (!$target_c_commu_topic['event_flag']) {
            handle_kengen_error();
        }

        $this->set('c_commu_topic', $target_c_commu_topic);

        // コミュニティ
        $this->set("c_commu", $c_commu);

        // ランダムフレンドリスト
        //    イベント参加済のメンバーも含まれる
        $this->set("c_friend_list", db_friend_ktai_c_friend_list_random4c_member_id($u));

        return 'success';
    }
}

?>
