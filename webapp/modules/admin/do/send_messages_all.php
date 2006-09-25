<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// メッセージ一括送信
class admin_do_send_messages_all extends OpenPNE_Action
{
    function execute($requests)
    {
        $module_name = ADMIN_MODULE_NAME;
        $send_type = $requests['send_type'];
        
        if (empty($requests['subject'])) {
            openpne_forward($module_name, 'page', 'send_messages_all');
            exit;
        }
        if (empty($requests['body'])) {
            openpne_forward($module_name, 'page', 'send_messages_all');
            exit;
        }

        // 送信者はとりあえず1番で固定
        $c_member_id_from = 1;
        $c_member_id_list = p_common_c_member_id_list4null();

        foreach ($c_member_id_list as $c_member_id) {
            if ($c_member_id_from == $c_member_id) continue;
            switch ($send_type) {
                case "mail":
                    do_admin_send_mail($c_member_id, $requests['subject'], $requests['body']);
                break;
                case "message":
                    do_admin_send_message($c_member_id_from, $c_member_id, $requests['subject'], $requests['body']);
                break;
                default:
                    openpne_forward($module_name, 'page', 'send_messages');
                break;
            }
        }
        
        switch ($send_type) {
            case "mail":
                $sended_name = "メール";
            break;
            case "message":
                $sended_name = "メッセージ";
            break;
        }
        
        admin_client_redirect('top', $sended_name.'を送信しました');
    }
}

?>
