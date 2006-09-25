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

    $regexp = '/.*\/\?(.*)/i';
    $string = preg_replace_callback($regexp, 'client_redirect_login_with_param', $_SERVER['REQUEST_URI']);
}

$auth->uid($u);
$GLOBALS['AUTH'] = $auth;


function client_redirect_login_with_param($matches)
{
    $params  = $matches[1];
    client_redirect_absolute(get_login_url()."&login_params=".urlencode(t_encrypt($params)));
}

?>
