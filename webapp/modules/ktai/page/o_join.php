<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_page_o_join extends OpenPNE_Action
{
    function isSecure()
    {
        return false;
    }

    function execute($requests)
    {
        // 携帯から新規登録できない場合はログインページへ
        if (IS_CLOSED_SNS || !((OPENPNE_REGIST_FROM & OPENPNE_REGIST_FROM_KTAI) >> 1)) {
            openpne_redirect('ktai', 'page_o_login');
        }

        // --- リクエスト変数
        $aff_id = $requests['aff_id'];

        $this->set('aff_id', $aff_id);
        return 'success';
    }
}

?>
