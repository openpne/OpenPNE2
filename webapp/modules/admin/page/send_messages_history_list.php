<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// メッセージ or メール 一括送信の履歴のリスト
class admin_page_send_messages_history_list extends OpenPNE_Action
{
    function execute($requests)
    {
        $pager = array();

        $module_name = ADMIN_MODULE_NAME;
        $history_list = db_admin_get_c_send_messages_history_all($requests['page'], $requests['page_size'], $pager);

        $this->set('pager', $pager);
        $this->set('history_list', $history_list);

        return 'success';
    }
}
?>
