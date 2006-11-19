<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// 書き込み管理(日記削除)
class admin_do_delete_kakikomi_c_commu_topic_comment extends OpenPNE_Action
{
    function execute($requests)
    {
        do_c_bbs_delete_c_commu_topic_comment($requests['target_c_commu_topic_comment_id']);

        module_client_redirect('delete_kakikomi', 'トピックコメントを削除しました');
    }
}

?>
