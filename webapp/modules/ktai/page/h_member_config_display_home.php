<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_page_h_member_config_display_home extends OpenPNE_Action
{
    function execute($requests)
    {
        if (!DISPLAY_NEWDIARYTOPIC_HOME) {
            handle_kengen_error();
        }

        $u  = $GLOBALS['KTAI_C_MEMBER_ID'];

        return 'success';
    }
}

?>
