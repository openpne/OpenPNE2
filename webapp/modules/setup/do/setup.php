<?php
/**
 * @copyright 2005-2007 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class setup_do_setup extends OpenPNE_Action
{
    function handleError($errors)
    {
        openpne_forward('setup', 'page', 'setup', $errors);
        exit;
    }

    function execute($requests)
    {
        $errors = array();
        if (!db_common_is_mailaddress($requests['pc_address'])
            || is_ktai_mail_address($requests['pc_address'])) {
            $errors[] = 'PCメールアドレスを正しく入力してください';
        }
        if ($requests['password'] !== $requests['password2']) {
            $errors[] = 'パスワードが一致していません';
        }
        if ($requests['admin_password'] !== $requests['admin_password2']) {
            $errors[] = '管理用パスワードが一致していません';
        }
        if ($errors) {
            $this->handleError($errors);
        }

        // c_admin_config: SNS_NAME
        $data = array(
            'name' => 'SNS_NAME',
            'value' => $requests['SNS_NAME'],
        );
        db_insert('c_admin_config', $data);

        // c_member_secure
        $data = array(
            'c_member_id' => 1,
            'hashed_password' => md5($requests['password']),
            'hashed_password_query_answer' => '',
            'pc_address' => t_encrypt($requests['pc_address']),
            'ktai_address' => '',
            'regist_address' => t_encrypt($requests['pc_address']),
            'easy_access_id' => '',
        );
        db_insert('c_member_secure', $data);

        // c_admin_user
        $data = array(
            'username' => $requests['admin_username'],
            'password' => md5($requests['admin_password']),
            'auth_type' => 'all',
        );
        db_insert('c_admin_user', $data);

        openpne_redirect('setup', 'page_setup_done');
    }
}

?>
