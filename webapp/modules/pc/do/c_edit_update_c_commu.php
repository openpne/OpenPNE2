<?php
/**
 * @copyright 2005-2007 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * コミュニティ情報の更新
 */
class pc_do_c_edit_update_c_commu extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();


        // --- リクエスト変数
        $target_c_commu_id = $requests['target_c_commu_id'];
        $name = $requests['name'];
        $c_commu_category_id = $requests['c_commu_category_id'];
        $info = $requests['info'];
        $public_flag = $requests['public_flag'];
        $topic_authority = $requests['topic_authority'];
        $is_send_join_mail = $requests['is_send_join_mail'];
        // ----------
        $upfile_obj = $_FILES['image_filename'];

        //--- 権限チェック
        //コミュニティ管理者

        $status = db_common_commu_status($u, $target_c_commu_id);
        if (!$status['is_commu_admin']) {
            handle_kengen_error();
        }
        //---

        $err_msg = array();
        if (!$name) $err_msg[] = "コミュニティ名を入力してください";
        if (!$info) $err_msg[] = "コミュニティの説明を入力してください";

        if (!empty($upfile_obj) && $upfile_obj['error'] !== UPLOAD_ERR_NO_FILE) {
            if (!($image = t_check_image($upfile_obj))) {
                $err_msg[] = '画像は'.IMAGE_MAX_FILESIZE.'KB以内のGIF・JPEG・PNGにしてください';
            }
        }

        ////GoogleMAP
        if (OPENPNE_USE_COMMU_MAP) {
            $is_display_map = $requests['is_display_map'];

            if ($is_display_map && $requests['map_pref_id'] <> 50) {
                $pref = null;
                if ($requests['map_pref_id'] > 0) {
                    $pref = db_etc_c_profile_pref4id($requests['map_pref_id']);
                }

                if (!empty($pref['map_latitude']) && !empty($pref['map_longitude']) && $requests['map_pref_id'] <> -1) {
                    $map_latitude = $pref['map_latitude'];
                    $map_longitude = $pref['map_longitude'];
                    $map_zoom = $pref['map_zoom'];
                } else {
                    // cast input parameters
                    $map_latitude  = doubleval($requests['map_latitude']);
                    $map_longitude = doubleval($requests['map_longitude']);
                    $map_zoom = intval($requests['map_zoom']);
                }
            } else {
                $map_latitude = 0;
                $map_longitude = 0;
                $map_zoom = 0;
            }
        } else {
            $is_display_map = null;
            $map_latitude = null;
            $map_longitude = null;
            $map_zoom = null;
        }

        if ($err_msg) {
            $_REQUEST['err_msg'] = $err_msg;
            $_REQUEST['target_c_commu_id'] = $target_c_commu_id;
            $_REQUEST['name'] = $name;
            $_REQUEST['info'] = $info;
            openpne_forward('pc', 'page', "c_edit");
            exit;
        }

        $c_commu = db_commu_c_commu4c_commu_id($target_c_commu_id);

        //画像アップデート
        $image_filename = image_insert_c_image_direct($upfile_obj, 'c_' . $target_c_commu_id);

        if ($image_filename) {
            //画像削除
            image_data_delete($c_commu['image_filename']);
        }

        // 承認待ちメンバー登録処理
        if ($public_flag == 'public' && $public_flag != $c_commu['public_flag']) {
            $member_confirm_list = db_commu_c_commu_member_confirm4c_commu_id($target_c_commu_id);
            foreach ($member_confirm_list as $confirm_id => $c_member_id) {
                db_commu_join_c_commu($target_c_commu_id, $c_member_id);
                do_inc_join_c_commu_send_mail($target_c_commu_id, $c_member_id);
                db_commu_delete_c_commu_member_confirm($confirm_id);
            }
        }

        db_commu_update_c_commu(
            $target_c_commu_id,
            $name,
            $topic_authority,
            $c_commu_category_id,
            $info,
            $public_flag,
            $image_filename,
            $is_send_join_mail,
            $is_display_map,
            $map_latitude,
            $map_longitude,
            $map_zoom);

        $p = array('target_c_commu_id' => $target_c_commu_id);
        openpne_redirect('pc', 'page_c_home', $p);
    }
}

?>
