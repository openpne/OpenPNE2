<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * 管理画面用アカウントが存在するかどうか
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
 */
function db_select_c_sns_config($target_id = 1)
{
    $sql = 'SELECT * FROM c_sns_config WHERE c_sns_config_id = ?';
    $params = array(intval($target_id));
    return db_get_row($sql, $params);
}

/**
 * 配色設定を全て取得
 */
function db_select_c_sns_config_all()
{
    $sql = 'SELECT * FROM c_sns_config';
    return db_get_all($sql);
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
function db_etc_c_profile_pref_id4latlng($lat, $lng)
{
    if (!$lat || !$lng) {
        return false;
    }

    $sql = 'SELECT c_profile_pref_id FROM c_profile_pref' .
        ' WHERE map_latitude = ? AND map_longitude = ?';
    $params = array($lat, $lng);
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
function db_common_authenticate_password($c_member_id, $password)
{
    $sql = 'SELECT c_member_secure_id FROM c_member_secure' .
            ' WHERE c_member_id = ? AND hashed_password = ?';
    return (bool)db_get_one($sql, array(intval($c_member_id), md5($password)));;
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

?>
