<?php
/**
 * @copyright 2005-2007 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// 管理画面トップページ 認証済み

class admin_page_delete_topic_comment extends OpenPNE_Action
{
    function execute($requests)
    {
        $v = array();
        
        $target_c_commu_topic_comment_id = $requests['target_c_commu_topic_comment_id'];
        
        $v = array();
        $topic_comment = db_commu_c_commu_topic_comment4c_commu_topic_comment_id($target_c_commu_topic_comment_id);
        $member = db_member_c_member4c_member_id($topic_comment['c_member_id']);
        $topic_comment['nickname'] = $member['nickname'];
        $topic_comment['count_comments'] = _db_count_c_commu_topic_comments4c_commu_topic_id($value['c_commu_topic_id']);
        $this->set('topic_comment', $topic_comment);
        
        $v['SNS_NAME'] = SNS_NAME;
        $v['OPENPNE_VERSION'] = OPENPNE_VERSION;
        $this->set($v);
        return 'success';
    }
}

?>
