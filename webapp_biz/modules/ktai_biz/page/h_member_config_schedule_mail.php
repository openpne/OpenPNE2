<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_biz_page_h_member_config_schedule_mail extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['KTAI_C_MEMBER_ID'];

        $option = util_get_c_member_config($u);
        $this->set("option", $option);

        $send_schedule_mail_ktai = $option['SEND_SCHEDULE_MAIL_KTAI'];
        $this->set("send_schedule_mail_ktai", $send_schedule_mail_ktai);

        return 'success';
    }
}

?>
