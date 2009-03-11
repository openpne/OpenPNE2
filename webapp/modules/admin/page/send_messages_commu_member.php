<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// 一括メッセージ送信
class admin_page_send_messages_commu_member extends OpenPNE_Action
{
    function execute($requests)
    {
        $v = array();

        // コミュ情報
        $c_commu = db_commu_c_commu4c_commu_id2($requests['target_c_commu_id']);
        $c_member_list = db_admin_commu_c_members_all_get4c_commu_id($requests['target_c_commu_id']);

        if (empty($c_member_list)) {
            openpne_redirect('admin', 'page_list_c_commu'); 
        }

        $v['c_commu'] = $c_commu;
        $v['c_member_list'] = $c_member_list;
        $v['target_c_commu_id'] = $requests['target_c_commu_id'];

        $this->set($v);

        return 'success';
    }
}

?>
