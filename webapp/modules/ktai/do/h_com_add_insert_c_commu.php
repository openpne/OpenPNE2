<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_do_h_com_add_insert_c_commu extends OpenPNE_Action
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
        $c_commu_category_id = $requests['c_commu_category_id'];
        $name = $requests['name'];
        $info = $requests['info'];
        $is_admit = $requests['is_admit'];
        $is_open = $requests['is_open'];

        if (db_commu_is_commu4c_commu_name($name)) {
            $p = array('msg' => 49);
            openpne_redirect('ktai', 'page_h_com_add', $p);
        }

        if (!db_commu_c_commu_category_is_create_commu($c_commu_category_id)) {
            $p = array('msg' => 50);
            openpne_redirect('ktai', 'page_h_com_add', $p);
        }
        // ----------

        $c_member_id = $u;

        $c_commu_id = db_commu_insert_c_commu($c_member_id, $name, $c_commu_category_id, $info, $is_admit, $is_open);

        //作成者をコミュメンバーにする
        db_commu_join_c_commu($c_commu_id, $c_member_id);

        $p = array('target_c_commu_id' => $c_commu_id);
        openpne_redirect('ktai', 'page_c_home', $p);
    }
}

?>
