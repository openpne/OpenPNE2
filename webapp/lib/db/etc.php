<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * 管理用アカウントが存在するかどうか
 * setup が完了しているかどうかの判定に使う
 *
 * @return bool 存在するかどうか
 */
function db_admin_user_exists()
{
    $sql = 'SELECT c_admin_user_id FROM c_admin_user';
    return (bool)db_get_one($sql);
}

/**
 * 配色設定を取得
 *
 * @param int $c_config_color_id
 * @return array
 */
function db_etc_c_config_color($c_config_color_id = 1)
{
    $sql = 'SELECT * FROM c_config_color WHERE c_config_color_id = ?';
    $params = array(intval($c_config_color_id));
    return db_get_row($sql, $params);
}

/**
 * 配色設定を全て取得
 */
function db_etc_c_config_color_list()
{
    $current = db_etc_c_config_color();
    $preset = util_get_preset_color_list();
    return array_merge(array($current), $preset);
}

/**
 * 配色設定を変更
 *
 * @param array $color_list
 * @param int $c_config_color_id
 * @return bool
 */
function db_update_c_config_color($color_list, $c_config_color_id = 1)
{
    $where = array('c_config_color_id' => intval($c_config_color_id));
    return db_update('c_config_color', $color_list, $where);
}

/**
 * 携帯版配色設定を取得
 *
 * @param int $c_config_color_ktai_id
 * @return array
 */
function db_etc_c_config_color_ktai($c_config_color_ktai_id = 1)
{
    $sql = 'SELECT * FROM c_config_color_ktai WHERE c_config_color_ktai_id = ?';
    $params = array(intval($c_config_color_ktai_id));
    return db_get_row($sql, $params);
}

/**
 * 携帯版配色設定を全て取得
 */
function db_etc_c_config_color_ktai_list()
{
    $current = db_etc_c_config_color_ktai();
    $preset = util_get_preset_color_list('ktai');
    return array_merge(array($current), $preset);
}

/**
 * 携帯版配色設定を変更
 *
 * @param array $color_list
 * @param int $c_config_color_ktai_id
 * @return bool
 */
function db_update_c_config_color_ktai($color_list, $c_config_color_ktai_id = 1)
{
    $where = array('c_config_color_ktai_id' => intval($c_config_color_ktai_id));
    return db_update('c_config_color_ktai', $color_list, $where);
}


/**
 * siteadminを取得
 */
function p_common_c_siteadmin4target_pagename($target_pagename)
{
    $sql = 'SELECT body FROM c_siteadmin WHERE target = ?';
    $params = array($target_pagename);
    return db_get_one($sql, $params);
}

/**
 * 都道府県リストを取得
 */
function p_regist_prof_c_profile_pref_list4null()
{
    $hint = db_mysql_hint('FORCE INDEX (sort_order)');
    $sql = 'SELECT c_profile_pref_id, pref FROM c_profile_pref' . $hint .
           ' ORDER BY sort_order';
    return db_get_assoc($sql);
}

/**
 * 都道府県リスト(全データ)を取得
 */
function db_etc_c_profile_pref_list()
{
    $hint = db_mysql_hint('FORCE INDEX (sort_order)');
    $sql = 'SELECT * FROM c_profile_pref' . $hint . ' ORDER BY sort_order';
    return db_get_all($sql);
}

/**
 * IDから都道府県リスト(全データ)を取得
 */
function db_etc_c_profile_pref4id($c_profile_pref_id)
{
    $sql = 'SELECT * FROM c_profile_pref WHERE c_profile_pref_id = ?';
    $params = array(intval($c_profile_pref_id));
    return db_get_row($sql, $params);
}

/**
 * 特定の緯度経度の都道府県を取得
 */
function db_etc_c_profile_pref_id4latlng($lat, $lng, $zoom)
{
    if (!$lat || !$lng) {
        return false;
    }

    $sql = 'SELECT c_profile_pref_id FROM c_profile_pref' .
        ' WHERE map_latitude = ? AND map_longitude = ? AND map_zoom = ?';
    $params = array($lat, $lng, intval($zoom));
    return db_get_one($sql, $params);
}

/**
 * 秘密の質問を取得
 */
function p_common_c_password_query4null()
{
    $sql = 'SELECT c_password_query_id, c_password_query_question FROM c_password_query';
    return db_get_assoc($sql);
}


function check_search_word($search_word)
{
    $search_word = str_replace("_", "\_", $search_word);
    $search_word = str_replace("%", "\%", $search_word);
    return $search_word;
}

//---

function do_common_c_pc_address_pre4pc_address($pc_address)
{
    $sql = 'SELECT * FROM c_pc_address_pre WHERE pc_address = ?';
    $params = array($pc_address);
    return db_get_row($sql, $params);
}

function do_common_c_pc_address_pre4sid($sid)
{
    $sql = 'SELECT * FROM c_pc_address_pre WHERE session = ?';
    $params = array($sid);
    return db_get_row($sql, $params);
}

/**
 * パスワードが正しいかどうか認証する
 *
 * @param int $c_member_id
 * @param string $password 平文のパスワード
 * @return bool パスワードが正しいかどうか
 */
function db_common_authenticate_password($c_member_id, $password, $is_ktai = false)
{
    $auth_config = get_auth_config($is_ktai);

    if (OPENPNE_AUTH_MODE == 'slavepne' || OPENPNE_AUTH_MODE == 'pneid') {
        $username = db_member_username4c_member_id($c_member_id, $is_ktai);
    } else {
        $auth_config['options']['usernamecol'] = 'c_member_id';
        $username = $c_member_id;
    }

    $storage = Auth::_factory($auth_config['storage'],$auth_config['options']);
    if ($storage->fetchData($username, $password, false) === true) {
        return true;
    }
    return false;
}

/**
 * 日記ページのカレンダー生成
 */
function db_common_diary_monthly_calendar($year, $month, $c_member_id, $u = null)
{
    include_once 'Calendar/Month/Weekdays.php';
    $Month = new Calendar_Month_Weekdays($year, $month, 0);
    $Month->build();

    $is_diary_list = p_h_diary_is_diary_written_list4date($year, $month, $c_member_id, $u);

    $calendar = array();
    $week = 0;
    while ($Day = $Month->fetch()) {
        if ($Day->isFirst()) $week++;

        if ($Day->isEmpty()) {
            $calendar['days'][$week][] = array();
        } else {
            $day = $Day->thisDay();
            $item = array(
                'day' => $day,
                'is_diary' => in_array($day, $is_diary_list),
            );
            $calendar['days'][$week][] = $item;
        }
    }

    // 最初に日記を書いた日
    $sql = 'SELECT r_datetime FROM c_diary WHERE c_member_id = ? ORDER BY r_datetime';
    $first_datetime = db_get_one($sql, array(intval($c_member_id)));

    // 前の月、次の月
    $prev_month = $Month->prevMonth('timestamp');
    $this_month = $Month->thisMonth('timestamp');
    $next_month = $Month->nextMonth('timestamp');

    $ym = array(
        'disp_year'  => $year,
        'disp_month' => $month,
        'prev_year'  => null,
        'prev_month' => null,
        'next_year'  => null,
        'next_month' => null,
    );
    if ($first_datetime && strtotime($first_datetime) < $this_month) {
        $ym['prev_year'] = date('Y', $prev_month);
        $ym['prev_month'] = date('n', $prev_month);
    }
    if ($next_month < time()) {
        $ym['next_year'] = date('Y', $next_month);
        $ym['next_month'] = date('n', $next_month);
    }
    $calendar['ym'] = $ym;

    return $calendar;
}

/**
 * メッセージページのカレンダー生成
 */
function db_common_message_monthly_calendar($u, $year, $month, $c_member_id, $box)
{
    include_once 'Calendar/Month/Weekdays.php';
    $Month = new Calendar_Month_Weekdays($year, $month, 0);
    $Month->build();

    $is_message_list = db_message_is_message_list4date($u, $year, $month, $box);

    $calendar = array();
    $week = 0;
    while ($Day = $Month->fetch()) {
        if ($Day->isFirst()) $week++;

        if ($Day->isEmpty()) {
            $calendar['days'][$week][] = array();
        } else {
            $day = $Day->thisDay();
            $item = array(
                'day' => $day,
                'is_message' => @in_array($day, $is_message_list),
            );
            $calendar['days'][$week][] = $item;
        }
    }

    if ($box == 'inbox' || !$box) {
        $where = "c_member_id_to = ?".
                 " AND is_deleted_to = 0" .
                 " AND is_send = 1";
    } elseif ($box == 'outbox') {
        $where = "c_member_id_from = ?".
                 " AND is_deleted_from = 0" .
                 " AND is_send = 1";
    } else {
        return null;
    }

    // 最初にメッセージを書いた日
    $sql = "SELECT r_datetime FROM c_message WHERE $where ORDER BY r_datetime";
    $first_datetime = db_get_one($sql, array(intval($u)));

    // 前の月、次の月
    $prev_month = $Month->prevMonth('timestamp');
    $this_month = $Month->thisMonth('timestamp');
    $next_month = $Month->nextMonth('timestamp');

    $ym = array(
        'disp_year'  => $year,
        'disp_month' => $month,
        'prev_year'  => null,
        'prev_month' => null,
        'next_year'  => null,
        'next_month' => null,
    );
    if ($first_datetime && strtotime($first_datetime) < $this_month) {
        $ym['prev_year'] = date('Y', $prev_month);
        $ym['prev_month'] = date('n', $prev_month);
    }
    if ($next_month < time()) {
        $ym['next_year'] = date('Y', $next_month);
        $ym['next_month'] = date('n', $next_month);
    }
    $calendar['ym'] = $ym;

    return $calendar;
}

//---

/**
 * スキン画像のfilenameを取得
 */
function db_get_c_skin_filename_list()
{
    $sql = 'SELECT skinname, filename FROM c_skin_filename';
    return db_get_assoc($sql);
}

function db_get_c_skin_filename4skinname($skinname)
{
    static $table;
    if (!isset($table)) {
        $table = (array)db_get_c_skin_filename_list();
    }

    if (empty($table[$skinname])) {
        return '';
    } else {
        return $table[$skinname];
    }
}

//---

/**
 * DBテンプレートを読み込み
 */
function db_get_c_template_source($name)
{
    $sql = 'SELECT source FROM c_template WHERE name = ?';
    $params = array(strval($name));
    return db_get_one($sql, $params);
}

/**
 * ナビゲーション項目を取得
 */
function db_get_c_navi($navi_type = 'h')
{
    $sql = 'SELECT * FROM c_navi WHERE navi_type = ? ORDER BY sort_order';
    $params = array(strval($navi_type));
    return db_get_all($sql, $params);
}

//--- 退会

/**
 * SNSメンバー退会
 *
 * @param int $c_member_id
 */
function db_common_delete_c_member($c_member_id)
{
    //function cache削除
    cache_drop_c_member($c_member_id);

    //// --- 双方向パターン
    $double = array(intval($c_member_id), intval($c_member_id));

    // c_access_block
    $sql = 'DELETE FROM c_access_block WHERE c_member_id = ? OR c_member_id_block = ?';
    db_query($sql, $double);

    // c_bookmark
    $sql = 'DELETE FROM c_bookmark WHERE c_member_id_from = ? OR c_member_id_to = ?';
    db_query($sql, $double);

    // c_friend
    $sql = 'DELETE FROM c_friend WHERE c_member_id_from = ? OR c_member_id_to = ?';
    db_query($sql, $double);

    // c_friend_confirm
    $sql = 'DELETE FROM c_friend_confirm WHERE c_member_id_from = ? OR c_member_id_to = ?';
    db_query($sql, $double);


    //// --- 単一パターン
    $single = array(intval($c_member_id));

    // c_ktai_address_pre
    $sql = 'DELETE FROM c_ktai_address_pre WHERE c_member_id = ?';
    db_query($sql, $single);

    // c_member_ktai_pre
    $sql = 'DELETE FROM c_member_ktai_pre WHERE c_member_id_invite = ?';
    db_query($sql, $single);

    // c_pc_address_pre
    $sql = 'DELETE FROM c_pc_address_pre WHERE c_member_id = ?';
    db_query($sql, $single);

    // c_review_clip
    $sql = 'DELETE FROM c_review_clip WHERE c_member_id = ?';
    db_query($sql, $single);

    // c_review_comment
    $sql = 'DELETE FROM c_review_comment WHERE c_member_id = ?';
    db_query($sql, $single);

    // c_rss_cache
    $sql = 'DELETE FROM c_rss_cache WHERE c_member_id = ?';
    db_query($sql, $single);

    // c_schedule
    $sql = 'DELETE FROM c_schedule WHERE c_member_id = ?';
    db_query($sql, $single);


    //// --- 特殊パターン

    ///コミュニティ関連
    // c_commu_member
    $sql = 'DELETE FROM c_commu_member WHERE c_member_id = ?';
    db_query($sql, $single);

    // c_commu.c_member_id_sub_admin
    $data = array('c_member_id_sub_admin' => 0);
    $where = array('c_member_id_sub_admin' => intval($c_member_id));
    db_update('c_commu', $data, $where);

    // c_commu (画像)
    $sql = 'SELECT * FROM c_commu WHERE c_member_id_admin = ?';
    $c_commu_list = db_get_all($sql, $single, 'main');

    foreach ($c_commu_list as $c_commu) {
        $sql = 'SELECT COUNT(*) FROM c_commu_member WHERE c_commu_id = ?';
        $count = db_get_one($sql, array(intval($c_commu['c_commu_id'])), 'main');
        if (!$count) {
            // コミュニティ削除
            db_common_delete_c_commu($c_commu['c_commu_id'], $c_member_id);
        } else {
            // 管理者交代
            //     副管理者がいる場合：副管理者に交代
            //     副管理者がいない場合：参加日時が一番古い人に交代
            $new_admin_id = 0;
            if (empty($c_commu['c_member_id_sub_admin'])) {
                $sql = 'SELECT c_member_id FROM c_commu_member WHERE c_commu_id = ?'
                     . ' ORDER BY r_datetime';
                $params = array(intval($c_commu['c_commu_id']));
                $new_admin_id = db_get_one($sql, $params, 'main');
            } else {
                $new_admin_id = $c_commu['c_member_id_sub_admin'];
            }
            do_common_send_mail_c_commu_admin_change($new_admin_id, $c_commu['c_commu_id']);

            $data = array('c_member_id_admin' => intval($new_admin_id), 'c_member_id_sub_admin' => 0);
            $where = array('c_commu_id' => intval($c_commu['c_commu_id']));
            db_update('c_commu', $data, $where);
        }
    }

    // c_commu_admin_confirm
    $sql = 'DELETE FROM c_commu_admin_confirm WHERE c_member_id_to = ?';
    db_query($sql, $single);

    // c_commu_member_confirm
    $sql = 'DELETE FROM c_commu_member_confirm WHERE c_member_id = ?';
    db_query($sql, $single);

    // c_commu_review
    $sql = 'DELETE FROM c_commu_review WHERE c_member_id = ?';
    db_query($sql, $single);

    // c_event_member
    $sql = 'DELETE FROM c_event_member WHERE c_member_id = ?';
    db_query($sql, $single);


    ///日記関連
    db_diary_delete4c_member_id($c_member_id);
    // c_diary (画像)
    $sql = 'SELECT * FROM c_diary WHERE c_member_id = ?';
    $c_diary_list = db_get_all($sql, $single, 'main');
    foreach ($c_diary_list as $c_diary) {
        db_image_data_delete($c_diary['image_filename_1'], $c_member_id);
        db_image_data_delete($c_diary['image_filename_2'], $c_member_id);
        db_image_data_delete($c_diary['image_filename_3'], $c_member_id);

    // アルバム
    db_album_delete4c_member_id($c_member_id);
        // c_diary_comment
        $sql = 'SELECT * FROM c_diary_comment WHERE c_diary_id = ?';
        $params = array(intval($c_diary['c_diary_id']));
        $c_diary_comment_list = db_get_all($sql, $params, 'main');
        foreach ($c_diary_comment_list as $c_diary_comment) {
            db_image_data_delete($c_diary_comment['image_filename_1'], $c_member_id);
            db_image_data_delete($c_diary_comment['image_filename_2'], $c_member_id);
            db_image_data_delete($c_diary_comment['image_filename_3'], $c_member_id);
        }

        $sql = 'DELETE FROM c_diary_comment WHERE c_diary_id = ?';
        db_query($sql, $params);
    }
    $sql = 'DELETE FROM c_diary WHERE c_member_id = ?';
    db_query($sql, $single);

    ///アルバム関連
    $sql = 'SELECT c_album_id FROM c_album WHERE c_member_id = ?';
    $c_album_id_list = db_get_col($sql, $single, 'main');
    foreach ($c_album_id_list as $c_album_id) {
        db_album_delete_c_album($c_album_id, $c_member_id);
    }

    ///メンバー関連
    // c_member_pre
    $sql = 'SELECT * FROM c_member_pre WHERE c_member_id_invite = ?';
    $c_member_pre_list = db_get_all($sql, $single, 'main');
    foreach ($c_member_pre_list as $c_member_pre) {
        // c_member_pre_profile
        $sql = 'DELETE FROM c_member_pre_profile WHERE c_member_pre_id = ?';
        $params = array(intval($c_member_pre['c_member_pre_id']));
        db_query($sql, $params);
    }
    $sql = 'DELETE FROM c_member_pre WHERE c_member_id_invite = ?';
    db_query($sql, $single);

    // c_member_profile
    $sql = 'DELETE FROM c_member_profile WHERE c_member_id = ?';
    db_query($sql, $single);

    // c_member_secure
    $sql = 'DELETE FROM c_member_secure WHERE c_member_id = ?';
    db_query($sql, $single);

    // c_member (画像)
    $sql = 'SELECT image_filename_1, image_filename_2, image_filename_3' .
        ' FROM c_member WHERE c_member_id = ?';
    $c_member = db_get_row($sql, $single, 'main');
    db_image_data_delete($c_member['image_filename_1'], $c_member_id);
    db_image_data_delete($c_member['image_filename_2'], $c_member_id);
    db_image_data_delete($c_member['image_filename_3'], $c_member_id);

    // c_member (メンバー情報)
    $sql = 'DELETE FROM c_member WHERE c_member_id = ?';
    db_query($sql, $single);

    // c_username
    $sql = 'DELETE FROM c_username WHERE c_member_id = ?';
    db_query($sql, $single);


    ///グループ関連
    // biz_group_member
    $sql = 'DELETE FROM biz_group_member '
         . 'WHERE c_member_id = ? ';
    db_query($sql, $single);

    $sql = 'SELECT * FROM biz_group '
         . 'WHERE admin_id = ? ';
    $biz_group_list = db_get_all($sql, $single, 'main');

    foreach ($biz_group_list as $biz_group) {
        // 管理者交代
        // biz_group_member_idが一番早い人に交代
        $sql = 'SELECT c_member_id FROM biz_group_member '
             . 'WHERE biz_group_id = ? '
             . 'ORDER BY biz_group_member_id ';
        $params = array(intval($biz_group['biz_group_id']));
        $new_admin_id = db_get_one($sql, $params, 'main');
        if ($new_admin_id) {
            if (USE_BIZ_DIR) {
                do_common_send_mail_biz_group_admin_change($new_admin_id, $biz_group['biz_group_id']);
            }
            $data = array('admin_id' => intval($new_admin_id));
            $where = array('biz_group_id' => intval($biz_group['biz_group_id']));
            db_update('biz_group', $data, $where);
        } else {
            require_once OPENPNE_MODULES_BIZ_DIR . '/biz/lib/mysql_functions.php';
            biz_deleteGroup($biz_group['biz_group_id'], $c_member_id);
        }
    }
    // 画像容量管理テーブルから情報を削除
    db_image_delete_c_image_size4c_member_id($c_member_id);
}

/**
 * コミュニティ削除
 * 関連情報を合わせて削除する
 *
 * @param int $c_commu_id
 */
function db_common_delete_c_commu($c_commu_id)
{
    //function cacheの削除
    cache_drop_c_commu($c_commu_id);

    $single = array(intval($c_commu_id));

    $sql = 'SELECT * FROM c_commu WHERE c_commu_id = ?';
    $c_commu = db_get_row($sql, $single);

    // 画像削除
    db_image_data_delete($c_commu['image_filename'], $c_commu['c_member_id_admin']);

    // c_commu_admin_confirm
    $sql = 'DELETE FROM c_commu_admin_confirm WHERE c_commu_id = ?';
    db_query($sql, $single);

    // c_commu_member
    $sql = 'DELETE FROM c_commu_member WHERE c_commu_id = ?';
    db_query($sql, $single);

    // c_commu_member_confirm
    $sql = 'DELETE FROM c_commu_member_confirm WHERE c_commu_id = ?';
    db_query($sql, $single);

    // c_commu_review
    $sql = 'DELETE FROM c_commu_review WHERE c_commu_id = ?';
    db_query($sql, $single);

    ///トピック関連
    $sql = 'SELECT * FROM c_commu_topic WHERE c_commu_id = ?';
    $topic_list = db_get_all($sql, $single);

    foreach ($topic_list as $topic) {
        // c_commu_topic_comment(画像)
        $sql = 'SELECT image_filename1, image_filename2, image_filename3, filename' .
            ' FROM c_commu_topic_comment WHERE c_commu_topic_id = ?';
        $params = array(intval($topic['c_commu_topic_id']));
        $topic_comment_list = db_get_all($sql, $params);
        foreach ($topic_comment_list as $topic_comment) {
            db_image_data_delete($topic_comment['image_filename1'], $c_member_id);
            db_image_data_delete($topic_comment['image_filename2'], $c_member_id);
            db_image_data_delete($topic_comment['image_filename3'], $c_member_id);
            db_file_delete_c_file($topic_comment['filename']);
        }

        $sql = 'DELETE FROM c_commu_topic_comment WHERE c_commu_topic_id = ?';
        db_query($sql, $params);

        // c_event_member
        $sql = 'DELETE FROM c_event_member WHERE c_commu_topic_id = ?';
        db_query($sql, $params);
    }

    // c_commu_topic
    $sql = 'DELETE FROM c_commu_topic WHERE c_commu_id = ?';
    db_query($sql, $single);

    // c_commu
    $sql = 'DELETE FROM c_commu WHERE c_commu_id = ?';
    db_query($sql, $single);
}

//--- ログ

/**
 * バナーのクリックログを追加
 */
function db_banner_insert_c_banner_log($c_banner_id, $c_member_id, $clicked_from)
{
    $data = array(
        'c_banner_id' => intval($c_banner_id),
        'c_member_id' => intval($c_member_id),
        'clicked_from' => $clicked_from,
        'r_datetime' => db_now(),
        'r_date' => db_now(),
    );
    return db_insert('c_banner_log', $data);
}

/**
 * 検索ログを追加
 */
function do_common_insert_search_log($c_member_id, $searchword)
{
    if (!$searchword) return false;

    $data = array(
        'c_member_id' => intval($c_member_id),
        'searchword'  => $searchword,
        'r_datetime'  => db_now(),
    );
    return db_insert('c_searchlog', $data);
}

function p_access_log($c_member_id, $page_name, $ktai_flag = "0")
{
    if (!$page_name) return false;

    $data = array(
        'c_member_id'             => intval($c_member_id),
        'page_name'               => $page_name,
        'target_c_member_id'      => 0,
        'target_c_commu_id'       => 0,
        'target_c_commu_topic_id' => 0,
        'target_c_diary_id'       => 0,
        'ktai_flag'               => (bool)$ktai_flag,
        'r_datetime' => db_now(),
    );

    $target_ids = array(
        'target_c_member_id',
        'target_c_commu_id',
        'target_c_commu_topic_id',
        'target_c_diary_id',
    );
    foreach ($target_ids as $key) {
        if (isset($_REQUEST[$key])) {
            $data[$key] = intval($_REQUEST[$key]);
        }
    }

    db_insert('c_access_log', $data);
}

/**
 * スキン画像のfilenameを登録
 */
function db_replace_c_skin_filename($skinname, $filename)
{
    db_delete_c_skin_filename($skinname);

    $data = array(
        'skinname' => strval($skinname),
        'filename' => strval($filename),
    );
    return db_insert('c_skin_filename', $data);
}

/**
 * スキン画像を削除(デフォルトに戻す)
 */
function db_delete_c_skin_filename($skinname)
{
    $sql = 'SELECT * FROM c_skin_filename WHERE skinname = ?';
    $params = array(strval($skinname));
    if ($skin_filename = db_get_row($sql, $params)) {
        db_image_data_delete($skin_filename['filename']);
        $sql = 'DELETE FROM c_skin_filename WHERE skinname = ?';
        return db_query($sql, $params);
    } else {
        return false;
    }
}

/**
 * スキン画像全削除（デフォルトに戻す）
 */
function db_delete_all_c_skin_filename($theme = 'default')
{
    $list = db_get_c_skin_filename_list();
    foreach ($list as $filename) {
        db_image_data_delete($filename);
    }
    $sql = 'DELETE FROM c_skin_filename';
    db_query($sql);

    db_insert_c_image4skin_filename('no_image', $theme);
    db_insert_c_image4skin_filename('no_logo', $theme);
    db_insert_c_image4skin_filename('no_logo_small', $theme);
}

/**
 * スキンファイルから画像をDB登録（no_imageをデフォルトに戻す）
 */
function db_insert_c_image4skin_filename($skinname, $skintheme = OPENPNE_SKIN_THEME)
{
    if (!$skinname || preg_match('/[^\.\w]/', $skinname)) {
        return false;
    }
    $ext = 'gif';
    $filename = $skinname . '.' . $ext;

    if (!$skintheme || preg_match('/[^\.\w]/', $skintheme)) {
        $skintheme = 'default';
    }

    $path = sprintf('%s/skin/%s/img/%s', OPENPNE_PUBLIC_HTML_DIR, $skintheme, $filename);
    if (!is_readable($path)) {
        $path = sprintf('%s/skin/default/img/%s', OPENPNE_PUBLIC_HTML_DIR, $filename);
    }

    $filename = sprintf('skin_default_%s_%s.%s', $skinname, time(), $ext);
    $res = db_image_insert_c_image2($filename, $path);
    return db_replace_c_skin_filename($skinname, $filename);
}

//---

/**
 * DBテンプレートを削除
 */
function db_delete_c_template($name)
{
    $sql = 'DELETE FROM c_template WHERE name = ?';
    $params = array(strval($name));
    return db_query($sql, $params);
}

/**
 * DBテンプレートを登録
 */
function db_replace_c_template($name, $source)
{
    db_delete_c_template($name);

    $data = array(
        'name' => strval($name),
        'source' => strval($source),
        'r_datetime' => db_now(),
    );
    return db_insert('c_template', $data);
}

/**
 * ナビゲーション項目を削除
 */
function db_delete_c_navi($navi_type, $sort_order)
{
    $sql = 'DELETE FROM c_navi WHERE navi_type = ? AND sort_order = ?';
    $params = array(strval($navi_type), intval($sort_order));
    return db_query($sql, $params);
}

/**
 * ナビゲーション項目を登録
 */
function db_replace_c_navi($navi_type, $sort_order, $url, $caption)
{
    db_delete_c_navi($navi_type, $sort_order);

    $data = array(
        'navi_type' => strval($navi_type),
        'sort_order' => intval($sort_order),
        'url' => strval($url),
        'caption' => strval($caption),
    );
    return db_insert('c_navi', $data);
}

//小窓の使用範囲をチェック
function db_is_use_cmd($src, $type = '')
{
    if (!$type) {  // type の指定がない場合は小窓を有効にする
        return true;
    }

    $sql = 'SELECT * FROM c_cmd WHERE name = ?';
    $params = array(strval($src));
    $c_cmd = db_get_row($sql, $params);

    if (empty($c_cmd)) {
        return true;
    }

    $permit_list = db_get_permit_list();

    foreach ($permit_list as $key => $name) {
        if (($c_cmd['permit'] & $key)
         && preg_match('/'.$c_cmd['name'].'/', $src)
         && $name == $type) {
            return true;
        }
    }

    return false;
}

//小窓の使用範囲のリスト
function db_get_permit_list()
{
    return array(
        '1' => 'community',
        '2' => 'diary',
        '4' => 'profile',
        '64' => 'message',
        '8' => 'side_banner',
        '16' => 'info',
        '32' => 'entry_point',
    );
}

//小窓のurl2aを無効にするリスト
function db_get_url2a_denied_list()
{
    return array(
        'side_banner',
        'info',
        'entry_point',
    );
}

/**
 * カレンダーの祝日を取得する
 */
function db_c_holiday_list4date($m, $d)
{
    $sql = 'SELECT name FROM c_holiday WHERE month = ? AND day = ?';
    $params = array(intval($m), intval($d));
    return db_get_col($sql, $params);
}

function db_decoration_enable_list()
{
    $sql = 'SELECT tagname,is_enabled FROM c_config_decoration';
    $decoration_enable_list = db_get_all($sql);

    $result = array();
    foreach ($decoration_enable_list as $value) {
        $tagname = strtr($value['tagname'], ':', '_');
        $result[$tagname] = $value['is_enabled'];
    }

    return $result;
}

function db_decoration_is_enabled4tagname($tagname)
{
    $sql = 'SELECT is_enabled FROM c_config_decoration WHERE tagname = ?';
    $is_enabled = db_get_one($sql, array($tagname));

    return $is_enabled;
}

function db_etc_c_cmd_url4name($name)
{
    $sql = 'SELECT c_cmd.url FROM c_cmd INNER JOIN c_cmd_caster USING(c_cmd_caster_id)'
         . ' WHERE name = ? ORDER BY c_cmd_caster.sort_order';
    return db_get_one($sql, array($name));
}

/**
 * DBから前回POST情報を取得する
 *
 * @param int $u
 * @return array
 */
function db_etc_get_post_info($u) 
{
    $result = db_member_c_member_config4c_member_id($u);
    return array($result['last_post_time'], $result['last_post_count']);
}

/**
 * DBにPOST情報を設定する
 *
 * @param int $u
 * @param int $post_time
 * @param int $post_count
 *
 */
function db_etc_set_post_info($u, $post_time, $post_count) 
{
    db_member_update_c_member_config($u, 'last_post_time', $post_time);
    db_member_update_c_member_config($u, 'last_post_count', $post_count);
}

/**
 * 指定メンバーの書き込み一括削除
 * 以下の書き込みが削除対象
 * ・日記、日記コメント
 * ・トピック・イベント、トピック・イベントのコメント
 * ・送信メッセージ
 * ・アルバム
 *
 * @param int $c_member_id
 */
function db_common_delete_c_member_write_all($c_member_id)
{
    $params = array(intval($c_member_id));

    ///コミュニティ関連
    // トピック・イベント削除
    $sql = 'SELECT c_commu_topic_id FROM c_commu_topic WHERE c_member_id = ?';
    $c_topic_list = db_get_all($sql, $params, 'main');
    foreach ($c_topic_list as $c_topic) {
        // 削除
        db_commu_delete_c_commu_topic($c_topic['c_commu_topic_id']);
    }

    // トピック・イベントのコメント削除
    $sql = 'SELECT c_commu_topic_comment_id FROM c_commu_topic_comment WHERE c_member_id = ?';
    $c_topic_comment_list = db_get_all($sql, $params, 'main');
    foreach ($c_topic_comment_list as $c_topic_comment) {
        //削除
        db_commu_delete_c_commu_topic_comment($c_topic_comment['c_commu_topic_comment_id']);
    }

    ///日記関連
    db_diary_delete4c_member_id($c_member_id);

    // 対象メンバーのコメントをすべて削除
    $sql = 'SELECT * FROM c_diary_comment WHERE c_member_id = ?';
    $c_diary_comment_list = db_get_all($sql, $params, 'main');
    foreach ($c_diary_comment_list as $c_diary_comment) {
        db_image_data_delete($c_diary_comment['image_filename_1']);
        db_image_data_delete($c_diary_comment['image_filename_2']);
        db_image_data_delete($c_diary_comment['image_filename_3']);
    }
    $sql = 'DELETE FROM c_diary_comment WHERE c_member_id = ?';
    db_query($sql, $params); 
    // コメントが無ければ履歴削除
    $sql = 'DELETE FROM c_diary_comment_log'
         . ' WHERE c_member_id = ?';
    db_query($sql, $params);

    // アルバム
    db_album_delete4c_member_id($c_member_id);

    //送信メッセージ関連
    $sql = 'SELECT * FROM c_message WHERE c_member_id_from = ?';
    $c_message_list = db_get_all($sql, $params, 'main');
    foreach ($c_message_list as $c_message) {
        db_image_data_delete($c_message['image_filename_1']);
        db_image_data_delete($c_message['image_filename_2']);
        db_image_data_delete($c_message['image_filename_3']);
    }
    $sql = 'DELETE FROM c_message WHERE c_member_id_from = ?';
    db_query($sql, $params);
}

?>
