<?php
/**
 * @copyright 2005-2008 OpenPNE Project
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
        $is_admit = $requests['is_admit'];
        $is_open = $requests['is_open'];
        $is_topic = $requests['is_topic'];
        $is_comment = $requests['is_comment'];
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
        $filesize = 0;
        $del_file = array();
        if (!$name) $err_msg[] = WORD_COMMUNITY . "名を入力してください";
        if (!$info) $err_msg[] = WORD_COMMUNITY . "の説明を入力してください";

        if (   db_commu_is_changed_c_commu_name($target_c_commu_id, $name)
            && db_commu_is_commu4c_commu_name($name)) {
            $err_msg[] = 'その' . WORD_COMMUNITY . 'はすでに存在します';
        }

        $c_commu = db_commu_c_commu4c_commu_id($target_c_commu_id);
        if (($c_commu_category_id != $c_commu['c_commu_category_id']) && (!db_commu_c_commu_category_is_create_commu($c_commu_category_id))) {
            $_REQUEST['c_commu_category_id'] = $c_commu['c_commu_category_id'];
            $err_msg[] = '指定されたカテゴリは選択できません';
        }

        if ($is_open == 'member') {
            if ($is_topic == 'public') {
                $err_msg[] = '公開範囲とトピック作成権限が指定できない組み合わせです';
            }
            if ($is_comment == 'public') {
                $err_msg[] = '公開範囲とコメント作成権限が指定できない組み合わせです';
            }
        }

        if (!empty($upfile_obj) && $upfile_obj['error'] !== UPLOAD_ERR_NO_FILE) {
            if (!($image = t_check_image($upfile_obj))) {
                $err_msg[] = '画像は'.IMAGE_MAX_FILESIZE.'KB以内のGIF・JPEG・PNGにしてください';
            }

            $filesize = $image['size'];
            if ($c_commu['image_filename']) {
                $del_file[] = $c_commu['image_filename'];
            }
        }

        //---画像アップロードサイズチェック
        if (!$err_msg && $filesize) {
            $result = util_image_check_change_image_upload($filesize, $del_file, $u, 'other');
            if ($result) {
                $err_msg[] = util_image_get_upload_err_msg($result);
            }
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
        $image_filename = image_insert_c_image_direct($upfile_obj, 'c_' . $target_c_commu_id, $u);

        if ($image_filename) {
            //画像削除
            db_image_data_delete($c_commu['image_filename'], $u);
        }

        // 承認待ちメンバー登録処理
        if ($is_admit == 'public' && $is_admit != $c_commu['is_admit']) {
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
            $is_topic,
            $is_comment,
            $c_commu_category_id,
            $info,
            $is_admit,
            $is_open,
            $image_filename,
            $is_send_join_mail);

        $p = array('target_c_commu_id' => $target_c_commu_id);
        openpne_redirect('pc', 'page_c_home', $p);
    }
}

?>
