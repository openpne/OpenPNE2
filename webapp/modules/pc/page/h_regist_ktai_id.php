<?php
/**
 * @copyright 2005-2007 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_h_regist_ktai_id extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();
        
        
        $this->set('c_member_secure', db_member_c_member_secure4c_member_id($u));
        
        $this->set('inc_navi', fetch_inc_navi("h"));
        
        return 'success';
    }
}

?>
