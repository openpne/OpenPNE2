<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_h_diary_edit extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $target_c_diary_id = $requests['target_c_diary_id'];
        $subject = $requests['subject'];
        $body = $requests['body'];
        $public_flag = $requests['public_flag'];
        $category = $requests['category'];
        $is_comment_input = $requests['is_comment_input'];
        // ----------

        $c_diary = db_diary_get_c_diary4id($target_c_diary_id);

        // target が指定されていない
        // 新規作成
        if (!$target_c_diary_id) {
            openpne_redirect('pc', 'page_h_diary_add');
        }

        // target の日記が存在しない
        if (!p_common_is_active_c_diary_id($target_c_diary_id) && $target_c_diary_id != null) {
            openpne_redirect('pc', 'page_h_err_fh_diary');
        }

        //--- 権限チェック
        //日記の作成者
        if ($u != $c_diary['c_member_id']) {
            handle_kengen_error();
        }


        //登録されている写真を削除　0は削除しない 1は削除する
        if ($_REQUEST['del_img'] & 0x01 == 1)  $c_diary['image_filename_1'] = "";
        if ($_REQUEST['del_img'] & 0x02 == 1)  $c_diary['image_filename_2'] = "";
        if ($_REQUEST['del_img'] & 0x04 == 1)  $c_diary['image_filename_3'] = "";
        $this->set('del_img', $_REQUEST['del_img']);

        $this->set('inc_navi', fetch_inc_navi('h'));

        //プロフィール
        $this->set("target_member", db_member_c_member4c_member_id($u));

        //カレンダー関係
        //カレンダー開始用変数
        $time = strtotime($c_diary['r_datetime']);
        $year = date('Y', $time);
        $month= date('n', $time);
        //日記一覧、カレンダー用変数
        $date_val = array(
            'year' => $year,
            'month' => $month,
            'day' => null,
        );
        $this->set("date_val", $date_val);

        //日記のカレンダー
        $calendar = db_common_diary_monthly_calendar($year, $month, $u);

        $this->set("calendar", $calendar['days']);
        $this->set("ym", $calendar['ym']);

        //各月の日記
        $this->set("date_list", p_fh_diary_list_date_list4c_member_id($u));

        if (USE_DIARY_CATEGORY) {
            //この日記のカテゴリリストを得る
            if ($category) {
                $category_list = array();
                foreach(preg_split('/\s+/', $category) as $value) {
                    if (empty($value)) {
                        break;
                    }
                    $category_list[] = array('c_diary_category_id' => 'dummy', 'category_name' => $value);
                }
                $this->set("category", $category_list);
            } else {
                $this->set("category", db_diary_category_list4c_diary_id($target_c_diary_id));
            }
            //メンバーのカテゴリリスト
            $this->set("category_list", db_diary_category_list4c_member_id($u));
            $this->set("use_diary_category", true);
        }

        // 内容の不備によるリダイレクト時・編集修正時は値を上書き
        if ($requests['msg'] || !(is_null($subject) || is_null($body))) {
            $c_diary['subject'] = $subject;
            $c_diary['body'] = $body;
            $c_diary['public_flag'] = util_cast_public_flag_diary($public_flag);
            $c_diary['is_comment_input'] = $is_comment_input;
        }

        $this->set("diary", $c_diary);

        // inc_entry_point
        $this->set('inc_entry_point', fetch_inc_entry_point($this->getView(), 'h_diary_edit'));

        return 'success';
    }
}

?>
