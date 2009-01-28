<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// c_image に画像を登録、削除
class admin_page_edit_c_banner extends OpenPNE_Action
{
    function execute($requests)
    {
        $v = array();

        $v['SNS_NAME'] = SNS_NAME;
        $v['is_image'] = db_image_is_c_image4filename($requests['filename']);

        $v['c_banner_top_list'] = db_admin_c_banner_list4null('TOP');
        $v['c_banner_side_list'] = db_admin_c_banner_list4null('SIDE');

        $v['cnt_c_banner_top_list'] = count($v['c_banner_top_list']);

        $v['top_banner_html_before'] = p_common_c_siteadmin4target_pagename('top_banner_html_before');
        $v['top_banner_html_after'] = p_common_c_siteadmin4target_pagename('top_banner_html_after');
        $v['side_banner_html_before'] = p_common_c_siteadmin4target_pagename('side_banner_html_before');
        $v['side_banner_html_after'] = p_common_c_siteadmin4target_pagename('side_banner_html_after');

        $this->set($v);
        return 'success';
    }
}

?>
