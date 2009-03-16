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
        db_common_delete_c_member_write_all($requests['target_c_member_id']);

        admin_client_redirect('top', 'メンバーの書き込みを全て削除しました');
    }
}

?>
