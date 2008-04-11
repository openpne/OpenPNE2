<?php

// ポータル管理画面 配色設定
class portal_page_edit_color extends OpenPNE_Action
{
    function execute($requests)
    {
        $data = db_portal_config(PORTAL_CONFIG_COLOR_TYPE);
        $skin = $this->_search_skin_dir();

        $v = array();
        if (!isset($data)) {
            $v['portal_config']['color_type'] = "default";
        } else {
            $v['portal_config']['color_type'] = $data['value'];
        }

        $v['skin'] = $skin;

        $this->set($v);
        return 'success';
    }

    function _search_skin_dir()
    {
        $dir = OPENPNE_PUBLIC_HTML_DIR . '/modules/portal/skin/';
        $theme_list = array();
        if (!is_dir($dir)) {
            return $theme_list;
        }
        if ($dh = opendir($dir)) {
            while (($file = readdir($dh)) !== false) {
                if ($file[0] === '.') {
                    continue;
                }
                $path = realpath($dir . '/' . $file);
                if (is_dir($path)) {
                    $name = $file;
                    $ini_file = $path . '/skin.ini';
                    if (is_readable($ini_file)) {
                        $ini_array = parse_ini_file($ini_file);
                        $caption = $name;
                        $thumbnail = '';
                        $color = '#ffffff';

                        if (isset($ini_array['caption'])) {
                            $caption = $ini_array['caption'];
                        }

                        if (isset($ini_array['thumbnail'])) {
                            $thumbnail = $ini_array['thumbnail'];
                        }

                        if (!$thumbnail && isset($ini_array['color'])) {
                            $color = $ini_array['color'];
                        }

                        $theme_list[$name] = array(
                            'caption' => $caption,
                            'thumbnail' => $thumbnail,
                            'color' => $color,
                        );
                    }
                }
            }
            closedir($dh);
            ksort($theme_list);
        }
        return $theme_list;
    }
}

?>
