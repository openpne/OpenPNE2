<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class admin_page_limit_domain extends OpenPNE_Action
{

    function handleError($msg)
    {
        $_REQUEST['msg'] = array_shift($msg);
        openpne_forward(ADMIN_MODULE_NAME, 'page', 'limit_domain');
        exit;
    }

    function execute($requests)
    {
        return 'success';
    }
}

?>
