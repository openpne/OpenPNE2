<?php
/**
 * @copyright 2005-2007 OpenPNE Project
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
        if (defined('OPENPNE_REGIST_FROM') &&
                !((OPENPNE_REGIST_FROM & OPENPNE_REGIST_FROM_KTAI) >> 1)) {
            openpne_redirect('ktai', 'page_o_login');
        }
        //>

        // --- リクエスト変数
        $ses = $requests['ses'];
        $aff_id = $requests['aff_id'];
        // ----------

        // セッションが有効かどうか
        if (!$pre = db_member_c_member_ktai_pre4session($ses)) {
            // 無効の場合、login へリダイレクト
            openpne_redirect('ktai', 'page_o_login');
        }
        if ($aff_id) {
            $this->set('aff_id', $aff_id);
        }
        // ブラックリストチェック
        if (db_is_c_black_list($pre['ktai_address'])) {
            // このアドレスでは登録できません
            $p = array('msg' => 37);
            openpne_redirect('ktai', 'page_o_login', $p);
        }

        $this->set('ses', $ses);
        $this->set('SNS_NAME', SNS_NAME);
        return 'success';
    }
}
?>
