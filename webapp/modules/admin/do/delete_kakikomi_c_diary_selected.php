<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// 書き込み管理(日記削除)
class admin_do_delete_kakikomi_c_diary_selected extends OpenPNE_Action
{
    function execute($requests)
    {
        $id_ary = split(":", $requests['target_c_diary_ids']);

        foreach ($id_ary as $id) {
            $diary = db_diary_get_c_diary4id($id);

            if (!$diary) {
                admin_client_redirect('diary_list', '指定された' . WORD_DIARY . 'は存在しません');
            }
        }

        foreach ($id_ary as $id) {
            db_diary_delete_c_diary($id);
        }

        admin_client_redirect('diary_list', WORD_DIARY . 'を削除しました');
    }
}

?>
