<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

require_once 'OpenPNE/Auth.php';

$config = get_auth_config();
$auth = new OpenPNE_Auth($config);
$auth->setExpire($GLOBALS['OpenPNE']['common']['session_lifetime']);
$auth->setIdle($GLOBALS['OpenPNE']['common']['session_idletime']);

if (   !$auth->auth()
    || !($u = db_member_c_member_id4username_encrypted($auth->getUsername(), false))
    || db_member_is_login_rejected($u)) {
    $auth->logout();

    if (LOGIN_URL_PC) {
        client_redirect_absolute(get_login_url());
    } else {
        $parts = explode('/', $_SERVER['SCRIPT_NAME']);
        $_REQUEST['login_params'] = $_SERVER['QUERY_STRING'];
        if ($_SERVER['REQUEST_METHOD'] == 'POST') {
            $_POST = array('login_params' => $_SERVER['QUERY_STRING']);
        } else {
            $_GET = array('login_params' => $_SERVER['QUERY_STRING']);
        }
        openpne_forward('pc', 'page', "o_login");
        exit;
    }
}

if (db_member_is_blacklist($u)) {
    $p = array('msg_code' => 'blacklist');
    openpne_redirect('pc', 'page_o_tologin', $p);
}

$auth->uid($u);
$GLOBALS['AUTH'] = $auth;

if (OPENPNE_AUTH_MODE != 'email' && (empty($_SESSION['regist_step']) || !$_SESSION['regist_step'])) {
    $check_param = db_member_check_param_inputed($u);
    $_SESSION['regist_step'] = ($check_param == 0);
    $current_page = $GLOBALS['__Framework']['current_type'] . '_' . $GLOBALS['__Framework']['current_action'];

    // プロフィールが未登録の場合はリダイレクト
    $prof_ext_page = array(
        'do_h_regist_prof' => true,
        'page_h_regist_prof' => true,
        'do_inc_page_header_logout' => true,
        'page_h_regist_intro' => true,
    );

    if (OPENPNE_AUTH_MODE == 'slavepne' && ($check_param == 1) && !$prof_ext_page[$current_page]) {
        openpne_redirect('pc', 'page_h_regist_intro');
    }

    // メールアドレスが未登録の場合はリダイレクト
    $mail_ext_page = array(
        'do_h_regist_address' => true,
        'page_h_regist_address' => true,
        'do_inc_page_header_logout' => true,
    );

    if (($check_param == 2) && !$mail_ext_page[$current_page]) {
        openpne_redirect('pc', 'page_h_regist_address');
    }
}

?>
