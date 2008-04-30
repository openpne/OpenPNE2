<?php

class portal_page_user_top extends OpenPNE_Action
{
    function isSecure()
    {
        return false;
    }

    function execute($requests)
    {

        $use_portal = $this->_get_portal_config(PORTAL_CONFIG_USE_PORTAL);
        if (!isset($use_portal) || $use_portal['value'] == '0') {
            openpne_redirect('pc');
        }

        // ヘッダ表示テキスト取得
        $head_text_type = $this->_get_portal_config(PORTAL_CONFIG_HEAD_TEXT_TYPE);

        if (!$head_text_type) {
            $head_text_type = PORTAL_CONFIG_HEAD_TEXT_TYPE_SNS;
        }

        if ($head_text_type == PORTAL_CONFIG_HEAD_TEXT_TYPE_MANUAL) {
            $head_text = $this->_get_portal_config( PORTAL_CONFIG_HEAD_TEXT );
        } else {
            $head_text = SNS_NAME;
        }

        if (SNS_TITLE) {
            $title = SNS_TITLE;
        } else {
            $title = SNS_NAME;
        }

        //レイアウト設定
        $layout_type = $this->_get_portal_config(PORTAL_CONFIG_LAYOUT_TYPE);
        if (strlen($layout_type) == 0 || !is_numeric(intval($layout_type))) {
            $layout_type = "1";
        }

        //配色設定
        $color_type = $this->_get_portal_config(PORTAL_CONFIG_COLOR_TYPE);
        if (strlen($color_type) == 0) {
            $color_type = "default";
        }
        // CSS
        $custom_css = $this->_get_portal_config(PORTAL_CONFIG_CUSTOM_CSS);
        // meta タグ
        $meta_description = $this->_get_portal_config(PORTAL_CONFIG_META_DESCRIPTION);
        $meta_keywords = $this->_get_portal_config(PORTAL_CONFIG_META_KEYWORDS);

        $top = array();
        $left = array();
        $right = array();
        $bottom = array();

        $layout_list = db_portal_layout_order_by_position();

        foreach ($layout_list as $layout) {
            $pos = $layout['position'];
            $name = $layout['content_name'];

            $content = $this->get_contents($name);
            $content['is_image'] = $layout['is_image'];

            if ($pos >= 10 && $pos < 20) {
                $top[] = $content;
            } else if($pos >= 20 && $pos < 30) {
                $left[] = $content;
            } else if($pos >= 30 && $pos < 40) {
                $right[] = $content;
            } else if($pos >= 40 && $pos < 50) {
                $bottom[] = $content;
            }
        }

        if ($color_type == 'no_image') {
            $preset_color = util_get_preset_color_list();
            $default_color_id = 7;
            $default_color = $preset_color[$default_color_id];
            $this->set('color_config', $default_color);
        }

        $this->set('title', $title);
        $this->set('head_text', $head_text);
        $this->set('layout_type', $layout_type);
        $this->set('color_type', $color_type);
        $this->set('custom_css', $custom_css);
        $this->set('meta_description', $meta_description);
        $this->set('meta_keywords', $meta_keywords);

        $this->set('top', $top);
        $this->set('left', $left);
        $this->set('right', $right);
        $this->set('bottom', $bottom);

        return 'success';
    }

    function get_contents($name)
    {
        $config = array();

        switch ($name) {
        case PORTAL_LAYOUT_COMMUNITY:
            $config['kind'] = PORTAL_LAYOUT_COMMUNITY;
            $config['contents'] = db_portal_public_c_commmu_list(5);
            break;
        case PORTAL_LAYOUT_REVIEW:
            $config['kind'] = PORTAL_LAYOUT_REVIEW;
            $config['contents'] = array_shift(monitor_review_list('', 5, 1));
            break;
        case PORTAL_LAYOUT_ACCESS_RANKING:
            $config['kind'] = PORTAL_LAYOUT_ACCESS_RANKING;
            $config['contents'] = $this->_getRanking('ashiato');
            break;
        case PORTAL_LAYOUT_COMMUNITY_RANKING:
            $config['kind'] = PORTAL_LAYOUT_COMMUNITY_RANKING;
            $config['contents'] = $this->_getRanking('com_comment');
            break;
        case PORTAL_LAYOUT_EVENT:
            $config['kind'] = PORTAL_LAYOUT_EVENT;
            $config['contents'] = $this->_get_event();
            break;
        case PORTAL_LAYOUT_RSS1:
            $config['kind'] = PORTAL_LAYOUT_RSS1;
            $config['contents'] = $this->_get_rss_feed(1);
            break;
        case PORTAL_LAYOUT_RSS2:
            $config['kind'] = PORTAL_LAYOUT_RSS2;
            $config['contents'] = $this->_get_rss_feed(2);
            break;
        case PORTAL_LAYOUT_RSS3:
            $config['kind'] = PORTAL_LAYOUT_RSS3;
            $config['contents'] = $this->_get_rss_feed(3);
            break;
        case PORTAL_LAYOUT_RSS4:
            $config['kind'] = PORTAL_LAYOUT_RSS4;
            $config['contents'] = $this->_get_rss_feed(4);
            break;
        case PORTAL_LAYOUT_RSS5:
            $config['kind'] = PORTAL_LAYOUT_RSS5;
            $config['contents'] = $this->_get_rss_feed(5);
            break;
        case PORTAL_LAYOUT_FREE1:
            $config['kind'] = PORTAL_LAYOUT_FREE1;
            $config['contents'] = $this->_get_free_area(1);
            break;
        case PORTAL_LAYOUT_FREE2:
            $config['kind'] = PORTAL_LAYOUT_FREE2;
            $config['contents'] = $this->_get_free_area(2);
            break;
        case PORTAL_LAYOUT_FREE3:
            $config['kind'] = PORTAL_LAYOUT_FREE3;
            $config['contents'] = $this->_get_free_area(3);
            break;
        case PORTAL_LAYOUT_FREE4:
            $config['kind'] = PORTAL_LAYOUT_FREE4;
            $config['contents'] = $this->_get_free_area(4);
            break;
        case PORTAL_LAYOUT_FREE5:
            $config['kind'] = PORTAL_LAYOUT_FREE5;
            $config['contents'] = $this->_get_free_area(5);
            break;
        case PORTAL_LAYOUT_LINK :
            $config['kind'] = PORTAL_LAYOUT_LINK;
            $portal_link = db_portal_get_portal_link();
            foreach ($portal_link as $key => $link) {
                if (!$link['is_enabled']) {
                    unset($portal_link[$key]);
                    continue;
                }
            }
            $config['contents'] = $portal_link;
        default:
            break;
        }

        return $config;
    }

    function _get_portal_config($portal_config_name)
    {
        $data = db_portal_config($portal_config_name);

        if (!isset($data)) {
            return "";
        }
        return $data['value'];
    }

    function _get_rss_feed($portal_rss_id)
    {
        $data = db_portal_portal_rss($portal_rss_id);

        if (!$data || strlen(trim($data['url'])) == 0) {
            return "";
        }

        require_once 'OpenPNE/RSS.php';
        $parser = new OpenPNE_RSS();
        $result = @$parser->fetch($data['url'], true);

        if (!$result) {
            return array();
        }

        foreach ($result[1] as $key => $content) {
            $image_url = '';
            $enc_type = $content['enclosure']->type;

            if ($enc_type == 'image/jpeg' || $enc_type == 'image/png' || $enc_type == 'image/gif') {
                $image_url = $content['enclosure']->link;
            }

            $result[1][$key]['image_url'] = $image_url;
        }

        return $result;
    }

    function _get_free_area($portal_free_area_id)
    {
        $data = db_portal_portal_free_area($portal_free_area_id);

        return $data['html'];
    }

    function _get_event()
    {
        $data = db_portal_c_commu_event(date('Y-m-d', time()), 0, 5);

        return $data;
    }

    function _getRanking($kind)
    {
        $limit = 5;
        switch ($kind) {
        case "com_comment":
            $list = pne_cache_call(3600, 'db_ranking_c_commu_topic_comment_ranking', $limit);
            foreach ($list as $key => $value) {
                $list[$key]['c_commu'] = db_commu_c_commu4c_commu_id($value['c_commu_id']);
            }
            break;
        case "ashiato":
        default:
            $list = pne_cache_call(3600, 'db_ranking_c_ashiato_ranking', $limit);
            foreach ($list as $key => $value) {
                $list[$key]['c_member'] = db_member_c_member_with_profile($value['c_member_id']);
                if (!$list[$key]['c_member']) {
                    unset($list[$key]);
                }
            }
            break;
        }
        $rank_list = array();
        if ($list) {
            $rank = 1;
            $current_count = null;
            foreach ($list as $item) {
                if ($item['count'] != $current_count) {
                    $rank = $rank + count($rank_list[$rank]);
                    $current_count = $item['count'];
                }
                $rank_list[$rank][] = $item;
            }
        }
        return $rank_list;
    }

}

?>
