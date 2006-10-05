<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

require_once 'OpenPNE/Auth.php';

$auth = new OpenPNE_Auth();
$auth->setExpire($GLOBALS['OpenPNE']['common']['session_lifetime']);
$auth->setIdle($GLOBALS['OpenPNE']['common']['session_idletime']);

if (   !$auth->auth()
    || !($u = _db_c_member_id4pc_address_encrypted($auth->getUsername()))
    || db_member_is_login_rejected($u)) {
    $auth->logout();

    $params = strstr($_SERVER['REQUEST_URI'], '/?');
    $params = substr($params, 2);

    if (LOGIN_URL_PC) {
        client_redirect_absolute(get_login_url());
    } else {
        $_REQUEST['login_params'] = $params;
        openpne_forward('pc', 'page', "o_login");
        exit;
    }
}

$auth->uid($u);
$GLOBALS['AUTH'] = $auth;

?>
