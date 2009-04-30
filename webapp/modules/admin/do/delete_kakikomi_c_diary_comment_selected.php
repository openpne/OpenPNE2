<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// 書き込み管理(日記削除)
class admin_do_delete_kakikomi_c_diary_comment_selected extends OpenPNE_Action
{
    function execute($requests)
    {
        $id_ary = split(":", $requests['target_c_diary_comment_ids']);

        $diary_comment_list = array();
        foreach ($id_ary as $id) {
            $diary_comment = _do_c_diary_comment4c_diary_comment_id($id);

            if (!$diary_comment) {
                admin_client_redirect('diary_comment_list', '指定された' . WORD_DIARY . 'コメントは存在しません');
            }

            array_push($diary_comment_list, $diary_comment);
        }

        foreach ($diary_comment_list as $diary_comment) {
            db_diary_delete_c_diary_comment($diary_comment['c_diary_comment_id'], $diary_comment['c_member_id']);
        }

        admin_client_redirect('diary_comment_list', WORD_DIARY . 'コメントを削除しました');
    }
}

?>
