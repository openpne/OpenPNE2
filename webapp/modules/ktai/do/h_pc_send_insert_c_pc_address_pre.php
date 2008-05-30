<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_do_h_pc_send_insert_c_pc_address_pre extends OpenPNE_Action
{
    function execute($requests)
    {
        //<PCKTAI
        if (!OPENPNE_ENABLE_PC) {
            openpne_redirect('ktai', 'page_h_home');
        }
        //>

        $tail = $GLOBALS['KTAI_URL_TAIL'];
        $u = $GLOBALS['KTAI_C_MEMBER_ID'];

        // --- リクエスト変数
        $pc_address = $requests['pc_address'];
        // ----------

        $errors = array();
        if (!db_common_is_mailaddress($pc_address)) {
            $errors[] = 'メールアドレスを正しく入力してください';
        } elseif (is_ktai_mail_address($pc_address)) {
            $errors[] = '携帯メールアドレスは入力できません';
        } elseif (db_member_c_member4pc_address($pc_address)) {
            $errors[] = '入力したメールアドレスは既に登録されています';
        } elseif (!db_member_is_limit_domain4mail_address($pc_address)) {
            $errors[] = '入力したメールアドレスでは登録できません';
        }

        if ($errors) {
            ktai_display_error($errors);
        }

        db_member_h_config_1($u, $pc_address);

        openpne_redirect('ktai', 'page_h_pc_send_confirm');
    }
}

?>
