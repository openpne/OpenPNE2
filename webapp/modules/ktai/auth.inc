<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

if (empty($_REQUEST['ksid'])) {
    __logout();
}

session_name('OpenPNEktai');
session_id($_REQUEST['ksid']);
session_start();

if (   empty($_SESSION['c_member_id'])
    || !k_auth($_SESSION['c_member_id'])
    || db_member_is_login_rejected($_SESSION['c_member_id'])) {
    __logout(15);
}

// セッションの有効期限
$lifetime = $GLOBALS['OpenPNE']['ktai']['session_lifetime'];
$idletime = $GLOBALS['OpenPNE']['ktai']['session_idletime'];
if (!isset($_SESSION['timestamp']) ||
    ($liftime && ($_SESSION['timestamp'] + $lifetime) < time())
   ) {
    __logout(15, $_SESSION['c_member_id']);
}
if (!isset($_SESSION['idle']) ||
    ($idletime && ($_SESSION['idle'] + $idletime) < time())
   ) {
    __logout(15, $_SESSION['c_member_id']);
}

$_SESSION['idle'] = time();

$GLOBALS['KTAI_C_MEMBER_ID'] = $_SESSION['c_member_id'];
$GLOBALS['KTAI_URL_TAIL'] = "ksid=" . session_id();


function __logout($msg = 0, $c_member_id = 0)
{
    @session_destroy();

    $p = array();
    if ($msg) {
        $p['msg'] = $msg;
    }
    if ($c_member_id) {
        $c_member_secure = db_common_c_member_secure4c_member_id($c_member_id);
        $p['kad'] = t_encrypt($c_member_secure['ktai_address']);
    }
    openpne_redirect('ktai', 'page_o_login', $p);
}

?>
