<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class biz_do_h_home_edit_nickname extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $state = $requests['state'];
        $member_id = $requests['member_id'];
        // ----------

        biz_changeNickname($member_id, $state);

        $p = array();
        openpne_redirect('pc', 'page_h_home', $p);
    }
}

?>
