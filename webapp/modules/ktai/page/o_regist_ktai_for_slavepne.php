<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_page_o_regist_ktai_for_slavepne extends OpenPNE_Action
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
        // ----------

        // セッションが有効かどうか
        if (!$pre = db_member_c_ktai_address_pre4session($ses)) {
            // 無効の場合、login へリダイレクト
            openpne_redirect('ktai', 'page_o_login');
        }

        if (!db_member_is_necessary_to_register_easy_access_id($pre['c_member_id'], true)) {
            openpne_redirect('ktai', 'page_o_login');
        }

        $this->set('ses', $ses);
        $this->set('pre', $pre);
        return 'success';
    }
}

?>
