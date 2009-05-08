<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_do_c_edit_update_c_commu extends OpenPNE_Action
{
    function handleError($errors)
    {
        ktai_display_error($errors);
    }

    function execute($requests)
    {
        $tail = $GLOBALS['KTAI_URL_TAIL'];
        $u = $GLOBALS['KTAI_C_MEMBER_ID'];

        // --- リクエスト変数
        $target_c_commu_id = $requests['target_c_commu_id'];
        $name = $requests['name'];
        $c_commu_category_id = $requests['c_commu_category_id'];
        $info = $requests['info'];
        $is_admit = $requests['is_admit'];
        $is_open = $requests['is_open'];
        $is_topic = $requests['is_topic'];
        $is_comment = $requests['is_comment'];

        if (   db_commu_is_changed_c_commu_name($target_c_commu_id, $name)
            && db_commu_is_commu4c_commu_name($name)) {
            $p = array('target_c_commu_id' => $target_c_commu_id, 'msg' => 49);
            openpne_redirect('ktai', 'page_c_edit', $p);
        }

        $c_commu = db_commu_c_commu4c_commu_id($target_c_commu_id);
        if (($c_commu_category_id != $c_commu['c_commu_category_id']) && (!db_commu_c_commu_category_is_create_commu($c_commu_category_id))) {
            $p = array('target_c_commu_id' => $target_c_commu_id, 'msg' => 50);
            openpne_redirect('ktai', 'page_c_edit', $p);
        }
 
        if ($is_open == 'member') {
            if ($is_topic == 'public') {
                $p = array('target_c_commu_id' => $target_c_commu_id, 'msg' => 53);
                openpne_redirect('ktai', 'page_c_edit', $p);
            }
            if ($is_comment == 'public') {
                $p = array('target_c_commu_id' => $target_c_commu_id, 'msg' => 54);
                openpne_redirect('ktai', 'page_c_edit', $p);
            }
        }

        // ----------

        //--- 権限チェック
        //コミュニティ管理者

        $status = db_common_commu_status($u, $target_c_commu_id);
        if (!$status['is_commu_admin']) {
            handle_kengen_error();
        }
        //---

        // 承認待ちメンバー登録処理
        $c_commu = db_commu_c_commu4c_commu_id($target_c_commu_id);
        if ($is_admit == 'public' && $is_admit != $c_commu['is_admit']) {
            $c_commu_member_confirm_list = db_commu_c_commu_member_confirm4c_commu_id($target_c_commu_id);
            foreach ($c_commu_member_confirm_list as $c_commu_member_confirm) {
                db_commu_join_c_commu($target_c_commu_id, $c_commu_member_confirm['c_member_id']);
                do_inc_join_c_commu_send_mail($target_c_commu_id, $c_commu_member_confirm['c_member_id']);
                db_commu_delete_c_commu_member_confirm($c_commu_member_confirm['c_commu_member_confirm_id']);
            }
        }

        db_commu_update_c_commu($target_c_commu_id, $name, $is_topic, $is_comment, $c_commu_category_id, $info, $is_admit, $is_open);

        $p = array('target_c_commu_id' => $target_c_commu_id);
        openpne_redirect('ktai', 'page_c_home', $p);
    }
}

?>
