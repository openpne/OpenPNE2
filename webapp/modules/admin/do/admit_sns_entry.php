<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// メンバー情報一括承認
class admin_do_admit_sns_entry extends OpenPNE_Action
{
    function execute($requests)
    {
        // メンバー一覧
        $ids = $requests['c_member_pre_ids'];
        switch ($requests['EntryType']) {
            case '1' :
                $result = $this->_entry_admit($ids);
                $msg = '承認しました';
                break;
            case '2' :
                $result = $this->_entry_reject($ids);
                $msg = '否認しました';
                break;
            default :
                $msg = '無効な処理が指定されました';
                break;
        }
    
        admin_client_redirect('list_sns_entry', $msg);
    }

    // 承認
    function _entry_admit($ids) {
        foreach ($ids as $key => $c_member_pre_id) {
            // 登録情報を取得
            $prof = db_member_c_member_pre4c_member_pre_id($c_member_pre_id);
            $c_member = $prof;
            $c_member_secure = array(
                'password' => $prof['password'],
                'password_query_answer' => $prof['c_password_query_answer'],
                'pc_address' => $prof['pc_address'],
                'ktai_address' => $prof['ktai_address'],
                'regist_address' => $prof['regist_address'],
            );

            $c_member_profile_list = db_member_c_member_pre_profile4c_member_pre_id($c_member_pre_id);

            // メンバー登録
            $u = util_regist_c_member($c_member, $c_member_secure, $c_member_profile_list, true);

            // pre の内容を削除
            db_member_delete_c_member_pre4c_member_pre_id($c_member_pre_id);

            // 登録完了メール送信
            if (empty($prof['pc_address'])) {
                //固体識別番号を登録
                db_member_update_easy_access_id($u, $prof['easy_access_id'], true);

                // 携帯
                do_insert_c_member_mail_send($u, $prof['password'], $prof['ktai_address']);

            } else {
                // PC
                do_regist_prof_do_regist2_mail_send($u);
            }
        }
    }

    // 否認
    function _entry_reject($ids) {
        foreach ($ids as $key => $c_member_pre_id) {
            // pre の内容を削除
            // 否認の場合、メールは送信しない
            db_member_delete_c_member_pre4c_member_pre_id($c_member_pre_id);

        }
    }
}
?>
