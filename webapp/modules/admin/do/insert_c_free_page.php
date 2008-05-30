<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// フリーページ編集
class admin_do_insert_c_free_page extends OpenPNE_Action
{
    function handleError($errors)
    {
        admin_client_redirect('list_c_free_page', array_shift($errors));
    }

    function execute($requests)
    {
        db_admin_insert_c_free_page($requests['title'], $requests['body'], $requests['auth'], $requests['type']);

        admin_client_redirect('list_c_free_page', 'フリーページを追加しました');
    }
}

?>
