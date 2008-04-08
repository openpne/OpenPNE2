<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// 強制参加させるコミュニティ情報追加
class admin_do_update_c_commu_is_regist_join extends OpenPNE_Action
{
    function handleError($errors)
    {
        admin_client_redirect('manage_c_commu', '正しく入力してください');
    }

    function execute($requests)
    {
        db_commu_update_is_regist_join($requests['target_c_commu_id'], $requests['value']);
        admin_client_redirect('manage_c_commu', WORD_COMMUNITY . '一覧を更新しました');
    }
}

?>
