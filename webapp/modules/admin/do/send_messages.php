<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// メッセージ一括送信
class admin_do_send_messages extends OpenPNE_Action
{
    function execute($requests)
    {
        $module_name = ADMIN_MODULE_NAME;

        if (empty($requests['c_member_ids'])) {
            admin_client_redirect('list_c_member');
        }

        if (empty($requests['subject'])) {
            openpne_forward($module_name, 'page', 'send_messages');
        }
        if (empty($requests['body'])) {
            openpne_forward($module_name, 'page', 'send_messages');
        }

        // 送信者はとりあえず1番で固定
        $c_member_id_from = 1;

        foreach ($requests['c_member_ids'] as $c_member_id) {
            do_common_send_message($c_member_id_from, $c_member_id, $requests['subject'], $requests['body']);
        }

        admin_client_redirect('top', 'メッセージを送信しました');
    }
}

?>
