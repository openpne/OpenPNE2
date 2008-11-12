<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

require_once 'OpenPNE/Auth.php';

$config = array('is_admin' => true);
$auth = new OpenPNE_Auth($config);
$auth->setExpire($GLOBALS['OpenPNE']['admin']['session_lifetime']);
$auth->setIdle($GLOBALS['OpenPNE']['admin']['session_idletime']);

if (   !$auth->auth()
    || !($uid = db_admin_c_admin_user_id4username($auth->getUsername()))
    || !db_admin_is_one_session_per_user($uid, session_id())) {
    $auth->logout();
    admin_client_redirect('login');
}

$auth->uid($uid);
$GLOBALS['AUTH'] = $auth;

?>
