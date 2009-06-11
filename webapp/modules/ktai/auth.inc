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

if (!$auth->auth()
    || !($u = db_member_c_member_id4username_encrypted($auth->getUsername(), true))
    || db_member_is_login_rejected($u)
    || db_member_is_blacklist($u)
    || !db_member_is_one_session_per_user($u, session_id())) {
    $auth->logout();

    __logout();
}

$auth->uid($u);
$GLOBALS['AUTH'] = $auth;

$GLOBALS['KTAI_C_MEMBER_ID'] = $auth->uid();
$GLOBALS['KTAI_URL_TAIL'] = "ksid=" . session_id();

// ログインモードが email でない場合、ログインに必要な情報が入力されているかどうかをチェックする
if (OPENPNE_AUTH_MODE != 'email' && empty($_SESSION['regist_step'])) {
    $current_page = $GLOBALS['__Framework']['current_type'] . '_' . $GLOBALS['__Framework']['current_action'];

    // プロフィールが未登録の場合でもアクセスすることのできるアクション
    $prof_ext_page = array(
        'page_h_regist_pre',
        'do_h_regist_prof',
        'page_h_regist_prof',
    );

    // メールアドレスが未登録の場合でもアクセスすることのできるアクション
    $mail_ext_page = array(
        'do_h_regist_address',
        'page_h_regist_address',
    );

    $is_registered_profile = db_member_is_registered_nickname_birth_day($u);
    $is_registered_profile_action = in_array($current_page, $prof_ext_page);

    $is_registered_address = db_member_is_ktai_address_registered($u);
    $is_registered_address_action = in_array($current_page, $mail_ext_page);

    if ($is_registered_profile && $is_registered_address) {
        $_SESSION['regist_step'] = true;
    } elseif ($is_registered_address && OPENPNE_AUTH_MODE == 'pneid') {
        $_SESSION['regist_step'] = true;
    } else {
        $_SESSION['regist_step'] = false;
    }

    if (!$is_registered_profile_action && !$is_registered_address_action) {
        // プロフィールが未登録
        if (!$is_registered_profile && OPENPNE_AUTH_MODE == 'slavepne') {
            openpne_redirect('ktai', 'page_h_regist_pre');
        }

        // メールアドレスが未登録
        if (!$is_registered_address) {
            openpne_redirect('ktai', 'page_h_regist_address');
        }
    }
}

// 秘密の質問の設定が有効な状態で、秘密の質問を設定していない場合、秘密の質問の入力をチェックする
if (IS_PASSWORD_QUERY_ANSWER == 2 && OPENPNE_AUTH_MODE != 'slavepne' && empty($_SESSION['is_password_query_answer'])) {
    $current_page = $GLOBALS['__Framework']['current_type'] . '_' . $GLOBALS['__Framework']['current_action'];

    // 秘密の質問が未登録の場合でもアクセスすることのできるアクション
    $password_query_answer_ext_page = array(
        'page_h_config_password_query',
        'do_h_config_password_query_update_password_query',
    );

    $is_registered_password_query_answer = db_member_is_registered_password_query_answer($u);
    $is_registered_password_query_answer_action = in_array($current_page, $password_query_answer_ext_page);

    if ($is_registered_password_query_answer) {
        $_SESSION['is_password_query_answer'] = true;
    } else {
        $_SESSION['is_password_query_answer'] = false;
    }

    if (!$is_registered_password_query_answer_action) {
        // 秘密の質問が未登録
        if (!$is_registered_password_query_answer) {
            $p = array('msg' => 52);
            openpne_redirect('ktai', 'page_h_config_password_query', $p);
        }

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
