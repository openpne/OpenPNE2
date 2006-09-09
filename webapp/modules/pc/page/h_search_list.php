<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_h_search_list extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        $this->set('inc_navi', fetch_inc_navi('h'));

        $this->set('profile_list', db_common_c_profile_list());
        $this->set('count_list', p_h_search_list_count_c_member_profile());

        return 'success';
    }
}

?>
