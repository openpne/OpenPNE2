<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// 休日削除
class admin_do_delete_c_holiday extends OpenPNE_Action
{
    function execute($requests)
    {
        db_admin_delete_c_holiday($requests['c_holiday_id']);

        admin_client_redirect('edit_c_holiday', '祝日を削除しました');
    }
}

?>
