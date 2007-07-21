<?php
/**
 * @copyright 2005-2007 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// 書き込み管理(コミュニティトピック削除)
class admin_do_delete_kakikomi_c_commu_topic extends OpenPNE_Action
{
    function execute($requests)
    {
        db_commu_delete_c_commu_topic($requests['target_c_commu_topic_id']);

        admin_client_redirect('topic_comment_list', 'コミュニティトピックを削除しました');
    }
}

?>
