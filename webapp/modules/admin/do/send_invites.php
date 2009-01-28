<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// 招待メール一括送信
class admin_do_send_invites extends OpenPNE_Action
{
    function execute($requests)
    {
        $module_name = ADMIN_MODULE_NAME;

        if ($requests['input'] || empty($requests['mails'])) {
            openpne_forward($module_name, 'page', 'send_invites');
            exit;
        }

        $mails = $requests['mails'];
        $mails = str_replace("\r\n", "\n", $mails);
        $mails = str_replace("\r", "\n", $mails);
        $mail_list = explode("\n", $mails);

        $is_disable_regist_easy_access_id = $requests['is_disable_regist_easy_access_id'];

        // filtering
        $errors = array();
        $pcs = array();
        $ktais = array();
        $limits = array();

        foreach ($mail_list as $mail) {
            if (is_ktai_mail_address($mail)) {
                $mail = str_replace('"', '', $mail);
            }

            if (!db_common_is_mailaddress($mail)) { // メールアドレスとして正しくない
                $errors[] = $mail;
            } elseif (db_member_is_sns_join4mail_address($mail)) { // 登録済み
                $registered[] = $mail;
            } elseif (!db_member_is_limit_domain4mail_address($mail)) { // ドメイン制限
                $limits[] = $mail;
            } elseif (is_ktai_mail_address($mail)) {
                $ktais[] = $mail;
            } else {
                $pcs[] = $mail;
            }
        }

        if (isset($requests['complete'])) {
            // 送信者はとりあえず1番で固定
            $c_member_id_invite = 1;

            // 送信完了メール数確認用
            $send_complete = array();

            //<PCKTAI
            if ((OPENPNE_REGIST_FROM & OPENPNE_REGIST_FROM_KTAI) >> 1) {
                // 携帯へ招待メール
                foreach ($ktais as $mail) {
                    $session = create_hash();

                    // c_member_ktai_pre に追加
                    if (db_member_c_member_ktai_pre4ktai_address($mail)) {
                        db_member_update_c_member_ktai_pre($session, $mail, $c_member_id_invite, $is_disable_regist_easy_access_id);
                    } else {
                        db_member_insert_c_member_ktai_pre($session, $mail, $c_member_id_invite, $is_disable_regist_easy_access_id);
                    }

                    h_invite_insert_c_invite_mail_send($session, $c_member_id_invite, $mail, $requests['message']);
                    $send_complete[] = $mail;
                }
            }
            //>

            //<PCKTAI
            if ((OPENPNE_REGIST_FROM & OPENPNE_REGIST_FROM_PC)) {
                // PCへ招待メール
                foreach ($pcs as $mail) {
                    $session = create_hash();

                    // c_member_pre に追加
                    if (db_member_c_member_pre4pc_address($mail)) {
                        db_member_update_c_invite($c_member_id_invite, $mail, $requests['message'], $session, $is_disable_regist_easy_access_id);
                    } else {
                        db_member_insert_c_invite($c_member_id_invite, $mail, $requests['message'], $session, $is_disable_regist_easy_access_id);
                    }

                    do_h_invite_insert_c_invite_mail_send($c_member_id_invite, $session, $requests['message'], $mail);
                    $send_complete[] = $mail;
                }
            }
            //>

            // メール送信完了数が1件以上ある時は、完了画面へ
            if ($send_complete) {
                admin_client_redirect('top', '招待メールを送信しました');
            }
        }

        $_REQUEST['error_mails'] = $errors;
        $_REQUEST['registered_mails'] = $registered;
        $_REQUEST['pc_mails'] = $pcs;
        $_REQUEST['ktai_mails'] = $ktais;
        $_REQUEST['limit_domain_mails'] = $limits;
        openpne_forward($module_name, 'page', 'send_invites_confirm');
        exit;
    }
}

?>
