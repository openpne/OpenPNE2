<?php
/**
 * @copyright 2005-2007 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_h_album_cover_edit extends OpenPNE_Action
{
    function execute($requests)
    {
        if (!OPENPNE_USE_ALBUM) {
            handle_kengen_error();
        }

        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $target_c_album_id = $requests['target_c_album_id'];
        $subject = $requests['subject'];
        $description = $requests['description'];
        $public_flag = $requests['public_flag'];
        // ----------

        // target のアルバムが存在しない
        if (!p_common_is_active_c_album_id($target_c_album_id) && $target_c_album_id != null) {
            openpne_redirect('pc', 'page_h_err_fh_album');
        }

        //--- 権限チェック
        $album = db_album_get_c_album4c_album_id($target_c_album_id);
        if($album['c_member_id'] != $u){
            handle_kengen_error();
        }
        
        if (!(is_null($subject) || is_null($description)||is_null($public_flag))) {
            $album['subject'] = $subject;
            $album['description'] = $description;
            $album['public_flag'] = $public_flag;
        }
        
        //$community_name = db_get_commu_name4c_commu_id($album['c_commu_id']);
        //$this->set('commu_name',$community_name);
        
        //get the community list to be selected in h_album_cover_edit
        //$commu_list = db_album_get_commu_list4c_member_id($u);
        //$this->set('commu_list',$commu_list);
        
        //$list_set0 = db_album_get_c_album_subject($u);
        //$this->set("new_album_subject_list", $list_set0);

        $this->set('inc_navi', fetch_inc_navi('h'));
        $this->set('target_c_album_id',$target_c_album_id);

        //アルバムデータ
        $this->set('album',$album);

        //プロフィール
        //$this->set("target_member", db_member_c_member4c_member_id($u));

        //画像データ一時ファイル削除
        $sessid = session_id();
        t_image_clear_tmp($sessid);

        return 'success';

        //カレンダー関係
        //カレンダー開始用変数
        /*
        $time = strtotime($album['r_datetime']);
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
        */
        
        //kazuki OpenPNEのアルバムではカテゴリを使わない
        /*
        if (USE_ALBUM_CATEGORY) {
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
        */
    }
}

?>
