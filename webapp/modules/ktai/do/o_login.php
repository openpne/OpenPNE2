<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_do_o_login extends OpenPNE_Action
{
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

        if (LOGIN_CHECK_ENABLE) {
            // 不正ログインチェック
            include_once 'OpenPNE/LoginChecker.php';
            $options = array(
                'check_num'   => LOGIN_CHECK_NUM,
                'check_time'  => LOGIN_CHECK_TIME,
                'reject_time' => LOGIN_REJECT_TIME,
            );
            $lc = new OpenPNE_LoginChecker($options);
            if ($lc->is_rejected() || !$c_member_id = k_auth_login($ktai_address, $password)) {
                // 認証エラー
                $lc->fail_login();
                $p = array('msg' => '0', 'kad' => t_encrypt($ktai_address));
                openpne_redirect('ktai', 'page_o_login', $p);
            }
        } else {
            if (!$c_member_id = k_auth_login($ktai_address, $password)) {
                $p = array('msg' => '0', 'kad' => t_encrypt($ktai_address));
                openpne_redirect('ktai', 'page_o_login', $p);
            }
        }

        @session_name('OpenPNEktai');
        @session_start();
        @session_regenerate_id();

        $_SESSION['c_member_id'] = $c_member_id;
        $_SESSION['ktai_address'] = t_encrypt($requests['ktai_address']);
        $_SESSION['timestamp'] = $_SESSION['idle'] = time();
        if (OPENPNE_SESSION_CHECK_URL) {
            $_SESSION['OPENPNE_URL'] = OPENPNE_URL;
        }

        $p = array();
        if ($requests['login_params']) {
            parse_str($requests['login_params'], $p);
        }
        $p['ksid'] = session_id();
        if (!empty($p['a']) && $p['a'] != 'page_o_login') {
            $a = $p['a'];
            unset($p['a']);
        } else {
            $a = 'page_h_home';
        }
        openpne_redirect('ktai', $a, $p);
    }
}

?>
