<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_page_fh_com_list extends OpenPNE_Action
{
    function execute($requests)
    {
        $u  = $GLOBALS['KTAI_C_MEMBER_ID'];

        // --- リクエスト変数
        $target_c_member_id = $requests['target_c_member_id'];
        $page = $requests['page'];
        // ----------

        if (!$target_c_member_id) {
            $target_c_member_id = $u;
        }

        if (db_member_is_access_block($u, $target_c_member_id)) {
            openpne_redirect('ktai', 'page_h_access_block');
        }

        // メンバー情報
        $this->set("target_c_member", db_member_c_member4c_member_id_LIGHT($target_c_member_id));

        // 参加コミュニティリスト
        $page_size = 10;

        $list = db_commu_c_commu_list4c_member_id_4($target_c_member_id, $page_size, $page);

        $this->set("c_commu_list", $list[0]);
        $this->set("page", $page);
        $this->set("is_prev", $list[1]);
        $this->set("is_next", $list[2]);

        $pager = array();
        $pager['start'] = ($page_size * ($page - 1)) + 1;
        $pager['end'] = $pager['start'] + count($list[0]) - 1;
        $this->set('pager', $pager);

        // 参加コミュニティ数
        $this->set("count_commus", $list[3]);

        //f or h
        $this->set("INC_NAVI_type", k_p_fh_common_get_type($target_c_member_id, $u));

        return 'success';
    }
}

?>
