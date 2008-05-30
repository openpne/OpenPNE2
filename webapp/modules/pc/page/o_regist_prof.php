<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_o_regist_prof extends OpenPNE_Action
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
        $err_msg = $requests['err_msg'];
        // ----------

        if (!db_member_is_active_sid($sid)) {
            $p = array('msg_code' => 'invalid_url');
            openpne_redirect('pc', 'page_o_tologin', $p);
        }

        $pre = db_member_c_member_pre4sid($sid);

        $this->set('err_msg', $err_msg);

        session_name('OpenPNEpcregist');
        @session_start();
        $this->set('profs', $_SESSION['prof']);

        //---- inc_ テンプレート用 変数 ----//
        $this->set('inc_page_header', fetch_inc_page_header('regist'));


        $c_member_pre = db_member_c_member_pre4c_member_pre_session($sid);

        $this->set('sid', $sid);
        $this->set('pc_address', $c_member_pre['pc_address']);

        $public_flags = array(
            'public' => '全員に公開',
            'friend' => WORD_MY_FRIEND.'まで公開',
            'private'=> '公開しない',
        );
        $this->set('public_flags', $public_flags);

        $this->set('month_list', p_regist_prof_c_profile_month_list4null());
        $this->set('day_list', p_regist_prof_c_profile_day_list4null());
        $this->set('query_list', p_common_c_password_query4null());

        $this->set('c_profile_list', db_member_c_profile_list());

        return 'success';
    }
}

?>
