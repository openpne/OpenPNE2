<?php
/**
 * @copyright 2005-2007 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class admin_page_blacklist_delete_confirm extends OpenPNE_Action
{
    function execute($requests)
    {
        $this->set('blacklist', db_admin_c_blacklist($requests['target_c_blacklist_id']));
        
        return 'success';
    }
}

?>
