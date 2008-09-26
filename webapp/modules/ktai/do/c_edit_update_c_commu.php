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
        $public_flag = $requests['public_flag'];
        $topic_authority = $requests['topic_authority'];
        // ----------

        //--- 権限チェック
        //コミュニティ管理者

        $status = db_common_commu_status($u, $target_c_commu_id);
        if (!$status['is_commu_admin']) {
            handle_kengen_error();
        }
        //---

        // 承認待ちメンバー登録処理
        $registered_public_flag = db_commu_public_flg4c_commu_id($target_c_commu_id);
        if ($public_flag == 'public' && ($registered_public_flag == 'auth_sns' || $registered_public_flag == 'auth_commu_member')) {
            $sql = 'SELECT c_commu_member_confirm_id, c_member_id FROM c_commu_member_confirm'
                 . ' WHERE c_commu_id = ?';
            $params = array(intval($target_c_commu_id));
            $c_commu_member_confirm_list = db_get_all($sql, $params);
            foreach ($c_commu_member_confirm_list as $c_commu_member_confirm) {
                db_commu_join_c_commu($target_c_commu_id, $c_commu_member_confirm['c_member_id']);
                do_inc_join_c_commu_send_mail($target_c_commu_id, $c_commu_member_confirm['c_member_id']);
                db_commu_delete_c_commu_member_confirm($c_commu_member_confirm['c_commu_member_confirm_id']);
            }
        }

        db_commu_update_c_commu($target_c_commu_id, $name, $topic_authority, $c_commu_category_id, $info, $public_flag);

        $p = array('target_c_commu_id' => $target_c_commu_id);
        openpne_redirect('ktai', 'page_c_home', $p);
    }
}

?>
