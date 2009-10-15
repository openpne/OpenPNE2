<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_page_fh_diary extends OpenPNE_Action
{
    function execute($requests)
    {
        $u  = $GLOBALS['KTAI_C_MEMBER_ID'];

        // --- リクエスト変数
        $target_c_diary_id = $requests['target_c_diary_id'];
        $target_response_comment_id = $requests['target_response_comment_id'];
        $page = $requests['page'];
        // ----------

        $c_diary = db_diary_get_c_diary4id($target_c_diary_id);

        $target_c_member = k_p_fh_diary_c_member4c_diary_id($target_c_diary_id);
        $target_c_member_id = $target_c_member['c_member_id'];

        if ($u != $target_c_member_id) {
            // check public_flag
            if (!pne_check_diary_public_flag($target_c_diary_id, $u)) {
                openpne_redirect('ktai', 'page_h_err_diary_access');
            }
            //アクセスブロック設定
            if (db_member_is_access_block($u, $target_c_member_id)) {
                openpne_redirect('ktai', 'page_h_access_block');
            }
        }
        //管理画面HTML
        $this->set('c_siteadmin', p_common_c_siteadmin4target_pagename('k_fh_diary'));

        //日記の作者情報
        $this->set('target_diary_writer', $target_c_member);

        //日記
        $this->set('target_c_diary', $c_diary);
        $this->set('c_diary_id_prev', db_diary_c_diary_id_prev4c_diary_id($target_c_member_id, $target_c_diary_id, $u));
        $this->set('c_diary_id_next', db_diary_c_diary_id_next4c_diary_id($target_c_member_id, $target_c_diary_id, $u));
        //自分で日記を見たとき
        if ($c_diary['c_member_id'] == $u) {
            //日記を閲覧済みにする
            db_diary_update_c_diary_is_checked($target_c_diary_id, 1);
            $this->set('type', 'h');
        }

        //コメント
        $page_size = 5;
        if ($requests['order'] === 'asc') {
            $desc = false;
        } else {
            $desc = true;
        }
        list($c_diary_comment_list, $is_prev, $is_next, $total_num, $total_page_num)
            = k_p_fh_diary_c_diary_comment_list4c_diary_id($target_c_diary_id, $page_size, $page, $desc);
        if ($desc) {
            $c_diary_comment_list = array_reverse($c_diary_comment_list);
        }

        if ($target_response_comment_id) {
            $target_comment = _do_c_diary_comment4c_diary_comment_id($target_response_comment_id);
            $response_set = db_member_c_member4c_member_id_LIGHT($target_comment['c_member_id']);
            $this->set(
                'response_comment_format',
                '>>' . $target_comment['number'] . ' ' . $response_set['nickname'] . "さん\n"
            );
        }

        $this->set('c_diary_comment', $c_diary_comment_list);
        $this->set('total_num', $total_num);
        $this->set('total_page_num', $total_page_num);
        $this->set('page_size', $page_size);
        $this->set('page', $page);

        $this->set('is_writable_comment', db_diary_is_writable_comment4c_diary_id($target_c_diary_id));

        // コメント許可設定取得
        $this->set('is_comment_input', $c_diary['is_comment_input']);

        $start_comment = reset($c_diary_comment_list);
        $end_comment = end($c_diary_comment_list);

        $pager = array();
        $pager['start'] = (int)$start_comment['number'];
        $pager['end'] = (int)$end_comment['number'];
        if ($is_prev) {
            if ($desc) {
                $pager['page_next'] = $page - 1;
            } else {
                $pager['page_prev'] = $page - 1;
            }
        }
        if ($is_next) {
            if ($desc) {
                $pager['page_prev'] = $page + 1;
            } else {
                $pager['page_next'] = $page + 1;
            }
        }
        $this->set('pager', $pager);

        // f or h
        $this->set('INC_NAVI_type', k_p_fh_common_get_type($target_c_member['c_member_id'], $u));

        if (MAIL_ADDRESS_HASHED) {
            $mail_address = "bc{$target_c_diary_id}-".t_get_user_hash($u).'@'.MAIL_SERVER_DOMAIN;
        } else {
            $mail_address = "bc{$target_c_diary_id}".'@'.MAIL_SERVER_DOMAIN;
        }
        $mail_address = MAIL_ADDRESS_PREFIX . $mail_address;
        $this->set('mail_address', $mail_address);

        //あしあとをつける
        db_ashiato_insert_c_ashiato($target_c_member_id, $u);

        return 'success';
    }
}

?>
