<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

if (empty($_REQUEST['ksid'])) {
    __logout();
}

session_name('OpenPNEktai');
require_once 'OpenPNE/Auth.php';

$config = get_auth_config(true);
$auth = new OpenPNE_Auth($config);
$auth->setExpire($GLOBALS['OpenPNE']['ktai']['session_lifetime']);
$auth->setIdle($GLOBALS['OpenPNE']['ktai']['session_idletime']);

if (   !$auth->auth()
    || !($u = db_member_c_member_id4username_encrypted($auth->getUsername(), true))
    || db_member_is_login_rejected($u)) {
    $auth->logout();

    __logout();
}

if (db_member_is_blacklist($u)) {
    ktai_display_error('ﾛｸﾞｲﾝできませんでした。');
}

$auth->uid($u);
$GLOBALS['AUTH'] = $auth;

$GLOBALS['KTAI_C_MEMBER_ID'] = $auth->uid();
$GLOBALS['KTAI_URL_TAIL'] = "ksid=" . session_id();


if (OPENPNE_AUTH_MODE != 'email' && (empty($_SESSION['regist_step']) || !$_SESSION['regist_step'])) {
    $check_param = db_member_check_param_inputed($u, true);
    $_SESSION['regist_step'] = ($check_param == 0);
    $current_page = $GLOBALS['__Framework']['current_type']."_".$GLOBALS['__Framework']['current_action'];

    //プロフィールが未登録の場合はリダイレクト
    $prof_ext_page = array(
        'page_h_regist_pre' => true,
        'do_h_regist_prof' => true,
        'page_h_regist_prof' => true,
    );

    if (OPENPNE_AUTH_MODE == 'slavepne' && ($check_param == 1) && !$prof_ext_page[$current_page]) {
        openpne_redirect('ktai', 'page_h_regist_pre');
    }

    //メールアドレスが未登録の場合はリダイレクト
    $mail_ext_page = array(
        'do_h_regist_address' => true,
        'page_h_regist_address' => true,
    );

    if (($check_param == 2) && !$mail_ext_page[$current_page]) {
        openpne_redirect('ktai', 'page_h_regist_address');
    }
}

function __logout($msg = 0, $c_member_id = 0)
{
    @session_destroy();

    if ($msg) {
        $_REQUEST['msg'] = $msg;
    }
    if ($c_member_id) {
        $_REQUEST['kad'] = t_encrypt(db_member_username4c_member_id($c_member_id, true));
    }
    $_REQUEST['login_params'] = $_SERVER['QUERY_STRING'];
    if ($_SERVER['REQUEST_METHOD'] == 'POST') {
        $_POST = array('login_params' => $_SERVER['QUERY_STRING']);
    } else {
        $_GET = array('login_params' => $_SERVER['QUERY_STRING']);
    }
    if (LOGIN_URL_KTAI) {
        client_redirect_absolute(LOGIN_URL_KTAI);
    } else {
        openpne_forward('ktai', 'page', 'o_login');
    }
    exit;
}

?>
