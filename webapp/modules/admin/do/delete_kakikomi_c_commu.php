<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// 書き込み管理(コミュニティ削除)
class admin_do_delete_kakikomi_c_commu extends OpenPNE_Action
{
    function execute($requests)
    {
        $commu = db_commu_c_commu4c_commu_id($requests['target_c_commu_id']);

        if (!$commu) {
            admin_client_redirect('commu_list', '指定された' . WORD_COMMUNITY . 'は存在しません');
        }

        db_common_delete_c_commu($requests['target_c_commu_id']);

        admin_client_redirect('commu_list', WORD_COMMUNITY . 'を削除しました');
    }
}

?>
