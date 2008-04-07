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
            'color_1' => '見出し・セル罫線',
            'color_2' => 'テーブル外枠',
            'color_3' => 'メッセージメニュー枠線',
            'color_4' => 'テーブル背景1',
            'color_5' => 'テーブル内枠',
            'color_6' => 'セル背景1',
            'color_7' => 'セル背景2',
            'color_8' => '紹介文下部罫線',
            'color_9' => 'テーブル背景2',
            'color_10' => '見出し背景',
            'color_11' => '9面パネル罫線',
            'color_12' => 'テーブル・項目背景1',
            'color_13' => 'テーブル・項目背景2',
            'color_14' => WORD_DIARY . 'カレンダー背景',
            'color_15' => 'お知らせ見出し背景',
            'color_16' => 'サイドバナー領域背景',
            'color_17' => 'コンテンツ領域背景',
            'color_18' => 'カレンダー(日曜)背景',
            'color_19' => 'Searchフォーム背景',
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
