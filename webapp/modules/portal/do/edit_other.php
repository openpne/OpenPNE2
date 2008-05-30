<?php

//
// ポータル設定-その他設定を更新するクラス
//
class portal_do_edit_other extends OpenPNE_Action
{

    function execute($requests)
    {
        $custom_css = $requests['custom_css'];
        $meta_description = $requests['meta_description'];
        $meta_keywords = $requests['meta_keywords'];

        $tmp1 = db_portal_config(PORTAL_CONFIG_CUSTOM_CSS);

        if (!isset($tmp1)) {
            db_portal_insert_portal_config(PORTAL_CONFIG_CUSTOM_CSS, $custom_css);
        } else {
            db_portal_update_portal_config(PORTAL_CONFIG_CUSTOM_CSS, $custom_css);
        }

        $tmp2 = db_portal_config(PORTAL_CONFIG_META_DESCRIPTION);

        if (!isset($tmp2)) {
            db_portal_insert_portal_config(PORTAL_CONFIG_META_DESCRIPTION, $meta_description);
        } else {
            db_portal_update_portal_config(PORTAL_CONFIG_META_DESCRIPTION, $meta_description);
        }

        $tmp3 = db_portal_config(PORTAL_CONFIG_META_KEYWORDS);

        if (!isset($tmp3)) {
            db_portal_insert_portal_config(PORTAL_CONFIG_META_KEYWORDS, $meta_keywords);
        } else {
            db_portal_update_portal_config(PORTAL_CONFIG_META_KEYWORDS, $meta_keywords);
        }

        portal_client_redirect('edit_other', 'その他設定を変更しました');
    }

}

?>
