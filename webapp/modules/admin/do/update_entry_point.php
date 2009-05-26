<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class admin_do_update_entry_point extends OpenPNE_Action
{
    function execute($requests)
    {
        $name = sprintf('inc_entry_point_%s_%d', $requests['target'], $requests['num']);
        if ($requests['source']) {
            db_replace_c_template($name, $requests['source']);
        } else {
            db_delete_c_template($name);
        }

        $params = sprintf('target=%s&num=%d', $requests['target'], $requests['num']);
        admin_client_redirect('edit_entry_point', '変更しました', $params);
    }
}

?>
