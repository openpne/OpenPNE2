<?php

//
// ポータル設定 - コンテンツ設定画面の表示アクションクラスです。
//
class portal_page_edit_contents extends OpenPNE_Action
{

    function execute($requests)
    {
        $v = array();

        // 表示位置の数値　10-14 20-44
        $potal_layout_position = array();
        $potal_layout_position[PORTAL_LAYOUT_NOUSE] = "表示しない";

        for ($i = 10; $i <= 14; $i++) {
            $potal_layout_position[$i] = $i;
        }

        for ($i = 20; $i <= 44; $i++) {
            $potal_layout_position[$i] = $i;
        }

        //ヘッダ表示テキスト
        $data = db_portal_config(PORTAL_CONFIG_HEAD_TEXT);

        $v['portal_config']['header_text'] = $data['value'];
        unset($data);

        //ヘッダ表示テキスト形式 設定がない場合はSNS
        $data = db_portal_config(PORTAL_CONFIG_HEAD_TEXT_TYPE);

        if (!isset($data)) {
            $data['value'] = PORTAL_CONFIG_HEAD_TEXT_TYPE_SNS;
        }
        $v['portal_config']['header_text_type'] = $data['value'];
        $v['portal_layout']['position_list'] = $potal_layout_position;
        $v['portal_config']['layout_config'] = $this->get_layout_config();
        $v['portal_free_area_list'] = db_portal_portal_free_area();
        $v['portal_rss_list'] = db_portal_portal_rss();

        $this->set($v);
        return 'success';
    }

    function get_layout_config()
    {
        $data  = db_portal_layout();
        $config = array();

        foreach ($data as $tmp) {
            $config[$tmp['content_name']] = $tmp['position'];
            $config['is_image'][$tmp['content_name']] = $tmp['is_image'];
        }

        return $config;
    }
}

?>
