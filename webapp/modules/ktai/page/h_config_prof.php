<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_page_h_config_prof extends OpenPNE_Action
{
    function execute($requests)
    {
        $u  = $GLOBALS['KTAI_C_MEMBER_ID'];

        $this->set("c_member", db_member_c_member4c_member_id($u));

        $prof = db_member_c_member_with_profile($u, 'private');
        $this->set('c_member', $prof);

        $public_flags = array(
        'public' => '全員に公開',
        'friend' => WORD_MY_FRIEND_HALF.'まで公開',
        'private'=> '公開しない',
        );
        $this->set('public_flags', $public_flags);

        $this->set('profile_list', db_member_c_profile_list());

        $this->set('month', p_regist_prof_c_profile_month_list4null());
        $this->set('day', p_regist_prof_c_profile_day_list4null());

        return 'success';
    }
}

?>
