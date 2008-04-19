<?php
/**
 * @copyright 2005-2007 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_fh_album extends OpenPNE_Action
{
    function execute($requests)
    {
        if (!OPENPNE_USE_ALBUM) {
            handle_kengen_error();
        }

        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $target_c_album_id = $requests['target_c_album_id'];
        $direc = $requests['direc'];
        $page = $requests['page'];
        // ----------
        $page += $direc;
        $page_size = 10;

        // target が指定されていない
        if (!$target_c_album_id) {
            openpne_redirect('pc', 'page_h_err_fh_album');
            exit;
        }
        // target のアルバムが存在しない
        if (!p_common_is_active_c_album_id($target_c_album_id)) {
            openpne_redirect('pc', 'page_h_err_fh_album');
            exit;
        }
        
        $target_c_album = db_album_get_c_album4c_album_id($target_c_album_id);
        $target_c_member_id = $target_c_album['c_member_id'];

        if ($target_c_member_id == $u) {
            $type = 'h';
        } else {
            $type = 'f';
            
            //check public flag
            if (!pne_check_album_public_flag($target_c_album_id, $u)) {
                openpne_redirect('pc', 'page_h_err_fh_album');
            }

            // アクセスブロック
            if (db_member_is_access_block($u, $target_c_member_id)) {
                openpne_redirect('pc', 'page_h_access_block');
            }
            
            // あしあとをつける
            db_ashiato_insert_c_ashiato($target_c_member_id, $u);
        }
        
        $this->set("type", $type);
        $this->set('inc_navi', fetch_inc_navi($type, $target_c_member_id));
        
        $this->set('target_c_member_id',$target_c_member_id);
        $this->set('target_c_album_id',$target_c_album_id);
        $this->set('album_info',$target_c_album);

        //メンバー情報
        $this->set("target_member", db_member_c_member4c_member_id($target_c_member_id));

        //最新アルバム10件[サイドバー用]
        $album_subject_list =  db_album_get_c_album_subject_list4c_member_id($target_c_member_id, 10, $u);
        $this->set("target_album_list",$album_subject_list);

        //アルバムに登録された写真
        $target_c_album_image = db_album_get_c_album_page4id($target_c_album_id,$page_size,$page);
        $this->set("target_album_image", $target_c_album_image[0]);

        //アルバムの写真表示を2列にするための工夫？
        if(count($target_c_album_image[0])<$page_size){
         for($i=0;$i<=count($target_c_album_image[0]);$i++){
            if($i%2==0){
                $temp1[$i]=$target_c_album_image[0][$i];
            }
            if($i%2==1){
                $temp2[$i]=$target_c_album_image[0][$i];
            }
           }
         }else{
             for($i=0;$i<=$page_size;$i++){
            if($i%2==0){
                $temp1[$i]=$target_c_album_image[0][$i];
            }
            if($i%2==1){
                $temp2[$i]=$target_c_album_image[0][$i];
            }
           }
         }
    
        //アルバムの写真表示を2列にするための工夫？
        if(count($target_c_album_image[0])<$page_size){
          for($j=0;$j<(intval(ceil(count($target_c_album_image[0])/2)));$j++){
            $list_set1[0][$j][dual]=$temp1[$j+$j];
            $list_set1[0][$j][singular]=$temp2[$j+$j+1];
          }
        }else{
            for($j=0;$j<=($page_size/2-1);$j++){
            $list_set1[0][$j][dual]=$temp1[$j+$j];
            $list_set1[0][$j][singular]=$temp2[$j+$j+1];
          }
        }     
        $this->set("new_album_list", $list_set1[0]);
        
        $this->set('page', $page);
        $this->set('page_size', $page_size);
        $this->set('is_prev', $target_c_album_image[1]);
        $this->set('is_next', $target_c_album_image[2]);
        $this->set("total_num", $target_c_album_image[3]);
        $this->set('album_list_count', count($target_c_album_image[0]));

        return 'success';
    }
}

?>
