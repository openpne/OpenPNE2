<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_page_h_config_image_delete_image_confirm extends OpenPNE_Action
{
    function execute($requests)
    {
        $u  = $GLOBALS['KTAI_C_MEMBER_ID'];
        $prof = db_member_c_member_with_profile($u);
        $this->set('c_member', $prof);

        // --- リクエスト変数
        $img_num = $requests['img_num'];
        // ----------

        $this->set("img_num", $img_num);

        return 'success';
    }
}

?>
