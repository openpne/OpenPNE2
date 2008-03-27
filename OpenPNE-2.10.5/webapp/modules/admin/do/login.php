<?php
/**
 * @copyright 2005-2007 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class admin_do_login extends OpenPNE_Action
{
    var $_auth;

    function isSecure()
    {
        return false;
    }

    function execute($requests)
    {
        $options = array(
            'dsn'         => db_get_dsn(),
            'table'       => 'c_admin_user',
            'usernamecol' => 'username',
            'passwordcol' => 'password',
            'cryptType'   => 'md5',
        );
        $auth = new OpenPNE_Auth('DB', $options);
        $this->_auth =& $auth;
        $auth->setExpire($GLOBALS['OpenPNE']['admin']['session_lifetime']);
        $auth->setIdle($GLOBALS['OpenPNE']['admin']['session_idletime']);

        // 現在のセッションを削除
        $auth->logout();

        if (!$auth->login($requests['is_save'])) {
            $this->_fail_login();
        }

        admin_client_redirect('top');
    }

    function _fail_login()
    {
        $this->_auth->logout();
        admin_client_redirect('login', 'ログインに失敗しました');
    }
}

?>
