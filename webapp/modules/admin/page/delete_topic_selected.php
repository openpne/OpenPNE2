<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// 管理画面トップページ 認証済み

class admin_page_delete_topic_selected extends OpenPNE_Action
{
    function execute($requests)
    {
        $v = array();

        $target_c_commu_topic_ids = $requests['target_c_commu_topic_ids'];

        // トピックが選択されていない場合はエラー
        if (!$target_c_commu_topic_ids) {
            admin_client_redirect('topic_list', "トピックが選択されていません");
        }

        $id_ary = split(":", $target_c_commu_topic_ids);

        $v = array();

        $topic_list = array();
        foreach ($id_ary as $id) {
            $topic = db_commu_c_topic4c_commu_topic_id_2($id);

            if (!$topic) {
                admin_client_redirect('topic_list', '指定されたトピック・イベントは存在しません');
            }

            $member = db_member_c_member4c_member_id($topic['c_member_id']);
            $topic['count_comments'] = _db_count_c_commu_topic_comments4c_commu_topic_id($topic['c_commu_topic_id']);
            $commu = db_commu_c_commu4c_commu_id($topic['c_commu_id']);
            $topic['commu_name'] = $commu['name'];
            $topic['c_member'] = $member;
            $topic['original_filename'] = db_file_original_filename4filename($topic['filename']);

            array_push($topic_list, $topic);
        }

        $this->set('topic_list', $topic_list);
        $this->set('pref', p_regist_prof_c_profile_pref_list4null());
        $this->set('target_c_commu_topic_ids', $target_c_commu_topic_ids);

        $v['SNS_NAME'] = SNS_NAME;
        $v['OPENPNE_VERSION'] = OPENPNE_VERSION;
        $this->set($v);
        return 'success';
    }
}

?>
