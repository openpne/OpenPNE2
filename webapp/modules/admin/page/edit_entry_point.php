<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class admin_page_edit_entry_point extends OpenPNE_Action
{
    function execute($requests)
    {
        $name = sprintf('inc_entry_point_%s_%d', $requests['target'], $requests['num']);
        $this->set('source', db_get_c_template_source($name));
        $this->set('entry_point_list', get_inc_entry_point_list());
        return 'success';
    }
}

?>
