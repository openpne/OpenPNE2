<?php
/**
 * @copyright 2005-2007 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// ブラックリスト追加
class admin_do_insert_c_black_list extends OpenPNE_Action
{
    function execute($requests)
    {
        if (!db_common_is_mailaddress($requests['address'])) {
            admin_client_redirect('list_c_black_list', 'メールアドレスとして正しくないため登録できませんでした');
        }

        db_admin_insert_c_black_list($requests['address'], $requests['memo']);

        admin_client_redirect('list_c_black_list', 'ブラックリストを追加しました');
    }
}

?>
