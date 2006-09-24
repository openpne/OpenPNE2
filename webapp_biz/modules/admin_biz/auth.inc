<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_0.txt PHP License 3.0
 */

require_once 'OpenPNE/Auth.php';

$auth = new OpenPNE_Auth();
$auth->setExpire($GLOBALS['OpenPNE']['admin']['session_lifetime']);
$auth->setIdle($GLOBALS['OpenPNE']['admin']['session_idletime']);

if (   !$auth->auth()
    || !$uid = db_admin_c_admin_user_id4username($auth->getUsername())) {
    $auth->logout();
    admin_biz_client_redirect('login');
}

$auth->uid($uid);
$GLOBALS['AUTH'] = $auth;

?>
