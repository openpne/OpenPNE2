<?php
/**
 * @copyright 2005-2007 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// c_sns_config を編集
class admin_page_edit_c_sns_config extends OpenPNE_Action
{
    function execute($requests)
    {
        $v = array();

        // 色設定名配列構造
        $v['bgcolor_scheme_names'] = array(
            'color_1' => 'border_01',
            'color_2' => 'border_07',
            'color_3' => 'border_10',
            'color_4' => 'bg_00',
            'color_5' => 'bg_01',
            'color_6' => 'bg_02',
            'color_7' => 'bg_03',
            'color_8' => 'bg_04',
            'color_9' => 'bg_05',
            'color_10' => 'bg_06',
            'color_11' => 'bg_07',
            'color_12' => 'bg_08',
            'color_13' => 'bg_09',
            'color_14' => 'bg_10',
            'color_15' => 'bg_11',
            'color_16' => 'bg_12',
            'color_17' => 'bg_13',
            'color_18' => 'bg_14',
        );
        $v['c_config_color_list'] = db_etc_c_config_color_list();
        $v['inc_custom_css'] = p_common_c_siteadmin4target_pagename('inc_custom_css');

        $this->set($v);
        return 'success';
    }
}

?>
