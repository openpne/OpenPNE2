<?php
/**
 * @copyright 2005-2007 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class admin_page_edit_c_sns_config_ktai extends OpenPNE_Action
{
    function execute($requests)
    {
        $v = array();

        $v['bgcolor_scheme_names'] = array('bg_01', 'bg_02', 'bg_03', 'bg_04',
        	'bg_05', 'bg_06', 'bg_07', 'border_01', 'border_02',
        	'border_03', 'font_01', 'font_02', 'font_03',
        );

        $v['c_sns_config'] = array();
        $v['preset_bgcolors'] = array();

        $current_list = db_select_c_sns_config_ktai();
        $v['preset_bgcolors'][] = db_select_c_sns_config_ktai('default');

        foreach ($current_list as $key => $value) {
            $v['c_sns_config'][$key] = $value;
        }
        $this->set($v);

        return 'success';
    }
}

?>
