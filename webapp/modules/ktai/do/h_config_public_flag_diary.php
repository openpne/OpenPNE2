<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_do_h_config_public_flag_diary extends OpenPNE_Action
{
    function execute($requests)
    {
        $tail = $GLOBALS['KTAI_URL_TAIL'];
        $u = $GLOBALS['KTAI_C_MEMBER_ID'];

        db_ktai_update_public_flag_diary($u, $requests['public_flag_diary']);

        $p = array('msg' => 35);
        openpne_redirect('ktai', 'page_h_config', $p);
    }
}

?>
