<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// コミュニティの削除
class admin_do_delete_c_commu extends OpenPNE_Action
{
    function execute($requests)
    {

        $target_c_commu_ids = $requests['target_c_commu_ids'];

        if (empty($target_c_commu_ids)) {
            admin_client_redirect('list_c_commu', WORD_COMMUNITY . 'が選択されていません');
        }
        foreach($target_c_commu_ids as $target_c_commu_id) {
            db_common_delete_c_commu($target_c_commu_id);
        }
        admin_client_redirect('list_c_commu', WORD_COMMUNITY . 'の削除が完了しました');
    }
}

?>
