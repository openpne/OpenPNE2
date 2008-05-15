<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_h_message_box extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $box = $requests['box'];
        $ru_page = $requests['ru_page'];
        $s_page = $requests['s_page'];
        $save_page = $requests['save_page'];
        $trash_page = $requests['trash_page'];
        $keyword = $requests['keyword'];
        $target_c_member_id = $requests['target_c_member_id'];
        $year = $requests['year'];
        $month = $requests['month'];
        $day = $requests['day'];
        // ----------

        $this->set('inc_navi', fetch_inc_navi("h"));

        // 1ページ当たりに表示するメッセージ数
        $page_size = 20;
        $this->set("page_size", $page_size);

        //ボックス判定
        $this->set("box", $box);

        //送受信絞り
        $this->set("target_c_member_id", $target_c_member_id);

        //keyword
        $this->set("keyword", $keyword);
        $this->set("url_keyword", urlencode($keyword));

        switch ($box) {

        //受信リスト
        case 'inbox':
        default:
            //検索
            if ($keyword || $target_c_member_id) {
                list($ru_list,$is_ru_prev,$is_ru_next, $total_num) = db_message_search_c_message($u, $ru_page, $page_size, $keyword, $box, $target_c_member_id);
            } elseif ($year && $month) {
            //年月日絞り
                list($ru_list,$is_ru_prev,$is_ru_next, $total_num) = db_message_c_message_received_list4c_member_id4range($u, $ru_page, $page_size, $year, $month, $day);
            } else {
                list($ru_list,$is_ru_prev,$is_ru_next, $total_num) = db_message_c_message_received_list4c_member_id4range($u, $ru_page, $page_size);
            }
            $this->set("c_message_ru_list", $ru_list);
            //メッセージの送信者リスト
            $this->set("c_message_sender_list", db_message_c_message_sender_list4c_member_id($u));

            $this->set("count_c_message_ru_list", count($ru_list));

            $ru_data = array('ru_page' => $ru_page,'is_ru_prev' => $is_ru_prev,'is_ru_next' => $is_ru_next);

            $this->set("ru_data", $ru_data);
            break;

        //送信済みリスト
        case 'outbox':
            //検索
            if ($keyword || $target_c_member_id) {
                list($s_list,$is_s_prev,$is_s_next, $total_num) = db_message_search_c_message($u, $s_page, $page_size, $keyword, $box, $target_c_member_id);
            } elseif ($year && $month) {

                list($s_list,$is_s_prev,$is_s_next, $total_num) = db_message_c_message_sent_list4c_member_id4range($u, $s_page, $page_size, $year, $month, $day);
            } else {
                list($s_list,$is_s_prev,$is_s_next, $total_num) = db_message_c_message_sent_list4c_member_id4range($u, $s_page, $page_size);
            }

            $this->set("c_message_s_list", $s_list);
            $this->set("count_c_message_s_list", count($s_list));
            //メッセージの宛先リスト
            $this->set("c_message_receiver_list", db_message_c_message_receiver_list4c_member_id($u));

            $s_data = array('s_page' => $s_page,'is_s_prev' => $is_s_prev,'is_s_next' => $is_s_next);

            $this->set("s_data", $s_data);
            break;

        //下書き保存リスト
        case 'savebox':
            list($save_list,$is_save_prev,$is_save_next, $total_num) = db_message_c_message_save_list4c_member_id4range($u, $save_page, $page_size);
            $this->set("c_message_save_list", $save_list);
            $this->set("count_c_message_save_list", count($save_list));

            $save_data = array('save_page' => $save_page,'is_save_prev' => $is_save_prev,'is_save_next' => $is_save_next);

            $this->set("save_data", $save_data);
            break;

        //ごみ箱リスト
        case 'trash':
            list($trash_list,$is_trash_prev,$is_trash_next, $total_num) = db_message_c_message_trash_list4c_member_id4range($u, $trash_page, $page_size);
            $this->set("c_message_trash_list", $trash_list);
            $this->set("count_c_message_trash_list", count($trash_list));

            $trash_data = array('trash_page' => $trash_page,'is_trash_prev' => $is_trash_prev,'is_trash_next' => $is_trash_next);

            $this->set("trash_data", $trash_data);
            break;
        }

        $this->set("date_list", db_message_month_list4c_member_id($u, $box));
        $this->set("total_num", $total_num);

        if (!$year || !$month) {
            $this->set('all', 1);
        }
        if (!$year) {
            $year = date('Y');
        }
        if (!$month) {
            $month = date('n');
        }

        //メッセージ一覧、カレンダー用変数
        $date_val = array(
            'year'  => $year,
            'month' => $month,
            'day'   => $day,
        );
        $this->set('date_val', $date_val);
        //メッセージのカレンダー
        $calendar = db_common_message_monthly_calendar($u, $year, $month, $target_c_member_id, $box);
        $this->set('calendar', $calendar['days']);
        $this->set('ym', $calendar['ym']);

        return 'success';
    }
}

?>
