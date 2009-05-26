<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_h_invite extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        if (!IS_USER_INVITE) {
            openpne_forward('pc', 'page', 'h_err_invite');
            exit;
        }

        $this->set('inc_navi', fetch_inc_navi('h'));

        if (OPENPNE_AUTH_MODE == 'slavepne') {
            $inviting_member = array();
            $k_inviting_member = array();
        } else {
            $inviting_member = db_member_inviting_member4c_member_id($u);
            $k_inviting_member = db_member_inviting_member4c_member_id2($u);
        }

        $this->set('inviting_member', $inviting_member);
        $this->set('k_inviting_member', $k_inviting_member);

        return 'success';
    }
}

?>
