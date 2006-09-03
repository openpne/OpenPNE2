<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * メンバー情報を取得する
 * 
 * @param int $c_member_id
 * @param bool $is_secure `c_member_secure`の項目を取得するかどうか
 * @param bool $with_profile `c_member_profile`の項目を取得するかどうか
 * @param string $public_flag プロフィール項目を取得する場合の公開設定(public, friend, private)
 * @return array メンバー情報
 */
function db_common_c_member4c_member_id($c_member_id, $is_secure = false, $with_profile = false, $public_flag = 'public')
{
    $sql = 'SELECT * FROM c_member WHERE c_member_id = ?';
    $params = array(intval($c_member_id));
    if (!$c_member = db_get_row($sql, $params))
        return array();

    if ($is_secure) {
        $c_member['secure'] = db_common_c_member_secure4c_member_id($c_member_id);
    }

    if ($with_profile) {
        $c_member['profile'] = db_common_c_member_profile_list4c_member_id($c_member_id, $public_flag);

        // public_flag_birth_year
        switch ($c_member['public_flag_birth_year']) {
        case "friend":
            if ($public_flag == 'public')
                unset($c_member['birth_year']);
            break;
        case "private":
            if ($public_flag == 'public' || $public_flag == 'friend')
                unset($c_member['birth_year']);
            break;
        }
    }

    return $c_member;
}

/**
 * メンバーのプロフィールを取得
 */
function db_common_c_member_profile_list4c_member_id($c_member_id, $public_flag = 'public')
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

    $sql = 'SELECT cp.name, cp.caption, cp.form_type, cm.value, cm.public_flag' .
        ' FROM c_member_profile as cm, c_profile as cp' .
        ' WHERE cm.c_member_id = ?'.
            " AND cm.public_flag IN ($flags)" .
            ' AND cm.c_profile_id = cp.c_profile_id' .
        ' ORDER BY cp.sort_order, cm.c_member_profile_id';
    $profile = db_get_all($sql, array(intval($c_member_id)));

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

    return $member_profile;
}

/**
 * メンバーの暗号化された情報を復号化して取得
 */
function db_common_c_member_secure4c_member_id($c_member_id)
{
    $sql = 'SELECT pc_address, ktai_address, regist_address, easy_access_id FROM c_member_secure WHERE c_member_id = ?';
    $c_member_secure = db_get_row($sql, array(intval($c_member_id)));

    return array_map('t_decrypt', $c_member_secure);
}

/**
 * メンバー情報をプロフィール付きで取得する
 * (secure情報は取得しない)
 * 
 * @param int $c_member_id
 * @param string $public_flag 取得するプロフィール項目の公開レベル(public, friend, private)
 * @return array メンバー情報
 */
function db_common_c_member_with_profile($c_member_id, $public_flag = 'public')
{
    return db_common_c_member4c_member_id($c_member_id, false, true, $public_flag);
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
function db_common_c_member4c_member_id_LIGHT($c_member_id)
{
    static $results;
    if (!isset($results[$c_member_id])) {
        $sql = 'SELECT c_member_id, nickname, image_filename FROM c_member WHERE c_member_id = ?';
        $results[$c_member_id] = db_get_row($sql, array(intval($c_member_id)));
    }
    return $results[$c_member_id];
}

/**
 * PCアドレスからメンバーIDを取得(ログインに必要)
 * 
 * @param   string $pc_address
 * @return  int    $c_member_id
 */
function _db_c_member_id4pc_address($pc_address)
{
    return _db_c_member_id4pc_address_encrypted(t_encrypt($pc_address));
}

function _db_c_member_id4pc_address_encrypted($pc_address_encoded)
{
    $sql = 'SELECT c_member_id FROM c_member_secure WHERE pc_address = ?';
    $params = array($pc_address_encoded);
    return db_get_one($sql, $params);
}

function _db_c_member_id4ktai_address_encrypted($ktai_address_encoded)
{
    $sql = 'SELECT c_member_id FROM c_member_secure WHERE ktai_address = ?';
    $params = array($ktai_address_encoded);
    return db_get_one($sql, $params);
}

/**
 * アクティブユーザーか？
 */
function p_common_is_active_c_member_id($c_member_id)
{
    $sql = 'SELECT c_member_id FROM c_member WHERE c_member_id = ?';
    $params = array(intval($c_member_id));
    return (bool)db_get_one($sql, $params);
}

/**
 * セッションからc_member_preを返す
 */
function p_common_c_member_pre4c_member_pre_session($session)
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
        ' ORDER BY p.sort_order, m.c_member_pre_profile_id';
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

function n_regist_intro_is_active_sid($sid)
{
    $sql = 'SELECT c_member_pre_id FROM c_member_pre WHERE session = ?';
    $params = array($sid);
    return (bool)db_get_one($sql, $params);
}

function p_h_search_result_search($cond, $cond_like, $page_size, $page, $c_member_id, $profiles)
{
    $page = intval($page);
    $page_size = intval($page_size);

    $where = " WHERE 1";
    $params = array();

    foreach ($cond as $key => $value) {
        if ($value) {
            if ($key == 'image') {
                $where .= " AND image_filename <> ''";
            } else {
                $where .= " AND ". db_escapeIdentifier($key) ." = ?";
                $params[] = $value;
                if ($key == 'birth_year') {
                    $where .= " AND public_flag_birth_year = 'public'";
                }
            }
        }
    }
    foreach ($cond_like as $key => $value) {
        if ($value) {
            $where .= " AND " . db_escapeIdentifier($key) . " LIKE ?";
            $params[] = '%'.$value.'%';
        }
    }

    $from = " FROM c_member";
    $order = " ORDER BY c_member_id DESC";
    $sql = "SELECT c_member_id" . $from . $where . $order;

    $result_ids = db_get_col($sql, $params);

    foreach ($profiles as $key => $value) {
        $sql = "SELECT c_member_id FROM c_member_profile";
        $sql .= " WHERE c_profile_id = ? AND public_flag = 'public'";
        $params = array(intval($value['c_profile_id']));

        if ($value['form_type'] == "text" || $value['form_type'] == 'textarea') {
            $sql .= " AND value LIKE ?";
            $params[] = '%'.$value['value'].'%';
        } elseif (is_array($value['c_profile_option_id'])) {
            $values = implode(',', array_map('intval', $value['c_profile_option_id']));
            $sql .= " AND c_profile_option_id IN (". $values .")";
        } else {
            $sql .= " AND c_profile_option_id = ?";
            $params[] = intval($value['c_profile_option_id']);
        }
        $sql .= " ORDER BY c_member_id DESC";

        $ids = db_get_col($sql, $params);
        $result_ids = array_values(array_intersect($result_ids, $ids));
    }

    $start = ($page - 1) * $page_size;

    $list = array();
    for ($i = $start; $i < $start + $page_size && $result_ids[$i]; $i++) {
        $c_member = db_common_c_member_with_profile($result_ids[$i], 'public');
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

function h_invite_inviting_member4c_member_id($c_member_id)
{
    $sql = 'SELECT * FROM c_member_pre WHERE c_member_id_invite = ? ORDER BY r_date DESC';
    $params = array(intval($c_member_id));
    return db_get_all($sql, $params);
}

function p_h_home_birthday_flag4c_member_id($c_member_id)
{
    $c_member = db_common_c_member4c_member_id($c_member_id);
    $birthday = $c_member['birth_month'] . "-" . $c_member['birth_day'];

    return (bool)(date("n-j") == $birthday);
}

/**
 * あるメンバーがアクセスブロックしているメンバーIDのリストを取得
 */
function p_h_config_c_member_id_block4c_member_id($c_member_id)
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
function p_common_is_access_block($c_member_id, $target_c_member_id)
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
function db_common_count_days_birthday4c_member_id($c_member_id)
{
    $c_member = db_common_c_member4c_member_id($c_member_id);
    return getCountdownDays($c_member['birth_month'], $c_member['birth_day']);
}

function p_h_search_result_check_profile($profile)
{
    $result_list = array();

    foreach ($profile as $key => $v) {
        if (!$v) continue;

        $sql = 'SELECT * FROM c_profile WHERE name = ?';
        $params = array($key);
        $c_profile = db_get_row($sql, $params);
        if (!($c_profile && $c_profile['disp_search'])) continue;

        $public_flags = array('public', 'friend', 'private');
        if (!$c_profile['public_flag_edit']
            && $c_profile['public_flag_default'] != 'public') {
            // 公開項目以外は除外
            continue;
        }

        switch ($c_profile['form_type']) {
        case "text":
        case "textarea":
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

function p_h_search_list_count_c_member_profile()
{
    $sql = 'SELECT c_profile_option_id, COUNT(DISTINCT c_member_id)' .
        ' FROM c_member_profile' .
        ' WHERE public_flag = \'public\'' .
        ' AND c_profile_option_id > 0' .
        ' GROUP BY c_profile_option_id';
    return db_get_assoc($sql);
}

function p_h_home_birth4c_member_id($month, $day, $c_member_id)
{
    $sql = "SELECT c_member_id_to FROM c_friend WHERE c_member_id_from = ?";
    $params = array(intval($c_member_id));
    $ids = db_get_col($sql, $params);
    $ids[] = $c_member_id;
    $ids = implode(", ", $ids);

    $sql = "SELECT * FROM c_member" .
        " WHERE c_member_id IN (". $ids . ")" .
        " AND birth_day = ?" .
        " AND birth_month = ?";
    $params = array(intval($day), intval($month));
    return db_get_all($sql, $params);
}

function db_c_member_list4exists_rss()
{
    $sql = "SELECT * FROM c_member WHERE rss <> ''";
    return db_get_all($sql);
}

function db_c_member_list4no_exists_rss()
{
    $sql = "SELECT * FROM c_member WHERE rss = ''";
    return db_get_all($sql);
}

function db_common_c_profile_list4null()
{
    $sql = 'SELECT * FROM c_profile ORDER BY sort_order';
    return db_get_all($sql);
}

function db_common_c_profile_option_list4c_profile_id($c_profile_id)
{
    $sql = 'SELECT * FROM c_profile_option WHERE c_profile_id = ? ORDER BY sort_order';
    $params = array(intval($c_profile_id));
    return db_get_all($sql, $params);
}

function db_common_c_profile_list()
{
    $list = db_common_c_profile_list4null();

    $profile_list = array();
    foreach ($list as $value) {
        $profile_list[$value['name']] = $value;
        $profile_list[$value['name']]['options'] = db_common_c_profile_option_list4c_profile_id($value['c_profile_id']);
    }
    return $profile_list;
}

function db_common_main_image_filename_number($c_member_id)
{
    $c_member = db_common_c_member4c_member_id($c_member_id);
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

function do_common_c_member_pre4sid($sid)
{
    $sql = 'SELECT * FROM c_member_pre WHERE session = ?';
    $params = array($sid);
    return db_get_row($sql, $params);
}

function do_common_c_member_pre4pc_address($pc_address)
{
    $sql = 'SELECT * FROM c_member_pre WHERE pc_address = ?';
    $params = array($pc_address);
    return db_get_row($sql, $params);
}

function do_common_c_member4pc_address($pc_address)
{
    $sql = 'SELECT * FROM c_member_secure WHERE pc_address = ?';
    $params = array(t_encrypt($pc_address));
    return db_get_row($sql, $params);
}

function do_common_c_member_list4daily_news()
{
    $sql = 'SELECT c_member_id, is_receive_daily_news FROM c_member' .
            ' WHERE is_receive_daily_news > 0';
    return db_get_all($sql);
}

function do_common_c_member_list4birthday_mail()
{
    // この日が誕生日の人を対称にする
    $target_date = "+1 week";

    $timestamp = strtotime($target_date);
    $month = date("n", $timestamp);
    $day   = date("j", $timestamp);

    $sql = 'SELECT * FROM c_member WHERE birth_month = ? AND birth_day = ?';
    $params = array(intval($month), intval($day));
    return db_get_all($sql, $params);
}

/**
 * パスワードクエリが合っているか判定
 */
function do_password_query_is_password_query_complete($pc_address, $query_id, $query_answer)
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

function do_common_c_member_id4ktai_address($ktai_address)
{
    if (!$ktai_address) {
        return null;
    }

    $sql = "SELECT c_member_id FROM c_member_secure WHERE ktai_address = ?";
    $params = array(t_encrypt($ktai_address));
    return db_get_one($sql, $params);
}

function k_h_invite_inviting_member4c_member_id($c_member_id)
{
    $sql = "SELECT * FROM c_member_ktai_pre WHERE c_member_id_invite = ?";
    $params = array(intval($c_member_id));
    return db_get_all($sql, $params);
}

//対象のアドレスが、登録されてるか否か
function p_is_sns_join4mail_address($mail_address)
{
    $params = array(t_encrypt($mail_address));

    $sql = "SELECT c_member_id FROM c_member_secure WHERE pc_address = ?";
    $array = db_get_row($sql, $params);

    $sql = "SELECT c_member_id FROM c_member_secure WHERE ktai_address = ?";
    $k_array = db_get_row($sql, $params);

    //対象のアドレスが登録済み
    if ($array['c_member_id'] || $k_array['c_member_id']) {
        return true;
    } else {
        return false;
    }
}

function do_common_c_member_ktai_pre4ktai_address($ktai_address)
{
    $sql = 'SELECT * FROM c_member_ktai_pre WHERE ktai_address = ?';
    $params = array($ktai_address);
    return db_get_row($sql, $params);
}

/**
 * 携帯認証用
 */
function k_auth($c_member_id)
{
    $sql = 'SELECT c_member_id FROM c_member WHERE c_member_id = ?';
    $params = array(intval($c_member_id));
    return db_get_one($sql, $params);
}

function k_auth_login($ktai_address, $password)
{
    if (!$ktai_address or !$password) {
        return false;
    }

    $sql = "SELECT c_member_id FROM c_member_secure" .
            " WHERE ktai_address = ?" .
            " AND hashed_password = ?";
    $params = array(t_encrypt($ktai_address), md5($password));
    return db_get_one($sql, $params);
}

function c_ktai_address_pre4session($session)
{
    $sql = 'SELECT * FROM c_ktai_address_pre WHERE session = ?';
    $params = array($session);
    return db_get_row($sql, $params);
}

function c_member_ktai_pre4session($session)
{
    $sql = 'SELECT * FROM c_member_ktai_pre WHERE session = ?';
    $params = array($session);
    return db_get_row($sql, $params);
}

/**
 * メンバーIDからハッシュ化されたパスワードを取得
 * (携帯の認証に暫定的に用いる)
 * 
 * @param int $c_member_id
 * @return string hashed password
 */
function k_common_hashed_password4c_member_id($c_member_id)
{
    $sql = 'SELECT hashed_password FROM c_member_secure WHERE c_member_id = ?';
    $params = array(intval($c_member_id));
    return db_get_one($sql, $params);
}

function db_ktai_is_password_query_complete($ktai_address, $query_id, $query_answer)
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

function db_ktai_c_member_id4easy_access_id($easy_access_id)
{
    if (!$easy_access_id) return false;

    $sql = 'SELECT c_member_id FROM c_member_secure WHERE easy_access_id = ?';
    $params = array(t_encrypt($easy_access_id));
    return db_get_one($sql, $params);
}

function do_config_prof_check_profile($profile_list, $public_flag_list)
{
    $result_list = array();

    foreach ($profile_list as $key => $v) {
        $sql = 'SELECT c_profile_id, is_required, public_flag_edit, public_flag_default, form_type, name' .
                ' FROM c_profile WHERE name = ?';
        $params = array($key);
        $c_profile = db_get_row($sql, $params);

        switch ($c_profile['form_type']) {
        case 'text':
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
            $c_profile_option_id = $v;
            break;
        case 'checkbox':
            $value = array();
            $c_profile_option_id = $v;
            if (!$v) break;

            $sql = "SELECT c_profile_option_id, value FROM c_profile_option" .
                " WHERE c_profile_option_id IN (". implode(",", array_map('intval', $v)). ")" .
                " AND c_profile_id = ?".
                " ORDER BY sort_order";
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
 * すべてのメンバー（アクティブユーザ）のメンバーIDを取得
 */
function p_common_c_member_id_list4null()
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

?>
