<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// メッセージ or メール 一括送信の履歴の詳細
class admin_page_send_messages_history_detail extends OpenPNE_Action
{
    function execute($requests)
    {
        $module_name = ADMIN_MODULE_NAME;

        $history = db_admin_get_c_send_messages_history($requests['target_c_send_messages_history_id']);

        $this->set('history', $history);
        return 'success';
    }
}
?>
