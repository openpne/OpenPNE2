<?php
/**
 * @copyright 2005-2007 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_h_regist_prof_confirm extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        $this->set('inc_navi', fetch_inc_navi("h"));
        $this->set('prof', $_SESSION['prof']);
        $query_list = p_common_c_password_query4null();
        $query_id = $_SESSION['prof']['c_password_query_id'];
        $this->set('password_query_name', $query_list[$query_id]);

        $this->set('profile_list', db_member_c_profile_list4null());

        return 'success';
    }
}

?>
