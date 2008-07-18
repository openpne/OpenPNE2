<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class admin_page_list_c_cmd_caster extends OpenPNE_Action
{
    function execute($requests)
    {
        $c_cmd_caster_list = db_admin_get_c_cmd_caster_list();

        $this->set("c_cmd_caster_list", $c_cmd_caster_list);

        return 'success';
    }
}

?>
