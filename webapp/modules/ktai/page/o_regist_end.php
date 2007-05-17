<?php
/**
 * @copyright 2005-2007 OpenPNE Project
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
        if (!((OPENPNE_REGIST_FROM & OPENPNE_REGIST_FROM_KTAI) >> 1)) {
            openpne_redirect('ktai', 'page_o_login');
        }
        //>
        $aff_id = $requests['aff_id'];

        if ($aff_id) {
            //アフィリエイトタグ用変数
            $aff_tag = str_replace(array('({$ID})', '({$DATETIME})', '({$AFF_ID})'),
                array($requests['c_member_id'], date("YmdHis"), $aff_id), AFFILIATE_KTAI_TAG);
            $this->set('aff_tag', $aff_tag);
        }

        return 'success';
    }
}

?>
