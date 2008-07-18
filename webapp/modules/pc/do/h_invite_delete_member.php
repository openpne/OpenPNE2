<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_do_h_invite_delete_member extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();
        // --- リクエスト変数
        $c_member_id = $requests['c_member_id'];
        $c_member_ktai_id = $requests['c_member_ktai_id'];
        // ----------

        if ($c_member_id) {
            db_member_delete_c_member_pre($u, $c_member_id);
        }
        //携帯用
        if ($c_member_ktai_id) {
            db_member_delete_c_member_ktai_pre($u, $c_member_ktai_id);
        }

        openpne_redirect('pc', 'page_h_invite');
    }
}

?>
