<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_h_diary_add extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $form_val['subject'] = $requests['subject'];
        $form_val['body'] = $requests['body'];
        $form_val['public_flag'] = $requests['public_flag'];
        $form_val['category'] = $requests['category'];
        $form_val['is_comment_input'] = $requests['is_comment_input'];
        // ----------

        $sessid = session_id();
        t_image_clear_tmp($sessid);

        $this->set('inc_navi', fetch_inc_navi("h"));

        //プロフィール
        $c_member = db_member_c_member4c_member_id($u);
        if (empty($form_val['public_flag'])) {
            $form_val['public_flag'] = $c_member['public_flag_diary'];
        }
        $this->set("target_member", $c_member);
        $this->set("form_val", $form_val);

        //カレンダー関係
        //カレンダー開始用変数
        $year = date("Y");
        $month= date("n");
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
            //カテゴリリスト
            $this->set("category_list", db_diary_category_list4c_member_id($u));
            $this->set("use_diary_category", true);
        }

        // inc_entry_point
        $this->set('inc_entry_point', fetch_inc_entry_point($this->getView(), 'h_diary_add'));

        return 'success';
    }
}

?>
