<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// ログアウト
class admin_do_logout extends OpenPNE_Action
{
    function execute($requests)
    {
        $GLOBALS['AUTH']->logout();
        admin_client_redirect('login');
    }
}

?>
