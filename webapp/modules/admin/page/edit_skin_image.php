<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// スキン画像を変更
class admin_page_edit_skin_image extends OpenPNE_Action
{
    function execute($requests)
    {
        $this->set('skin_list', db_get_c_skin_filename_list());
        return 'success';
    }
}

?>
