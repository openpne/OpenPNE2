<?php
/**
 * @copyright 2005-2007 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// CMD一覧
class admin_page_list_c_cmd extends OpenPNE_Action
{
    function execute($requests)
    {
        $c_cmd_list = db_admin_get_c_cmd_all();

        $permit_list = db_get_permit_list();

        $this->set("permit_list", $permit_list);

        foreach ($c_cmd_list as $key1 => $value) {
            $permit = $value['permit'];
            foreach ($permit_list as $key => $name) {
                $is_permit[$name] = ($permit & $key) ? 1:0 ;
            }
            $c_cmd_list[$key1]['permit'] = $is_permit;
        }

        $this->set("c_cmd_list", $c_cmd_list);
        return 'success';
    }
}

?>
