<?php

//
// ポータル設定-コンテンツ設定を更新するクラス
//
class portal_do_edit_contents extends OpenPNE_Action
{
    var $layout_keys = array(
        PORTAL_LAYOUT_COMMUNITY,
        PORTAL_LAYOUT_REVIEW,
        PORTAL_LAYOUT_ACCESS_RANKING,
        PORTAL_LAYOUT_COMMUNITY_RANKING,
        PORTAL_LAYOUT_EVENT,
        PORTAL_LAYOUT_RSS1,
        PORTAL_LAYOUT_RSS2,
        PORTAL_LAYOUT_RSS3,
        PORTAL_LAYOUT_RSS4,
        PORTAL_LAYOUT_RSS5,
        PORTAL_LAYOUT_FREE1,
        PORTAL_LAYOUT_FREE2,
        PORTAL_LAYOUT_FREE3,
        PORTAL_LAYOUT_FREE4,
        PORTAL_LAYOUT_FREE5,
        PORTAL_LAYOUT_LINK,
    );


    function execute($requests)
    {
        //
        // 選択肢に重複位置がないかどうかチェック
        //
        if (!$this->validate_position($requests)) {
            $error_str = '複数のコンテンツを同じ場所（番号）に指定することはできません。';
            portal_client_redirect('edit_contents', null, 'error_msg=' . urlencode($error_str));
        }

        //
        // ヘッダテキストタイプ
        //
        unset($tmp);
        $tmp = db_portal_config(PORTAL_CONFIG_HEAD_TEXT_TYPE);

        if (!isset($tmp)) {
            db_portal_insert_portal_config(PORTAL_CONFIG_HEAD_TEXT_TYPE, $requests['header_text_type']);
        } else {
            db_portal_update_portal_config(PORTAL_CONFIG_HEAD_TEXT_TYPE, $requests['header_text_type']);
        }

        //
        // ヘッダ表示テキスト portal_configへ
        //
        unset($tmp);
        $tmp = db_portal_config(PORTAL_CONFIG_HEAD_TEXT);

        if (!isset($tmp)) {
            db_portal_insert_portal_config(PORTAL_CONFIG_HEAD_TEXT, $requests['header_text']);
        } else {
            db_portal_update_portal_config(PORTAL_CONFIG_HEAD_TEXT, $requests['header_text']);
        }

        //
        // portal_layout position
        //
        db_portal_truncate_portal_layout();

        foreach ($this->layout_keys as $key) {
            $value = $requests[$key];
            $is_image = $requests[$key . '_is_image'];
            if ($value != PORTAL_LAYOUT_NOUSE) {
                db_portal_insert_portal_layout($key, $value, $is_image);
            }
        }

        portal_client_redirect('edit_contents', 'コンテンツ設定を変更しました');
    }

    function validate_position($requests)
    {
        $tmp = array();

        foreach ($this->layout_keys as $key) {
            $value = $requests[$key];
            if (($value != PORTAL_LAYOUT_NOUSE ) and (array_key_exists($value ,$tmp))) {
                return false;
            }
            $tmp[$value] = $key;
        }

        return true;
    }

}

?>
