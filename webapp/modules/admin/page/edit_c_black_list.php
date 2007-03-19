<?php
/**
 * @copyright 2005-2007 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// ブラックリスト編集
class admin_page_edit_c_black_list extends OpenPNE_Action
{
    function execute($requests)
    {
        $c_black_list = db_admin_get_c_black_list_one($requests['c_black_list_id']);
        if (!$c_black_list['address']) {
            admin_client_redirect('list_c_black_list', "指定されたc_black_list_idは無効です");
        }

        $this->set("c_black_list", $c_black_list);

        return 'success';
    }
}

?>
