<?php

//
// ポータル設定-配色設定を更新するクラス
//
class portal_do_edit_color extends OpenPNE_Action
{

    function execute($requests)
    {
        $color_type = $requests['color_type'];

        $tmp = db_portal_config(PORTAL_CONFIG_COLOR_TYPE);

        if (!isset($tmp)) {
            db_portal_insert_portal_config(PORTAL_CONFIG_COLOR_TYPE, $color_type);
        } else {
            db_portal_update_portal_config(PORTAL_CONFIG_COLOR_TYPE, $color_type);
        }

        portal_client_redirect('edit_color', '配色設定を変更しました');
    }

}

?>
