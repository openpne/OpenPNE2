<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// 書き込み管理(日記削除)
class admin_do_delete_kakikomi_c_commu_topic_comment_selected extends OpenPNE_Action
{
    function execute($requests)
    {
        $id_ary = split(":", $requests['target_c_commu_topic_comment_ids']);

        foreach ($id_ary as $id) {
            $topic_comment = db_commu_c_commu_topic_comment4c_commu_topic_comment_id($id);

            if (!$topic_comment) {
                admin_client_redirect('topic_comment_list', '指定されたトピック・イベントのコメントは存在しません');
            }
            if ($topic_comment['number'] == 0) {
                admin_client_redirect('topic_comment_list', '指定されたコメントはトピック本文のためトピック削除にて削除してください');
            }
        }

        foreach ($id_ary as $id) {
            db_commu_delete_c_commu_topic_comment($id);
        }

        admin_client_redirect('topic_comment_list', 'トピック・イベントのコメントを削除しました');
    }
}

?>
