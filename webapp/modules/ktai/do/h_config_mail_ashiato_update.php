<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_do_h_config_mail_ashiato_update extends OpenPNE_Action
{
    function handleError($errors)
    {
        ktai_display_error($errors);
    }

    function execute($requests)
    {
        $tail = $GLOBALS['KTAI_URL_TAIL'];
        $u = $GLOBALS['KTAI_C_MEMBER_ID'];

        db_member_update_ashiato_mail_num($u, $requests['ashiato_mail_num']);

        $p = array('msg' => 34);
        openpne_redirect('ktai', 'page_h_config', $p);
    }
}

?>
