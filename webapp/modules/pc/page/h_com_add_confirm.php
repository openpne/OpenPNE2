<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_h_com_add_confirm extends OpenPNE_Action
{
    function handleError($errors)
    {
        $_REQUEST['err_msg'] = $errors;
        openpne_forward('pc', 'page', 'h_com_add');
        exit;
    }

    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $name = $requests['name'];
        $c_commu_category_id = $requests['c_commu_category_id'];
        $info = $requests['info'];
        $is_admit = $requests['is_admit'];
        $is_open = $requests['is_open'];
        // ----------
        $upfile_obj = $_FILES['image_filename'];

        //Category Check
        if (!db_commu_c_commu_category4is_create_commu()) {
            openpne_redirect('pc', 'page_h_err_c_commu_add');
        }

        //TODO:
        $err_msg = array();
        if (db_commu_is_commu4c_commu_name($name))
            $err_msg[] = 'その' . WORD_COMMUNITY . 'はすでに存在します';

        if (!db_commu_c_commu_category_is_create_commu($c_commu_category_id)) {
            $err_msg[] = '指定されたカテゴリは選択できません';
        }

        if (!empty($upfile_obj) && $upfile_obj['error'] !== UPLOAD_ERR_NO_FILE) {
            if (!($image = t_check_image($upfile_obj))) {
                $err_msg[] = '画像は'.IMAGE_MAX_FILESIZE.'KB以内のGIF・JPEG・PNGにしてください';
            }

            // 画像アップロード可能サイズチェック
            $filesize = $image['size'];
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
        //-----

        $this->set('inc_navi', fetch_inc_navi('h'));

        $c_commu_category_list = db_commu_c_commu_category4null();

        $public_flag_list=
        array('is_admit' => array(
                              'public' => '誰でも参加可能',
                              'auth' => '管理者の承認が必要',
                            ),
              'is_open' => array(
                              'public' => '全員に公開',
                              'member' => WORD_COMMUNITY . '参加者にのみ公開',
                            ),
        );

        foreach ($c_commu_category_list as $each_c_commu_categfory) {
            if ($each_c_commu_categfory['c_commu_category_id']==$c_commu_category_id)$c_commu_category_value=$each_c_commu_categfory['name'];
        }
        $is_admit_value = $public_flag_list['is_admit'][$is_admit];
        $is_open_value  = $public_flag_list['is_open'][$is_open];

        $this->set("c_commu_category_value", $c_commu_category_value);
        $this->set("is_admit_value", $is_admit_value);
        $this->set("is_open_value", $is_open_value);

        //画像をvar/tmpフォルダにコピー
        $sessid = session_id();
        t_image_clear_tmp($sessid);
        if (file_exists($upfile_obj["tmp_name"])) {
            $tmpfile = t_image_save2tmp($upfile_obj, $sessid, "c");
        }

        $form_val = array(
            'name'=>$name,
            'c_commu_category_id'=>$c_commu_category_id,
            'info'=>$info,
            'is_admit'=>$is_admit,
            'is_open'=>$is_open,
            'tmpfile'=>$tmpfile,
            'image_filename' => $upfile_obj['name']
        );
        $this->set("form_val", $form_val);

        return 'success';
    }
}

?>
