<?php
/**
 * @copyright 2005-2007 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// ブラックリスト編集
class admin_do_update_c_black_list extends OpenPNE_Action
{
    function execute($requests)
    {
        $c_black_list = db_admin_get_c_black_list_one($requests['c_black_list_id']);
        if (!$c_black_list['address']) {
            admin_client_redirect('edit_c_black_list', "指定されたc_black_list_idは無効です", "c_black_list_id=".$requests['c_black_list_id']);
        }

        if (!db_common_is_mailaddress($requests['address'])) {
            admin_client_redirect('edit_c_black_list', 'メールアドレスとして正しくありません', "c_black_list_id=".$requests['c_black_list_id']);
        }

        db_admin_update_c_black_list($requests['c_black_list_id'], $requests['address'], $requests['memo']);

        admin_client_redirect('list_c_black_list', 'ブラックリストを編集しました');

    }
}

?>
