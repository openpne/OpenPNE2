<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_o_help_login_error extends OpenPNE_Action
{
    function isSecure()
    {
        return false;
    }

    function execute($requests)
    {
        if (OPENPNE_AUTH_MODE == 'slavepne') {
            client_redirect_login();
        }

        return 'success';
    }
}

?>
