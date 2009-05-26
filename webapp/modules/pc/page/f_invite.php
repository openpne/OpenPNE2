<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_f_invite extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        $target_c_member_id = $requests['target_c_member_id'];

        $this->set('inc_navi', fetch_inc_navi("f", $target_c_member_id));

        //メンバー情報
        $this->set("target_member", db_member_c_member4c_member_id($target_c_member_id));

        //招待する友達リスト
        $this->set("f_invite_list",
            db_friend_invite_list4c_member_ids($target_c_member_id, $u));

        return 'success';
    }
}

?>
