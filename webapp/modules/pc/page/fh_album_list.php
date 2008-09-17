<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_fh_album_list extends OpenPNE_Action
{
    function execute($requests)
    {
        if (!OPENPNE_USE_ALBUM) {
            handle_kengen_error();
        }

        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $target_c_member_id = $requests['target_c_member_id'];
        $page = $requests['page'];
        $keyword = $requests['keyword'];
        // ----------

        if (!$target_c_member_id || !is_null($keyword)) {
            $target_c_member_id = $u;
        }

        if ($target_c_member_id == $u) {
            $type = 'h';
            $is_album_admin = true;
        } else {
            $type = 'f';
            $is_album_admin = false;
            $target_c_member = db_member_c_member4c_member_id($target_c_member_id);

            // メンバーが存在しない
            if (!$target_c_member) {
                handle_kengen_error();
            }

            // アクセスブロック
            if (db_member_is_access_block($u, $target_c_member_id)) {
                openpne_redirect('pc', 'page_h_access_block');
            }

            //あしあとをつける
            db_ashiato_insert_c_ashiato($target_c_member_id, $u);
        }
        $this->set('inc_navi', fetch_inc_navi($type, $target_c_member_id));
        $this->set('type', $type);

        $page_size = 10;

        $target_member = db_member_c_member4c_member_id($target_c_member_id);
        $this->set('target_member', $target_member);
        $this->set('c_member_id',$u);

        //年月日で一覧表示、アルバム数に制限なし

        //検索する場合
        if ($keyword) {
            $list_set = p_h_album_list_all_search_c_album4c_album($keyword, $page_size, $page, $u);
        } else {
            $list_set = p_fh_album_list_fh_my_album_list4c_member_id($target_c_member_id, $page_size, $page, $u);
        }

        $this->set('target_album_list', $list_set[0]);

        //アルバムサブジェクト一覧取得
        $album_subject_list =  db_album_get_c_album_subject_list4c_member_id($target_c_member_id, 10, $u);
        $this->set('target_album_subject_list', $album_subject_list);

        $this->set('page', $page);
        $this->set('page_size', $page_size);
        $this->set('is_prev', $list_set[1]);
        $this->set('is_next', $list_set[2]);
        $this->set("total_num", $list_set[3]);
        $this->set('album_list_count', count($list_set[0]));

        //検索ワード
        $this->set('keyword', $keyword);
        $this->set("url_keyword", urlencode($keyword));

        return 'success';
    }
}

?>
