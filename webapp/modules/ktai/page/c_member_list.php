<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_page_c_member_list extends OpenPNE_Action
{
    function execute($requests)
    {
        $u  = $GLOBALS['KTAI_C_MEMBER_ID'];

        // --- リクエスト変数
        $target_c_commu_id = $requests['target_c_commu_id'];
        $page = $requests['page'];
        // ----------

        $page_size = 20;

        //ページ
        $this->set("page", $page);

        //メンバーリスト
        $list = db_commu_c_members4c_commu_id($target_c_commu_id, $page_size, $page);
        if (empty($list[0])) {
            handle_kengen_error();
        }
        $this->set("c_member_list", $list[0]);
        $this->set("is_prev", $list[1]);
        $this->set("is_next", $list[2]);

        $pager = array();
        $pager['start'] = ($page_size * ($page - 1)) + 1;
        $pager['end'] = $pager['start'] + count($list[0]) - 1;
        $this->set('pager', $pager);

        // コミュニティ
        $this->set('c_commu', db_commu_c_commu4c_commu_id_k($target_c_commu_id));
        //コミュニティID
        $this->set("c_commu_id", $target_c_commu_id);
        //コミュニティのメンバー数
        $this->set("count_member", db_commu_count_c_commu_member_list4c_commu_id($target_c_commu_id));

        return 'success';
    }
}

?>
