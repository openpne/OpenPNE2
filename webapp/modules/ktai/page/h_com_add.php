<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_page_h_com_add extends OpenPNE_Action
{
    function execute($requests)
    {
        $u  = $GLOBALS['KTAI_C_MEMBER_ID'];

        //カテゴリのリスト
        $c_commu_category_list = db_commu_c_commu_category4is_create_commu();
        if ($c_commu_category_list) {
            $this->set("c_commu_category_list", $c_commu_category_list);
        } else {
            ktai_display_error('現在' . WORD_COMMUNITY_HALF . 'を作成することは出来ません');
        }

        return 'success';
    }
}

?>
