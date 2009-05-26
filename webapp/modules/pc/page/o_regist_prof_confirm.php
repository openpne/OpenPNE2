<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_o_regist_prof_confirm extends OpenPNE_Action
{
    function isSecure()
    {
        return false;
    }

    function execute($requests)
    {
        //<PCKTAI
        if (OPENPNE_AUTH_MODE == 'slavepne' || !(OPENPNE_REGIST_FROM & OPENPNE_REGIST_FROM_PC)) {
            client_redirect_login();
        }
        //>

        // --- リクエスト変数
        $sid = $requests['sid'];
        // ----------

        if (!db_member_is_active_sid($sid)) {
            $p = array('msg_code' => 'invalid_url');
            openpne_redirect('pc', 'page_o_tologin', $p);
        }

        $pre = db_member_c_member_pre4sid($sid);

        $this->set('inc_page_header', fetch_inc_page_header('regist'));

        $this->set('sid', $sid);
        session_name('OpenPNEpcregist');
        @session_start();
        $this->set('prof', $_REQUEST['prof']);
        $this->set('pc_address', $pre['pc_address']);
        $query_list = p_common_c_password_query4null();
        $query_id = $_REQUEST['c_password_query_id'];
        $this->set('password_query_name', $query_list[$query_id]);

        $this->set('profile_list', db_member_c_profile_list4null());

        return 'success';
    }
}

?>
