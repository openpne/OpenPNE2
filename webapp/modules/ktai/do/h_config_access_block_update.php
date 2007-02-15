<?php
/**
 * @copyright 2005-2007 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_do_h_config_access_block_update extends OpenPNE_Action
{
    function handleError($errors)
    {
        ktai_display_error($errors);
    }

    function execute($requests)
    {
        $tail = $GLOBALS['KTAI_URL_TAIL'];
        $u = $GLOBALS['KTAI_C_MEMBER_ID'];

        db_member_insert_c_access_block($u, $requests['c_member_id_block']);

        $p = array('msg' => 36);
        openpne_redirect('ktai', 'page_h_config', $p);
    }
}

?>
