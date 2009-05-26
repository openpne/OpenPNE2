<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_page_h_config_password extends OpenPNE_Action
{
    function execute($requests)
    {
        //外部認証の場合はリダイレクト
        check_action4pne_slave(true);

        $u  = $GLOBALS['KTAI_C_MEMBER_ID'];

        return 'success';
    }
}

?>
