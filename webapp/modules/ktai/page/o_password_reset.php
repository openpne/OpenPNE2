<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_page_o_password_reset extends OpenPNE_Action
{
    function isSecure()
    {
        return false;
    }

    function execute($requests)
    {
        //外部認証の場合はリダイレクト
        check_action4pne_slave(true);

        // --- リクエスト変数
        $session = $requests['session'];
        $id = $requests['id'];
        // ----------

        // ハッシュ化されたIDを戻す
        $c_member_id = t_decrypt($id);

        // 権限チェック
        if (!db_member_c_member_config4name($c_member_id, 'password_reset_sid')) {
            handle_kengen_error();
        }
        if (!db_member_c_member_config4name($c_member_id, 'password_reset_sid_time')) {
            handle_kengen_error();
        }

        $c_member_config = db_member_c_member_config4c_member_id($c_member_id);

        // 権限チェック
        if ($c_member_config['password_reset_sid'] != $session) {
            handle_kengen_error();
        }

        // 有効期限は24時間
        $one_day_time = 86400;
        $limit_password_reset_sid_time
            = $c_member_config['password_reset_sid_time'] + $one_day_time;

        // 権限チェック
        if (time() > $limit_password_reset_sid_time) {
            $p = array('msg' => 55);
            openpne_redirect('ktai', 'page_o_login', $p);
        }

        $this->set('session', $session);
        $this->set('id', $id);

        return 'success';
    }
}

?>
