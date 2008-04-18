<?php
/**
 * @copyright 2005-2007 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_h_album_image_edit extends OpenPNE_Action
{
    function execute($requests)
    {
        if (!OPENPNE_USE_ALBUM) {
            handle_kengen_error();
        }

        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $target_c_album_id = $requests['target_c_album_id'];
        $target_c_album_image_id = $requests['target_c_album_image_id'];
        $image_description = $requests['image_description'];
        // ----------

        // target が指定されていない
        if (!$target_c_album_image_id) {
            openpne_redirect('pc', 'page_h_err_fh_album');
        }

        //アルバムデータ取得
        $c_album = db_album_get_c_album4c_album_id($target_c_album_id);
        //--- 権限チェック
        if ($u != $c_album['c_member_id']) {
            handle_kengen_error();
        }
        
        // アルバムの画像データ取得
        $c_album_iamge = db_album_image_get_c_album_image4id($target_c_album_image_id);
        
        // target の画像が存在しない
        if(!$c_album_iamge){
            openpne_redirect('pc', 'page_h_err_fh_album');
        }
        
        if (!(is_null($image_description))) {
            $c_album_iamge['image_description'] = $image_description;
        }
        
        $this->set('inc_navi', fetch_inc_navi('h'));
        $this->set('c_album_image', $c_album_iamge);
        $this->set('target_c_album_id', $target_c_album_id);
        $this->set('target_c_album_image_id', $target_c_album_image_id);
        
        return 'success';
        
        //登録されている写真を削除　0は削除しない 1は削除する
        /*
        if ($_REQUEST['del_img'] & 0x01 == 1)  $c_album['image_filename_1'] = "";
        if ($_REQUEST['del_img'] & 0x02 == 1)  $c_album['image_filename_2'] = "";
        if ($_REQUEST['del_img'] & 0x04 == 1)  $c_album['image_filename_3'] = "";
        $this->set('del_img', $_REQUEST['del_img']);
        */

        /*
        $c_album = db_album_get_c_album4id($target_c_album_id);
        foreach($c_album as $key => $value)
        {
            $c_album[$key]['image_description'] = db_c_album_get_image_description4image_id($value['c_album_image_id']);
        }
        */
        /*
        if (!(is_null($subject) || is_null($description))) {
            $c_album['subject'] = $subject;
            $c_album['description'] = $description;
        }
        */

        //プロフィール
        /*
        $this->set("target_member", db_member_c_member4c_member_id($u));
        $this->set("album", $c_album);
        $this->set('album_cover',$c_album[0]);
        */
        
        //カレンダー関係
        //カレンダー開始用変数
        /*
        $time = strtotime($c_album['r_datetime']);
        $year = date('Y', $time);
        $month= date('n', $time);
        //アルバム一覧、カレンダー用変数
        $date_val = array(
            'year' => $year,
            'month' => $month,
            'day' => null,
        );
        $this->set("date_val", $date_val);

        //アルバムのカレンダー
        $calendar = db_common_album_monthly_calendar($year, $month, $u);

        $this->set("calendar", $calendar['days']);
        $this->set("ym", $calendar['ym']);

        //各月のアルバム
        $this->set("date_list", p_fh_album_list_date_list4c_member_id($u));
        $this->set('c_album_id',$target_c_album_id);

        if (USE_ALBUM_CATEGORY) {
            //このアルバムのカテゴリリストを得る
            if ($category) {
                $category_list = array();
                foreach(explode(' ', $category) as $value) {
                    if (empty($value)) {
                        break;
                    }
                    $category_list[] = array('c_album_category_id' => 'dummy', 'category_name' => $value);
                }
                $this->set("category", $category_list);
            } else {
                $this->set("category", db_album_category_list4c_album_id($target_c_album_id));
            }
            //ユーザのカテゴリリスト
            $this->set("category_list", db_album_category_list4c_member_id($u));
            $this->set("use_album_category", true);
        }
//print "<pre>";
//print_r ($c_album);
//print "</pre>";
         */
    }
}

?>
