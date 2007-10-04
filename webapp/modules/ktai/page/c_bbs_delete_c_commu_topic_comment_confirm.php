<?php
/**
 * @copyright 2005-2007 OpenPNE Project
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

        //トピック名
        $this->set("c_commu_topic_name", k_p_c_bbs_c_commu_topic_name4c_commu_topic_id($target_c_commu_topic_id));

        $list = db_commu_c_commu_topic_comment_list4c_c_commu_topic_id($target_c_commu_topic_id, $u, 1, 1);
        $this->set("c_commu_topic_comment_list", $list[0]);

        $this->set("c_commu_topic_id", $target_c_commu_topic_id);
        $this->set("c_commu_topic_comment_id", $c_commu_topic_comment_id);

        return 'success';
    }
}

?>
