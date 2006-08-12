<?php
/**
 * @copyright 2005-2006 OpenPNE Project
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
        // ----------

        $this->set('inc_navi',fetch_inc_navi("h"));

        $this->set('u', $u);

        // 1ページ当たりに表示するメッセージ数
        $page_size = 20;
        $this->set("page_size",$page_size);

        //ボックス判定
        $this->set("box",$box);

        switch ($box) {

        //受信リスト
        case 'inbox':
        default:
            list($ru_list,$is_ru_prev,$is_ru_next) = p_h_message_box_c_message_received_list4c_member_id4range($u, $ru_page, $page_size);
            $this->set("c_message_ru_list",$ru_list);
            $this->set("count_c_message_ru_list",count($ru_list) );

            $ru_data = array('ru_page' => $ru_page,'is_ru_prev' => $is_ru_prev,'is_ru_next' => $is_ru_next );

            $this->set("ru_data",$ru_data);
            break;

        //送信済みリスト
        case 'outbox':
            list($s_list,$is_s_prev,$is_s_next) = p_h_message_box_c_message_sent_list4c_member_id4range($u, $s_page, $page_size);
            $this->set("c_message_s_list", $s_list);
            $this->set("count_c_message_s_list", count($s_list) );

            $s_data = array('s_page' => $s_page,'is_s_prev' => $is_s_prev,'is_s_next' => $is_s_next );

            $this->set("s_data",$s_data);
            break;

        //下書き保存リスト
        case 'savebox':
            list($save_list,$is_save_prev,$is_save_next) = p_h_message_box_c_message_save_list4c_member_id4range($u, $save_page, $page_size);
            $this->set("c_message_save_list",$save_list);
            $this->set("count_c_message_save_list", count($save_list) );

            $save_data = array('save_page' => $save_page,'is_save_prev' => $is_save_prev,'is_save_next' => $is_save_next );

            $this->set("save_data",$save_data);
            break;

        //ごみ箱リスト
        case 'trash':
            list($trash_list,$is_trash_prev,$is_trash_next) = p_h_message_box_c_message_trash_list4c_member_id4range($u, $trash_page, $page_size);
            $this->set("c_message_trash_list",$trash_list);
            $this->set("count_c_message_trash_list", count($trash_list) );

            $trash_data = array('trash_page' => $trash_page,'is_trash_prev' => $is_trash_prev,'is_trash_next' => $is_trash_next );

            $this->set("trash_data",$trash_data);
            break;
        }
        return 'success';
    }
}

?>
