<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_do_h_config_mail_insert_c_ktai_address_pre extends OpenPNE_Action
{
    function execute($requests)
    {
        $tail = $GLOBALS['KTAI_URL_TAIL'];
        $u = $GLOBALS['KTAI_C_MEMBER_ID'];

        // --- リクエスト変数
        $ktai_address = $requests['ktai_address'];
        // ----------
        $ktai_address = str_replace('"', '', $ktai_address);

        //--- 権限チェック
        //必要なし

        //---

        if (!db_common_is_mailaddress($ktai_address)) {
            // メールアドレスを入力してください
            $p = array('msg' => 12);
            openpne_redirect('ktai', 'page_h_config_mail', $p);
        }

        if (!is_ktai_mail_address($ktai_address)) {
            // 携帯メールアドレス以外は指定できません
            $p = array('msg' => 16);
            openpne_redirect('ktai', 'page_h_config_mail', $p);
        }

        if (db_member_is_sns_join4mail_address($ktai_address)) {
            // このメールアドレスはすでに登録されています
            $p = array('msg' => 17);
            openpne_redirect('ktai', 'page_h_config_mail', $p);
        }

        if (!db_member_is_limit_domain4mail_address($ktai_address)) {
            // このメールアドレスでは登録できません
            $p = array('msg' => 37);
            openpne_redirect('ktai', 'page_h_config_mail', $p);
        }

        db_member_delete_c_member_ktai_pre4ktai_address($ktai_address);
        db_member_delete_c_ktai_address_pre4ktai_address($ktai_address);

        $session = create_hash();
        db_member_insert_c_ktai_address_pre($u, $session, $ktai_address);

        do_mail_sns_change_ktai_mail_send($u, $session, $ktai_address);

        openpne_redirect('ktai', 'page_o_send_mail_end');
    }
}

?>
