<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * コミュニティ作成
 */

class pc_do_h_com_add_insert_c_commu extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $name = $requests['name'];
        $c_commu_category_id = $requests['c_commu_category_id'];
        $info = $requests['info'];
        $is_admit = $requests['is_admit'];
        $is_open = $requests['is_open'];
        $tmpfile = $requests['tmpfile'];
        $err_msg = array();

        if (db_commu_is_commu4c_commu_name($name))
            $err_msg[] = 'その' . WORD_COMMUNITY . 'はすでに存在します';

        if (!db_commu_c_commu_category_is_create_commu($c_commu_category_id)) {
            $err_msg[] = '指定されたカテゴリは選択できません';
        }

        // 画像アップロード可能サイズチェック
        if ($tmpfile) {
            $filesize = util_image_get_c_tmp_filesize4filename("c_{$c_commu_id}", $tmpfile);
            $result = util_image_check_add_image_upload($filesize, $u, 'other');
            if ($result) {
                $err_msg[] = util_image_get_upload_err_msg($result);
            }
        }

        if ($err_msg) {
            $_REQUEST['err_msg'] = $err_msg;
            openpne_forward('pc', 'page', "h_com_add");
            exit;
        }
        // ----------

        // コミュニティ作成
        $c_commu_id = db_commu_insert_c_commu($u, $name, $c_commu_category_id, $info, $is_admit, $is_open);

        if ($tmpfile) {
            $filename = image_insert_c_image4tmp("c_{$c_commu_id}", $tmpfile, $u);
            t_image_clear_tmp(session_id());

            // 画像更新
            if ($filename) {
                db_commu_update_c_commu_image_filename($c_commu_id, $filename);
            }
        }

        //作成者をコミュメンバーにする
        db_commu_join_c_commu($c_commu_id, $u);

        $p = array('target_c_commu_id' => $c_commu_id);
        openpne_redirect('pc', 'page_c_home', $p);
    }
}

?>
