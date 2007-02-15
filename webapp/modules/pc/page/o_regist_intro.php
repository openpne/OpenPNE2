<?php
/**
 * @copyright 2005-2007 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_o_regist_intro extends OpenPNE_Action
{
    function isSecure()
    {
        return false;
    }

    function execute($requests)
    {
        //<PCKTAI
        if (defined('OPENPNE_REGIST_FROM') &&
                !(OPENPNE_REGIST_FROM & OPENPNE_REGIST_FROM_PC)) {
            client_redirect_login();
        }
        //>

        $sid = $requests['sid'];
        if (!db_member_is_active_sid($sid)) {
            $p = array('msg_code' => 'invalid_url');
            openpne_redirect('pc', 'page_o_tologin', $p);
        }

        $this->set('inc_page_header', fetch_inc_page_header('public'));

        $this->set('sid', $sid);
        $this->set('c_siteadmin', p_common_c_siteadmin4target_pagename('sns_kiyaku'));

        return 'success';
    }
}

?>
