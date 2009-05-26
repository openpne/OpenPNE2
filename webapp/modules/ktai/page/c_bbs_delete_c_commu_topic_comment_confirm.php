<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_page_c_bbs_delete_c_commu_topic_comment_confirm extends OpenPNE_Action
{
    function execute($requests)
    {
        $u  = $GLOBALS['KTAI_C_MEMBER_ID'];

        // --- リクエスト変数
        $target_c_commu_topic_id = $requests['target_c_commu_topic_id'];
        $c_commu_topic_comment_id = $requests['c_commu_topic_comment_id'];
        // ----------

        $c_topic = db_commu_c_topic4c_commu_topic_id($target_c_commu_topic_id);
        $c_commu_id = $c_topic['c_commu_id'];
        $c_commu_topic_comment = db_commu_c_commu_topic_comment4c_commu_topic_comment_id_2($c_commu_topic_comment_id);
        $c_commu_topic_comment['original_filename'] = db_file_original_filename4filename($c_commu_topic_comment['filename']);

        //--- 権限チェック
        $status = db_common_commu_status($u, $c_commu_id);
        if (!$status['is_commu_admin']
            && $c_commu_topic_comment['c_member_id'] != $u) {
            handle_kengen_error();
        }
        //---

        //トピック名
        $this->set("c_commu_topic_name", $c_topic['name']);
        $this->set('c_commu_topic_comment', $c_commu_topic_comment);
        $this->set("c_commu_topic_id", $target_c_commu_topic_id);
        $this->set("c_commu_topic_comment_id", $c_commu_topic_comment_id);

        return 'success';
    }
}

?>
