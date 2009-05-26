<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_do_inc_page_header_logout extends OpenPNE_Action
{
    function execute($requests)
    {
        $GLOBALS['AUTH']->logout();
        $p = array('msg_code' => 'logout');
        openpne_redirect('pc', 'page_o_tologin', $p);
    }
}

?>
