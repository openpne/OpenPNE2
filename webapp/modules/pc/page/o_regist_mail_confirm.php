<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_o_regist_mail_confirm extends OpenPNE_Action
{
    function isSecure()
    {
        return false;
    }

    function execute($requests)
    {
        // --- リクエスト変数
        $sid = $requests['sid'];
        // ----------

        $this->set('sid', $sid);

        //---- inc_ テンプレート用 変数 ----//
        $this->set('inc_page_header', fetch_inc_page_header('public'));

        // メールアドレスが登録できるかどうか
        $c_pc_address_pre = do_common_c_pc_address_pre4sid($sid);
        if (!util_is_regist_mail_address($c_pc_address_pre['pc_address'], $c_pc_address_pre['c_member_id'])) {
            $p = array('msg_code' => 'invalid_url');
            openpne_redirect('pc', 'page_o_tologin', $p);
        }

        if ($c_pc_address_pre) {
            $this->set('username', $c_pc_address_pre['pc_address']);
            $this->set('pc_address', $c_pc_address_pre['pc_address']);
            return 'success';
        } else {
            $p = array('msg_code' => 'invalid_url');
            openpne_redirect('pc', 'page_o_tologin', $p);
        }
    }
}

?>
