<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// 管理画面トップページ 認証済み

class admin_page_delete_diary_comment_selected extends OpenPNE_Action
{
    function execute($requests)
    {
        $v = array();

        $target_c_diary_comment_ids = $requests['target_c_diary_comment_ids'];

        // 日記コメントが選択されていない場合はエラー
        if (!$target_c_diary_comment_ids) {
            admin_client_redirect('diary_comment_list', WORD_DIARY . "のコメントが選択されていません");
        }

        $id_ary = split(":", $target_c_diary_comment_ids);

        $v = array();
        $diary_comment_list = array();
        foreach ($id_ary as $id) {
            $diary_comment = _do_c_diary_comment4c_diary_comment_id($id);

            if (!$diary_comment) {
                admin_client_redirect('diary_comment_list', '指定された' . WORD_DIARY . 'のコメントは存在しません');
            }

            $diary = db_diary_get_c_diary4id($diary_comment['c_diary_id']);
            $diary_comment['subject'] = $diary['subject'];
            $diary_comment['count_comments'] = db_diary_count_c_diary_comment4c_diary_id($diary_comment['c_diary_id']);
            $member = db_member_c_member4c_member_id($diary_comment['c_member_id']);
            $diary_comment['c_member'] = $member;

            array_push($diary_comment_list, $diary_comment);
        }
        $this->set('diary_comment_list', $diary_comment_list);
        $this->set('target_c_diary_comment_ids', $target_c_diary_comment_ids);

        $v['SNS_NAME'] = SNS_NAME;
        $v['OPENPNE_VERSION'] = OPENPNE_VERSION;
        $this->set($v);
        return 'success';
    }
}

?>
