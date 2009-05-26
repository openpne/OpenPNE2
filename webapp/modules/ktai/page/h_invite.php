<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_page_h_invite extends OpenPNE_Action
{
    function execute($requests)
    {
        $u  = $GLOBALS['KTAI_C_MEMBER_ID'];

        if (!IS_USER_INVITE) {
            ktai_display_error(SNS_NAME . 'では、メンバーによる招待は行えません');
        }

        return 'success';

    }
}

?>
