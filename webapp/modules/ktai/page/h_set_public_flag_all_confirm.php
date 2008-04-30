<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_page_h_set_public_flag_all_confirm extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['KTAI_C_MEMBER_ID'];

        $public_flag = util_cast_public_flag_diary($requests['public_flag_diary_all']);

        $this->set('public_flag_diary_all', $public_flag);
        return 'success';
    }
}

?>
