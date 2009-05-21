<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// 管理画面トップページ 認証済み

class admin_page_delete_commu extends OpenPNE_Action
{
    function execute($requests)
    {
        $v = array();

        $target_c_commu_ids = $requests['target_c_commu_ids'];
        $target_c_commu_id = $requests['target_c_commu_id'];
        if (!empty($target_c_commu_id)) {
            $target_c_commu_ids[] = $target_c_commu_id;
        }

        if (empty($target_c_commu_ids)) {
            admin_client_redirect('list_c_commu', WORD_COMMUNITY . 'が選択されていません');
        }

        $i = 0;
        foreach ($target_c_commu_ids as $target_c_commu_id) {
        $c_commu_list[$i] = db_commu_c_commu4c_commu_id($target_c_commu_id);
        if (!$c_commu_list[$i]) {
            admin_client_redirect('list_c_commu', '指定された' . WORD_COMMUNITY . 'は存在しません');
        }

        $c_commu_list[$i]['c_member'] = db_member_c_member4c_member_id($c_commu_list[$i]['c_member_id_admin']);

        $i++;
        }

        $this->set('c_commu_list', $c_commu_list);

        $v['SNS_NAME'] = SNS_NAME;
        $v['OPENPNE_VERSION'] = OPENPNE_VERSION;
        $this->set($v);
        return 'success';
    }
}

?>
