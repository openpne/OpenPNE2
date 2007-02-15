<?php
/**
 * @copyright 2005-2007 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * SNSを退会する
 */
class ktai_do_h_taikai extends OpenPNE_Action
{
    function execute($requests)
    {
        $tail = $GLOBALS['KTAI_URL_TAIL'];
        $u = $GLOBALS['KTAI_C_MEMBER_ID'];

        if ($u == 1) {
            openpne_redirect('ktai', 'page_h_config');
        }

        $password = $requests['password'];
        if (!db_common_authenticate_password($u, $password, true)) {
            $p = array('msg' => 18);
            openpne_redirect('ktai', 'page_h_taikai_confirm', $p);
        }

        //退会完了メール送信
        do_common_send_mail_taikai_end_ktai($u);

        //退会処理
        db_common_delete_c_member($u);

        @session_destroy();
        openpne_redirect('ktai', 'page_o_taikai_end');
    }
}
?>
