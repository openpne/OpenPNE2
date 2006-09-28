<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * 繧ｳ繝溘Η繝九ユ繧｣菴懈・
 */
 
//$GMAP_KEY
class pc_do_h_com_add_insert_c_commu extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- 繝ｪ繧ｯ繧ｨ繧ｹ繝亥､画焚
        $name = $requests['name'];
        $c_commu_category_id = $requests['c_commu_category_id'];
        $info = $requests['info'];
        $public_flag = $requests['public_flag'];
        $tmpfile = $requests['tmpfile'];
        // ----------

        // 繧ｳ繝溘Η繝九ユ繧｣菴懈・
        $c_commu_id = db_commu_insert_c_commu($u, $name, $c_commu_category_id, $info, $public_flag);

        if ($tmpfile) {
            $filename = image_insert_c_image4tmp("c_{$c_commu_id}", $tmpfile);
            t_image_clear_tmp(session_id());

            // 逕ｻ蜒乗峩譁ｰ
            if ($filename) {
                db_commu_update_c_commu_image_filename($c_commu_id, $filename);
            }
        }

        //菴懈・閠・ｒ繧ｳ繝溘Η繝｡繝ｳ繝舌・縺ｫ縺吶ｋ
        do_inc_join_c_commu($c_commu_id, $u);
        
        
        
        //GoogleMAP 
        //$c_commu_id
        $gmap_lon = $GLOBALS['gmap_lon'];//邱ｯ蠎ｦ
        $gmap_lat = $GLOBALS['gmap_lat'];//邨悟ｺｦ
        $gmap_exp = $GLOBALS['gmap_exp'];//諡｡螟ｧ邇・
        
        if($gmap_exp > 14){ $gmap_exp = 14;}//譛螟ｧ14
        
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
