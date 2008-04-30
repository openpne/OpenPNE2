<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_page_c_sub_admin_request extends OpenPNE_Action
{
    function execute($requests)
    {
        $u  = $GLOBALS['KTAI_C_MEMBER_ID'];

        // --- リクエスト変数
        $target_c_commu_id = $requests['target_c_commu_id'];
        $target_c_member_id = $requests['target_c_member_id'];
        $body = $requests['body'];
        // ----------

        //--- 権限チェック
        // コミュニティ管理者
        // コミュニティ副管理者ではない
        // 自分自身へのメッセージ送信ではない
        // すでに管理者交代依頼メッセージ送信済みではない
        // すでに副管理者要請メッセージを送信済みでない

        if (!db_commu_is_c_commu_admin($target_c_commu_id, $u)) {
            handle_kengen_error();
        }

        if (db_commu_is_c_commu_sub_admin($target_c_commu_id, $u)) {
            handle_kengen_error();
        }

        if ($u == $target_c_member_id) {
            handle_kengen_error();
        }

        $target_c_commu_admin_confirm_list =
        db_commu_anatani_c_commu_admin_confirm_list4c_member_id($target_c_member_id);
        if (!empty($target_c_commu_admin_confirm_list)) {
            foreach ($target_c_commu_admin_confirm_list as $value) {
                if ($value['c_commu_id'] == $target_c_commu_id) {
                    handle_kengen_error();
                }
            }
        }

        $target_c_commu_sub_admin_confirm_list =
            db_commu_anatani_c_commu_sub_admin_confirm_list4c_member_id($target_c_member_id);
        if (!empty($target_c_commu_sub_admin_confirm_list)) {
            foreach ($target_c_commu_sub_admin_confirm_list as $value) {
                if ($value['c_commu_id'] == $target_c_commu_id) {
                    handle_kengen_error();
                }
            }
        }
        //---

        $this->set('inc_navi', fetch_inc_navi("c", $target_c_commu_id));

        $member = db_member_c_member_with_profile($target_c_member_id);
        $member['last_login'] = p_f_home_last_login4access_date($member['access_date']);

        $this->set("member", $member);
        $this->set("c_commu", db_commu_c_commu4c_commu_id($target_c_commu_id));
        $this->set('body', $body);

        return 'success';
    }
}

?>
