<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class admin_do_update_profile_sort_order extends OpenPNE_Action
{
    function handleError($errors)
    {
        admin_client_redirect('edit_c_profile', array_shift($errors));
    }

    function execute($requests)
    {
        if (is_null(db_admin_c_admin_config4name('SORT_ORDER_NICK'))) {
            db_admin_insert_c_admin_config('SORT_ORDER_NICK', $requests['sort_order_nick']);
        } else {
            db_admin_update_c_admin_config('SORT_ORDER_NICK', $requests['sort_order_nick']);
        }

        if (is_null(db_admin_c_admin_config4name('SORT_ORDER_BIRTH'))) {
            db_admin_insert_c_admin_config('SORT_ORDER_BIRTH', $requests['sort_order_birth']);
        } else {
            db_admin_update_c_admin_config('SORT_ORDER_BIRTH', $requests['sort_order_birth']);
        }

        admin_client_redirect('edit_c_profile', '並び順を変更しました');
    }
}

?>
