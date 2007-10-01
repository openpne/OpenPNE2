<?php
/**
 * @copyright 2005-2007 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_page_o_regist_ktai_end extends OpenPNE_Action
{
    function isSecure()
    {
        return false;
    }

    function execute($requests)
    {
        // --- リクエスト変数

        //アフィリエイトタグ用変数
        $aftag = str_replace(array('({$ID})', '({$DATETIME})'),
            array($requests['c_member_id'], date("YmdHis")), AFFILIATE_KTAI_TAG);
        $this->set('aftag', $aftag);
        
        // ----------
        return 'success';
    }
}

?>
