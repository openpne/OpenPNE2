<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_h_ashiato extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        $this->set('inc_navi', fetch_inc_navi("h"));

        $c_member = db_member_c_member4c_member_id($u);
        $this->set('c_member', $c_member);

        // あしあとリスト
        $this->set("c_ashiato_list", db_ashiato_c_ashiato_list4c_member_id($u, 30));

        // 総あしあと数
        $this->set("c_ashiato_num", db_ashiato_c_ashiato_num4c_member_id($u));

        return 'success';
    }
}

?>
