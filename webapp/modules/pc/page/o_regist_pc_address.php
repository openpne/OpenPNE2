<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_o_regist_pc_address extends OpenPNE_Action
{
    function isSecure()
    {
        return false;
    }

    function execute($requests)
    {
        if (OPENPNE_AUTH_MODE == 'slavepne' || !OPENPNE_ENABLE_KTAI) {
            client_redirect_login();
        }

        return 'success';
    }
}

?>
