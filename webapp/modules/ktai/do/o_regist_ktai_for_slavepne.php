<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

require_once 'OpenPNE/KtaiID.php';

class ktai_do_o_regist_ktai_for_slavepne extends OpenPNE_Action
{
    var $_auth;

    function isSecure()
    {
        return false;
    }

    function execute($requests)
    {
        // --- リクエスト変数
        $ses = $requests['ses'];
        $username = $requests['username'];
        $password = $requests['password'];
        // ----------

        if (!$pre = db_member_c_ktai_address_pre4session($ses)) {
            openpne_redirect('ktai', 'page_o_login');
        }
        $c_member_id = $pre['c_member_id'];
        $ktai_address = $pre['ktai_address'];

        // 個体識別番号の登録が必要かどうか
        if (!db_member_is_necessary_to_register_easy_access_id($c_member_id, true)) {
            openpne_redirect('ktai', 'page_o_login');
        }

        // メールアドレスが登録できるかどうか
        if (!util_is_regist_mail_address($ktai_address, $c_member_id)) {
            openpne_redirect('ktai', 'page_o_login', array('msg' => 42));
        }

        // ユーザ名の一致を確認
        if (db_member_username4c_member_id($c_member_id, true) != $username) {
            $p = array('msg' => 49, 'ses' => $ses);
            openpne_redirect('ktai', 'page_o_regist_ktai_for_slavepne', $p);
        }

        // パスワードチェック
        if (!db_common_authenticate_password($c_member_id, $password, true)) {
            $p = array('msg' => 49, 'ses' => $ses);
            openpne_redirect('ktai', 'page_o_regist_ktai_for_slavepne', $p);
        }

        // 携帯の個体識別番号の登録処理
        if (!$easy_access_id = OpenPNE_KtaiID::getID()) {
            // 携帯の個体識別番号を取得できませんでした
            $p = array('msg' => 27, 'ses' => $ses);
            openpne_redirect('ktai', 'page_o_regist_ktai_for_slavepne', $p);
        } else {
            $id = db_member_c_member_id4easy_access_id($easy_access_id);
            if ($id && $c_member_id != $id) {
                $p = array('msg' => 39, 'ses' => $ses);
                openpne_redirect('ktai', 'page_o_regist_ktai_for_slavepne', $p);
            }
            if (db_member_easy_access_id_is_blacklist(md5($easy_access_id))) {
                ktai_display_error('携帯ﾒｰﾙｱﾄﾞﾚｽを登録できませんでした。');
            }
            // 携帯個体識別番号を登録する
            db_member_update_easy_access_id($c_member_id, $easy_access_id);
            db_member_update_ktai_address($c_member_id, $ktai_address);
            db_member_delete_ktai_address_pre($pre['c_ktai_address_pre_id']);

            // 登録完了メール送信
            do_regist_prof_do_regist2_mail_send($u);

            openpne_redirect('ktai', 'do_o_easy_login');
        }
    }
}
?>
