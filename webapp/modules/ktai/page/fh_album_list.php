<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_page_fh_album_list extends OpenPNE_Action
{
    function handleError()
    {
        openpne_redirect('ktai', 'page_h_err_fh_album');
    }

    function execute($requests)
    {
        if (!OPENPNE_USE_ALBUM) {
            handle_kengen_error();
        }

        $u  = $GLOBALS['KTAI_C_MEMBER_ID'];

        // --- リクエスト変数
        $target_c_member_id = $requests['target_c_member_id'];
        $page = $requests['page'];
        // ----------
        $page_size = 10;

        if (!$target_c_member_id) {
            $target_c_member_id = $u;
        }

        if ($target_c_member_id == $u) {
            $type = 'h';
            //$is_album_admin = true;
            $target_c_member = db_member_c_member4c_member_id($u);
        } else {
            $type = 'f';
            //$is_album_admin = false;
            $target_c_member = db_member_c_member4c_member_id($target_c_member_id);

            // メンバーが存在しない
            if (!$target_c_member) {
                $this->handleError();
            }

            // アクセスブロック
            if (db_member_is_access_block($u, $target_c_member_id)) {
                openpne_redirect('ktai', 'page_h_access_block');
            }

            // あしあとをつける
            db_ashiato_insert_c_ashiato($target_c_member_id, $u);
        }

        $this->set('type', $type);

        //メンバー情報
        $this->set('c_member_id',$u);
        $this->set("target_member", $target_c_member);

        //アルバム一覧取得
        list($album_list, $is_prev, $is_next, $total_num) =
            p_fh_album_list_fh_my_album_list4c_member_id($target_c_member_id, $page_size, $page, $u);
        $this->set('album_list', $album_list);

        $this->set('page', $page);
        $this->set('page_size', $page_size);
        $this->set('is_prev', $is_prev);
        $this->set('is_next', $is_next);
        $this->set("total_num", $total_num);
        $this->set('album_list_count', count($album_list));

        $start = ($page - 1) * $page_size + 1;
        $end = $start + count($album_list) - 1;
        $this->set('start', $start);
        $this->set('end', $end);

        return 'success';
    }
}

?>
