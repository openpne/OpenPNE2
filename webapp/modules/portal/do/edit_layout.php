<?php

//
// ポータル設定-レイアウト設定を更新するクラス
//
class portal_do_edit_layout extends OpenPNE_Action
{

    function execute($requests)
    {
        $layout_type = $requests['layout_type'];

        //
        // 登録されていない場合のみinsert
        //
        $tmp = db_portal_config(PORTAL_CONFIG_LAYOUT_TYPE);

        if (!isset($tmp)) {
            db_portal_insert_portal_config(PORTAL_CONFIG_LAYOUT_TYPE, $layout_type);
        } else {
            db_portal_update_portal_config(PORTAL_CONFIG_LAYOUT_TYPE, $layout_type);
        }

        portal_client_redirect('edit_layout', 'レイアウト設定を変更しました');
    }

}

?>
