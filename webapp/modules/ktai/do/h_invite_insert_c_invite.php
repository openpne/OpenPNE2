<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * 招待メール送信
 */
class ktai_do_h_invite_insert_c_invite extends OpenPNE_Action
{
    function execute($requests)
    {
        $tail = $GLOBALS['KTAI_URL_TAIL'];
        $u = $GLOBALS['KTAI_C_MEMBER_ID'];

        if (!IS_USER_INVITE) {
            ktai_display_error(SNS_NAME . 'では、メンバーによる招待は行えません');
        }

        // --- リクエスト変数
        $mail = $requests['mail_address'];
        $body = $requests['body'];
        // ----------
        if (is_ktai_mail_address($mail)) {
            $mail = str_replace('"', '', $mail);
        }

        if (!$mail) {
            $p = array('msg' => 12);
            openpne_redirect('ktai', 'page_h_invite', $p);
        }
        if (!db_common_is_mailaddress($mail)) {
            $p = array('msg' => 31);
            openpne_redirect('ktai', 'page_h_invite', $p);
        }
        if (db_member_is_sns_join4mail_address($mail)) {
            $p = array('msg' => 9);
            openpne_redirect('ktai', 'page_h_invite', $p);
        }
        if (!db_member_is_limit_domain4mail_address($mail)) {
            $p = array('msg' => 37);
            openpne_redirect('ktai', 'page_h_invite', $p);
        }

        $session = create_hash();

        if (is_ktai_mail_address($mail)) {
            //<PCKTAI
            if (!((OPENPNE_REGIST_FROM & OPENPNE_REGIST_FROM_KTAI) >> 1)) {
                $p = array('msg' => 13);
                openpne_redirect('ktai', 'page_h_invite', $p);
            }
            //>

            if (OPENPNE_AUTH_MODE != 'slavepne') {
                // c_member_ktai_pre に追加
                if (db_member_c_member_ktai_pre4ktai_address($mail)) {
                    db_member_update_c_member_ktai_pre($session, $mail, $u);
                } else {
                    db_member_insert_c_member_ktai_pre($session, $mail, $u);
                }
            }

            h_invite_insert_c_invite_mail_send($session, $u, $mail, $body);

        } else {
            //<PCKTAI
            if (!(OPENPNE_REGIST_FROM & OPENPNE_REGIST_FROM_PC)) {
                $p = array('msg' => 16);
                openpne_redirect('ktai', 'page_h_invite', $p);
            }
            //>

            if (OPENPNE_AUTH_MODE != 'slavepne') {
                // c_member_pre に追加
                if (db_member_c_member_pre4pc_address($mail)) {
                    db_member_update_c_invite($u, $mail, $body, $session);
                } else {
                    db_member_insert_c_invite($u, $mail, $body, $session);
                }
            }

            do_h_invite_insert_c_invite_mail_send($u, $session, $body, $mail);
        }

        $p = array('msg' => 30);
        openpne_redirect('ktai', 'page_h_invite', $p);
    }
}

?>
