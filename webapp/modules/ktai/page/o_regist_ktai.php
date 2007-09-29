<?php
/**
 * @copyright 2005-2007 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_page_o_regist_ktai extends OpenPNE_Action
{
    function isSecure()
    {
        return false;
    }

    function execute($requests)
    {
        // --- リクエスト変数
        $ses = $requests['ses'];
        $c_member_id = intval($requests['id']);
        $c_member_pre_id = intval($requests['pre_id']);
        // ----------

        $pre = array();

        // セッションが有効かどうか
        if ((!$pre = db_member_c_ktai_address_pre4session($ses)) && !empty($c_member_id)) {  // 既存メンバー
            // 無効の場合、login へリダイレクト
            $c_member_secure = db_member_c_member_secure4c_member_id($c_member_id);
            $p = array('kad' => t_encrypt($c_member_secure['ktai_address']));
            openpne_redirect('ktai', 'page_o_login', $p);
        } elseif (!empty($c_member_id)) {
        } elseif ((!$pre = db_member_c_member_pre4session($ses)) && !empty($c_member_pre_id)) {  // 新規登録
            openpne_redirect('ktai', 'page_o_login');
        }

        if (!empty($c_member_id) && ($c_member_id == $pre['c_member_id'])) {
            $this->set('c_member_id', $c_member_id);
        } elseif (!empty($c_member_pre_id) && ($c_member_pre_id == $pre['c_member_pre_id'])) {
            $this->set('c_member_pre_id', $c_member_pre_id);
        } else {
            var_dump($c_member_pre_id, $pre['c_member_pre_id']);
            openpne_redirect('ktai', 'page_o_login');
        }
        $this->set('ses', $ses);
        $this->set('pre', $pre);

        return 'success';
    }
}

?>
