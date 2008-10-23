<?php

require_once 'OpenPNE/Auth.php';

$auth = new OpenPNE_Auth();
$auth->setExpire($GLOBALS['OpenPNE']['admin']['session_lifetime']);
$auth->setIdle($GLOBALS['OpenPNE']['admin']['session_idletime']);

if (   !$auth->auth()
    || !($uid = db_admin_c_admin_user_id4username($auth->getUsername()))
    || db_etc_is_difference_session_per_user($uid, $auth->auth(), session_id(), true)){
    $auth->logout();
    admin_client_redirect('login');
}

$auth->uid($uid);
$GLOBALS['AUTH'] = $auth;

?>
