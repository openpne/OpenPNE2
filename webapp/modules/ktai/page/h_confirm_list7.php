<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_page_h_confirm_list7 extends OpenPNE_Action
{
    function execute($requests)
    {
        $u  = $GLOBALS['KTAI_C_MEMBER_ID'];

        // あなたがコミュニティ管理者交代を要請しているメンバー
        $this->set("anataga_c_commu_admin_confirm_list",
            db_commu_anataga_c_commu_admin_confirm_list4c_member_id($u));

        return 'success';
    }
}

?>
