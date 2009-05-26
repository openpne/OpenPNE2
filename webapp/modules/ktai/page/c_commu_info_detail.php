<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_page_c_commu_info_detail extends OpenPNE_Action
{
    function execute($requests)
    {
        $u  = $GLOBALS['KTAI_C_MEMBER_ID'];

        // --- リクエスト変数
        $target_c_commu_id = $requests['target_c_commu_id'];
        // ----------

        $c_commu = db_commu_c_commu4c_commu_id($target_c_commu_id);

        //コミュニティの存在の有無
        if (!$c_commu) {
            openpne_redirect('ktai', 'page_h_home');
        }

        //コミュニティ情報
        $this->set("c_commu", db_commu_c_commu4c_commu_id_k($target_c_commu_id));

        // 副管理者情報
        $c_member_sub_admin = db_member_c_member4c_member_id($c_commu['c_member_id_sub_admin']);
        $this->set('sub_admin', $c_member_sub_admin);

        return 'success';
    }
}

?>
