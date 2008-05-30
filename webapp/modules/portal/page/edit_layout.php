<?php

//
// ポータル設定 - レイアウト設定画面の表示アクションクラスです。
//
class portal_page_edit_layout extends OpenPNE_Action
{
    function execute($requests)
    {
        $data = db_portal_config(PORTAL_CONFIG_LAYOUT_TYPE);

        $v = array();
        if (!isset($data)) {
            $v['portal_config']['layout_type'] = 1;
        } else {
            $v['portal_config']['layout_type'] = $data['value'];
        }
        $this->set($v);

        return 'success';
    }
}

?>
