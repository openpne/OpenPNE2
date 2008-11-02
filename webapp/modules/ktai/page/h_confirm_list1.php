<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_page_h_confirm_list1 extends OpenPNE_Action
{
    function execute($requests)
    {
        $u  = $GLOBALS['KTAI_C_MEMBER_ID'];

        //リンク承認待ちリスト
        $this->set("anatani_c_friend_confirm_list", db_friend_ktai_anatani_c_friend_confirm_list4c_member_id($u));

        return 'success';
    }
}

?>
