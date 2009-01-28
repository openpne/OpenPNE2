<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

require_once 'OpenPNE/KtaiID.php';

class ktai_do_o_update_ktai_address extends OpenPNE_Action
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

        // セッションが有効かどうか
        if (!$pre = db_member_c_ktai_address_pre4session($ses)) {
            // 無効の場合、login へリダイレクト
            openpne_redirect('ktai', 'page_o_login');
        }

        // メールアドレスが登録できるかどうか
        if (!util_is_regist_mail_address($pre['ktai_address'], $pre['c_member_id'])) {
            openpne_redirect('ktai', 'page_o_login', array('msg' => 42));
        }

        $c_member_id = $pre['c_member_id'];
        $ktai_address = $pre['ktai_address'];

        // パスワードチェック
        if (!db_common_authenticate_password($c_member_id, $password, true)) {
            $p = array('msg' => 18, 'ses' => $ses);
            openpne_redirect('ktai', 'page_o_login2', $p);
        }

        if (IS_GET_EASY_ACCESS_ID == 2 || IS_GET_EASY_ACCESS_ID == 3) {

        // 携帯の個体識別番号の取得が必須
            if (!$easy_access_id = OpenPNE_KtaiID::getID()) {
                // 携帯の個体識別番号を取得できませんでした
                $p = array('msg' => 27, 'ses' => $ses);
                openpne_redirect('ktai', 'page_o_login2', $p);
            } else {
                $id = db_member_c_member_id4easy_access_id($easy_access_id);
                if ($id && $c_member_id != $id) {
                    $p = array('msg' => 39, 'ses' => $ses);
                    openpne_redirect('ktai', 'page_o_login2', $p);
                }
                if (db_member_easy_access_id_is_blacklist(md5($easy_access_id))) {
                    ktai_display_error('携帯ﾒｰﾙｱﾄﾞﾚｽを登録できませんでした。');
                }
                // update
                db_member_update_easy_access_id($c_member_id, $easy_access_id);
                db_member_update_ktai_address($c_member_id, $ktai_address);
                db_member_delete_ktai_address_pre($pre['c_ktai_address_pre_id']);
                openpne_redirect('ktai', 'do_o_easy_login');
            }
        } else if (IS_GET_EASY_ACCESS_ID == 1) {

        // 携帯の個体識別番号の取得が任意
            if ($easy_access_id = OpenPNE_KtaiID::getID()) {
                $id = db_member_c_member_id4easy_access_id($easy_access_id);
                if ($id && $c_member_id != $id) {
                    $p = array('msg' => 39, 'ses' => $ses);
                    openpne_redirect('ktai', 'page_o_login2', $p);
                }
                if (db_member_easy_access_id_is_blacklist(md5($easy_access_id))) {
                    ktai_display_error('携帯ﾒｰﾙｱﾄﾞﾚｽを登録できませんでした。');
                }
                // update
                db_member_update_easy_access_id($c_member_id, $easy_access_id);
                db_member_update_ktai_address($c_member_id, $ktai_address);
                db_member_delete_ktai_address_pre($pre['c_ktai_address_pre_id']);
                openpne_redirect('ktai', 'do_o_easy_login');
            }
        }

        // 携帯の個体識別番号を取得しない

        db_member_update_ktai_address($c_member_id, $ktai_address);
        db_member_delete_ktai_address_pre($pre['c_ktai_address_pre_id']);

        // login ページへリダイレクト
        $p = array('msg' => 19, 'kad' => t_encrypt(db_member_username4c_member_id($c_member_id, true)));
        openpne_redirect('ktai', 'page_o_login', $p);
    }
}

?>
