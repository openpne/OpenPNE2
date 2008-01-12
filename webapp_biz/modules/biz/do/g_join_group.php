<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class biz_do_g_join_group extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        $target_id = $request['target_id'];

        biz_joinGroup($u, $target_id);

        $p = array();
        openpne_redirect('biz', 'page_h_home', $p);
    }
}

?>
