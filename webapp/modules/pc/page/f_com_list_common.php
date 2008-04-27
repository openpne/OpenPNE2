<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_f_com_list_common extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $target_c_member_id = $requests['target_c_member_id'];
        $page = $requests['page'];
        // ----------

        if (db_member_is_access_block($u, $target_c_member_id)) {
            openpne_redirect('pc', 'page_h_access_block');
        }

        $this->set('inc_navi', fetch_inc_navi('f', $target_c_member_id));

        $this->set("target_member", db_member_c_member4c_member_id($target_c_member_id));

        $page_size = 50;

        $this->set("page", $page);

        list($common_commu_list, $pager) = db_common_commu_common_commu_list4c_member_id($target_c_member_id, $u, $page, $page_size);

        $this->set("common_commu_list", $common_commu_list);
        $this->set("pager", $pager);

        for ($i=1; $i <= $pager['total_page']; $i++) {
            $page_list[] = $i;
        }
        $this->set("page_list", $page_list);

        return 'success';
    }
}

?>
