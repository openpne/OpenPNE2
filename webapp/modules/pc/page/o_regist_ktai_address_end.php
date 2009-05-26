<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_o_regist_ktai_address_end extends OpenPNE_Action
{
    function isSecure()
    {
        return false;
    }

    function execute($requests)
    {
        //<PCKTAI
        if (OPENPNE_AUTH_MODE == 'slavepne' || !(OPENPNE_REGIST_FROM & OPENPNE_REGIST_FROM_PC)) {
            client_redirect_login();
        }
        //>

        //---- inc_ テンプレート用 変数 ----//
        $this->set('inc_page_header', fetch_inc_page_header('regist'));

        //アフィリエイトタグ用変数
        $aftag = str_replace(array('({$ID})', '({$DATETIME})'),
            array($requests['c_member_pre_id'], date("YmdHis")), AFFILIATE_TAG);
        $this->set('aftag', $aftag);

        $this->set('login_url', get_login_url());
        return 'success';
    }
}

?>
