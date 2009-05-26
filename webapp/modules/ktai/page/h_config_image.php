<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_page_h_config_image extends OpenPNE_Action
{
    function execute($requests)
    {
        $u  = $GLOBALS['KTAI_C_MEMBER_ID'];

        $prof = db_member_c_member_with_profile($u);
        $this->set('c_member', $prof);

        if (MAIL_ADDRESS_HASHED) {
            $mail_address = "p{$u}-".t_get_user_hash($u)."@" . MAIL_SERVER_DOMAIN;
        } else {
            $mail_address = "p{$u}"."@" . MAIL_SERVER_DOMAIN;
        }
        $mail_address = MAIL_ADDRESS_PREFIX . $mail_address;
        $this->set('mail_address', $mail_address);

        return 'success';
    }
}

?>
