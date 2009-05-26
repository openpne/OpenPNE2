<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_page_h_ashiato extends OpenPNE_Action
{
    function execute($requests)
    {
        $u  = $GLOBALS['KTAI_C_MEMBER_ID'];

        // あしあとリスト
        $this->set("c_ashiato_list", db_ashiato_c_ashiato_list4c_member_id($u, 20));

        // 総あしあと数
        $this->set("c_ashiato_num", db_ashiato_c_ashiato_num4c_member_id($u));

        return 'success';
    }
}

?>
