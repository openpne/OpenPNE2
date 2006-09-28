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
        
        /*色設定名配列構造見本*/
        $v['bgcolor_scheme_names'] = array(//各値は配色設定名になります。
                'border_01' ,
                'border_07' ,
                'border_10' ,
                'bg_00' ,
                'bg_01' ,
                'bg_02' ,
                'bg_03' ,
                'bg_04' ,
                'bg_05' ,
                'bg_06' ,
                'bg_07' ,
                'bg_08' ,
                'bg_09' ,
                'bg_10' ,
                'bg_11' ,
                'bg_12' ,
                'bg_13'
       );

        $v['preset_bgcolors'] = db_select_c_sns_config_all();
       
        $temp = db_select_c_sns_config(1);
        $v['c_sns_config']['c_sns_config_id'] = $temp['c_sns_config_id'];
        
        $v['c_sns_config']['key_name'] = $temp['key_name'];
        
        $v['c_sns_config']['border_01'] = $temp['border_01'];
        $v['c_sns_config']['border_07'] = $temp['border_07'];
        $v['c_sns_config']['border_10'] = $temp['border_10'];
        
        $v['c_sns_config']['bg_00'] = $temp['bg_00'];
        $v['c_sns_config']['bg_01'] = $temp['bg_01'];
        $v['c_sns_config']['bg_02'] = $temp['bg_02'];
        $v['c_sns_config']['bg_03'] = $temp['bg_03'];
        $v['c_sns_config']['bg_04'] = $temp['bg_04'];
        $v['c_sns_config']['bg_05'] = $temp['bg_05'];
        $v['c_sns_config']['bg_06'] = $temp['bg_06'];
        $v['c_sns_config']['bg_07'] = $temp['bg_07'];
        $v['c_sns_config']['bg_08'] = $temp['bg_08'];
        $v['c_sns_config']['bg_09'] = $temp['bg_09'];
        $v['c_sns_config']['bg_10'] = $temp['bg_10'];
        $v['c_sns_config']['bg_11'] = $temp['bg_11'];
        $v['c_sns_config']['bg_12'] = $temp['bg_12'];
        $v['c_sns_config']['bg_13'] = $temp['bg_13'];

        $v['c_sns_config']['symbol'] = $temp['symbol'];

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
