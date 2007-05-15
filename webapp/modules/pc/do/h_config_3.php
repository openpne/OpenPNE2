<?php
/**
 * @copyright 2005-2006 OpenPNE Project
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
        $c_password_query_id = $requests['c_password_query_id'];
        $c_password_query_answer = $requests['c_password_query_answer'];
        $public_flag_diary = $requests['public_flag_diary'];
        $is_shinobiashi = $requests['is_shinobiashi'];
        $schedule_start_day = $requests['schedule_start_day'];
        // ----------

        include_once 'OpenPNE/RSS.php';
        
        $rss_url = OpenPNE_RSS::auto_discovery($rss);
        
        $msg_list = array();
        if ($rss && !$rss_url) $msg_list[] = "BlogのURLが有効な値ではありません";
        $filtered_id = db_member_filter_c_access_block_id($u, $c_member_id_block);
        foreach ($c_member_id_block as $each_id) {
            if (!in_array($each_id,$filtered_id)) {
            	$msg_list[] = "アクセスブロックIDが有効な値ではありません";
                break;
            }
        }
        
        // error
        if ($msg_list) {
            $_REQUEST['msg'] = array_shift($msg_list);
            openpne_forward('pc', 'page', "h_config");
            exit;
        }
        
        if ($rss_url) {
            $c_member = db_member_c_member4c_member_id($u);
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

        openpne_redirect('pc', 'page_h_home');
    }
}

?>
