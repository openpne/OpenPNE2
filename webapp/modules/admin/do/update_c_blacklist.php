<?php
/**
 * @copyright 2005-2007 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class admin_do_update_c_blacklist extends OpenPNE_Action
{
    function execute($requests)
    {
        db_admin_update_c_blacklist($requests['target_c_blacklist_id'], $requests['easy_access_id'], $requests['info']);
        
        admin_client_redirect('blacklist', '編集しました');
    }
}

?>
