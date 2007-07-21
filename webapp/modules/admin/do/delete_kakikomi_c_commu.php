<?php
/**
 * @copyright 2005-2007 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// 書き込み管理(コミュニティ削除)
class admin_do_delete_kakikomi_c_commu extends OpenPNE_Action
{
    function execute($requests)
    {
        db_common_delete_c_commu($requests['target_c_commu_id']);

        admin_client_redirect('commu_list', 'コミュニティを削除しました');
    }
}

?>
