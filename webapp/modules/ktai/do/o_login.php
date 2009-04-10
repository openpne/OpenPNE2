<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_do_o_login extends OpenPNE_Action
{
    var $_auth;

    function isSecure()
    {
        return false;
    }

    function execute($requests)
    {
        // --- リクエスト変数
        $c_member_id = $requests['c_member_id'];
        $ktai_address = $requests['ktai_address'];
        $password = $requests['password'];
        // ----------

        @session_name('OpenPNEktai');

        $config = get_auth_config(true);
        $auth = new OpenPNE_Auth($config);
        $auth->setExpire($GLOBALS['OpenPNE']['ktai']['session_lifetime']);
        $auth->setIdle($GLOBALS['OpenPNE']['ktai']['session_idletime']);
        $this->_auth =& $auth;

        if (LOGIN_CHECK_ENABLE) {
            // 不正ログインチェック
            include_once 'OpenPNE/LoginChecker.php';
            $options = array(
                'check_num'   => LOGIN_CHECK_NUM,
                'check_time'  => LOGIN_CHECK_TIME,
                'reject_time' => LOGIN_REJECT_TIME,
            );
            $lc = new OpenPNE_LoginChecker($options);
            if ($lc->is_rejected() || !$auth->login()) {
                // 認証エラー
                $lc->fail_login();
                $p = array('msg' => '0', 'kad' => t_encrypt($ktai_address), 'login_params' => $requests['login_params']);
                openpne_redirect('ktai', 'page_o_login', $p);
            }
        } else {
            if (!$auth->login()) {
                $p = array('msg' => '0', 'kad' => t_encrypt($ktai_address), 'login_params' => $requests['login_params']);
                openpne_redirect('ktai', 'page_o_login', $p);
            }
        }

        $c_member_id = db_member_c_member_id4username_encrypted($auth->getUsername(), true);
        if (OPENPNE_AUTH_MODE == 'slavepne' && !$c_member_id) {
            $c_member_id = db_member_create_member($_POST['username']);
        }
        if (!$c_member_id) {
            $p = array('msg' => '0', 'kad' => t_encrypt($ktai_address), 'login_params' => $requests['login_params']);
            openpne_redirect('ktai', 'page_o_login', $p);
        }

        if (OPENPNE_ONE_SESSION_PER_USER) {
            db_member_update_c_member_secure_insert_sess_id($c_member_id, session_id());
        }
        if (db_member_is_login_rejected($c_member_id)) {
            ktai_display_error('ﾛｸﾞｲﾝできませんでした。');
        }
        if (db_member_is_blacklist($c_member_id)) {
            ktai_display_error('ﾛｸﾞｲﾝできませんでした。');
        }

        db_member_do_access($c_member_id);

        // ログイン後のリダイレクト先を決定する
        $a = '';
        $m = 'ktai';
        $p = array();

        if ($requests['login_params']) {
            parse_str($requests['login_params'], $p);
        }

        if (!empty($p['a'])) {
            $a = $p['a'];
        }

        if (!empty($p['m'])) {
            $m = $p['m'];
        }

        if ($m == 'ktai' && $a == 'page_o_login') {
            $a = '';
        }

        $_SESSION['c_member_id'] = $c_member_id;
        $p['ksid'] = session_id();
        openpne_redirect($m, $a, $p);
    }
}

?>
