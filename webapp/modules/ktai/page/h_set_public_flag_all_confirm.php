<?php
/**
 * @copyright 2005-2007 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_page_h_set_public_flag_all_confirm extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['KTAI_C_MEMBER_ID'];

        switch ($requests['public_flag_diary_all']) {
            case 'public':
            default:
                $public_flag = 'public';
                break;
            case 'friend':
                $public_flag = 'friend';
                break;
            case 'private':
                $public_flag = 'private';
                break;
        }

        $this->set('public_flag_diary_all', $public_flag);
        return 'success';
    }
}

?>
