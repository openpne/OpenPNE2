<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// 管理画面トップページ 認証済み

class admin_page_delete_diary_selected extends OpenPNE_Action
{
    function execute($requests)
    {
        $v = array();

        $target_c_diary_ids = $requests['target_c_diary_ids'];

        // 日記が選択されていない場合はエラー
        if (!$target_c_diary_ids) {
            admin_client_redirect('diary_list', WORD_DIARY . "が選択されていません");
        }

        $ids_ary = split(":", $target_c_diary_ids);

        $v = array();
        $diary_list = array();
        foreach ($ids_ary as $id) {
            $diary = db_diary_get_c_diary4id($id);

            if (!$diary) {
                admin_client_redirect('diary_list', '指定された' . WORD_DIARY . "は存在しません");
            }
            $diary['count_comments'] = db_diary_count_c_diary_comment4c_diary_id($id);

            $member = db_member_c_member4c_member_id($diary['c_member_id']);
            $diary['c_member'] = $member;

            array_push($diary_list, $diary);
        }
        $this->set('diary_list', $diary_list);
        $this->set('target_c_diary_ids', $target_c_diary_ids);

        $v['SNS_NAME'] = SNS_NAME;
        $v['OPENPNE_VERSION'] = OPENPNE_VERSION;
        $this->set($v);
        return 'success';
    }
}

?>
