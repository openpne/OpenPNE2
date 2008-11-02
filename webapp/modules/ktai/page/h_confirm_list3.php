<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_page_h_confirm_list3 extends OpenPNE_Action
{
    function execute($requests)
    {
        $u  = $GLOBALS['KTAI_C_MEMBER_ID'];

        // あなたにコミュニティ管理者交代を希望しているメンバー
        $this->set("anatani_c_commu_admin_confirm_list",
            db_commu_anatani_c_commu_admin_confirm_list4c_member_id($u));

        return 'success';
    }
}

?>
