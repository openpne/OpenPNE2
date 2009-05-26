<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// 一括メッセージ送信
class admin_page_send_messages extends OpenPNE_Action
{
    function execute($requests)
    {
        $v = array();

        if (empty($requests['c_member_ids'])) {
            admin_client_redirect('list_c_member');
        }
        $v['c_member_list'] = array();
        foreach ($requests['c_member_ids'] as $c_member_id) {
            $v['c_member_list'][$c_member_id] = db_member_c_member4c_member_id($c_member_id, true);
        }

        $this->set($v);
        return 'success';
    }
}

?>
