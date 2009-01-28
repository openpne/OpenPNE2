<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_do_h_member_config_update_display_home extends OpenPNE_Action
{
    function execute($requests)
    {
        if (!DISPLAY_NEWDIARYTOPIC_HOME) {
            handle_kengen_error();
        }

        $tail = $GLOBALS['KTAI_URL_TAIL'];
        $u = $GLOBALS['KTAI_C_MEMBER_ID'];

        db_member_update_c_member_config($u, 'IS_DISPLAY_NEWDIARY_HOME_KTAI', $requests['IS_DISPLAY_NEWDIARY_HOME_KTAI']);
        db_member_update_c_member_config($u, 'IS_DISPLAY_NEWTOPIC_HOME_KTAI', $requests['IS_DISPLAY_NEWTOPIC_HOME_KTAI']);

        $p = array('msg' => 48);
        openpne_redirect('ktai', 'page_h_config', $p);
    }
}

?>
