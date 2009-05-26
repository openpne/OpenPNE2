<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_page_h_regist_prof extends OpenPNE_Action
{
    function execute($requests)
    {
        $this->set('SNS_NAME', SNS_NAME);
        $this->set('c_profile_pref_list', p_regist_prof_c_profile_pref_list4null());

        $v['month_list'] = array(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12);
        $v['day_list'] = array(1, 2, 3, 4, 5, 6, 7, 8, 9, 10,
            11, 12, 13, 14, 15, 16, 17, 18, 19, 20,
            21, 22, 23, 24, 25, 26, 27, 28, 29, 30,
            31);
        $public_flags = array(
        'public' => '全員に公開',
        'friend' => WORD_MY_FRIEND_HALF.'まで公開',
        'private'=> '公開しない',
        );
        $this->set('public_flags', $public_flags);

        $this->set('profile_list', db_member_c_profile_list());

        $this->set($v);
        return 'success';
    }
}

?>
