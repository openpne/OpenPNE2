<?php
/**
 * @copyright 2005-2006 OpenPNE Project
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

        $this->set("c_commu_topic_id", $target_c_commu_topic_id);
        $this->set("c_commu_topic_comment_id", $c_commu_topic_comment_id);

        return 'success';
    }
}

?>
