<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_h_config_prof extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $prof = $_REQUEST['prof'];
        // ----------

        $this->set('inc_navi', fetch_inc_navi('h'));

        if (!$prof) {
            $prof = db_member_c_member_with_profile($u, 'private');
            $OPTION = $this->get('C_MEMBER_CONFIG');
            $prof['is_search_result'] = $OPTION['IS_SEARCH_RESULT'];
        }
        $this->set('c_member', $prof);

        $this->set('month', p_regist_prof_c_profile_month_list4null());
        $this->set('day', p_regist_prof_c_profile_day_list4null());

        $public_flags = array(
            'public' => '全員に公開',
            'friend' => WORD_MY_FRIEND.'まで公開',
            'private'=> '公開しない',
        );
        $this->set('public_flags', $public_flags);

        $this->set('profile_list', db_member_c_profile_list());

        return 'success';
    }
}

?>
