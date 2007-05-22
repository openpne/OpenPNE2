<?php
/**
 * @copyright 2005-2007 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_h_set_public_flag_all_confirm extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        $public_flag = util_cast_public_flag_diary($requests['public_flag_diary_all']);

        $this->set('public_flag_diary_all', $public_flag);
        $this->set('inc_navi', fetch_inc_navi("h"));
        return 'success';
    }
}

?>
