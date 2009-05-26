<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// 書き込み管理(コミュニティトピック削除)
class admin_do_delete_kakikomi_c_commu_topic_selected extends OpenPNE_Action
{
    function execute($requests)
    {
        $id_ary = split(":", $requests['target_c_commu_topic_ids']);

        foreach ($id_ary as $id) {
            $topic = db_commu_c_topic4c_commu_topic_id($id);

            if (!$topic) {
                admin_client_redirect('topic_list', '指定されたトピック・イベントは存在しません');
            }
        }

        foreach ($id_ary as $id) {
            db_commu_delete_c_commu_topic($id);
        }

        admin_client_redirect('topic_list', WORD_COMMUNITY . 'トピックを削除しました');
    }
}

?>
