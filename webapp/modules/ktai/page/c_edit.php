<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_page_c_edit extends OpenPNE_Action
{
    function execute($requests)
    {
        $u  = $GLOBALS['KTAI_C_MEMBER_ID'];

        // --- リクエスト変数
        $target_c_commu_id = $requests['target_c_commu_id'];
        // ----------

        $c_commu = db_commu_c_commu4c_commu_id($target_c_commu_id);

        //--- 権限チェック
        if ($c_commu['c_member_id_admin']     != $u
         && $c_commu['c_member_id_sub_admin'] != $u) {
            handle_kengen_error();
        }

        //---

        //カテゴリのリスト
        $c_commu_category_list = db_commu_c_commu_category4is_create_commu($c_commu['c_commu_category_id']);

        // 現在設定されているカテゴリが作成不可ならば、別途取得
        if (!db_commu_c_commu_category_is_create_commu($c_commu['c_commu_category_id'])) {
            array_push($c_commu_category_list, db_commu_get_c_commu_category4id($c_commu['c_commu_category_id']));
            asort($c_commu_category_list);
        }

        $this->set('c_commu_category_list', $c_commu_category_list);

        $this->set('is_topic', db_commu_is_topic4c_commu_id($target_c_commu_id));

        $this->set('c_commu', $c_commu);

        if ($c_commu['c_member_id_sub_admin'] == $u) {
            $this->set('is_sub_admin', 1);
        }

        return 'success';
    }
}

?>
