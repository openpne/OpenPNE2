<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// メンバー強制退会
class admin_do_delete_c_member extends OpenPNE_Action
{
    function execute($requests)
    {
        // 管理者は強制退会できない
        if ($requests['target_c_member_id'] == 1) {
            admin_client_redirect('top', '管理者を強制退会させることはできません');
        }

        db_common_delete_c_member($requests['target_c_member_id']);

        admin_client_redirect('top', 'メンバーの強制退会を完了しました');
    }
}

?>
