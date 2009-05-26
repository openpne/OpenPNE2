<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_do_f_bookmark_delete extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();
        db_bookmark_delete_c_bookmark($u, $requests['target_c_member_id']);
        openpne_redirect('pc', 'page_h_bookmark_list');
    }
}

?>
