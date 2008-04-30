<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_page_fh_friend_list_delete_c_friend_confilm extends OpenPNE_Action
{
    function execute($requests)
    {
        $u  = $GLOBALS['KTAI_C_MEMBER_ID'];

        // --- リクエスト変数
        $target_c_member_id = $requests['target_c_member_id'];
        // ----------

        $this->set('target_c_member', db_member_c_member4c_member_id($target_c_member_id));
        $this->set("target_c_member_id", $target_c_member_id);

        return 'success';
    }
}

?>
