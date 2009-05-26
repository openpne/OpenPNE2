<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * メールアドレス変更
 */
class pc_do_h_regist_address extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $pc_address = $requests['pc_address'];
        $pc_address2 = $requests['pc_address2'];
        // ----------

        $msg_list = array();
        if (!$pc_address)  $msg_list[] = "メールアドレスを入力してください";
        if (!$pc_address2)  $msg_list[] = "メールアドレス(確認)を入力してください";
        if ($pc_address != $pc_address2) $msg_list[] = "メールアドレスが一致しません";
        if (!db_common_is_mailaddress($pc_address)) $msg_list[] = "メールアドレスを正しく入力してください";

        if ($msg_list) {
            $msg = array_shift($msg_list);
            $p = array('msg' => $msg);
            openpne_redirect('pc', 'page_h_regist_address', $p);
        }

        $c_member_id = db_member_c_member_id4pc_address($pc_address);
        if ($c_member_id == $u) {
            //自分のメールアドレス
            $p = array('msg' => "入力されたメールアドレスは既に登録されています");
            openpne_redirect('pc', 'page_h_regist_address', $p);
        } elseif ($c_member_id) {
            //既に使われている
            $p = array('msg' => "入力されたメールアドレスは既に登録されています");
            openpne_redirect('pc', 'page_h_regist_address', $p);
        }

        if (!db_member_is_limit_domain4mail_address($pc_address)) {
            $msg = "そのメールアドレスでは登録できません";
            $p = array('msg' => $msg);
            openpne_redirect('pc', 'page_h_regist_address', $p);
        }

        if (is_ktai_mail_address($pc_address)) {
            $p = array('msg' => '携帯メールアドレスは記入できません');
            openpne_redirect('pc', 'page_h_regist_address', $p);
        }

        db_member_h_regist_mail($u, $pc_address);

        $GLOBALS['AUTH']->logout();
        openpne_redirect('pc', 'page_o_h_regist_mail');
    }
}

?>
