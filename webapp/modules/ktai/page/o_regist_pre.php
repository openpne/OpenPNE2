<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_page_o_regist_pre extends OpenPNE_Action
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

        if ($aff_id) {
            $this->set('aff_id', $aff_id);
        }

        // 招待者の情報
        $c_member_invite = db_member_c_member_with_profile($pre['c_member_id_invite'], 'friend');
        $this->set('last_login',p_f_home_last_login4access_date($c_member_invite['access_date']));
        $this->set('friend_count',db_friend_count_friends($c_member_invite['c_member_id']));
        $this->set('target_c_member', $c_member_invite);

        $this->set('ses', $ses);
        $this->set('SNS_NAME', SNS_NAME);

        return 'success';
    }
}
?>
