<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// 参加申請の一括承認／拒否
class admin_page_admit_sns_entry extends OpenPNE_Action
{
    function execute($requests)
    {
        $v = array();

        $entrytype = $requests['EntryType'];
        switch ($entrytype) {
            case "1" :
                $entrytypestr = '承認';
                break;
            case "2" :
                $entrytypestr = '否認';
                break;
            default :
                admin_client_redirect('sns_entry_list', '無効な処理です');
                break;
        }

        if (empty($requests['c_member_ids'])) {
            admin_client_redirect('list_sns_entry','対象者をチェックしてください');
        }

        $v['c_member_pre_list'] = array();
        foreach ($requests['c_member_ids'] as $c_member_pre_id) {
            $v['c_member_pre_list'][$c_member_pre_id] = db_member_c_member_pre4c_member_pre_id($c_member_pre_id);
        }
        $v['entrytype'] = $entrytype;
        $v['entrytypestr'] = $entrytypestr;

        $this->set($v);
        return 'success';
    }
}

?>
