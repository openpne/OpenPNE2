<?php
class portal_page_preview_ktai extends OpenPNE_Action
{
    function execute($requests)
    {
        $this->set('SNS_NAME', SNS_NAME);
        $this->set('IS_CLOSED_SNS', IS_CLOSED_SNS);

        if (SNS_TITLE) {
            $title = SNS_TITLE;
        } else {
            $title = SNS_NAME;
        }

        $top = array();
        $bottom = array();

        $layout_list = db_portal_layout_ktai_order_by_position();

        foreach ($layout_list as $layout) {
            $pos = $layout['position'];
            $name = $layout['content_name'];

            $content = $this->get_contents($name);

            if ($pos == 10 || $pos == 11) {
                $top[] = $content;
            } else if($pos == 20 || $pos == 21) {
                $bottom[] = $content;
            }
        }

        $this->set('title', $title);
        $this->set('top', $top);
        $this->set('bottom', $bottom);

        $this->set('ktai_color_config', util_get_color_config_ktai());
        $this->set('inc_ktai_header', fetch_inc_ktai_header());
        $this->set('inc_ktai_footer', fetch_inc_ktai_footer());

        $this->set('WORD_FRIEND', WORD_FRIEND);
        $this->set('WORD_MY_FRIEND', WORD_MY_FRIEND);
        $this->set('WORD_FRIEND_HALF', WORD_FRIEND_HALF);
        $this->set('WORD_MY_FRIEND_HALF', WORD_MY_FRIEND_HALF);

        // inc_entry_point
        $this->set('inc_ktai_entry_point', fetch_inc_entry_point($this->getView(), 'ktai_o_login'));

        return 'success';
    }

    function get_contents($name)
    {
        $config = array();

        switch ($name) {
        case 'FREE1':
            $config['contents'] = db_portal_portal_free_area_ktai(1);
            break;
        case 'FREE2':
            $config['contents'] = db_portal_portal_free_area_ktai(2);
            break;
        case 'FREE3':
            $config['contents'] = db_portal_portal_free_area_ktai(3);
            break;
        case 'FREE4':
            $config['contents'] = db_portal_portal_free_area_ktai(4);
            break;
        default:
            $name = null;
            break;
        }

        if (!is_null($name)) {
            $config['kind'] = $name;
        }

        return $config;
    }
}
?>
