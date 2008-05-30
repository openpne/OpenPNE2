<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// 画像削除(確認画面)
class admin_page_delete_c_image_confirm extends OpenPNE_Action
{
    function execute($requests)
    {
        $v = array();

        $v['c_image'] = db_image_c_image4c_image_id($requests['target_c_image_id']);

        $this->set($v);
        return 'success';
    }
}

?>
