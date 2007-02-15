<?php
/**
 * @copyright 2005-2007 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

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

        $c_member_id = $pre['c_member_id'];
        $ktai_address = $pre['ktai_address'];

        // パスワードチェック
        if (!db_common_authenticate_password($c_member_id, $password, true)) {
            $p = array('msg' => 18, 'ses' => $ses);
            openpne_redirect('ktai', 'page_o_login2', $p);
        }

        db_member_update_ktai_address($c_member_id, $ktai_address);
        db_member_delete_ktai_address_pre($pre['c_ktai_address_pre_id']);

        // login ページへリダイレクト
        $p = array('msg' => 19, 'kad' => t_encrypt(db_member_username4c_member_id($c_member_id, true)));
        openpne_redirect('ktai', 'page_o_login', $p);
    }
}

?>
