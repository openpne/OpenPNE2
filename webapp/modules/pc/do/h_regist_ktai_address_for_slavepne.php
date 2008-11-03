<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_do_h_regist_ktai_address_for_slavepne extends OpenPNE_Action
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

        if (!is_ktai_mail_address($ktai_address)) {
            $msg = "携帯メールアドレスを記入してください";
            $p = array('msg' => $msg);
            openpne_redirect('pc', 'page_h_regist_ktai_address_for_slavepne', $p);
        }

        // 登録済みメールアドレスかどうかチェックする
        if (($c_member_id = db_member_c_member_id4ktai_address2($ktai_address)) &&
            $c_member_id != $u) {
            $msg = "入力されたメールアドレスは既に登録されています";
            $p = array('msg' => $msg);
            openpne_redirect('pc', 'h_regist_ktai_address_for_slavepne', $p);
        }

        db_member_delete_c_member_ktai_pre4ktai_address($ktai_address);
        db_member_delete_c_ktai_address_pre4ktai_address($ktai_address);

        $session = create_hash();
        db_member_insert_c_ktai_address_pre($u, $session, $ktai_address);
        do_mail_sns_regist_ktai_mail_for_slavepne_send($session, $ktai_address);

        $GLOBALS['AUTH']->logout();
        openpne_redirect('pc', 'page_o_h_regist_mail');
    }
}
?>
