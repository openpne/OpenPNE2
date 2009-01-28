<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// スキン画像を変更
class admin_page_edit_skin_image extends OpenPNE_Action
{
    function execute($requests)
    {
        $this->set('theme_list', $this->_search_skin_dir());
        $this->set('skin_list', db_get_c_skin_filename_list());

        $c_config_decoration_list = db_admin_c_config_decoration_list();
        foreach ($c_config_decoration_list as $key => $value) {
            $c_config_decoration_list[$key]['tagname'] = strtr($value['tagname'], ':', '_');
        }
        $this->set('c_config_decoration_list', $c_config_decoration_list);

        return 'success';
    }

    function _search_skin_dir()
    {
        $dir = OPENPNE_PUBLIC_HTML_DIR . '/skin';
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
                        if (isset($ini_array['caption'])) {
                            $caption = $ini_array['caption'];
                        }
                        $thumbnail = 'img/skin_login.jpg';
                        if (isset($ini_array['thumbnail'])) {
                            $thumbnail = $ini_array['thumbnail'];
                        }
                        $link = $thumbnail;
                        if (isset($ini_array['link'])) {
                            $link = $ini_array['link'];
                        }
                        $theme_list[$name] = array('name' => $name,
                                                   'caption' => $caption,
                                                   'link' => $link,
                                                   'thumbnail' => $thumbnail);
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
