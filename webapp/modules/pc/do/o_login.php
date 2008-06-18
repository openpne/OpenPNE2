<?php
/**
 * @copyright 2005-2007 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_do_o_login extends OpenPNE_Action
{
    var $_auth;
    var $_lc;
    var $_login_params;

    function isSecure()
    {
        return false;
    }

    function execute($requests)
    {
        $this->_login_params = $requests['login_params'];
        $auth_config = get_auth_config();
        $auth = new OpenPNE_Auth($auth_config['storage'], $auth_config['options']);
        $this->_auth =& $auth;
        $auth->setExpire($GLOBALS['OpenPNE']['common']['session_lifetime']);
        $auth->setIdle($GLOBALS['OpenPNE']['common']['session_idletime']);

        // 現在のセッションを削除
        $auth->logout();

        if (LOGIN_CHECK_ENABLE) {
            include_once 'OpenPNE/LoginChecker.php';
            $options = array(
                'check_num'   => LOGIN_CHECK_NUM,
                'check_time'  => LOGIN_CHECK_TIME,
                'reject_time' => LOGIN_REJECT_TIME,
            );
            $this->_lc =& new OpenPNE_LoginChecker($options);
        }

        if (!$auth->login($requests['is_save'], true)) {
            $this->_fail_login();
        }

        if (LOGIN_CHECK_ENABLE && $this->_lc->is_rejected()) {
            $this->_fail_login();
        }

        $c_member_id = db_member_c_member_id4username_encrypted($auth->getUsername(), false);
        if (IS_SLAVEPNE && !$c_member_id) {
            $c_member_id = db_member_create_member($_POST['username']);
        }
        if (!$c_member_id) {
            $this->_fail_login();
        }

        db_api_update_token($c_member_id);

        $url = OPENPNE_URL;
        if ($this->_login_params) {
            $url .= '?' . $this->_login_params;
        }
        client_redirect_absolute($url);
    }

    function _fail_login()
    {
        if (LOGIN_CHECK_ENABLE) {
            $this->_lc->fail_login();
        }
        $this->_auth->logout();
        $p = array('msg_code' => 'login_failed', 'login_params' => $this->_login_params);
        openpne_redirect('pc', 'page_o_tologin', $p);
    }
}

?>
