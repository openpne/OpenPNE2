<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// 管理画面トップページ 認証済み

class admin_page_delete_commu_selected extends OpenPNE_Action
{
    function execute($requests)
    {
        $v = array();

        $target_c_commu_ids = $requests['target_c_commu_ids'];

		// コミュニティが選択されていない場合はエラー
		if (!$target_c_commu_ids) {
        	admin_client_redirect('commu_list', WORD_COMMUNITY . "が選択されていません");
		}

		$id_ary = split(":", $target_c_commu_ids);

        $v = array();

		$commu_list = array();
		foreach ($id_ary as $id) {
        	$commu = db_commu_c_commu4c_commu_id($id);

        	if (!$commu) {
        	    admin_client_redirect('commu_list', '指定された' . WORD_COMMUNITY . 'は存在しません');
        	}

        	$commu['c_member'] = db_member_c_member4c_member_id($commu['c_member_id_admin']);

			array_push($commu_list, $commu);
		}
        $this->set('commu_list', $commu_list);
		$this->set('target_c_commu_ids', $target_c_commu_ids);

        $v['SNS_NAME'] = SNS_NAME;
        $v['OPENPNE_VERSION'] = OPENPNE_VERSION;
        $this->set($v);
        return 'success';
    }
}

?>
