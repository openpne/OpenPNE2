<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_page_h_member_config_rank_up_mail extends OpenPNE_Action
{
    function execute($requests)
    {
        if (util_is_unused_mail('m_ktai_rank_up')) {
            handle_kengen_error();
        }

        $u  = $GLOBALS['KTAI_C_MEMBER_ID'];
        $c_member_secure = db_member_c_member_secure4c_member_id($u);
        $c_member_config = db_member_c_member_config4c_member_id($u);

        if (isset($c_member_config['SEND_RANK_UP_MAIL_KTAI'])) {
            $SEND_RANK_UP_MAIL_KTAI = (bool)$c_member_config['SEND_RANK_UP_MAIL_KTAI'];
        } else {
            if ($c_member_secure['pc_address']) {
                $SEND_RANK_UP_MAIL_KTAI = false;
            } else {
                $SEND_RANK_UP_MAIL_KTAI = true;
            }
        }
        $this->set('SEND_RANK_UP_MAIL_KTAI', $SEND_RANK_UP_MAIL_KTAI);

        return 'success';
    }
}

?>
