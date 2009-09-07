<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_page_h_err_diary_access extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['KTAI_C_MEMBER_ID'];

        return 'success';
    }
}

?>
