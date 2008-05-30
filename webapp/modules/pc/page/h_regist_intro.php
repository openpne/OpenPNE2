<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_h_regist_intro extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        $this->set('c_siteadmin', p_common_c_siteadmin4target_pagename('sns_kiyaku'));
        $this->set('inc_navi', fetch_inc_navi("h"));

        return 'success';
    }
}

?>
