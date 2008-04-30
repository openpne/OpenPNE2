<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_page_o_regist_input extends OpenPNE_Action
{
    function isSecure()
    {
        return false;
    }

    function execute($requests)
    {
        //<PCKTAI
        if (OPENPNE_AUTH_MODE == 'slavepne' || !((OPENPNE_REGIST_FROM & OPENPNE_REGIST_FROM_KTAI) >> 1)) {
            openpne_redirect('ktai', 'page_o_login', array('msg' => 42));
        }
        //>

        // --- リクエスト変数
        $ses = $requests['ses'];
        $aff_id = $requests['aff_id'];
        // ----------

        // セッションが有効かどうか
        if (!$pre = db_member_c_member_ktai_pre4session($ses)) {
            // 無効の場合、login へリダイレクト
            openpne_redirect('ktai', 'page_o_login', array('msg' => 42));
        }

        // メールアドレスが登録できるかどうか
        if (!util_is_regist_mail_address($pre['ktai_address'])) {
            openpne_redirect('ktai', 'page_o_login', array('msg' => 42));
        }

        $this->set('SNS_NAME', SNS_NAME);
        $this->set('ses', $ses);
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

        $this->set('password_query_list', p_common_c_password_query4null());
        $this->set('profile_list', db_member_c_profile_list());
        $this->set('aff_id', $aff_id);

        $this->set($v);
        return 'success';
    }
}

?>
