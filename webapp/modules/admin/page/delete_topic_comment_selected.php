<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// 管理画面トップページ 認証済み

class admin_page_delete_topic_comment_selected extends OpenPNE_Action
{
    function execute($requests)
    {
        $v = array();

        $target_c_commu_topic_comment_ids = $requests['target_c_commu_topic_comment_ids'];

        // トピックのコメントが選択されていない場合はエラー
        if (!$target_c_commu_topic_comment_ids) {
            admin_client_redirect('topic_comment_list', "トピックのコメントが選択されていません");
        }

        $id_ary = split(":", $target_c_commu_topic_comment_ids);

        $v = array();

        $topic_comment_list = array();
        foreach ($id_ary as $id) {
            $topic_comment = db_commu_c_commu_topic_comment4c_commu_topic_comment_id($id);

            if (!$topic_comment) {
                admin_client_redirect('topic_comment_list', '指定されたトピック・イベントのコメントは存在しません');
            }

            if ($topic_comment['number'] == 0) {
                admin_client_redirect('topic_comment_list', '指定されたコメントはトピック本文のためトピック削除にて削除してください');
            }

            $member = db_member_c_member4c_member_id($topic_comment['c_member_id']);
            $topic_comment['nickname'] = $member['nickname'];
            $topic_comment['count_comments'] = _db_count_c_commu_topic_comments4c_commu_topic_id($topic_comment['c_commu_topic_id']);
            $topic_comment['original_filename'] = db_file_original_filename4filename($topic_comment['filename']);

            array_push($topic_comment_list, $topic_comment);
        }
        $this->set('topic_comment_list', $topic_comment_list);
        $this->set('target_c_commu_topic_comment_ids', $target_c_commu_topic_comment_ids);

        $v['SNS_NAME'] = SNS_NAME;
        $v['OPENPNE_VERSION'] = OPENPNE_VERSION;
        $this->set($v);
        return 'success';
    }
}

?>
