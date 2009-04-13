<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_page_h_manage_commu extends OpenPNE_Action
{
    function execute($requests)
    {
        $u  = $GLOBALS['KTAI_C_MEMBER_ID'];

        // --- リクエスト変数
        $page = $requests['page'];
        // ----------

        // 1ページ当たりに表示するコミュニティの数
        $page_size = 5;
        //自分のコミュニティリスト
        list($c_commu_list, $pager) = db_commu_c_commu_list4c_member_id($u, $page, $page_size);

        $this->set("c_commu_list", $c_commu_list);
        $this->set("pager", $pager);
        $this->set("page", $page);

        return 'success';
    }
}

?>
