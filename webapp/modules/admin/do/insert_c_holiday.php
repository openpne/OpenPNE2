<?php
/**
 * @copyright 2005-2007 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// 休日追加
class admin_do_insert_c_holiday extends OpenPNE_Action
{
    function execute($requests)
    {
        db_admin_insert_c_holiday(
            $requests['name'],
            $requests['month'],
            $requests['day']
        );
        admin_client_redirect('edit_c_holiday', '祝日を追加しました');
    }
}

?>
