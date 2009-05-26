<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// 書き込み管理(コミュニティ削除)
class admin_do_delete_kakikomi_c_commu_selected extends OpenPNE_Action
{
    function execute($requests)
    {
        $id_ary = split(":", $requests['target_c_commu_ids']);

        foreach ($id_ary as $id) {
            $commu = db_commu_c_commu4c_commu_id($id);
            if (!$commu) {
                admin_client_redirect('list_c_commu', '指定された' . WORD_COMMUNITY . 'は存在しません');
            }
        }

        foreach ($id_ary as $id) {
            db_common_delete_c_commu($id);
        }

        admin_client_redirect('list_c_commu', WORD_COMMUNITY . 'を削除しました');
    }
}

?>
