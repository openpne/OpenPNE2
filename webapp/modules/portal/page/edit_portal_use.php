<?php

// ポータル管理画面 ポータル使用設定
class portal_page_edit_portal_use extends OpenPNE_Action
{
    function execute($requests)
    {
        $data = db_portal_config(PORTAL_CONFIG_USE_PORTAL);

        $v = array();
        if (!isset($data)) {
            $v['portal_config']['use_portal'] = 1;
        } else {
            $v['portal_config']['use_portal'] = $data['value'];
        }

        $this->set($v);
        return 'success';
    }
}

?>
