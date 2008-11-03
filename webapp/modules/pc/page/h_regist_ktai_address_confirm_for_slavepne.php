<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_h_regist_ktai_address_confirm_for_slavepne extends OpenPNE_Action
{
    function isSecure()
    {
        return true;
    }

    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();
        if (!db_member_is_necessary_to_register_easy_access_id($u)) {
            openpne_redirect('pc', 'page_h_home');
        }

        $ktai_address = $requests['ktai_address'];
        $ktai_address = str_replace('"', '', $ktai_address);
        //携帯メールアドレスチェック
        if (!db_common_is_mailaddress($ktai_address)) {
            $msg = "メールアドレスを正しく入力してください";
        } elseif (db_member_is_sns_join4mail_address($ktai_address, 0, true)) {
            $msg = "そのメールアドレスは既に登録済みです";
        } elseif (!is_ktai_mail_address($ktai_address)) {
            $msg = "携帯メールアドレスを入力してください";
        }

        if (!empty($msg)) {
            $p = array('msg' => $msg, 'ktai_address' => $ktai_address);
            openpne_redirect('pc', 'page_h_regist_ktai_address_for_slavepne', $p);
        }

        //---- inc_ テンプレート用 変数 ----//
        $this->set('inc_page_header', fetch_inc_page_header('regist'));
        $this->set('ktai_address', $ktai_address);

        return 'success';
    }
}

?>
