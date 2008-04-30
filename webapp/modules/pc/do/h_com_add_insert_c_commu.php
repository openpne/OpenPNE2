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
        $public_flag = $requests['public_flag'];
        $tmpfile = $requests['tmpfile'];
        // ----------

        // コミュニティ作成
        $c_commu_id = db_commu_insert_c_commu($u, $name, $c_commu_category_id, $info, $public_flag);

        if ($tmpfile) {
            $filename = image_insert_c_image4tmp("c_{$c_commu_id}", $tmpfile);
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
