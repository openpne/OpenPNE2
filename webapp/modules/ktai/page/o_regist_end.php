<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_page_o_regist_end extends OpenPNE_Action
{
    function isSecure()
    {
        return false;
    }

    function execute($requests)
    {
        //<PCKTAI
        if (OPENPNE_AUTH_MODE == 'slavepne' || !((OPENPNE_REGIST_FROM & OPENPNE_REGIST_FROM_KTAI) >> 1)) {
            openpne_redirect('ktai', 'page_o_login');
        }
        //>
        $aff_id = $requests['aff_id'];
        $c_member_id = $requests['c_member_id'];

        if ($aff_id) {
            //アフィリエイトタグ用変数
            $aff_tag = str_replace(array('({$ID})', '({$DATETIME})', '({$AFF_ID})'),
                array($c_member_id, date('YmdHis'), htmlspecialchars($aff_id, ENT_QUOTES, 'UTF-8')),
                AFFILIATE_KTAI_TAG);
            $this->set('aff_tag', $aff_tag);
        }

        return 'success';
    }
}

?>
