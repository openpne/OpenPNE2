<?php

class portal_page_edit_contents_ktai extends OpenPNE_Action
{
    function execute($requests)
    {
        $v = array();

        // 表示位置の数値　10-11 20-21
        $portal_layout_position = array();
        $portal_layout_position[PORTAL_LAYOUT_NOUSE] = "表示しない";

        for ($i = 10; $i <= 11; $i++) {
            $portal_layout_position[$i] = $i;
        }

        for ($i = 20; $i <= 21; $i++) {
            $portal_layout_position[$i] = $i;
        }

        $v['portal_layout']['position_list'] = $portal_layout_position;
        $v['portal_config']['layout_config'] = $this->get_layout_config();
        $v['portal_free_area_list'] = db_portal_portal_free_area_ktai();

        $this->set($v);
        return 'success';
    }

    function get_layout_config()
    {
        $data  = db_portal_layout_ktai();
        $config = array();

        foreach ($data as $tmp) {
            $config[$tmp['content_name']] = $tmp['position'];
        }

        return $config;
    }
}

?>
