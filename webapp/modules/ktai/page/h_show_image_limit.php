<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_page_h_show_image_limit extends OpenPNE_Action
{
    function execute($requests)
    {
        //外部認証の場合はリダイレクト
        check_action4pne_slave(true);

        $u  = $GLOBALS['KTAI_C_MEMBER_ID'];

        // 写真使用量
        $image_limit_list = db_image_get_image_limit_list($u);
        $this->set('image_limit_list', $image_limit_list);

        return 'success';
    }
}

?>
