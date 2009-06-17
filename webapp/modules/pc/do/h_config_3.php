<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * 設定変更
 */
class pc_do_h_config_3 extends OpenPNE_Action
{
    function handleError($errors)
    {
        $_REQUEST['msg'] = array_shift($errors);
        openpne_forward('pc', 'page', 'h_config', $errors);
        exit;
    }

    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $rss = $requests['rss'];
        $is_receive_daily_news = $requests['is_receive_daily_news'];
        $is_receive_mail = $requests['is_receive_mail'];
        $ashiato_mail_num= $requests['ashiato_mail_num'];
        $c_member_id_block = $requests['c_member_id_block'];
        $public_flag_diary = util_cast_public_flag_diary($requests['public_flag_diary']);
        $is_shinobiashi = $requests['is_shinobiashi'];
        $schedule_start_day = $requests['schedule_start_day'];
        $c_password_query_id = $requests['c_password_query_id'];
        $c_password_query_answer = $requests['c_password_query_answer'];
        // ----------

        $c_member = db_member_c_member4c_member_id($u);

        $error_messages = array();

        if (OPENPNE_AUTH_MODE == 'slavepne') {
            $c_password_query_id = 0;
            $c_password_query_answer = '';
        } else {
            if (IS_PASSWORD_QUERY_ANSWER) {
                if (!strlen($requests['c_password_query_answer'])) {
                    if (!$c_member['c_password_query_id']) {
                        $c_password_query_id = 0;
                    } else {
                        if ($c_password_query_id != $c_member['c_password_query_id']) {
                            $error_messages[] = '秘密の質問の答えを入力してください。';
                        }
                    }
                }
            }
        }

        if ($rss) {
            if (!preg_match('|^https?://|', $rss)) {
                $error_messages[] = 'BlogのURLを正しく入力してください';
            } else {
                include_once 'OpenPNE/RSS.php';
                if (!($rss_url = OpenPNE_RSS::auto_discovery($rss))) {
                    $error_messages[] = 'BlogのURLが無効です';
                }
            }
        }

        $filtered_id = db_member_filter_c_access_block_id($u, $c_member_id_block);
        foreach ($c_member_id_block as $each_id) {
            if (!in_array($each_id, $filtered_id)) {
                $error_messages[] = 'アクセスブロックに無効なメンバーIDが含まれています';
                break;
            }
        }

        // error
        if ($error_messages) {
            $_REQUEST['msg'] = array_shift($error_messages);
            openpne_forward('pc', 'page', 'h_config');
            exit;
        }

        if ($rss_url) {
            if ($rss_url != $c_member['rss']) {
                //異なるBlogを登録すると過去のrssは全て削除する
                db_rss_delete_rss_cache($u);
            }

            //c_rss_cacheへ登録
            db_rss_insert_rss_cache($rss_url, $u);
        } else {
            $rss_url = '';
            db_rss_delete_rss_cache($u);
        }

        //秘密の質問使用モード = true
        //または、設定画面表示時はtrueだったけど、設定変更ボタンを押す時にはfalse
        //になっていた場合、
        //秘密の質問は登録する 
        db_member_h_config_3(
            $u,
            $is_receive_mail,
            $rss_url,
            $ashiato_mail_num,
            $is_receive_daily_news,
            $c_password_query_id,
            $c_password_query_answer,
            $public_flag_diary,
            $is_shinobiashi,
            $schedule_start_day
        );

        db_member_insert_c_access_block($u, $c_member_id_block);

        // ランクアップメール設定
        if (!util_is_unused_mail('m_pc_rank_up'))
        {
            db_member_update_c_member_config($u, 'SEND_RANK_UP_MAIL_PC', $requests['SEND_RANK_UP_MAIL_PC']);
        }

        openpne_redirect('pc', 'page_h_home');
    }
}

?>
