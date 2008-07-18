<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class admin_page_edit_deco extends OpenPNE_Action
{
    function execute($requests)
    {
        $v = array();

        $c_config_decoration_list = db_admin_c_config_decoration_list();
        foreach ($c_config_decoration_list as $key => $value) {
            $c_config_decoration_list[$key]['image_name'] = strtr($value['tagname'], ':', '_');
        }
        $v['c_config_decoration_list'] = $c_config_decoration_list;

        $this->set($v);

        return 'success';
    }
}

?>
