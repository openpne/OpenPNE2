<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class admin_page_edit_c_sns_config_ktai extends OpenPNE_Action
{
    function execute($requests)
    {
        $v = array();

        // 色設定名配列構造
        $v['bgcolor_scheme_names'] = array(
            'color_1' => 'ページ背景',
            'color_2' => 'タイトル背景',
            'color_3' => 'サブタイトル背景',
            'color_4' => 'home系説明文背景',
            'color_5' => 'リストA見出し背景',
            'color_6' => 'リストA背景1',
            'color_7' => 'リストA背景2',
            'color_8' => 'リストB見出し背景',
            'color_9' => 'リストB背景1',
            'color_10' => 'リストB背景2',
            'color_11' => '区切り罫線',
            'color_12' => 'リストA罫線',
            'color_13' => 'リストB罫線',
            'color_14' => 'ページ文字',
            'color_15' => 'リンク文字',
            'color_23' => 'リンク(アクティブ)文字',
            'color_17' => 'リンク(訪問済み)文字',
            'color_18' => 'タイトル文字',
            'color_19' => '日付・項目名',
            'color_20' => '「⇒」文字',
            'color_21' => '「▼」文字',
            'color_22' => 'エラーメッセージ文字',
            'color_24' => 'サブタイトル文字',
            'color_25' => 'リストA見出し文字',
            'color_26' => 'リストB見出し文字',
            'color_27' => '検索部分見出し背景',
            'color_28' => '検索部分見出し文字',
        );
        $v['c_config_color_ktai_list'] = db_etc_c_config_color_ktai_list();
        $v['c_config_color_ktai_list'][0]['caption'] = '現在の設定';
        $v['c_config_color_ktai_list'][0] = util_apply_color_default2current($v['c_config_color_ktai_list'][0], 'ktai');

        $this->set($v);
        return 'success';
    }
}

?>
