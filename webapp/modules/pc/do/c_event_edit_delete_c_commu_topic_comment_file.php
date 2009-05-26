<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_do_c_event_edit_delete_c_commu_topic_comment_file extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $c_commu_topic_id = $requests['target_c_commu_topic_id'];
        // ----------

        $c_topic = db_commu_c_topic4c_commu_topic_id_2($c_commu_topic_id);

        //--- 権限チェック
        //イベントの管理者 or コミュニティ管理者

        if (!db_commu_is_c_event_admin($c_commu_topic_id, $u) &&
            !db_commu_is_c_commu_admin($c_topic['c_commu_id'], $u)) {
            handle_kengen_error();
        }
        $c_commu = db_commu_c_commu4c_commu_id2($c_topic['c_commu_id']);
        if ($c_commu['is_topic'] == 'admin_only' &&
            !db_commu_is_c_commu_admin($c_topic['c_commu_id'], $u)) {
            handle_kengen_error();
        }
        //---

        db_file_delete_c_file($c_topic['filename']);
        db_commu_delete_c_commu_topic_comment_file($c_commu_topic_id);

        $p = array('target_c_commu_topic_id' => $c_commu_topic_id);
        openpne_redirect('pc', 'page_c_event_edit', $p);
    }
}
?>
