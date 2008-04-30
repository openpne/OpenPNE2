<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_do_h_config_ktai_send extends OpenPNE_Action
{
    function execute($requests)
    {
        //<PCKTAI
        if (!OPENPNE_ENABLE_KTAI) {
            openpne_redirect('pc', 'page_h_home');
        }
        //>

        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $ktai_address = $requests['ktai_address'];
        // ----------
        $ktai_address = str_replace('"', '', $ktai_address);

        if (!is_ktai_mail_address($ktai_address)) {
            $msg = "携帯メールアドレスを記入してください";
            $p = array('msg' => $msg);
            openpne_redirect('pc', 'page_h_config_ktai', $p);
        }

        // 登録済みメールアドレスかどうかチェックする
        if (($c_member_id = db_member_c_member_id4ktai_address2($ktai_address)) &&
            $c_member_id != $u) {
            $msg = "入力されたメールアドレスは既に登録されています";
            $p = array('msg' => $msg);
            openpne_redirect('pc', 'page_h_config_ktai', $p);
        }

        db_member_delete_c_member_ktai_pre4ktai_address($ktai_address);
        db_member_delete_c_ktai_address_pre4ktai_address($ktai_address);

        $session = create_hash();
        db_member_insert_c_ktai_address_pre($u, $session, $ktai_address);

        do_mail_sns_change_ktai_mail_send($u, $session, $ktai_address);

        openpne_redirect('pc', 'page_h_config_ktai_end');
    }
}

?>
