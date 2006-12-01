<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_page_h_message_box extends OpenPNE_Action
{
    function execute($requests)
    {
        $u  = $GLOBALS['KTAI_C_MEMBER_ID'];

        // --- リクエスト変数
        $target_c_member_id = $requests['target_c_member_id'];
        $direc_r = $requests['direc_r'];
        $page_r = $requests['page_r'];
        $direc_s = $requests['direc_s'];
        $page_s = $requests['page_s'];
        $box = $requests['box'];
        $keyword = $requests['keyword'];
        // ----------

        if (!$target_c_member_id) $target_c_member_id = $u;

        // 1ページ当たりに表示するメッセージ数
        $page_size = 10;

        $this->set("box", $box);
        $this->set('keyword', $keyword);

        if ($box == 'outbox') {
            $page_s += $direc_s;
            if (!$keyword) {
                $list_s = k_p_h_message_box_c_message_sent_list4c_member_id4range($u, $page_size, $page_s);
            } else {
                $list_s = db_message_search_c_message($u, $page_s, $page_size, $keyword, $box);
            }

            $this->set("c_message_sent_list", $list_s[0]);
            $this->set("page_s", $page_s);
            $this->set("is_prev_s", $list_s[1]);
            $this->set("is_next_s", $list_s[2]);
            $this->set("count_messages_sent", $list_s[3]);
            $this->set("total_num", $list_s[3]);

            $pager = array();
            $pager['start'] = $page_size * ($page_s - 1) + 1;
            if (($pager['end'] = $page_size * $page_s) > $list_s[3]) {
                $pager['end'] = $list_s[3];
            }
            $this->set('pager', $pager);
        } else {
            $page_r += $direc_r;

            if (!$keyword) {
                $list_r = k_p_h_message_box_c_message_received_list4c_member_id4range($u, $page_size, $page_r);
            } else {
                $list_r = db_message_search_c_message($u, $page_r, $page_size, $keyword, $box);
            }

            $this->set("c_message_received_list", $list_r[0]);
            $this->set("page_r", $page_r);
            $this->set("is_prev_r", $list_r[1]);
            $this->set("is_next_r", $list_r[2]);
            $this->set("count_messages_received", $list_r[3]);
            $this->set("total_num", $list_r[3]);

            $pager = array();
            $pager['start'] = $page_size * ($page_r - 1) + 1;
            if (($pager['end'] = $page_size * $page_r) > $list_r[3]) {
                $pager['end'] = $list_r[3];
            }
            $this->set('pager', $pager);
        }

        return 'success';
    }
}

?>
