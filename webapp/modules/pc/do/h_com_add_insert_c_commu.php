<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * コミュニティ作成
 */

//$GMAP_KEY
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
        do_inc_join_c_commu($c_commu_id, $u);



        //GoogleMAP 
        //$c_commu_id
        $gmap_lon = $GLOBALS['gmap_lon'];//緯度
        $gmap_lat = $GLOBALS['gmap_lat'];//経度
        $gmap_exp = $GLOBALS['gmap_exp'];//拡大率

        if($gmap_exp > 14){ $gmap_exp = 14;}//最大14

        $sql = "INSERT INTO `c_commu_gmap_wgs84` ( `c_comm_id`, `c_comm_gmap_wgs84_lon`, `c_comm_gmap_wgs84_lat`, `c_comm_gmap_wgs84_exp`) ".
        "VALUES (".
        "'".$c_commu_id."', ".
        "'".$gmap_lon."', ".
        "'".$gmap_lat."', ".
        "'".$gmap_exp."'".
        ")"; 

        $kakunin = mysql_query($sql);




        $p = array('target_c_commu_id' => $c_commu_id);
        openpne_redirect('pc', 'page_c_home', $p);
    }
}

?>
