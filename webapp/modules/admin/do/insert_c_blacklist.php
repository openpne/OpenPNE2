<?php
/**
 * @copyright 2005-2007 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class admin_do_insert_c_blacklist extends OpenPNE_Action
{
    function execute($requests)
    {
        db_admin_insert_c_blacklist($requests['easy_access_id'], $requests['info']);
        
        admin_client_redirect('blacklist', '追加しました');
    }
}

?>
