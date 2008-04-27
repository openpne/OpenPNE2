<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_fh_friend_list extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $target_c_member_id = $requests['target_c_member_id'];
        $page = $requests['page'];
        $order = $requests['order'];
        // ----------

        if (!$target_c_member_id) {
            $target_c_member_id = $u;
        }

        if (db_member_is_access_block($u, $target_c_member_id)) {
            openpne_redirect('pc', 'page_h_access_block');
        }

        // navi 振り分け用
        if ($target_c_member_id == $u) {
            $type = "h";
        } else {
            $type = "f";
        }
        $this->set('inc_navi', fetch_inc_navi($type, $target_c_member_id));
        $this->set("type", $type);

        //----------PC CONTENT#LEFT
        //メンバー情報
        $this->set("member", db_member_c_member4c_member_id($u));

        //ターゲット情報
        $this->set("target_member", db_member_c_member4c_member_id($target_c_member_id));

        //ターゲットの友達数
        $friend_num = db_friend_count_friends($target_c_member_id);

        $this->set("target_friend_num", $friend_num);

        //----------PC CONTENT#CENTER

        // 1ページ当たりに表示するフレンドの数
        $page_size = 50;

        //ターゲットの詳細な友達リスト
        $list = db_friend_friend_list4c_member_id2($target_c_member_id, $page_size, $page, $order);
        $this->set("order", $order);

        $this->set("target_friend_list_disp", $list[0]);
        $this->set("page", $page);
        $this->set("is_prev", $list[1]);
        $this->set("is_next", $list[2]);

        $this->set("start_num", ($page-1) * $page_size + 1);

        if (($page * $page_size) < $friend_num) {
            $end_num = $page * $page_size;
        } else {
            $end_num = $friend_num;
        }
        $this->set("end_num", $end_num);

        for ($i=1; $i <= $list[3]; $i++) {
            $page_num[] = $i;
        }
        $this->set("page_num", $page_num);

        //あしあとをつける
        if ($target_c_member_id != $u) {
            db_ashiato_insert_c_ashiato($target_c_member_id, $u);
        }

        return 'success';
    }
}

?>
