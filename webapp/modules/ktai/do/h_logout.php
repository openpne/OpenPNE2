<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_do_h_logout extends OpenPNE_Action
{
    function execute($requests)
    {
        $GLOBALS['AUTH']->logout();
        $p = array('msg' => 46);
        openpne_redirect('ktai', 'page_o_login', $p);
    }
}

?>
