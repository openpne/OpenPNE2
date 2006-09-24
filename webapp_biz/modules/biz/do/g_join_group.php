<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_0.txt PHP License 3.0
 */

class biz_do_g_join_group extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        $target_id = $request['target_id'];

        biz_joinGroup($u, $target_id);

        client_redirect_absolute("?m=pc&a=page_h_home");
    }
}

?>
