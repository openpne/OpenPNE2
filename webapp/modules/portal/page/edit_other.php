<?php

// ポータル管理画面 その他設定
class portal_page_edit_other extends OpenPNE_Action
{
    function execute($requests)
    {
        $custom_css = db_portal_config(PORTAL_CONFIG_CUSTOM_CSS);
        $description = db_portal_config(PORTAL_CONFIG_META_DESCRIPTION);
        $keywords = db_portal_config(PORTAL_CONFIG_META_KEYWORDS);

        $v = array();

        if (!isset($custom_css)) {
            $v['portal_config']['custom_css'] = "";
        } else {
            $v['portal_config']['custom_css'] = $custom_css['value'];
        }

        if (!isset($description)) {
            $v['portal_config']['meta_description'] = "";
        } else {
            $v['portal_config']['meta_description'] = $description['value'];
        }

        if (!isset($keywords)) {
            $v['portal_config']['meta_keywords'] = "";
        } else {
            $v['portal_config']['meta_keywords'] = $keywords['value'];
        }

        $this->set($v);
        return 'success';
    }
}

?>
