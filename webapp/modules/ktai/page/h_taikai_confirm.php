<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_page_h_taikai_confirm extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['KTAI_C_MEMBER_ID'];
        if ($u == 1) {
            openpne_redirect('ktai', 'page_h_config');
        }

        //メンバー情報
        $c_member = db_member_c_member4c_member_id($u);
        $this->set('c_member', $c_member);

        return 'success';
    }
}

?>
