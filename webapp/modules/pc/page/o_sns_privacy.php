<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_o_sns_privacy extends OpenPNE_Action
{
    function isSecure()
    {
        return false;
    }

    function execute($requests)
    {
        //---- inc_ テンプレート用 変数 ----//
        $this->set('inc_page_header', fetch_inc_page_header('public'));

        $this->set('c_siteadmin', p_common_c_siteadmin4target_pagename('sns_privacy'));

        $this->set('sns_name', SNS_NAME);
        return 'success';
    }
}

?>
