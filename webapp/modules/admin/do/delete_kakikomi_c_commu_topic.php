<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// 書き込み管理(コミュニティトピック削除)
class admin_do_delete_kakikomi_c_commu_topic extends OpenPNE_Action
{
    function execute($requests)
    {
        $topic = db_commu_c_topic4c_commu_topic_id($requests['target_c_commu_topic_id']);

        if (!$topic) {
            admin_client_redirect('topic_list', '指定されたトピック・イベントは存在しません');
        }

        db_commu_delete_c_commu_topic($requests['target_c_commu_topic_id']);

        admin_client_redirect('topic_list', WORD_COMMUNITY . 'トピックを削除しました');
    }
}

?>
