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
        $public_flag = $requests['public_flag'];
        // ----------

        $c_member_id = $u;

        $c_commu_id = db_commu_insert_c_commu($c_member_id, $name, $c_commu_category_id, $info, $public_flag);

        //作成者をコミュメンバーにする
        db_commu_join_c_commu($c_commu_id, $c_member_id);

        $p = array('target_c_commu_id' => $c_commu_id);
        openpne_redirect('ktai', 'page_c_home', $p);
    }
}

?>
