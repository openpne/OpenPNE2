<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// c_image に画像を登録、削除
class admin_page_edit_c_image extends OpenPNE_Action
{
    function execute($requests)
    {
        $v = array();

        $v['SNS_NAME'] = SNS_NAME;
        $v['is_image'] = db_image_is_c_image4filename($requests['filename']);

        $this->set($v);
        return 'success';
    }
}

?>
