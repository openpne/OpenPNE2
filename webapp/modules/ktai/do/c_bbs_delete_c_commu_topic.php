<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * コミュニティトピック削除
 */
class ktai_do_c_bbs_delete_c_commu_topic extends OpenPNE_Action
{
    function execute($requests)
    {
        $u  = $GLOBALS['KTAI_C_MEMBER_ID'];
        $tail = $GLOBALS['KTAI_URL_TAIL'];

        $target_c_commu_topic_id = $requests['target_c_commu_topic_id'];

        //--- 権限チェック
        //コミュニティ管理者 or トピック作成者

        $c_commu_topic = db_commu_c_commu_topic4c_commu_topic_id($target_c_commu_topic_id);

        $c_commu_id = $c_commu_topic['c_commu_id'];

        $status = db_common_commu_status($u, $c_commu_id);
        if (!$status['is_commu_admin']
            && $c_commu_topic['c_member_id'] != $u) {
            handle_kengen_error();
        }
        //---

        db_commu_delete_c_commu_topic($target_c_commu_topic_id);

        $p = array('target_c_commu_id' => $c_commu_topic['c_commu_id']);
        openpne_redirect('ktai', 'page_c_home', $p);
    }
}

?>
