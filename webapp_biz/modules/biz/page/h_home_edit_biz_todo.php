<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class biz_page_h_home_edit_biz_todo extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();
        $sessid = session_id();

        $this->set("id", $requests['id']);
        $this->set("todo", biz_getTodo($requests['id']));
        $this->set("cmd", 'h');
        $this->set('inc_navi',fetch_inc_navi('h'));

        return 'success';
    }
}
?>
