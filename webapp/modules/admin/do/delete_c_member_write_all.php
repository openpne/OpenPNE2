<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// メンバー書き込み一括削除
class admin_do_delete_c_member_write_all extends OpenPNE_Action
{
    function execute($requests)
    {
        if (!db_member_c_member4c_member_id_LIGHT($requests['target_c_member_id'])) {
            admin_client_redirect('list_c_member', '指定されたメンバーは存在しません');
        }

        db_common_delete_c_member_write_all($requests['target_c_member_id']);

        admin_client_redirect('list_c_member', 'メンバーの書き込みを全て削除しました');
    }
}

?>
