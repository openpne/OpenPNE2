<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// 書き込み削除
class admin_page_delete_kakikomi extends OpenPNE_Action
{
    function handleError($errors)
    {
        admin_client_redirect('delete_kakikomi', '正しく入力してください');
    }

    function execute($requests)
    {
        $v = array();

        if ($requests['target_c_diary_id']) {
            $v['c_diary'] = db_diary_get_c_diary4id($requests['target_c_diary_id']);
        }
        
        if ($requests['target_c_diary_comment_id']) {
            $v['c_diary_comment'] = _do_c_diary_comment4c_diary_comment_id($requests['target_c_diary_comment_id']);
        }

        if ($requests['target_c_commu_id']) {
            $v['c_commu'] = db_commu_c_commu4c_commu_id($requests['target_c_commu_id']);
        }

        if ($requests['target_c_commu_topic_id']) {
            $v['c_commu_topic'] = c_topic_detail_c_topic4c_commu_topic_id($requests['target_c_commu_topic_id']);
        }
        
        if ($requests['target_c_commu_topic_comment_id']) {
            $v['c_commu_topic_comment'] = _db_common_c_commu_topic_comment4c_commu_topic_comment_id($requests['target_c_commu_topic_comment_id']);
        }

        $this->set($v);
        return 'success';
    }
}

?>
