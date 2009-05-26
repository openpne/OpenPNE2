<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_c_topic_write_delete_confirm extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $c_commu_topic_comment_id = $requests['target_c_commu_topic_comment_id'];
        // ----------

        $c_commu_topic_comment = db_commu_c_commu_topic_comment4c_commu_topic_comment_id_3($c_commu_topic_comment_id);
        $c_commu_id = $c_commu_topic_comment['c_commu_id'];
        $c_commu_topic_id = $c_commu_topic_comment['c_commu_topic_id'];
        $c_commu = db_commu_c_commu4c_commu_id($c_commu_id);

        //--- 権限チェック
        $status = db_common_commu_status($u, $c_commu_id);
        if (!$status['is_commu_admin']
            && $c_commu_topic_comment['c_member_id'] != $u) {
            handle_kengen_error();
        }
        //---

        $c_commu_topic_comment['original_filename'] = db_file_original_filename4filename($c_commu_topic_comment['filename']);

        $this->set('inc_navi', fetch_inc_navi("c", $c_commu_id));
        $this->set('c_commu_id', $c_commu_id);
        $this->set('c_commu_topic_id', $c_commu_topic_id);
        $this->set('c_commu_topic_comment', $c_commu_topic_comment);
        $this->set("c_member", db_member_c_member4c_member_id($c_commu_topic_comment['c_member_id']));
        return 'success';
    }
}

?>
