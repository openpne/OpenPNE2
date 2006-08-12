<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_page_c_edit_member_delete_c_commu_member_confirm extends OpenPNE_Action
{
    function execute($requests)
    {
        $u  = $GLOBALS['KTAI_C_MEMBER_ID'];

        // --- リクエスト変数
        $target_c_commu_id = $requests['target_c_commu_id'];
        $target_c_member_id = $requests['target_c_member_id'];
        // ----------

        $this->set("target_c_commu_id", $target_c_commu_id);
        $this->set("target_c_member_id", $target_c_member_id);

        return 'success';
    }
}

?>
