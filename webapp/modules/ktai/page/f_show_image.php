<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_page_f_show_image extends OpenPNE_Action
{
    function execute($requests)
    {
        $u  = $GLOBALS['KTAI_C_MEMBER_ID'];

        $c_member_id = $requests['target_c_member_id'];

        // アクセスブロック
        if (db_member_is_access_block($u, $c_member_id)) {
            openpne_redirect('ktai', 'page_h_access_block');
        }

        $this->set('target_c_member', db_member_c_member4c_member_id($c_member_id));
        return 'success';
    }
}

?>
