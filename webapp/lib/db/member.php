<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * メンバー情報を取得する
 *
 * @param int $c_member_id
 * @param bool $is_secure `c_member_secure`の項目を取得するかどうか(OPENPNE_AUTH_MODEがemail以外の場合はc_usernameも取得する)
 * @param bool $with_profile `c_member_profile`の項目を取得するかどうか
 * @param string $public_flag プロフィール項目を取得する場合の公開設定(public, friend, private)
 * @return array メンバー情報
 */
function db_member_c_member4c_member_id($c_member_id, $is_secure = false, $with_profile = false, $public_flag = 'public')
{
    static $is_recurred = false;  //再帰処理中かどうかの判定フラグ

    if (!$is_recurred) {  //function cacheのために再帰処理を行う
        $is_recurred = true;
        $funcargs = func_get_args();
        $result = pne_cache_recursive_call(OPENPNE_FUNCTION_CACHE_LIFETIME_FAST, __FUNCTION__, $funcargs);
        $is_recurred = false;
        return $result;
    }

    if ($GLOBALS['_OPENPNE_DSN_LIST']['main']['dsn']['phptype'] == 'pgsql') {
        $sql = "SELECT *,case when access_date = '0001-01-01 00:00:00 BC' THEN '0000-00-00 00:00:00' ELSE to_char(access_date,'YYYY-MM-DD HH24:MI:SS') END as access_date" .
             " FROM c_member WHERE c_member_id = ?";
    } else {
        $sql = 'SELECT * FROM c_member WHERE c_member_id = ?';
    }

    $params = array(intval($c_member_id));
    if (!$c_member = db_get_row($sql, $params))
        return array();

    if ($is_secure) {
        $c_member['secure'] = db_member_c_member_secure4c_member_id($c_member_id);
    }

    if ($with_profile) {
        $c_member['profile'] = db_member_c_member_profile_list4c_member_id($c_member_id, $public_flag);
    }

    // public_flag_birth_year, public_flag_birth_month_day
    switch ($public_flag) {
    case 'public':
        if ($c_member['public_flag_birth_year'] !== 'public') {
            unset($c_member['birth_year']);
        }
        if ($c_member['public_flag_birth_month_day'] !== 'public') {
            unset($c_member['birth_month']);
            unset($c_member['birth_day']);
        }
        break;
    case 'friend':
        if ($c_member['public_flag_birth_year'] === 'private') {
            unset($c_member['birth_year']);
        }
        if ($c_member['public_flag_birth_month_day'] === 'private') {
            unset($c_member['birth_month']);
            unset($c_member['birth_day']);
        }
        break;
    }

    if (OPENPNE_AUTH_MODE != 'email' && $is_secure) {
        $c_member['username'] = db_member_username4c_member_id($c_member_id);
    }

    return $c_member;
}

/**
 * メンバーのプロフィールを取得
 */
function db_member_c_member_profile_list4c_member_id($c_member_id, $public_flag = 'public')
{
    switch ($public_flag) {
    case "private":
        $flags = "'public', 'friend', 'private'";
        break;
    case "friend":
        $flags = "'public', 'friend'";
        break;
    case "public":
    default:
        $flags = "'public'";
        break;
    }

    $sql = "SELECT cp.name, cp.caption, cp.form_type, cm.c_profile_option_id, cm.value, cm.public_flag"
         . " FROM c_member_profile as cm, c_profile as cp"
         . " WHERE cm.c_member_id = ?"
         . " AND cm.public_flag IN ($flags)"
         . " AND cm.c_profile_id = cp.c_profile_id"
         . " ORDER BY cp.sort_order, cp.c_profile_id, cm.c_member_profile_id";
    $profile = db_get_all($sql, array(intval($c_member_id)));
    $member_profile = array();
    foreach ($profile as $value) {
        $member_profile[$value['name']]['form_type'] = $value['form_type'];
        if ($value['form_type'] == 'checkbox') {
            if (!$value['c_profile_option_id']) {
                $member_profile[$value['name']]['value'] = '';
            } else {
                $member_profile[$value['name']]['value'][] = $value['value'];
            }
        } else {
            $member_profile[$value['name']]['value'] = $value['value'];
        }
        $member_profile[$value['name']]['caption'] = $value['caption'];
        $member_profile[$value['name']]['public_flag'] = $value['public_flag'];
    }

    return $member_profile;
}

/**
 * メンバーの暗号化された情報を復号化して取得
 */
function db_member_c_member_secure4c_member_id($c_member_id)
{
    $sql = 'SELECT pc_address, ktai_address, regist_address, easy_access_id, hashed_password, hashed_password_query_answer FROM c_member_secure WHERE c_member_id = ?';
    $c_member_secure = db_get_row($sql, array(intval($c_member_id)));

    if (is_array($c_member_secure)) {
        $c_member_secure['pc_address'] = t_decrypt($c_member_secure['pc_address']);
        $c_member_secure['ktai_address'] = t_decrypt($c_member_secure['ktai_address']);
        $c_member_secure['regist_address'] = t_decrypt($c_member_secure['regist_address']);
    }
    return $c_member_secure;
}

/**
 * メンバー情報をプロフィール付きで取得する
 * (secure情報は取得しない)
 *
 * @param int $c_member_id
 * @param string $public_flag 取得するプロフィール項目の公開レベル(public, friend, private)
 * @return array メンバー情報
 */
function db_member_c_member_with_profile($c_member_id, $public_flag = 'public')
{
    return db_member_c_member4c_member_id($c_member_id, false, true, $public_flag);
}

/**
 * メンバー情報のよく使う部分のみを取得する
 *
 * - メンバーID
 * - ニックネーム
 * - メイン画像
 * のみを取得する。
 *
 * @param int $c_member_id
 * @return array メンバー情報
 */
function db_member_c_member4c_member_id_LIGHT($c_member_id)
{
    static $results;
    if (!isset($results[$c_member_id])) {
        $sql = 'SELECT c_member_id, nickname, image_filename FROM c_member WHERE c_member_id = ?';
        $results[$c_member_id] = db_get_row($sql, array(intval($c_member_id)));
    }
    return $results[$c_member_id];
}

/**
 * PCメールアドレスからメンバーIDを取得(ログインに必要)
 *
 * @param   string $pc_address
 * @return  int    $c_member_id
 */
function db_member_c_member_id4pc_address($pc_address)
{
    return db_member_c_member_id4pc_address_encrypted(t_encrypt($pc_address));
}

function db_member_c_member_id4pc_address_encrypted($pc_address_encoded)
{
    $sql = 'SELECT c_member_id FROM c_member_secure WHERE pc_address = ?';
    $params = array($pc_address_encoded);
    return db_get_one($sql, $params);
}

function db_member_c_member_id4ktai_address($ktai_address)
{
    return db_member_c_member_id4ktai_address_encrypted(t_encrypt($ktai_address));
}

function db_member_c_member_id4ktai_address_encrypted($ktai_address_encoded)
{
    $sql = 'SELECT c_member_id FROM c_member_secure WHERE ktai_address = ?';
    $params = array($ktai_address_encoded);
    return db_get_one($sql, $params);
}

/**
 * アクティブメンバーか？
 */
function db_member_is_active_c_member_id($c_member_id)
{
    $sql = 'SELECT c_member_id FROM c_member WHERE c_member_id = ?';
    $params = array(intval($c_member_id));
    return (bool)db_get_one($sql, $params);
}

/**
 * セッションからc_member_preを返す
 */
function db_member_c_member_pre4c_member_pre_session($session)
{
    $sql = 'SELECT * FROM c_member_pre WHERE session = ?';
    $params = array($session);
    $c_member = db_get_row($sql, $params);

    //秘密の質問
    $c_password_query_id = $c_member['c_password_query_id'];
    $c_password_query_list = p_common_c_password_query4null();

    $c_member['c_password_query_name'] = $c_password_query_list["$c_password_query_id"];

    $sql = 'SELECT p.name, p.caption, p.form_type, m.value, m.public_flag' .
        ' FROM c_member_pre_profile AS m' .
             ' INNER JOIN c_profile AS p USING (c_profile_id)' .
        ' WHERE m.c_member_pre_id = ?' .
        ' ORDER BY p.sort_order, p.c_profile_id, m.c_member_pre_profile_id';
    $params = array(intval($c_member['c_member_pre_id']));
    $profile = db_get_all($sql, $params);

    $member_profile = array();
    foreach ($profile as $value) {
        $member_profile[$value['name']]['form_type'] = $value['form_type'];
        if ($value['form_type'] == 'checkbox') {
            $member_profile[$value['name']]['value'][] = $value['value'];
        } else {
            $member_profile[$value['name']]['value'] = $value['value'];
        }
        $member_profile[$value['name']]['caption'] = $value['caption'];
        $member_profile[$value['name']]['public_flag'] = $value['public_flag'];
    }

    $c_member['profile'] = $member_profile;
    return $c_member;
}

function db_member_is_active_sid($sid)
{
    $sql = 'SELECT c_member_pre_id FROM c_member_pre WHERE session = ?';
    $params = array($sid);
    return (bool)db_get_one($sql, $params);
}

function db_member_search($cond, $cond_like, $page_size, $page, $c_member_id, $profiles)
{
    $page = intval($page);
    $page_size = intval($page_size);

    $wheres = array();
    $params = array();

    foreach ($cond as $key => $value) {
        if ($value) {
            if ($key === 'image') {
                $wheres[] = "image_filename <> '' AND image_filename <> '0'";
            } else {
                $wheres[] = db_escapeIdentifier($key) . ' = ?';
                $params[] = $value;
                if ($key === 'birth_year') {
                    $wheres[] = "public_flag_birth_year = 'public'";
                } elseif ($key === 'birth_month' || $key === 'birth_day') {
                    $wheres[] = "public_flag_birth_month_day = 'public'";
                }
            }
        }
    }
    foreach ($cond_like as $key => $value) {
        if ($value) {
            $wheres[] = db_escapeIdentifier($key) . ' LIKE ?';
            $params[] = '%' . $value . '%';
        }
    }

    if ($wheres) {
        $where = ' WHERE ' . implode(' AND ', $wheres);
    } else {
        $where = '';
    }

    $from = " FROM c_member" . $hint;
    $order = " ORDER BY c_member_id DESC";
    $sql = "SELECT c_member_id" . $from . $where . $order;

    $result_ids = db_get_col($sql, $params);

    // 検索設定を公開にしていないメンバーを除外
    $sql = "SELECT c_member_id FROM c_member_config WHERE name = 'IS_SEARCH_RESULT' AND value = '0'";
    $ids = db_get_col($sql);
    $result_ids = array_diff($result_ids, $ids);

    foreach ($profiles as $key => $value) {
        $sql = "SELECT c_member_id FROM c_member_profile";
        $sql .= " WHERE c_profile_id = ? AND public_flag = 'public'";
        $params = array(intval($value['c_profile_id']));

        if ($value['form_type'] == "text" || $value['form_type'] == "textlong" || $value['form_type'] == 'textarea') {
            $sql .= " AND value LIKE ?";
            $params[] = '%'.$value['value'].'%';
        } elseif (is_array($value['c_profile_option_id'])) {
            $values = implode(',', array_map('intval', $value['c_profile_option_id']));
            $sql .= " AND c_profile_option_id IN (". $values .")";
        } else {
            $sql .= " AND c_profile_option_id = ?";
            $params[] = intval($value['c_profile_option_id']);
        }

        $ids = db_get_col($sql, $params);
        $result_ids = array_intersect($result_ids, $ids);
    }

    $result_ids = array_values($result_ids);

    $start = ($page - 1) * $page_size;

    $list = array();
    for ($i = $start; $i < $start + $page_size && $result_ids[$i]; $i++) {
        $c_member = db_member_c_member_with_profile($result_ids[$i], 'public');
        $c_member['last_login'] = p_f_home_last_login4access_date($c_member['access_date']);
        $list[] = $c_member;
    }

    $total_num = count($result_ids);

    if ($total_num != 0) {
        $total_page_num =  ceil($total_num / $page_size);
        if ($page >= $total_page_num) {
            $next = false;
        } else {
            $next = $page + 1;
        }
        if ($page <= 1) {
            $prev = false;
        } else {
            $prev = $page - 1;
        }
    }
    return array($list, $prev, $next, $total_num);
}

function db_member_inviting_member4c_member_id($c_member_id)
{
    $sql = 'SELECT * FROM c_member_pre WHERE c_member_id_invite = ? ORDER BY r_date DESC';
    $params = array(intval($c_member_id));
    return db_get_all($sql, $params);
}

function db_member_birthday_flag4c_member_id($c_member_id)
{
    $c_member = db_member_c_member4c_member_id($c_member_id, false, false, 'private');
    $birthday = $c_member['birth_month'] . "-" . $c_member['birth_day'];

    return (bool)(date("n-j") == $birthday);
}

/**
 * あるメンバーがアクセスブロックしているメンバーIDのリストを取得
 */
function db_member_c_member_id_block4c_member_id($c_member_id)
{
    $sql = 'SELECT c_member_id_block FROM c_access_block WHERE c_member_id = ?';
    $params = array(intval($c_member_id));
    return db_get_col($sql, $params);
}

/**
 * あるメンバーをアクセスブロックしているメンバーIDのリストを取得
 */
function db_member_access_block_list4c_member_id_to($c_member_id_to)
{
    $sql = 'SELECT c_member_id FROM c_access_block WHERE c_member_id_block = ?';
    $params = array(intval($c_member_id_to));
    return db_get_col($sql, $params);
}

/**
 * {c_member_id}が{target_...}にアクセスブロックされているかどうか
 */
function db_member_is_access_block($c_member_id, $target_c_member_id)
{
    $sql = 'SELECT c_access_block_id FROM c_access_block' .
            ' WHERE c_member_id = ? AND c_member_id_block = ?';
    $params = array(intval($target_c_member_id), intval($c_member_id));
    return (bool)db_get_one($sql, $params);
}

/**
 * 次の誕生日まであと何日？
 *
 * @param int $c_member_id
 * @return int 日数(当日は0)
 */
function db_member_count_days_birthday4c_member_id($c_member_id)
{
    $c_member = db_member_c_member4c_member_id($c_member_id, false, false, 'private');
    return getCountdownDays($c_member['birth_month'], $c_member['birth_day']);
}

function db_member_search_check_profile($profile)
{
    $result_list = array();

    foreach ($profile as $key => $v) {
        if (!$v) continue;

        $sql = 'SELECT * FROM c_profile WHERE name = ?';
        $params = array($key);
        $c_profile = db_get_row($sql, $params);
        if (!($c_profile && $c_profile['disp_search'])) continue;

        switch ($c_profile['form_type']) {
        case "text":
        case "textarea":
        case "textlong":
            $value = $v;
            $c_profile_option_id = 0;
            break;
        case "select":
        case "radio":
            $value = "";
            $c_profile_option_id = $v;
            break;
        case "checkbox":
            $value = array();
            $c_profile_option_id = $v;
            break;
        default:
            break;
        }

        $result_list[$c_profile['name']] = array(
            "c_profile_id" => $c_profile['c_profile_id'],
            "c_profile_option_id" => $c_profile_option_id,
            "value" => $value,
            "form_type" => $c_profile['form_type'],
        );
    }

    return $result_list;
}

function db_member_count_c_member_profile()
{
    $sql = 'SELECT c_profile_option_id, COUNT(DISTINCT c_member_id)' .
        ' FROM c_member_profile' .
        ' WHERE public_flag = \'public\'' .
        ' AND c_profile_option_id > 0' .
        ' GROUP BY c_profile_option_id';
    return db_get_assoc($sql);
}

function db_member_birth4c_member_id($month, $day, $c_member_id)
{
    static $is_recurred = false;  //再帰処理中かどうかの判定フラグ

    if (!$is_recurred) {  //function cacheのために再帰処理を行う
        $is_recurred = true;
        $funcargs = func_get_args();
        $result = pne_cache_recursive_call(OPENPNE_FUNCTION_CACHE_LIFETIME_LONG, __FUNCTION__, $funcargs);
        $is_recurred = false;
        return $result;
    }


    $sql = "SELECT c_member_id_to FROM c_friend WHERE c_member_id_from = ?";
    $params = array(intval($c_member_id));
    $ids = db_get_col($sql, $params);
    $ids[] = $c_member_id;
    $ids = implode(", ", $ids);

    $sql = "SELECT * FROM c_member" .
        " WHERE c_member_id IN (". $ids . ")" .
        " AND birth_day = ?" .
        " AND birth_month = ?".
        " ORDER BY c_member_id ASC";
    $params = array(intval($day), intval($month));
    return db_get_all($sql, $params);
}

function db_member_c_member_list4exists_rss()
{
    $sql = "SELECT * FROM c_member WHERE rss <> ''";
    return db_get_all($sql);
}

function db_member_c_member_list4no_exists_rss()
{
    $sql = "SELECT * FROM c_member WHERE rss = ''";
    return db_get_all($sql);
}

function db_member_c_profile_list4null()
{
    $sql = 'SELECT * FROM c_profile ORDER BY sort_order, c_profile_id';
    return db_get_all($sql);
}

function db_member_c_profile_option_list4c_profile_id($c_profile_id)
{
    $sql = 'SELECT * FROM c_profile_option WHERE c_profile_id = ? ORDER BY sort_order, c_profile_option_id';
    $params = array(intval($c_profile_id));
    return db_get_all($sql, $params);
}

function db_member_c_profile_list()
{
    static $is_recurred = false;  //再帰処理中かどうかの判定フラグ

    if (!$is_recurred) {  //function cacheのために再帰処理を行う
        $is_recurred = true;
        $funcargs = func_get_args();
        $result = pne_cache_recursive_call(OPENPNE_FUNCTION_CACHE_LIFETIME_FAST, __FUNCTION__, $funcargs);
        $is_recurred = false;
        return $result;
    }

    $list = db_member_c_profile_list4null();

    $profile_list = array();
    foreach ($list as $value) {
        $profile_list[$value['name']] = $value;
        $profile_list[$value['name']]['options'] = db_member_c_profile_option_list4c_profile_id($value['c_profile_id']);
    }
    return $profile_list;
}

function db_member_main_image_filename_number($c_member_id)
{
    $c_member = db_member_c_member4c_member_id($c_member_id);
    if (empty($c_member['image_filename'])) {
        return 0;
    }

    if ($c_member['image_filename'] == $c_member['image_filename_1'])
        return 1;
    elseif ($c_member['image_filename'] == $c_member['image_filename_2'])
        return 2;
    elseif ($c_member['image_filename'] == $c_member['image_filename_3'])
        return 3;
    else
        return 0;
}

function db_member_c_member_pre4sid($sid)
{
    $sql = 'SELECT * FROM c_member_pre WHERE session = ?';
    $params = array($sid);
    return db_get_row($sql, $params);
}

function db_member_c_member_pre4pc_address($pc_address)
{
    $sql = 'SELECT * FROM c_member_pre WHERE pc_address = ?';
    $params = array($pc_address);
    return db_get_row($sql, $params);
}

function db_member_c_member4pc_address($pc_address)
{
    $sql = 'SELECT * FROM c_member_secure WHERE pc_address = ?';
    $params = array(t_encrypt($pc_address));
    return db_get_row($sql, $params);
}

function db_member_c_member_list4daily_news()
{
    $sql = 'SELECT c_member_id, is_receive_daily_news FROM c_member' .
            ' WHERE is_receive_daily_news > 0';
    return db_get_all($sql);
}

/***
 * デイリーニュース配信対象者数を取得する
 *
 * @return array
 */
function db_member_count_c_member_is_receive_daily_news()
{
    $list = array();

    // 毎日デイリーニュースを受け取るメンバー数の取得
    $sql = 'SELECT COUNT(*) FROM c_member' .
        ' WHERE is_receive_daily_news = 1';
    $list['every_day'] = db_get_one($sql);

    // DAILY_NEWS_DAY（管理画面から設定）のみデイリーニュースを受け取るメンバー数の取得
    $sql = 'SELECT COUNT(*) FROM c_member' .
        ' WHERE is_receive_daily_news = 2';
    $list['daily_news_day'] = db_get_one($sql);

    return $list;
}

function db_member_c_member_list4birthday_mail()
{
    // この日が誕生日の人を対象にする
    $target_date = "+1 week";

    $timestamp = strtotime($target_date);
    $month = date("n", $timestamp);
    $day   = date("j", $timestamp);

    $sql = 'SELECT * FROM c_member WHERE birth_month = ? AND birth_day = ? AND public_flag_birth_month_day <> \'private\'';
    $params = array(intval($month), intval($day));
    return db_get_all($sql, $params);
}

/**
 * パスワードクエリが合っているか判定
 */
function db_member_is_password_query_complete($pc_address, $query_id, $query_answer)
{
    $sql = "SELECT c_member.c_member_id" .
        " FROM c_member, c_member_secure" .
        " WHERE c_member_secure.pc_address = ?" .
        " AND c_member.c_password_query_id = ?" .
        " AND c_member_secure.hashed_password_query_answer = ?" .
        " AND c_member.c_member_id = c_member_secure.c_member_id";
    $params = array(
        t_encrypt($pc_address),
        intval($query_id),
        md5($query_answer)
    );
    if ($c_member_id = db_get_one($sql, $params)) {
        return $c_member_id;
    }

    // 1.8以前との互換性を保つため、SJISでのチェックも行う
    $params = array(
        t_encrypt($pc_address),
        intval($query_id),
        md5(mb_convert_encoding($query_answer, 'SJIS-win', 'UTF-8'))
    );
    return db_get_one($sql, $params);
}

function db_member_c_member_id4ktai_address2($ktai_address)
{
    if (!$ktai_address) {
        return null;
    }

    $sql = "SELECT c_member_id FROM c_member_secure WHERE ktai_address = ?";
    $params = array(t_encrypt($ktai_address));
    return db_get_one($sql, $params);
}

function db_member_inviting_member4c_member_id2($c_member_id)
{
    $sql = "SELECT * FROM c_member_ktai_pre WHERE c_member_id_invite = ?";
    $params = array(intval($c_member_id));
    return db_get_all($sql, $params);
}

/**
 * 対象のメールアドレスが、登録されてるか否か
 *
 * @param string $mail_address
 * @param int $c_member_id チェックから除外するメンバーID
 * @param bool $is_check_pre    c_member_pre をチェックするかどうか
 */
function db_member_is_sns_join4mail_address($mail_address, $c_member_id = 0, $is_check_pre = false)
{
    $params = array(t_encrypt($mail_address), intval($c_member_id));

    $sql = "SELECT c_member_id FROM c_member_secure WHERE pc_address = ? AND c_member_id <> ?";
    $array = db_get_row($sql, $params);

    $sql = "SELECT c_member_id FROM c_member_secure WHERE ktai_address = ? AND c_member_id <> ?";
    $k_array = db_get_row($sql, $params);

    if ($is_check_pre) {
        $sql = 'SELECT c_member_pre_id FROM c_member_pre WHERE ktai_address = ?';
        $params = array($mail_address);
        $p_array = db_get_row($sql, $params);
    } else {
        $p_array = array();
    }

    //対象のメールアドレスが登録済み
    if ($array['c_member_id'] || $k_array['c_member_id'] || $p_array['c_member_pre_id']) {
        return true;
    } else {
        return false;
    }
}

//対象のメールアドレスが、ドメイン制限に合致しているかどうか
function db_member_is_limit_domain4mail_address($mail_address)
{
    // メールアドレスとして正しくない
    if (!db_common_is_mailaddress($mail_address)) {
        return false;
    }

    // 携帯メールアドレスは制限しない
    if (is_ktai_mail_address($mail_address)) {
        return true;
    }

    //ドメイン未設定なら無条件でＯＫ
    if (LIMIT_DOMAIN1 == '' &&
        LIMIT_DOMAIN2 == '' &&
        LIMIT_DOMAIN3 == '' &&
        LIMIT_DOMAIN4 == '' &&
        LIMIT_DOMAIN5 == ''
    ) {
        return true;
    }

    $arr = explode('@', $mail_address);
    $mail_domain = $arr[1];

    $domains = array(LIMIT_DOMAIN1,
                     LIMIT_DOMAIN2,
                     LIMIT_DOMAIN3,
                     LIMIT_DOMAIN4,
                     LIMIT_DOMAIN5,
               );

    foreach ($domains as $domain) {
        if ($domain) {
            $regexp = str_replace('\*', '.*', preg_quote($domain, '/'));
            if (preg_match(sprintf('/%s/', $regexp), $mail_domain)) {
                return true;
            }
        }
    }
    return false;
}
function db_member_c_member_ktai_pre4ktai_address($ktai_address)
{
    $sql = 'SELECT * FROM c_member_ktai_pre WHERE ktai_address = ?';
    $params = array($ktai_address);
    return db_get_row($sql, $params);
}

/**
 * 携帯認証用
 */
function db_member_k_auth($c_member_id)
{
    $sql = 'SELECT c_member_id FROM c_member WHERE c_member_id = ?';
    $params = array(intval($c_member_id));
    return db_get_one($sql, $params);
}

function db_member_k_auth_login($ktai_address, $password)
{
    if (!$ktai_address or !$password) {
        return false;
    }

    $c_member_id = db_member_c_member_id4username($ktai_address, true);
    $sql = "SELECT hashed_password FROM c_member_secure " .
            " WHERE c_member_id = ? ";
    if (md5($password) != db_get_one($sql, array($c_member_id))) {
        return false;
    }

    return $c_member_id;
}

function db_member_c_ktai_address_pre4session($session)
{
    $sql = 'SELECT * FROM c_ktai_address_pre WHERE session = ?';
    $params = array($session);
    return db_get_row($sql, $params);
}

function db_member_c_member_ktai_pre4session($session)
{
    $sql = 'SELECT * FROM c_member_ktai_pre WHERE session = ?';
    $params = array($session);
    return db_get_row($sql, $params);
}

function db_member_c_member_pre4ktai_session($ktai_session)
{
    $sql = 'SELECT * FROM c_member_pre WHERE ktai_session = ?';
    $params = array($ktai_session);
    return db_get_row($sql, $params);
}

/**
 * メンバーIDからハッシュ化されたパスワードを取得
 * (携帯の認証に暫定的に用いる)
 *
 * @param int $c_member_id
 * @return string hashed password
 */
function db_member_hashed_password4c_member_id($c_member_id)
{
    $sql = 'SELECT hashed_password FROM c_member_secure WHERE c_member_id = ?';
    $params = array(intval($c_member_id));
    return db_get_one($sql, $params);
}

function db_member_is_password_query_complete2($ktai_address, $query_id, $query_answer)
{
    $sql = "SELECT c_member.c_member_id" .
        " FROM c_member, c_member_secure" .
        " WHERE c_member_secure.ktai_address = ?" .
        " AND c_member.c_password_query_id = ?" .
        " AND c_member_secure.hashed_password_query_answer = ?" .
        " AND c_member.c_member_id = c_member_secure.c_member_id";
    $params = array(
        t_encrypt($ktai_address),
        intval($query_id),
        md5($query_answer)
    );
    if ($c_member_id = db_get_one($sql, $params)) {
        return $c_member_id;
    }

    // 1.8以前との互換性を保つため、SJISでのチェックも行う
    $params = array(
        t_encrypt($ktai_address),
        intval($query_id),
        md5(mb_convert_encoding($query_answer, 'SJIS-win', 'UTF-8'))
    );
    return db_get_one($sql, $params);
}

function db_member_c_member_id4easy_access_id($easy_access_id, $md5 = true)
{
    if (!$easy_access_id) return false;

    $sql = 'SELECT c_member_id FROM c_member_secure WHERE easy_access_id = ?';
    if ($md5) {
        $easy_access_id = md5($easy_access_id);
    }
    $params = array($easy_access_id);
    return db_get_one($sql, $params);
}

function db_member_check_profile($profile_list, $public_flag_list)
{
    $result_list = array();

    foreach ($profile_list as $key => $v) {
        $sql = 'SELECT c_profile_id, is_required, public_flag_edit, public_flag_default, form_type, name' .
                ' FROM c_profile WHERE name = ?';
        $params = array($key);
        $c_profile = db_get_row($sql, $params);

        switch ($c_profile['form_type']) {
        case 'text':
        case 'textlong':
        case 'textarea':
            $value = $v;
            $c_profile_option_id = 0;
            break;
        case 'select':
        case 'radio':
            $sql = 'SELECT value FROM c_profile_option' .
                    ' WHERE c_profile_option_id = ? AND c_profile_id = ?';
            $params = array(intval($v), intval($c_profile['c_profile_id']));
            $value = db_get_one($sql, $params);
            $c_profile_option_id = intval($v);
            break;
        case 'checkbox':
            $value = array();
            $c_profile_option_id = $v;
            if (!$v) break;

            $sql = "SELECT c_profile_option_id, value FROM c_profile_option" .
                " WHERE c_profile_option_id IN (". implode(",", array_map('intval', $v)). ")" .
                " AND c_profile_id = ?".
                " ORDER BY sort_order, c_profile_option_id";
            $params = array(intval($c_profile['c_profile_id']));
            $list = db_get_all($sql, $params);
            foreach ($list as $item) {
                $value[$item['c_profile_option_id']] = $item['value'];
            }
            break;
        default:
            $value = '';
            $c_profile_option_id = 0;
            break;
        }

        $public_flags = array('public', 'friend', 'private');
        if ($c_profile['public_flag_edit']
            && in_array($public_flag_list[$key], $public_flags)) {
            $public_flag = $public_flag_list[$key];
        } else {
            $public_flag = $c_profile['public_flag_default'];
        }

        $result_list[$c_profile['name']] = array(
            'c_profile_id' => $c_profile['c_profile_id'],
            'c_profile_option_id' => $c_profile_option_id,
            'value' => $value,
            'public_flag' => $public_flag,
        );
    }

    return $result_list;
}

/**
 * すべてのメンバーのメンバーIDを取得
 */
function db_member_c_member_id_list4null()
{
    $sql = 'SELECT c_member_id FROM c_member';

    return db_get_col($sql);
}

function db_member_is_login_rejected($c_member_id)
{
    $sql = 'SELECT is_login_rejected FROM c_member WHERE c_member_id = ?';
    $params = array(intval($c_member_id));
    return db_get_one($sql, $params);
}

/**
 * メンバーが忍び足(あしあとをつけない)状態かどうかを取得
 *
 * @param   int $c_member_id
 * @return  bool
 */
function db_member_is_shinobiashi($c_member_id)
{
    $sql = "SELECT is_shinobiashi FROM c_member WHERE c_member_id = ?";
    $params = array(intval($c_member_id));
    return db_get_one($sql, $params);
}

/*** write ***/

//--- c_member

/**
 * プロフィール変更(c_memberテーブル分)
 */
function db_member_config_prof_new($c_member_id, $prof_list)
{
    //function cacheの削除
    cache_drop_c_member_profile($c_member_id);

    $data = array(
        'nickname' => $prof_list['nickname'],
        'birth_year'  => intval($prof_list['birth_year']),
        'birth_month' => intval($prof_list['birth_month']),
        'birth_day'   => intval($prof_list['birth_day']),
        'public_flag_birth_year' => $prof_list['public_flag_birth_year'],
        'public_flag_birth_month_day' => $prof_list['public_flag_birth_month_day'],
        'u_datetime' => db_now(),
    );
    $where = array('c_member_id' => intval($c_member_id));
    return db_update('c_member', $data, $where);
}

/**
 * アクセス日時を更新
 */
function db_member_do_access($c_member_id)
{
    $data = array('access_date' => db_now());
    $where = array('c_member_id' => intval($c_member_id));
    return db_update('c_member', $data, $where);
}

//(image)

/**
 * プロフィール画像の変更
 */
function db_member_config_image_new($c_member_id, $image_filename, $img_num)
{
    //function cacheの削除
    cache_drop_c_member_profile($c_member_id);

    $data = array('image_filename_'.intval($img_num) => $image_filename);
    $where = array('c_member_id' => intval($c_member_id));
    return db_update('c_member', $data, $where);
}

/**
 * プロフィール画像の削除
 */
function db_member_delete_c_member_image_new($c_member_id, $img_num)
{
    //function cacheの削除
    cache_drop_c_member_profile($c_member_id);

    $sql = 'UPDATE c_member SET';
    if ($img_num == 1) {
        $sql .= ' image_filename_1 = image_filename_2,';
    }
    if ($img_num == 1 || $img_num == 2) {
        $sql .= ' image_filename_2 = image_filename_3,';
    }
    $sql .= ' image_filename_3 = \'\'';
    $sql .= ' WHERE c_member_id = ?';
    $params = array(intval($c_member_id));
    return db_query($sql, $params);
}

/**
 * メイン画像の変更
 */
function db_member_change_c_member_main_image($c_member_id, $img_num)
{
    //function cacheの削除
    cache_drop_c_member_profile($c_member_id);

    $sql = 'UPDATE c_member SET image_filename = image_filename_'.intval($img_num).
        ' WHERE c_member_id = ?';
    $params = array(intval($c_member_id));
    return db_query($sql, $params);
}

/**
 * メイン画像を登録する
 */
function db_member_update_c_member_image($c_member_id, $image_filename, $img_num)
{
    //function cacheの削除
    cache_drop_c_member_profile($c_member_id);

    $data = array(
        'image_filename' => $image_filename,
        'image_filename_'.intval($img_num) => $image_filename,
    );
    $where = array('c_member_id' => intval($c_member_id));
    return db_update('c_member', $data, $where);
}

/**
 * My Newsを更新する
 */
function db_member_update_c_profile_my_news($c_member_id, $prof_my_news, $my_news_datetime)
{
    $sql = 'SELECT c_profile_id FROM c_profile WHERE name = ? ';
    $prof_my_news_id = db_get_one($sql, array('PNE_MY_NEWS'));
    $my_news_datetime_id = db_get_one($sql, array('PNE_MY_NEWS_DATETIME'));

    // function cache削除
    cache_drop_c_member_profile($c_member_id);

    $sql = 'DELETE FROM c_member_profile' .
            ' WHERE c_member_id = ? AND c_profile_id = ?';
    $params = array(intval($c_member_id), $prof_my_news_id);
    db_query($sql, $params);
    db_member_insert_c_member_profile($c_member_id, $prof_my_news_id, '', $prof_my_news, 'private');

    $sql = 'DELETE FROM c_member_profile' .
            ' WHERE c_member_id = ? AND c_profile_id = ?';
    $params = array(intval($c_member_id), $my_news_datetime_id);
    db_query($sql, $params);
    db_member_insert_c_member_profile($c_member_id, $my_news_datetime_id, '', $my_news_datetime, 'private');
}

//--- c_member_secure

function db_member_insert_c_member($c_member, $c_member_secure, $is_password_encrypted = false)
{
    if ($c_member_secure['pc_address'] && !util_is_regist_mail_address($c_member_secure['pc_address'])) {
        return false;
    }

    if ($c_member_secure['ktai_address'] && !util_is_regist_mail_address($c_member_secure['ktai_address'])) {
        return false;
    }

    if (!util_is_regist_mail_address($c_member_secure['regist_address'])) {
        return false;
    }

    $data = array(
        'nickname'    => $c_member['nickname'],
        'birth_year'  => intval($c_member['birth_year']),
        'birth_month' => intval($c_member['birth_month']),
        'birth_day'   => intval($c_member['birth_day']),
        'public_flag_birth_year' => $c_member['public_flag_birth_year'],
        'public_flag_birth_month_day' => $c_member['public_flag_birth_month_day'],
        'c_member_id_invite'  => intval($c_member['c_member_id_invite']),
        'c_password_query_id' => intval($c_member['c_password_query_id']),
        'is_receive_mail' => (bool)$c_member['is_receive_mail'],
        'is_receive_ktai_mail'  => (bool)$c_member['is_receive_ktai_mail'],
        'is_receive_daily_news' => intval($c_member['is_receive_daily_news']),
        'r_date' => db_now(),
        'u_datetime' => db_now(),
        'image_filename' => '',
        'image_filename_1' => '',
        'image_filename_2' => '',
        'image_filename_3' => '',
        'rss' => '',
    );
    $c_member_id = db_insert('c_member', $data);

    //function cacheの削除
    cache_drop_c_member_profile($c_member_id);

    if ($c_member_secure['ktai_address']) {
        $c_member_secure['ktai_address'] = str_replace('"', '', $c_member_secure['ktai_address']);
        $c_member_secure['regist_address'] = str_replace('"', '', $c_member_secure['regist_address']);
    }

    $data = array(
        'c_member_id' => intval($c_member_id),
        'hashed_password' => md5($c_member_secure['password']),
        'hashed_password_query_answer' => md5($c_member_secure['password_query_answer']),
        'pc_address'     => t_encrypt($c_member_secure['pc_address']),
        'ktai_address'   => t_encrypt($c_member_secure['ktai_address']),
        'regist_address' => t_encrypt($c_member_secure['regist_address']),
        'easy_access_id' => '',
    );

    if ($is_password_encrypted) {
        $data['hashed_password'] = $c_member_secure['password'];
        $data['hashed_password_query_answer'] = $c_member_secure['password_query_answer'];
    }

    db_insert('c_member_secure', $data);

    return $c_member_id;
}

function db_member_ktai_insert_c_member($profs)
{
    if (!util_is_regist_mail_address($profs['ktai_address'])) {
        return false;
    }

    $data = array(
        'nickname' => $profs['nickname'],
        'birth_year' => intval($profs['birth_year']),
        'birth_month' => intval($profs['birth_month']),
        'birth_day' => intval($profs['birth_day']),
        'public_flag_birth_year' => $profs['public_flag_birth_year'],
        'public_flag_birth_month_day' => $profs['public_flag_birth_month_day'],
        'r_date' => db_now(),
        'u_datetime' => db_now(),
        'is_receive_ktai_mail' => 1,
        'c_member_id_invite' => intval($profs['c_member_id_invite']),
        'c_password_query_id' => intval($profs['c_password_query_id']),
        'image_filename' => '',
        'image_filename_1' => '',
        'image_filename_2' => '',
        'image_filename_3' => '',
        'rss' => '',
    );
    $c_member_id_new = db_insert('c_member', $data);

    if ($profs['ktai_address']) {
        $profs['ktai_address'] = str_replace('"', '', $profs['ktai_address']);
        $profs['regist_address'] = str_replace('"', '', $profs['regist_address']);
    }
    $data = array(
        'c_member_id' => intval($c_member_id_new),
        'hashed_password' => md5($profs['password']),
        'hashed_password_query_answer' => md5($profs['password_query_answer']),
        'pc_address' => '',
        'ktai_address' => t_encrypt($profs['ktai_address']),
        'regist_address' => t_encrypt($profs['ktai_address']),
        'easy_access_id' => '',
    );
    db_insert('c_member_secure', $data);

    return $c_member_id_new;
}

function db_member_update_c_member_pre_secure($c_member_pre_id, $c_member_pre_secure, $is_encrypted_password = false)
{
    $data = array(
        'session' => $c_member_pre_secure['session'],
        'nickname'    => $c_member_pre_secure['nickname'],
        'birth_year'  => intval($c_member_pre_secure['birth_year']),
        'birth_month' => intval($c_member_pre_secure['birth_month']),
        'birth_day'   => intval($c_member_pre_secure['birth_day']),
        'public_flag_birth_year' => $c_member_pre_secure['public_flag_birth_year'],
        'public_flag_birth_month_day' => $c_member_pre_secure['public_flag_birth_month_day'],
        'c_password_query_id' => intval($c_member_pre_secure['c_password_query_id']),
        'password' => md5($c_member_pre_secure['password']),
        'c_password_query_answer' => md5($c_member_pre_secure['password_query_answer']),
        'pc_address'     => $c_member_pre_secure['pc_address'],
        'ktai_address'     => $c_member_pre_secure['ktai_address'],
        'regist_address' => $c_member_pre_secure['regist_address'],
        'ktai_session' => $c_member_pre_secure['ktai_session'],
    );

    if ($is_encrypted_password) {
        $data['password'] = $c_member_pre_secure['password'];
        $data['c_password_query_answer'] = $c_member_pre_secure['password_query_answer'];
    }

    if (OPENPNE_AUTH_MODE == 'pneid') {
        $data['login_id'] = $c_member_pre_secure['login_id'];
    }

    return db_update('c_member_pre', $data, array('c_member_pre_id' => $c_member_pre_id));
}

function db_member_h_config_3(
                $c_member_id,
                $is_receive_mail,
                $rss,
                $ashiato_mail_num,
                $is_receive_daily_news,
                $c_password_query_id,
                $c_password_query_answer,
                $public_flag_diary,
                $is_shinobiashi,
                $schedule_start_day)
{
    //function cacheの削除
    cache_drop_c_member_profile($c_member_id);

    $data = array(
        'is_receive_mail' => (bool)$is_receive_mail,
        'is_receive_daily_news' => intval($is_receive_daily_news),
        'rss' => $rss,
        'ashiato_mail_num' => intval($ashiato_mail_num),
        'public_flag_diary' => util_cast_public_flag_diary($public_flag_diary),
        'is_shinobiashi' => $is_shinobiashi,
        'schedule_start_day' => $schedule_start_day,
        'u_datetime' => db_now(),
    );

    if (IS_PASSWORD_QUERY_ANSWER) {
        $data['c_password_query_id'] = intval($c_password_query_id);
    }
    $where = array('c_member_id' => intval($c_member_id));
    db_update('c_member', $data, $where);

    if (IS_PASSWORD_QUERY_ANSWER && !empty($c_password_query_answer)) {
        $data = array(
            'hashed_password_query_answer' => md5($c_password_query_answer)
        );
        db_update('c_member_secure', $data, $where);
    }
}

function db_member_update_easy_access_id($c_member_id, $easy_access_id, $is_encrypted_easy_access_id = false)
{
    // function cacheを削除
    cache_drop_c_member_profile($c_member_id);

    $hashed_easy_access_id = '';
    if ($easy_access_id) {
        if ($is_encrypted_easy_access_id) {
            $hashed_easy_access_id = $easy_access_id;
        } else {
            $hashed_easy_access_id = md5($easy_access_id);
        }
    }
    $data = array('easy_access_id' => $hashed_easy_access_id);
    $where = array('c_member_id' => intval($c_member_id));
    return db_update('c_member_secure', $data, $where);
}

function db_member_update_password_query($c_member_id, $c_password_query_id, $password_query_answer)
{
    // function cacheを削除
    cache_drop_c_member_profile($c_member_id);

    $data = array('c_password_query_id' => intval($c_password_query_id));
    $where = array('c_member_id' => intval($c_member_id));
    db_update('c_member', $data, $where);

    if (empty($password_query_answer)) {
        $password_query_answer = '';
    } else {
        $password_query_answer = md5($password_query_answer);
    }
    $data = array('hashed_password_query_answer' => $password_query_answer);
    $where = array('c_member_id' => intval($c_member_id));
    db_update('c_member_secure', $data, $where);
}

//(pc_address)

function db_member_update_c_member_pc_address4c_member_id($c_member_id, $pc_address)
{
    // function cacheを削除
    cache_drop_c_member_profile($c_member_id);

    if (!util_is_regist_mail_address($pc_address, $c_member_id)) {
        return false;
    }

    $data = array('pc_address' => t_encrypt($pc_address));
    $where = array('c_member_id' => intval($c_member_id));
    return db_update('c_member_secure', $data, $where);
}

function db_member_regist_c_member_pc_address4c_member_id($c_member_id, $pc_address)
{
    // function cacheを削除
    cache_drop_c_member_profile($c_member_id);

    if (!util_is_regist_mail_address($pc_address, $c_member_id)) {
        return false;
    }

    $data = array(
    'pc_address' => t_encrypt($pc_address),
    'regist_address' => t_encrypt($pc_address),
    );
    $where = array('c_member_id' => intval($c_member_id));
    return db_update('c_member_secure', $data, $where);
}

//(ktai_address)

function db_member_update_ktai_address($c_member_id, $ktai_address)
{
    // function cacheを削除
    cache_drop_c_member_profile($c_member_id);

    if ($ktai_address == ''){
        $data = array(
            'ktai_address' => '',
            'easy_access_id' => '',
        );
    } elseif (util_is_regist_mail_address($ktai_address, $c_member_id)) {
        $ktai_address = str_replace('"', '', $ktai_address);
        $data = array('ktai_address' => t_encrypt($ktai_address));
    } else {
        return false;
    }
    $where = array('c_member_id' => intval($c_member_id));
    return db_update('c_member_secure', $data, $where);
}

//(password)

function db_member_update_password($c_member_id, $password)
{
    // function cacheを削除
    cache_drop_c_member_profile($c_member_id);

    $data = array('hashed_password' => md5($password));
    $where = array('c_member_id' => intval($c_member_id));
    return db_update('c_member_secure', $data, $where);
}

//--- c_pc_address_pre

function db_member_h_config_1($c_member_id, $pc_address)
{
    $insert_id = 0;
    $session = create_hash();

    // 既にpreに存在するメールアドレスかどうか
    if (do_common_c_pc_address_pre4pc_address($pc_address)) {
        $data = array(
            'c_member_id' => intval($c_member_id),
            'session' => $session,
            'r_datetime' => db_now(),
        );
        $where = array('pc_address' => $pc_address);
        db_update('c_pc_address_pre', $data, $where);
    } else {
        $data = array(
            'c_member_id' => intval($c_member_id),
            'pc_address' => $pc_address,
            'session' => $session,
            'r_datetime' => db_now(),
        );
        $insert_id = db_insert('c_pc_address_pre', $data);
    }

    do_h_config_1_mail_send($c_member_id, $session, $pc_address);
    return $insert_id;
}

function db_member_h_regist_mail($c_member_id, $pc_address)
{
    $insert_id = 0;
    $session = create_hash();

    // 既にpreに存在するメールアドレスかどうか
    if (do_common_c_pc_address_pre4pc_address($pc_address)) {
        $data = array(
            'c_member_id' => intval($c_member_id),
            'session' => $session,
            'r_datetime' => db_now(),
        );
        $where = array('pc_address' => $pc_address);
        db_update('c_pc_address_pre', $data, $where);
    } else {
        $data = array(
            'c_member_id' => intval($c_member_id),
            'pc_address' => $pc_address,
            'session' => $session,
            'r_datetime' => db_now(),
        );
        $insert_id = db_insert('c_pc_address_pre', $data);
    }

    //function cache削除
    cache_drop_c_member_profile($c_member_id);

    do_h_regist_mail_mail_send($c_member_id, $session, $pc_address);
    return $insert_id;
}

function db_member_delete_c_pc_address_pre4sid($sid)
{
    $sql = 'DELETE FROM c_pc_address_pre WHERE session = ?';
    $params = array($sid);
    return db_query($sql, $params);
}

function db_member_change_mail($sid, $password)
{
    if (!$c_pc_address_pre = do_common_c_pc_address_pre4sid($sid)) {
        return false;
    }

    $c_member_id = $c_pc_address_pre['c_member_id'];
    $pc_address = $c_pc_address_pre['pc_address'];

    if (!db_common_authenticate_password($c_member_id, $password)) {
        return false;
    }

    db_member_update_c_member_pc_address4c_member_id($c_member_id, $pc_address);
    db_member_delete_c_pc_address_pre4sid($sid);
    return true;
}

function db_member_regist_mail($sid, $password)
{
    if (!$c_pc_address_pre = do_common_c_pc_address_pre4sid($sid)) {
        return false;
    }

    $c_member_id = $c_pc_address_pre['c_member_id'];
    $pc_address = $c_pc_address_pre['pc_address'];

    if (!db_common_authenticate_password($c_member_id, $password)) {
        return false;
    }

    db_member_regist_c_member_pc_address4c_member_id($c_member_id, $pc_address);
    db_member_delete_c_pc_address_pre4sid($sid);
    return true;
}

//--- c_ktai_address_pre

/**
 * 携帯メールアドレス変更
 */
function db_member_insert_c_ktai_address_pre($c_member_id, $session, $ktai_address)
{
    $ktai_address = str_replace('"', '', $ktai_address);

    $data = array(
        'c_member_id' => intval($c_member_id),
        'session' => $session,
        'ktai_address' => $ktai_address,
        'r_datetime' => db_now(),
    );
    return db_insert('c_ktai_address_pre', $data);
}

function db_member_delete_ktai_address_pre($c_ktai_address_pre_id)
{
    $sql = 'DELETE FROM c_ktai_address_pre WHERE c_ktai_address_pre_id = ?';
    $params = array(intval($c_ktai_address_pre_id));
    db_query($sql, $params);
}

function db_member_delete_c_ktai_address_pre4ktai_address($ktai_address)
{
    $sql = 'DELETE FROM c_ktai_address_pre WHERE ktai_address = ?';
    $params = array($ktai_address);
    db_query($sql, $params);
}

//--- c_member_pre

/**
 * 招待メール送信
 */
function db_member_insert_c_invite($c_member_id_invite, $pc_address, $message, $session, $is_disabled_regist_easy_access_id = false)
{
    $data = array(
        'pc_address' => $pc_address,
        'regist_address' => $pc_address,
        'c_member_id_invite' => intval($c_member_id_invite),
        'session' => $session,
        'r_date' => db_now(),
        'nickname' => '',
        'password' => '',
        'ktai_address' => '',
        'easy_access_id' => '',
        'is_disabled_regist_easy_access_id' => $is_disabled_regist_easy_access_id,
        'c_password_query_answer' => '',
    );
    return db_insert('c_member_pre', $data);
}

/**
 * 招待メール送信
 */
function db_member_update_c_invite($c_member_id_invite, $pc_address, $message, $session, $is_disabled_regist_easy_access_id = false)
{
    $sql = 'SELECT c_member_pre_id,ktai_session FROM c_member_pre WHERE pc_address = ?';
    $pre = db_get_row($sql, array($pc_address));

    $data = array(
        'c_member_id_invite' => intval($c_member_id_invite),
        'session' => $session,
        'regist_address' => $pc_address,
        'is_disabled_regist_easy_access_id' => $is_disabled_regist_easy_access_id,
        'r_date' => db_now(),
    );

    // プロフィール項目登録済みで携帯版未登録の場合（個体識別番号必須制）
    if (!empty($pre['ktai_session'])) {
        // プロフィール情報を削除
        db_member_delete_c_member_pre_profile4c_member_pre_id($pre['c_member_pre_id']);
        $tmp = array(
            'nickname' => '',
            'birth_year' => 0,
            'birth_month' => 0,
            'birth_day' => 0,
            'ktai_address' => '',
            'password' => '',
            'c_password_query_id' => 0,
            'c_password_query_answer' => '',
            'ktai_session' => '',
        );
        $data = array_merge($data, $tmp);
    }

    $where = array('pc_address' => $pc_address);
    return db_update('c_member_pre', $data, $where);
}

function db_member_delete_c_member_pre($c_member_id, $delete_c_member_ids)
{
    if (!(is_array($delete_c_member_ids) && $delete_c_member_ids)) {
        return false;
    }
    $ids = implode(',', array_map('intval', $delete_c_member_ids));

    $sql = 'DELETE FROM c_member_pre WHERE c_member_id_invite = ?'.
            ' AND c_member_pre_id IN ('.$ids.')';
    $params =  array(intval($c_member_id));
    db_query($sql, $params);
}

function db_member_delete_c_member_pre4sid($sid)
{
    $sql = 'DELETE FROM c_member_pre WHERE session = ?';
    $params = array($sid);
    return db_query($sql, $params);
}

function db_member_delete_c_member_pre4ktai_session($ktai_session)
{
    $sql = 'DELETE FROM c_member_pre WHERE ktai_session = ?';
    $params = array($ktai_session);
    return db_query($sql, $params);
}

function db_member_delete_c_member_pre_profile4c_member_pre_id($c_member_pre_id)
{
    $sql = 'DELETE FROM c_member_pre_profile WHERE c_member_pre_id = ?';
    $params = array($c_member_pre_id);
    return db_query($sql, $params);
}

//--- c_member_ktai_pre

function db_member_delete_c_member_ktai_pre($c_member_id, $delete_c_member_ids)
{
    if (!is_array($delete_c_member_ids) && $delete_c_member_ids) {
        return false;
    }
    $ids = implode(',', array_map('intval', $delete_c_member_ids));

    $sql = 'DELETE FROM c_member_ktai_pre WHERE c_member_id_invite = ?' .
            ' AND c_member_ktai_pre_id IN ('.$ids.')';
    $params = array(intval($c_member_id));
    db_query($sql, $params);
}

function db_member_delete_c_member_ktai_pre4id($c_member_ktai_pre_id)
{
    $sql = 'DELETE FROM c_member_ktai_pre WHERE c_member_ktai_pre_id = ?';
    $params = array(intval($c_member_ktai_pre_id));
    db_query($sql, $params);
}

/**
 * c_member_ktai_preを更新
 */
function db_member_update_c_member_ktai_pre($session, $ktai_address, $c_member_id_invite, $is_disabled_regist_easy_access_id = false)
{
    $data = array(
        'session' => $session,
        'r_datetime' => db_now(),
        'c_member_id_invite' => intval($c_member_id_invite),
        'is_disabled_regist_easy_access_id' => $is_disabled_regist_easy_access_id,
    );
    $where = array('ktai_address' => $ktai_address);
    return db_update('c_member_ktai_pre', $data, $where);
}

function db_member_delete_c_member_ktai_pre4ktai_address($ktai_address)
{
    $sql = 'DELETE FROM c_member_ktai_pre WHERE ktai_address = ?';
    $params = array($ktai_address);
    db_query($sql, $params);
}

function db_member_insert_c_member_ktai_pre($session, $ktai_address, $c_member_id_invite, $is_disabled_regist_easy_access_id = false)
{
    $ktai_address = str_replace('"', '', $ktai_address);
    if (db_member_c_member_ktai_pre4ktai_address($ktai_address)) {  // 二重引用符を除去した結果、DB内メールアドレスと重複する
        return db_member_update_c_member_ktai_pre($session, $ktai_address, $c_member_id_invite, $is_disabled_regist_easy_access_id);
    }

    $data = array(
        'session' => $session,
        'ktai_address' => $ktai_address,
        'c_member_id_invite' => intval($c_member_id_invite),
        'r_datetime' => db_now(),
        'is_disabled_regist_easy_access_id' => $is_disabled_regist_easy_access_id,
    );
    return db_insert('c_member_ktai_pre', $data);
}

//--- profile関連

function db_member_c_profile4name($name)
{
    $sql = 'SELECT * FROM c_profile WHERE name = ?';
    return db_get_row($sql, array($name));
}

function db_member_update_c_member_profile($c_member_id, $c_member_profile_list)
{
    //function cache削除
    cache_drop_c_member_profile($c_member_id);

    foreach ($c_member_profile_list as $item) {
        $sql = 'DELETE FROM c_member_profile' .
                ' WHERE c_member_id = ? AND c_profile_id = ?';
        $params = array(intval($c_member_id), intval($item['c_profile_id']));
        db_query($sql, $params);
        if (is_array($item['value']) && !empty($item['value'])) {
            foreach ($item['value'] as $key => $value) {
                db_member_insert_c_member_profile($c_member_id, $item['c_profile_id'], $key, $value, $item['public_flag']);
            }
        } else {
            if (empty($item['value'])) {
                $item['value'] = "";
            }
            db_member_insert_c_member_profile($c_member_id, $item['c_profile_id'], $item['c_profile_option_id'], $item['value'], $item['public_flag']);
        }
    }
}

function db_member_insert_c_member_profile($c_member_id, $c_profile_id, $c_profile_option_id, $value, $public_flag)
{
    //function cache削除
    cache_drop_c_member_profile($c_member_id);

    // プロフィール中に書いてあるURLがSNS内でありセッションパラメータを含んでいた場合は削除
    $value = db_ktai_delete_url_session_parameter($value);

    $data = array(
        'c_member_id' => intval($c_member_id),
        'c_profile_id' => intval($c_profile_id),
        'c_profile_option_id' => intval($c_profile_option_id),
        'value' => $value,
        'public_flag' => $public_flag,
    );
    return db_insert('c_member_profile', $data);
}

/***
 * 一時的に c_member_pre_profile にプロフィール情報をインサートする
 *
 * 個体識別番号登録必須制が「必須にする」である場合など、c_member ではなく c_member_pre を使うのが望ましい場面で使用する。
 *
 * @param int $c_member_pre_id
 * @param int $c_profile_id
 * @param int $c_profile_option_id
 * @param int $value
 * @param string $public_flag
 * @return mixed
 */
function db_member_insert_c_member_pre_profile($c_member_pre_id, $c_profile_id, $c_profile_option_id, $value, $public_flag)
{
    // プロフィール中に書いてあるURLがSNS内でありセッションパラメータを含んでいた場合は削除
    $value = db_ktai_delete_url_session_parameter($value);

    $data = array(
        'c_member_pre_id' => intval($c_member_pre_id),
        'c_profile_id' => intval($c_profile_id),
        'c_profile_option_id' => intval($c_profile_option_id),
        'value' => $value,
        'public_flag' => $public_flag,
    );
    return db_insert('c_member_pre_profile', $data);
}

/***
 * c_member_pre_profile のプロフィール情報を更新する
 *
 * @param int $c_member_pre_id
 * @param array $c_member_profile_list
 * @return mixed
 */
function db_member_update_c_member_pre_profile($c_member_pre_id, $c_member_profile_list)
{
    foreach ($c_member_profile_list as $item) {
        $sql = 'DELETE FROM c_member_pre_profile' .
                ' WHERE c_member_pre_id = ? AND c_profile_id = ?';
        $params = array(intval($c_member_pre_id), intval($item['c_profile_id']));
        db_query($sql, $params);

        if (!(is_null($item['value']) || $item['value'] === '')) {
            if (is_array($item['value'])) {
                foreach ($item['value'] as $key => $value) {
                    db_member_insert_c_member_pre_profile($c_member_pre_id, $item['c_profile_id'], $key, $value, $item['public_flag']);
                }
            } else {
                db_member_insert_c_member_pre_profile($c_member_pre_id, $item['c_profile_id'], $item['c_profile_option_id'], $item['value'], $item['public_flag']);
            }
        }
    }
}

/***
 * c_member_pre_profile のプロフィール情報を取得する
 *
 * @param int $c_member_pre_id
 * @return array
 */
function db_member_c_member_pre_profile4c_member_pre_id($c_member_pre_id)
{
    $sql = 'SELECT * FROM c_member_pre_profile WHERE c_member_pre_id = ?';
    $params = array(intval($c_member_pre_id));
    return db_get_all($sql, $params);
}

//--- c_access_block

function db_member_insert_c_access_block($c_member_id, $c_member_id_block)
{
    // 存在するIDのみを抽出
    $c_member_id_block = db_member_filter_c_access_block_id($c_member_id, $c_member_id_block);

    $sql = 'DELETE FROM c_access_block WHERE c_member_id = ?';
    $params = array(intval($c_member_id));
    db_query($sql, $params);

    foreach ($c_member_id_block as $id) {
        $data = array(
            'c_member_id' => intval($c_member_id),
            'c_member_id_block' => intval($id),
            'r_datetime' => db_now(),
        );
        db_insert('c_access_block', $data);
    }
}

function db_member_filter_c_access_block_id($c_member_id, $c_member_id_block)
{
    $c_member_id_block = array_unique(array_map('intval', $c_member_id_block));
    if (!$c_member_id_block) {
        return array();
    }
    $ids = implode(',', $c_member_id_block);
    $sql = 'SELECT c_member_id FROM c_member WHERE (c_member_id IN ('.$ids.')) AND (c_member_id <> ?) ';
    return db_get_col($sql, array($c_member_id));
}

//---

function db_member_update_mail_receive($c_member_id, $is_receive_ktai_mail)
{
    // function cacheを削除
    cache_drop_c_member_profile($c_member_id);

    $data = array('is_receive_ktai_mail' => intval($is_receive_ktai_mail));
    $where = array('c_member_id' => intval($c_member_id));
    db_update('c_member', $data, $where);
}

function db_member_update_ashiato_mail_num($c_member_id, $ashiato_mail_num)
{
    // function cacheを削除
    cache_drop_c_member_profile($c_member_id);

    $data = array('ashiato_mail_num' => intval($ashiato_mail_num));
    $where = array('c_member_id' => intval($c_member_id));
    db_update('c_member', $data, $where);
}

function db_member_update_public_flag_diary($c_member_id, $public_flag_diary)
{
    // function cacheを削除
    cache_drop_c_member_profile($c_member_id);

    $data = array('public_flag_diary' => util_cast_public_flag_diary($public_flag_diary));
    $where = array('c_member_id' => intval($c_member_id));
    db_update('c_member', $data, $where);
}

function db_member_update_is_shinobiashi($c_member_id, $is_shinobiashi)
{
    // function cacheを削除
    cache_drop_c_member_profile($c_member_id);

    $data = array('is_shinobiashi' => intval($is_shinobiashi));
    $where = array('c_member_id' => intval($c_member_id));
    db_update('c_member', $data, $where);
}

function db_member_insert_username($c_member_id, $username)
{
    $data = array(
        'c_member_id' => intval($c_member_id),
        'username' => $username,
    );
    db_insert('c_username', $data);
}

/**
 * ログインIDからc_member_idを取得
 */
function db_member_c_member_id4username($username, $is_ktai = false)
{
    if (OPENPNE_AUTH_MODE != 'slavepne' && OPENPNE_AUTH_MODE != 'pneid') {
        $username = t_encrypt($username);
    }
    return db_member_c_member_id4username_encrypted($username, $is_ktai);
}

/**
 * ログインIDからc_member_idを取得
 *
 * @param string $username 暗号化されたメールアドレス or SlavePNEのusername
 * @return int c_member_id
 */
function db_member_c_member_id4username_encrypted($username, $is_ktai = false)
{
    if (OPENPNE_AUTH_MODE == 'slavepne' || OPENPNE_AUTH_MODE == 'pneid') {
        $sql = 'SELECT c_member_id FROM c_username WHERE username = ?';
        $params = array($username);
        $c_member_id = db_get_one($sql, $params);
    } else {
        if ($is_ktai) {
            $c_member_id = db_member_c_member_id4ktai_address_encrypted($username);
        } else {
            $c_member_id = db_member_c_member_id4pc_address_encrypted($username);
        }
    }
    return $c_member_id;
}

/**
 * ログインIDからc_member_idを取得
 */
function db_member_username4c_member_id($c_member_id, $is_ktai = false)
{
    if (OPENPNE_AUTH_MODE == 'slavepne' || OPENPNE_AUTH_MODE == 'pneid') {
        $sql = 'SELECT username FROM c_username WHERE c_member_id = ?';
        $params = array($c_member_id);
        $username = db_get_one($sql, $params);
    } else {
        $c_member_secure = db_member_c_member_secure4c_member_id($c_member_id);
        if ($is_ktai) {
            $username = $c_member_secure['ktai_address'];
        } else {
            $username = $c_member_secure['pc_address'];
        }
    }
    return $username;
}

/**
 * ログインしたメンバーの情報が存在しない場合自動で生成
 */
function db_member_create_member($username)
{
    $data = array(
        'nickname'    => 'NO NAME',
        'birth_year'  => 0,
        'birth_month' => 0,
        'birth_day'   => 0,
        'public_flag_birth_year' => 'public',
        'public_flag_birth_month_day' => 'public',
        'c_member_id_invite'  => 1,
        'c_password_query_id' => 0,
        'is_receive_mail' => true,
        'is_receive_ktai_mail'  => true,
        'is_receive_daily_news' => true,
        'r_date' => db_now(),
        'u_datetime' => db_now(),
        'image_filename' => '',
        'image_filename_1' => '',
        'image_filename_2' => '',
        'image_filename_3' => '',
        'rss' => '',
    );
    $c_member_id = db_insert('c_member', $data);
    if (!$c_member_id) {
        return false;
    }

    $data = array(
        'c_member_id' => intval($c_member_id),
        'hashed_password' => "",
        'hashed_password_query_answer' => "",
        'pc_address'     => "",
        'ktai_address'   => "",
        'regist_address' => "",
        'easy_access_id' => '',
    );
    if (!IS_SLAVEPNE_EMAIL_REGIST) {
        $data['pc_address'] = t_encrypt($c_member_id.'@pc.example.com');
        $data['ktai_address'] = t_encrypt($c_member_id.'@ktai.example.com');
    }
    if (!db_insert('c_member_secure', $data)) {
        $sql = 'DELETE FROM c_member WHERE c_member_id = ?';
        db_query($sql, array($c_member_id));

        return false;
    }

    $data = array(
        'c_member_id' => intval($c_member_id),
        'username' => $username,
    );
    if (!db_insert('c_username', $data)) {
        $sql = 'DELETE FROM c_member WHERE c_member_id = ?';
        db_query($sql, array($c_member_id));

        $sql = 'DELETE FROM c_member_secure WHERE c_member_id = ?';
        db_query($sql, array($c_member_id));

        return false;
    }

    return $c_member_id;
}

/**
 * プロフィールに必須項目が入力されているかを返す。
 * 0:入力済み
 * 1:プロフィール未入力
 * 2:メールアドレス未登録
 */
function db_member_check_param_inputed($c_member_id, $is_ktai = false)
{
    if (!db_member_is_registered_nickname_birth_day($c_member_id)) {
        return 1;
    }

    if ($is_ktai && !db_member_is_ktai_address_registered($c_member_id)) {
        return 2;
    }
    if (!$is_ktai && !db_member_is_pc_address_registered($c_member_id)) {
        return 2;
    }

    return 0;
}

function db_member_is_registered_nickname_birth_day($c_member_id)
{
    $c_member = db_member_c_member4c_member_id($c_member_id, false, false, 'private');

    if (($c_member['nickname'] === '')
     || !$c_member['birth_year']
     || !$c_member['birth_month']
     || !$c_member['birth_day']
    ) {
        return false;
    }

    return true;
}

function db_member_is_pc_address_registered($c_member_id)
{
    $sql = 'SELECT pc_address FROM c_member_secure WHERE c_member_id = ?';
    $params = array(intval($c_member_id));
    return (bool)db_get_one($sql, $params);
}

function db_member_is_ktai_address_registered($c_member_id)
{
    $sql = 'SELECT ktai_address FROM c_member_secure WHERE c_member_id = ?';
    $params = array(intval($c_member_id));
    return (bool)db_get_one($sql, $params);
}

function db_member_is_blacklist($c_member_id)
{
    $sql = 'SELECT COUNT(*) FROM c_blacklist'
         . ' INNER JOIN c_member_secure USING (easy_access_id)'
         . ' WHERE c_member_secure.c_member_id = ?';
    $params = array(intval($c_member_id));
    return (bool)db_get_one($sql, $params);
}

function db_member_easy_access_id_is_blacklist($easy_access_id, $c_blacklist_id = 0)
{
    $sql = 'SELECT COUNT(*) FROM c_blacklist WHERE easy_access_id = ? AND c_blacklist_id <> ?';
    $param = array(
        $easy_access_id,
        intval($c_blacklist_id),
    );
    return (bool)db_get_one($sql, $param);
}

/**
 * c_member_configの値を取得する
 *
 * @param int $c_member_id
 * @return array メンバー設定情報
 */
function db_member_c_member_config4c_member_id($c_member_id)
{
    $sql = 'SELECT name, value FROM c_member_config WHERE c_member_id = ?';
    $params = array(
        intval($c_member_id),
    );

    $member_config = db_get_assoc($sql, $params);

    return $member_config;
}

/**
 * c_member_config_idに設定値があるかどうか
 *
 * @param int $c_member_id
 * @param string $name
 * @return bool
 */
function db_member_c_member_config4name($c_member_id, $name)
{
    $sql = 'SELECT COUNT(c_member_config_id) FROM c_member_config'
         . ' WHERE c_member_id = ? AND name = ?';
    $params = array(
        intval($c_member_id),
        $name,
    );
    return (bool)db_get_one($sql, $params, 'main');
}

/**
 * c_member_config更新(無ければInsert)
 *
 * @param int $c_member_id
 * @param string $name
 * @param string $value
 */
function db_member_update_c_member_config($c_member_id, $name, $value)
{
    if (!db_member_c_member_config4name($c_member_id, $name)) {
        $data = array(
            'c_member_id' => intval($c_member_id),
            'name' => $name,
            'value' => $value,
        );
        db_insert('c_member_config', $data);
    } else {
        $data = array('value' => $value);
        $where = array(
            'c_member_id' => intval($c_member_id),
            'name' => $name,
        );
        db_update('c_member_config', $data, $where);
    }
}

/**
 * c_member_configの削除
 *
 * @param int $c_member_id
 * @param string $name
 * @return bool
 */
function db_member_delete_c_member_config($c_member_id, $name)
{
    $sql = 'DELETE FROM c_member_config WHERE c_member_id = ? AND name = ?';
    $params = array(
        intval($c_member_id),
        $name,
    );
    return db_query($sql, $params);
}

/**
 * c_member_secureのsess_idフィールドにセッションIDを新規に追加する
 *
 * @param int $c_member_id 更新する行のメンバーID
 * @param string $sess_id 更新する値
 * @return  bool
 */
function db_member_update_c_member_secure_insert_sess_id($c_member_id, $sess_id) {
    $data = array('sess_id' => $sess_id);
    $where = array('c_member_id' => intval($c_member_id));
    return db_update('c_member_secure', $data, $where);
}

/**
 * c_member_secureのsess_idの値を削除する
 *
 * @param string $sess_id 更新する行のsess_idの値
 * @return  bool
 */
function db_member_update_c_member_secure_delete_sess_id($sess_id) {
    $data = array('sess_id' => '');
    $where = array('sess_id' => $sess_id);
    return db_update('c_member_secure', $data, $where);
}

/**
 * ログイン時のセッションIDと現在のセッションIDが一致していることを確認
 *
 * @param int $c_member_id
 * @param string $now_sess_id 現在のセッションID
 * @return bool
 */
function db_member_is_one_session_per_user($c_member_id, $now_sess_id)
{
    if (OPENPNE_ONE_SESSION_PER_USER) {
        $sql = 'SELECT sess_id FROM c_member_secure'
             . ' WHERE c_member_id = ?';
        $param = array($c_member_id);
        $login_sess_id = db_get_one($sql, $param);
        if ($login_sess_id !== $now_sess_id) {
            return false;
        }
    }
    return true;
}

/**
 * 秘密の質問の登録状況チェック
 * @param  int $c_member_id
 * @return true  : 設定されている
 *         false : 設定されていない
 */
function db_member_is_registered_password_query_answer($c_member_id)
{
    $null_answer = '';

    $sql = 'SELECT c_member.c_password_query_id'
         . ' ,c_member_secure.hashed_password_query_answer'
         . ' FROM c_member, c_member_secure'
         . ' WHERE c_member_secure.c_member_id = ?'
         . ' AND c_member.c_member_id = c_member_secure.c_member_id';
    $params = array(
        intval($c_member_id),
    );
    $c_member = db_get_row($sql, $params);
    if (!$c_member['hashed_password_query_answer']
     || md5($c_member['hashed_password_query_answer']) == md5($null_answer)
     || !$c_member['c_password_query_id']) {
        return false;
    }
    return true;

}

/**
 * 承認待ちユーザ情報を取得する
 *
 * @param  int $c_member_pre_id
 * @return array
 */
function db_member_c_member_pre4c_member_pre_id($c_member_pre_id)
{
    $sql = 'SELECT * FROM c_member_pre WHERE c_member_pre_id = ?';
    $params = array($c_member_pre_id);

    return db_get_row($sql, $params);
}

/**
 * 承認待ちユーザを削除する
 *
 * @param  int $c_member_pre_id
 * @return bool
 */
function db_member_delete_c_member_pre4c_member_pre_id($c_member_pre_id)
{
    $sql = 'DELETE FROM c_member_pre WHERE c_member_pre_id = ?';
    $params = array($c_member_pre_id);
    return db_query($sql, $params);
}

/**
 * 参加承認制の場合の、携帯情報登録用
 */
function db_member_insert_c_member_pre_from_ktai($c_member_id_invite, $ktai_address, $regist_address, $session) 
{
    $data = array(
        'ktai_address' => $ktai_address,
        'regist_address' => $regist_address,
        'c_member_id_invite' => intval($c_member_id_invite),
        'session' => $session,
        'r_date' => db_now(),
        'nickname' => '',
        'password' => '',
        'ktai_address' => '',
        'easy_access_id' => '',
        'c_password_query_answer' => '',
    );
    return db_insert('c_member_pre', $data);
}

/**
 * c_member_preの各種データを更新する
 * @param int   $c_member_pre_id
 * @param array $data_list
 * @param bool  $is_md5hash
 * @return bool
 */
function db_member_update_c_member_pre4c_member_pre_id($c_member_pre_id, $data_list, $is_md5hash = true)
{
    $data = array();
    foreach ($data_list as $key => $val) {
        if ($is_md5hash) {
            switch ($key) {
                case "easy_access_id" :
                case "password" :
                case "c_password_query_answer" :
                    $set_val = md5($val); 
                    break;
                default :
                    $set_val = $val;
                    break;
            }
        } else {
            $set_val = $val;
        }
        $data[$key] = $set_val;
    }
    $where = array('c_member_pre_id' => $c_member_pre_id);
    return db_update('c_member_pre', $data, $where);
}

?>
