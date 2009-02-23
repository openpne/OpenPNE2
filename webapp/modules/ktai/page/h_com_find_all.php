<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_page_h_com_find_all extends OpenPNE_Action
{
    function execute($requests)
    {
        $u  = $GLOBALS['KTAI_C_MEMBER_ID'];

        //最新書き込みコミュニティ５件
        $this->set("c_commu_list_lastupdated", db_commu_c_commu_list_lastupdated(5));

        //子カテゴリのリスト
        $this->set("c_commu_category_list", db_commu_c_commu_category4null());
        //親カテゴリのリスト
        $this->set('c_commu_category_parent_list', db_commu_c_commu_category_parent_list4null());

        // 作成可能カテゴリリスト
        $this->set('c_commu_category_is_create_commu', db_commu_c_commu_category4is_create_commu());

        return 'success';
    }
}

?>
