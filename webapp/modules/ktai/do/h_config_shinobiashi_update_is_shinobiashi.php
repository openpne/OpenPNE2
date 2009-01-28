<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_do_h_config_shinobiashi_update_is_shinobiashi extends OpenPNE_Action
{
    function execute($requests)
    {
        if (!USE_SHINOBIASHI) {
            handle_kengen_error();
        }

        $tail = $GLOBALS['KTAI_URL_TAIL'];
        $u = $GLOBALS['KTAI_C_MEMBER_ID'];

        $is_shinobiashi = $requests['is_shinobiashi'];

        db_member_update_is_shinobiashi($u, $is_shinobiashi);

        $p = array('msg' => 48);
        openpne_redirect('ktai', 'page_h_config', $p);
    }
}

?>
