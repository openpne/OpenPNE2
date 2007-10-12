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

        // 色設定名配列構造
        $v['bgcolor_scheme_names'] = array(
            'color_1' => 'bg_01',
            'color_2' => 'bg_02',
            'color_3' => 'bg_03',
            'color_4' => 'bg_04',
            'color_5' => 'bg_05',
            'color_6' => 'bg_06',
            'color_7' => 'bg_07',
            'color_8' => 'bg_08',
            'color_9' => 'bg_09',
            'color_10' => 'bg_10',
            'color_11' => 'border_01',
            'color_12' => 'border_02',
            'color_13' => 'border_03',
            'color_14' => 'font_01',
            'color_15' => 'font_02',
            'color_23' => 'font_03',
            'color_17' => 'font_04',
            'color_18' => 'font_05',
            'color_19' => 'font_06',
            'color_20' => 'font_07',
            'color_21' => 'font_08',
            'color_22' => 'font_09',
            'color_24' => 'color_24',
            'color_25' => 'color_25',
            'color_26' => 'color_26',
            'color_27' => 'color_27',
            'color_28' => 'color_28',
        );
        $v['c_config_color_ktai_list'] = db_etc_c_config_color_ktai_list();

        $this->set($v);
        return 'success';
    }
}

?>
