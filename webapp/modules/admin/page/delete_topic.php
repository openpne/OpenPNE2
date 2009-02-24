<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// 管理画面トップページ 認証済み

class admin_page_delete_topic extends OpenPNE_Action
{
    function execute($requests)
    {
        $v = array();

        $target_c_commu_topic_id = $requests['target_c_commu_topic_id'];

        $v = array();
        $topic = db_commu_c_topic4c_commu_topic_id_2($target_c_commu_topic_id);

        if (!$topic) {
            admin_client_redirect('topic_list', '指定されたトピック・イベントは存在しません');
        }

        $member = db_member_c_member4c_member_id($topic['c_member_id']);
        $topic['count_comments'] = _db_count_c_commu_topic_comments4c_commu_topic_id($topic['c_commu_topic_id']);
        $commu = db_commu_c_commu4c_commu_id($topic['c_commu_id']);
        $topic['commu_name'] = $commu['name'];
        $topic['c_member'] = $member;
        $topic['original_filename'] = db_file_original_filename4filename($topic['filename']);
        $this->set('topic', $topic);
        $this->set('pref', p_regist_prof_c_profile_pref_list4null());

        $v['SNS_NAME'] = SNS_NAME;
        $v['OPENPNE_VERSION'] = OPENPNE_VERSION;
        $this->set($v);
        return 'success';
    }
}

?>
