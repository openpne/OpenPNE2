<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class biz_page_h_biz_group_delete extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();
        $sessid = session_id();

        $id = $requests['target_id'];
        $this->set("target_id", $id);
        $this->set('inc_navi', fetch_inc_navi('h'));

        return 'success';
    }
}

?>
