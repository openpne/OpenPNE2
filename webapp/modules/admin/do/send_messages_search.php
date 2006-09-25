<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// メッセージ一括送信
class admin_do_send_messages_search extends OpenPNE_Action
{
    function execute($requests)
    {
        $module_name = ADMIN_MODULE_NAME;

        if (empty($requests['subject'])) {
            openpne_forward($module_name, 'page', 'send_messages_search');
            exit;
        }
        if (empty($requests['body'])) {
            openpne_forward($module_name, 'page', 'send_messages_search');
            exit;
        }
        
        $cond_list = validate_cond($_REQUEST);
        
        // 送信者はとりあえず1番で固定
        $c_member_id_from = 1;
        $c_member_id_list = _db_admin_c_member_id_list($cond_list);

        foreach ($c_member_id_list as $c_member_id) {
            if ($c_member_id_from == $c_member_id) continue;
            do_common_send_message($c_member_id_from, $c_member_id, $requests['subject'], $requests['body']);
        }

        admin_client_redirect('top', 'メッセージを送信しました');
    }
}

?>
