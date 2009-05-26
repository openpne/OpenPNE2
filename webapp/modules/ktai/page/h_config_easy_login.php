<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_page_h_config_easy_login extends OpenPNE_Action
{
    function execute($requests)
    {
        $u  = $GLOBALS['KTAI_C_MEMBER_ID'];

        $c_member_secure = db_member_c_member_secure4c_member_id($u);

        $this->set('is_registered', !empty($c_member_secure['easy_access_id']));
        return 'success';
    }
}

?>
