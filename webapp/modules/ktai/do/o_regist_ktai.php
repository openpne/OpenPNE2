<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

require_once 'OpenPNE/KtaiID.php';

class ktai_do_o_regist_ktai extends OpenPNE_Action
{
    function isSecure()
    {
        return false;
    }

    function execute($requests)
    {
        // --- リクエスト変数
        $ses = $requests['ses'];
        $password = $requests['password'];
        // ----------

        if (!$pre = db_member_c_member_pre4ktai_session($ses)) {
            openpne_redirect('ktai', 'page_o_login');
        }

        $c_member_pre_id = $pre['c_member_pre_id'];
        $ktai_address = $pre['ktai_address'];

        // パスワードチェック
        if (md5($password) !== $pre['password']) {
            $p = array('msg' => 18, 'ses' => $ses);
            openpne_redirect('ktai', 'page_o_regist_ktai', $p);
        }

        // 携帯個体識別番号を取得できなかった場合
        if (!$easy_access_id = OpenPNE_KtaiID::getID()) {
            $p = array('ses' => $ses);
            openpne_redirect('ktai', 'page_o_regist_ktai_uid_err', $p);
        }

        // 携帯個体識別番号が登録済み
        if (db_member_c_member_id4easy_access_id($easy_access_id)) {
            $p = array('msg' => 39, 'ses' => $ses);
            openpne_redirect('ktai', 'page_o_regist_ktai', $p);
        }

        // 携帯個体識別番号がブラックリストに登録済み
        if (db_member_easy_access_id_is_blacklist(md5($easy_access_id))) {
            ktai_display_error('新規登録を完了できませんでした。');
        }

        // 携帯アドレスが登録済みかどうか
        if (db_member_is_sns_join4mail_address($ktai_address)) {
            $p = array('msg' => 17, 'ses' => $ses);
            openpne_redirect('ktai', 'page_o_regist_ktai', $p);
        }

        // 参加承認制の場合
        if (IS_SNS_ENTRY_CONFIRM) {
            // PCから入力された情報は既にpreに登録されているので、
            // 携帯個体識別番号のみを登録する
            $data = array('easy_access_id' => $easy_access_id
                         ,'is_sns_entry_confirm' => 1);
            db_member_update_c_member_pre4c_member_pre_id($pre['c_member_pre_id'], $data);
            openpne_redirect('ktai', 'page_o_regist_wait');
        }

        // PC版で行わなかったメンバー登録処理をここで行う
        $c_member = $pre;
        $c_member_secure = array(
            'password' => $pre['password'],
            'c_password_query_id' => $pre['c_password_query_id'],
            'password_query_answer' => $pre['c_password_query_answer'],
            'pc_address' => $pre['pc_address'],
            'ktai_address' => $pre['ktai_address'],
            'regist_address' => $pre['pc_address'],
        );
        $c_member_pre_profile = db_member_c_member_pre_profile4c_member_pre_id($pre['c_member_pre_id']);

        $u = util_regist_c_member($c_member, $c_member_secure, $c_member_pre_profile, true);

        // 携帯個体識別番号を登録する
        db_member_update_easy_access_id($u, $easy_access_id);

        // pre の内容を削除
        db_member_delete_c_member_pre4ktai_session($ses);
        db_member_delete_c_member_pre_profile4c_member_pre_id($pre['c_member_pre_id']);

        // 登録完了メール送信
        do_regist_prof_do_regist2_mail_send($u);

        // 登録完了メール(管理者宛)
        if (SEND_USER_DATA) {
            do_common_send_mail_regist4admin($u);
        }

        openpne_redirect('ktai', 'page_o_regist_ktai_end', array('c_member_id' => $u));
    }
}

?>
