<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_do_o_regist_pc_address extends OpenPNE_Action
{
    function isSecure()
    {
        return false;
    }

    function handleError($errors)
    {
        unset($_REQUEST['password']);

        $_REQUEST['msg'] = array_shift($errors);
        openpne_forward('pc', 'page', 'o_regist_pc_address');

        exit;
    }

    function execute($requests)
    {
        // --- リクエスト変数
        $password = $requests['password'];
        $pc_address = $requests['pc_address'];
        $pc_address2 = $requests['pc_address2'];

        if (OPENPNE_AUTH_MODE == 'pneid') {
            $username = $requests['pneid'];
        } else {
            $username = $requests['ktai_address'];
        }

        // ----------

        if (OPENPNE_AUTH_MODE == 'slavepne' || !OPENPNE_ENABLE_KTAI) {
            client_redirect_login();
        }

        $errors = array();

        if (OPENPNE_USE_CAPTCHA) {
            @session_start();
            if ($_SESSION['captcha_keystring'] !== $requests['captcha']) {
                $errors[] = "確認キーワードが誤っています";
            }

            unset($_SESSION['captcha_keystring']);
        }

        $c_member_id = db_member_c_member_id4username($username, true);
        if (!$c_member_id || db_member_hashed_password4c_member_id($c_member_id) !== md5($password)) {
            if (OPENPNE_AUTH_MODE == 'pneid') {
                $errors[] = 'ログインID、またはパスワードに正しい値を入力してください';
            } else {
                $errors[] = '携帯メールアドレス、またはパスワードに正しい値を入力してください';
            }
        }
        if (db_member_is_pc_address_registered($c_member_id)) {
            $errors[] = '既にPCメールアドレスを登録済みです';
        }
        if (!db_common_is_mailaddress($pc_address)
            || is_ktai_mail_address($pc_address)) {
            $errors[] = 'PCメールアドレスを正しく入力してください';
        }
        if (db_member_c_member_id4pc_address($pc_address)) {
            $errors[] = '入力されたPCメールアドレスは既に登録されています';
        }
        if ($pc_address !== $pc_address2) {
            $errors[] = 'PCメールアドレスが一致しません';
        }
        if (!db_member_is_limit_domain4mail_address($pc_address)) {
            $errors[] = '入力したPCメールアドレスでは登録できません';
        }

        if ($errors) {
            $this->handleError($errors);
        }

        // PCメール登録処理 
        db_member_h_config_1($c_member_id, $pc_address);

        openpne_redirect('pc', 'page_o_regist_pc_address_end');
    }
}

?>
