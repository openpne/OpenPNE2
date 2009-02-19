<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// 初期ポイント設定
class admin_do_update_c_point_clear extends OpenPNE_Action
{
    function handleError($errors)
    {
        admin_client_redirect('list_c_rank', array_shift($errors));
    }

    function execute($requests)
    {
        db_admin_update_c_point_clear($requests['point']);

        admin_client_redirect('list_c_rank', '初期ポイントに変更しました');
    }
}

?>
