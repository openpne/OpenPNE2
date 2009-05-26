<?php
/**
 * @copyright 2005-2008 OpenPNE Project
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
            'color_5' => '線の色',
            'color_16' => 'ページ背景',
            'color_17' => 'コンテンツ領域背景',
            'color_4' => '枠色',
            'color_10' => '見出し背景',
            'color_13' => '説明領域背景',
            'color_6' => 'ボックスの背景',
            'color_14' => '左メニュー枠色',
        );
        $v['c_config_color_list'] = db_etc_c_config_color_list();
        $v['c_config_color_list'][0]['caption'] = '現在の設定';
        $v['c_config_color_list'][0] = util_apply_color_default2current($v['c_config_color_list'][0]);
        $v['inc_custom_css'] = p_common_c_siteadmin4target_pagename('inc_custom_css');

        $this->set($v);
        return 'success';
    }
}

?>
