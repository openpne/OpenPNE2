<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

require_once 'OpenPNE/Auth.php';

$auth = new OpenPNE_Auth();
$auth->setExpire($GLOBALS['OpenPNE']['admin']['session_lifetime']);
$auth->setIdle($GLOBALS['OpenPNE']['admin']['session_idletime']);

if (   !$auth->auth()
    || !$uid = db_admin_c_admin_user_id4username($auth->getUsername())) {
    $auth->logout();
    admin_client_redirect('login');
}

$auth->uid($uid);
$GLOBALS['AUTH'] = $auth;

?>
