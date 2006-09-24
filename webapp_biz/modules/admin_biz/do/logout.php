<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_0.txt PHP License 3.0
 */

// ログアウト
class admin_biz_do_logout extends OpenPNE_Action
{
    function execute($requests)
    {
        $GLOBALS['AUTH']->logout();
        admin_biz_client_redirect('login');
    }
}

?>
