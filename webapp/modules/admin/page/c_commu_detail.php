<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// 管理画面トップページ 認証済み

class admin_page_c_commu_detail extends OpenPNE_Action
{
    function execute($requests)
    {
        $v = array();

        $target_c_commu_id = $requests['target_c_commu_id'];

        $v = array();
        $commu = db_commu_c_commu4c_commu_id2($target_c_commu_id);

        if (!$commu) {
            admin_client_redirect('list_c_commu', '指定された' . WORD_COMMUNITY . 'は存在しません');
        }

        $commu['c_member'] = db_member_c_member4c_member_id($commu['c_member_id_admin']);
        $this->set('commu', $commu);

        $v['SNS_NAME'] = SNS_NAME;
        $v['OPENPNE_VERSION'] = OPENPNE_VERSION;
        $this->set($v);
        return 'success';
    }
}

?>
