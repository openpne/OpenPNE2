<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_h_reply_message extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        $this->set('inc_navi', fetch_inc_navi("h"));
        // inc_entry_point
        $this->set('inc_entry_point', fetch_inc_entry_point($this->getView(), 'h_reply_message'));

        return 'success';
    }
}

?>
