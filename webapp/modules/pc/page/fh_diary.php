<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_fh_diary extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $target_c_diary_id = $requests['target_c_diary_id'];
        $body = $requests['body'];
        // ----------

        // target が指定されていない
        if (!$target_c_diary_id) {
            openpne_redirect('pc', 'page_h_err_fh_diary');
        }
        // target の日記が存在しない
        if (!p_common_is_active_c_diary_id($target_c_diary_id)) {
            openpne_redirect('pc', 'page_h_err_fh_diary');
        }


        $target_c_diary = db_diary_get_c_diary4id($target_c_diary_id);
        $target_c_member_id = $target_c_diary['c_member_id'];

        if ($target_c_member_id == $u) {
            $type = 'h';

            //日記を閲覧済みにする
            db_diary_update_c_diary_is_checked($target_c_diary_id, 1);

        } else {
            $type = 'f';
            $target_c_member = db_common_c_member4c_member_id($target_c_member_id);
            $is_friend = db_friend_is_friend($u, $target_c_member_id);

            // check public_flag
	        if (!pne_check_diary_public_flag($target_c_diary_id, $u)) {
	            openpne_redirect('pc', 'page_h_err_diary_access');
	        }
            // アクセスブロック
            if (p_common_is_access_block($u, $target_c_member_id)) {
                openpne_redirect('pc', 'page_h_access_block');
            }

            // あしあとをつける
            db_ashiato_insert_c_ashiato($target_c_member_id, $u);
        }
        $this->set("type", $type);

        $this->set('inc_navi', fetch_inc_navi($type, $target_c_member_id));

        $this->set("member", db_common_c_member4c_member_id($u));

        $this->set("target_member", db_common_c_member4c_member_id($target_c_member_id));
        $this->set("target_diary", $target_c_diary);
        $this->set("target_diary_comment_list", db_diary_get_c_diary_comment_list4c_diary_id($target_c_diary_id));

        $this->set("body", $body);

        //最近の日記を取得
        $list_set = p_fh_diary_list_diary_list4c_member_id($target_c_member_id, 7, 1, $u);
        $this->set("new_diary_list", $list_set[0]);

        //カレンダー関係
        //カレンダー開始用変数
        $time = strtotime($target_c_diary['r_datetime']);
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
        $calendar = db_common_diary_monthly_calendar($year, $month, $target_c_member_id, $u);

        $this->set("calendar", $calendar['days']);
        $this->set("ym", $calendar['ym']);

        //各月の日記
        $this->set("date_list", p_fh_diary_list_date_list4c_member_id($target_c_member_id));

        return 'success';
    }
}

?>
