<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// 中カテゴリ追加
class admin_do_insert_c_commu_category_parent extends OpenPNE_Action
{
    function handleError($errors)
    {
        admin_client_redirect('edit_category', '中カテゴリを追加できませんでした');
    }

    function execute($requests)
    {
        db_admin_insert_c_commu_category_parent($requests['name'], $requests['sort_order']);

        admin_client_redirect('edit_category', '中カテゴリを追加しました');
    }
}

?>
