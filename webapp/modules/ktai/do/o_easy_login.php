<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

require_once 'OpenPNE/KtaiID.php';

class ktai_do_o_easy_login extends OpenPNE_Action
{
    var $_auth;

    function isSecure()
    {
        return false;
    }

    function execute($requests)
    {
        if (!$c_member_id = db_member_c_member_id4easy_access_id(OpenPNE_KtaiID::getID())) {
            // 認証エラー
            $p = array('msg' => 14, 'kad' => t_encrypt($requests['ktai_address']), 'login_params' => $requests['login_params']);
            openpne_redirect('ktai', 'page_o_login', $p);
        }

        $c_member = db_member_c_member4c_member_id($c_member_id, true);

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
            if ($lc->is_rejected()) {
                // 認証エラー
                $lc->fail_login();
                $p = array('msg' => '0', 'login_params' => $requests['login_params']);
                openpne_redirect('ktai', 'page_o_login', $p);
            }
        }
        $auth->auth =& $auth->factory(true);
        $username = db_member_username4c_member_id($c_member_id, true);
        if (OPENPNE_AUTH_MODE == 'email') {
           $username = t_encrypt($username);
        }
        $auth->auth->setAuth($username);
        $auth->auth->setAuthData('OPENPNE_URL', OPENPNE_URL);
        $auth->auth->setAuthData('USER_AGENT', $_SERVER['HTTP_USER_AGENT']);

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
