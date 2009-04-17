<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_c_edit extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $target_c_commu_id = $requests['target_c_commu_id'];
        $name = $requests['name'];
        $c_commu_category_id = $requests['c_commu_category_id'];
        $info = $requests['info'];
        $is_admit = $requests['is_admit'];
        $is_open = $requests['is_open'];
        $is_topic = $requests['is_topic'];
        $is_comment = $requests['is_comment'];
        $err_msg = $requests['err_msg'];
        // ----------

        //--- 権限チェック
        //コミュニティ管理者
        if (!db_commu_is_c_commu_admin($target_c_commu_id, $u)) {
            handle_kengen_error();
        }
        //---


        $this->set('inc_navi', fetch_inc_navi('c', $target_c_commu_id));
        //コミュニティデータ取得
        $c_commu = db_commu_c_commu4c_commu_id($target_c_commu_id);
        $c_commu_category_id_now = $c_commu['c_commu_category_id'];
        if ($name) {
            $c_commu['name'] = $name;
        }
        if ($c_commu_category_id) {
            $c_commu['c_commu_category_id'] = $c_commu_category_id;
        }
        if ($info) {
            $c_commu['info'] = $info;
        }
        if ($public_flag) {
            $c_commu['public_flag'] = $public_flag;
        }

        $this->set('target_c_commu_id', $target_c_commu_id);

        if ($err_msg) {
            $c_commu['name'] = $name;
            $c_commu['info'] = $info;
        }

        $this->set('c_commu', $c_commu);

        // カテゴリリスト
        $c_commu_category_list = db_commu_c_commu_category4is_create_commu();

        // 現在設定されているカテゴリが作成不可ならば、別途取得
        if (!db_commu_c_commu_category_is_create_commu($c_commu_category_id_now)) {
            array_push($c_commu_category_list, db_commu_get_c_commu_category4id($c_commu_category_id_now));
            asort($c_commu_category_list);
        }
        $this->set('c_commu_category_list', $c_commu_category_list);

        $this->set('is_topic', db_commu_is_topic4c_commu_id($target_c_commu_id));
        $this->set('err_msg', $err_msg);

        $this->set('is_unused_join_commu', util_is_unused_mail('m_pc_join_commu'));

        return 'success';
    }
}
?>
