<?php
/**
 * @copyright 2005-2007 OpenPNE Project
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
        @session_start();
        @session_regenerate_id();
        
        $auth_config = get_auth_config(true);
        $auth_config['options']['advancedsecurity'] = false;
        $auth = new OpenPNE_Auth($auth_config['storage'], $auth_config['options'],true);
        $this->_auth =& $auth;
        $auth->setExpire($GLOBALS['OpenPNE']['ktai']['session_lifetime']);
        $auth->setIdle($GLOBALS['OpenPNE']['ktai']['session_idletime']);
        
        if (LOGIN_CHECK_ENABLE) {
            // 不正ログインチェック
            include_once 'OpenPNE/LoginChecker.php';
            $options = array(
                'check_num'   => LOGIN_CHECK_NUM,
                'check_time'  => LOGIN_CHECK_TIME,
                'reject_time' => LOGIN_REJECT_TIME,
            );
            $lc = new OpenPNE_LoginChecker($options);
            if ($lc->is_rejected() || !$auth->login(false, true, true)) {
                // 認証エラー
                $lc->fail_login();
                $p = array('msg' => '0', 'kad' => t_encrypt($ktai_address), 'login_params' => $requests['login_params']);
                openpne_redirect('ktai', 'page_o_login', $p);
            }
        } else {
            if (!$auth->login(false, true, true)) {
                $p = array('msg' => '0', 'kad' => t_encrypt($ktai_address), 'login_params' => $requests['login_params']);
                openpne_redirect('ktai', 'page_o_login', $p);
            }
        }
        if (IS_SLAVEPNE && !($c_member_id = db_member_c_member_id4username_encrypted($auth->getUsername(), true))) {
            db_member_create_member($_POST['username']);
        }

        // ログイン後のリダイレクト先を決定する
        $a = '';
        $m = 'ktai';
        $p = array();

        if ($GLOBALS['__Framework']['default_page']) {
            $a = 'page_' . $GLOBALS['__Framework']['default_page'];
        }

        if ($requests['login_params']) {
            parse_str($requests['login_params'], $p);
        }

        if (!empty($p['a']) && $p['a'] != 'page_o_login') {
            $a = $p['a'];
        }
        if (!empty($p['m'])) {
            $m = $p['m'];
        }

        $_SESSION['c_member_id'] = $c_member_id;
        $p['ksid'] = session_id();

        openpne_redirect($m, $a, $p);
    }
}

?>
