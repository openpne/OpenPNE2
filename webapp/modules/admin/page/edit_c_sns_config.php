<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// c_sns_config を編集
class admin_page_edit_c_sns_config extends OpenPNE_Action
{
    function execute($requests)
    {
        $v = array();

        $v['c_sns_config'] = db_select_c_sns_config();
        $v['c_sns_config']['bg_11'] = SKIN_BG_11;
        $v['c_sns_config']['bg_12'] = SKIN_BG_12;
        $v['c_sns_config']['bg_13'] = SKIN_BG_13;

        $v['border_names'] = array('border_01', 'border_07', 'border_10');
        $v['bg_names'] = array();
        for ($i = 0; $i <= 13; $i++) {
            $v['bg_names'][] = sprintf('bg_%02d', $i);
        }

        $v['inc_custom_css'] = p_common_c_siteadmin4target_pagename('inc_custom_css');

        $this->set($v);
        return 'success';
    }
}

?>
