<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// 書き込み管理(日記削除)
class admin_do_delete_kakikomi_c_diary_comment extends OpenPNE_Action
{
    function execute($requests)
    {
        $diary_comment = _do_c_diary_comment4c_diary_comment_id($requests['target_c_diary_comment_id']);

        if (!$diary_comment) {
            admin_client_redirect('diary_comment_list', '指定された' . WORD_DIARY . 'コメントは存在しません');
        }

        db_diary_delete_c_diary_comment($diary_comment['c_diary_comment_id'], $diary_comment['c_member_id']);

        admin_client_redirect('diary_comment_list', WORD_DIARY . 'コメントを削除しました');
    }
}

?>
