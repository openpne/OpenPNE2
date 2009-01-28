<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// 管理画面トップページ 認証済み

class admin_page_delete_diary extends OpenPNE_Action
{
    function execute($requests)
    {
        $v = array();

        $target_c_diary_id = $requests['target_c_diary_id'];

        $v = array();
        $diary = db_diary_get_c_diary4id($target_c_diary_id);

        if (!$diary) {
            admin_client_redirect('diary_list', '指定された' . WORD_DIARY . 'は存在しません');
        }
        $diary['count_comments'] = db_diary_count_c_diary_comment4c_diary_id($target_c_diary_id);

        $member = db_member_c_member4c_member_id($diary['c_member_id']);
        $diary['c_member'] = $member;
        $this->set('diary', $diary);

        $v['SNS_NAME'] = SNS_NAME;
        $v['OPENPNE_VERSION'] = OPENPNE_VERSION;
        $this->set($v);
        return 'success';
    }
}

?>
