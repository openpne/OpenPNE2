<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_page_o_sns_kiyaku extends OpenPNE_Action
{
    function isSecure()
    {
        return false;
    }

    function execute($requests)
    {
        $this->set('c_siteadmin', p_common_c_siteadmin4target_pagename('sns_kiyaku'));

        return 'success';
    }
}
?>
