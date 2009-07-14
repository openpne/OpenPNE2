<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * メンバーリスト取得
 */
function db_admin_c_member_list($page, $page_size, &$pager)
{
    $sql = 'SELECT c_member_id FROM c_member ORDER BY c_member_id';
    $ids = db_get_col_page($sql, $page, $page_size);

    $c_member_list = array();
    foreach ($ids as $id) {
        $c_member_list[] = db_member_c_member4c_member_id($id, true, true, 'private');
    }

    $sql = 'SELECT COUNT(*) FROM c_member';
    $total_num = db_get_one($sql);
    $pager = util_make_pager($page, $page_size, $total_num);

    return $c_member_list;
}

function db_admin_c_member4mail_address($mail_address)
{
    $sql = 'SELECT c_member_id FROM c_member_secure' .
            ' WHERE pc_address = ? OR ktai_address = ? OR regist_address = ?';
    $enc_address = t_encrypt($mail_address);
    $params = array($enc_address, $enc_address, $enc_address);
    $list = db_get_col($sql, $params);

    $c_member_list = array();
    foreach ($list as $c_member_id) {
        $c_member_list[] = db_member_c_member4c_member_id($c_member_id, true, true, 'private');
    }
    return $c_member_list;
}

function db_admin_c_member4username($username)
{
    $sql = 'SELECT c_member_id FROM c_username WHERE username = ?';
    $c_member_id = db_get_one($sql, array($username));

    $c_member = db_member_c_member4c_member_id($c_member_id, true, true, 'private');
    return $c_member;
}

function db_admin_c_siteadmin($target)
{
    $sql = 'SELECT * FROM c_siteadmin WHERE target = ?';
    $params = array($target);
    return db_get_row($sql, $params);
}

function db_admin_insert_c_siteadmin($target, $body)
{
    $data = array(
        'target' => $target,
        'body' => $body,
        'r_date' => db_now(),
    );
    return db_insert('c_siteadmin', $data);
}

function db_admin_update_c_siteadmin($target, $body)
{
    $data = array(
        'body' => $body,
        'r_date' => db_now(),
    );
    $where = array('target' => $target);
    return db_update('c_siteadmin', $data, $where);
}

function db_admin_delete_c_profile_option($c_profile_option_id)
{
    //function cache削除
    pne_cache_drop('db_member_c_profile_list');

    if (!$c_profile_option_id) {
        return false;
    }

    $sql = 'DELETE FROM c_member_profile WHERE c_profile_option_id = ?';
    $params = array(intval($c_profile_option_id));
    db_query($sql, $params);

    $sql = 'DELETE FROM c_profile_option WHERE c_profile_option_id = ?';
    db_query($sql, $params);

    return true;
}

function db_admin_insert_c_profile_option($c_profile_id, $value, $sort_order)
{
    //function cache削除
    pne_cache_drop('db_member_c_profile_list');

    $data = array(
        'c_profile_id' => intval($c_profile_id),
        'value' => $value,
        'sort_order' => intval($sort_order),
    );
    return db_insert('c_profile_option', $data);
}

function db_admin_update_c_profile_option($c_profile_option_id, $value, $sort_order)
{
    //function cache削除
    pne_cache_drop('db_member_c_profile_list');

    $data = array('value' => $value);
    $where = array('c_profile_option_id' => intval($c_profile_option_id));
    db_update('c_member_profile', $data, $where);

    $data = array(
        'value' => $value,
        'sort_order' => intval($sort_order),
    );
    db_update('c_profile_option', $data, $where);
}

function db_admin_insert_c_banner($a_href, $type, $nickname)
{
    $data = array(
        'a_href' => $a_href,
        'type' => $type,
        'nickname' => $nickname,
        'is_hidden_after' => 0,
        'is_hidden_before' => 0,
        'image_filename' => '',
    );
    return db_insert('c_banner', $data);
}

function db_admin_update_c_banner($c_banner_id, $sets)
{
    $where = array('c_banner_id' => intval($c_banner_id));
    db_update('c_banner', $sets, $where);
}

function db_admin_delete_c_banner($c_banner_id)
{
    db_admin_delete_c_image4c_banner_id($c_banner_id);

    $sql = 'DELETE FROM c_banner WHERE c_banner_id = ?';
    $params = array(intval($c_banner_id));
    db_query($sql, $params);
}

function db_admin_delete_c_image4c_banner_id($c_banner_id)
{
    $sql = 'SELECT image_filename FROM c_banner WHERE c_banner_id = ?';
    $params = array(intval($c_banner_id));
    $image_filename = db_get_one($sql, $params);
    db_image_data_delete($image_filename);
}

function db_admin_insert_c_profile(
    $name
    , $caption
    , $info
    , $is_required
    , $public_flag_edit
    , $public_flag_default
    , $form_type
    , $sort_order
    , $disp_regist
    , $disp_config
    , $disp_search
    , $val_type
    , $val_regexp
    , $val_min
    , $val_max
    )
{
    pne_cache_drop('db_member_c_profile_list');

    if (empty($info) || is_null($info)) {
        $info = '';
    }

    $data = array(
        'name' => $name,
        'caption' => $caption,
        'info' => $info,
        'is_required' => (bool)$is_required,
        'public_flag_edit' => (bool)$public_flag_edit,
        'public_flag_default' => $public_flag_default,
        'form_type' => $form_type,
        'sort_order' => (int)$sort_order,
        'disp_regist' => (bool)$disp_regist,
        'disp_config' => (bool)$disp_config,
        'disp_search' => (bool)$disp_search,
        'val_type' => $val_type,
        'val_regexp' => $val_regexp,
        'val_min' => (int)$val_min,
        'val_max' => (int)$val_max,
    );
    return db_insert('c_profile', $data);
}

function db_admin_update_c_profile($c_profile_id
    , $name
    , $caption
    , $info
    , $is_required
    , $public_flag_edit
    , $public_flag_default
    , $form_type
    , $sort_order
    , $disp_regist
    , $disp_config
    , $disp_search
    , $val_type
    , $val_regexp
    , $val_min
    , $val_max
    )
{
    if (empty($info) || is_null($info)) {
        $info = '';
    }

    $data = array(
        'name' => $name,
        'caption' => $caption,
        'info' => $info,
        'is_required' => (bool)$is_required,
        'public_flag_edit' => (bool)$public_flag_edit,
        'public_flag_default' => $public_flag_default,
        'form_type' => $form_type,
        'sort_order' => intval($sort_order),
        'disp_regist' => (bool)$disp_regist,
        'disp_config' => (bool)$disp_config,
        'disp_search' => (bool)$disp_search,
        'val_type' => $val_type,
        'val_regexp' => $val_regexp,
        'val_min' => intval($val_min),
        'val_max' => intval($val_max),
    );
    $where = array('c_profile_id' => intval($c_profile_id));
    db_update('c_profile', $data, $where);

    // 公開設定が固定のときはメンバーの設定値を上書き
    if (!$public_flag_edit) {
        $data = array('public_flag' => $public_flag_default);
        db_update('c_member_profile', $data, $where);
    }

    pne_cache_drop('db_member_c_profile_list');
}

function db_admin_delete_c_profile($c_profile_id)
{
    $params = array(intval($c_profile_id));

    // メンバーのプロフィールから削除
    $sql = 'DELETE FROM c_member_profile WHERE c_profile_id = ?';
    db_query($sql, $params);

    // 選択肢項目を削除
    $sql = 'DELETE FROM c_profile_option WHERE c_profile_id = ?';
    db_query($sql, $params);

    // プロフィール項目を削除
    $sql = 'DELETE FROM c_profile WHERE c_profile_id = ?';
    db_query($sql, $params);

    pne_cache_drop('db_member_c_profile_list');
}

function db_admin_c_profile4c_profile_id($c_profile_id)
{
    $sql = 'SELECT * FROM c_profile WHERE c_profile_id = ?';
    $params = array(intval($c_profile_id));
    return db_get_row($sql, $params);
}

/**
 * 全バナー取得
 *
 * @param  int $limit 取得最大件数
 * @return array_of_array  c_banner_list バナー配列
 */
function db_admin_c_banner_list4null($type = '')
{
    $sql = 'SELECT * FROM c_banner';
    $params = array();
    if ($type) {
        $sql .= ' WHERE type = ?';
        $params[] = $type;
    }
    $sql .= ' ORDER BY c_banner_id';
    return db_get_all($sql, $params);
}

function db_admin_c_commu_category_parent_list()
{
    $sql = 'SELECT * FROM c_commu_category_parent ORDER BY sort_order';
    return db_get_all($sql);
}

function db_admin_c_commu_category_list()
{
    $sql = 'SELECT * FROM c_commu_category ORDER BY sort_order';
    $list = db_get_all($sql);

    $category_list = array();
    foreach ($list as $item) {
        $category_list[$item['c_commu_category_parent_id']][] = $item;
    }
    return $category_list;
}

function db_admin_insert_c_commu_category_parent($name, $sort_order)
{
    $data = array(
        'name' => $name,
        'sort_order' => intval($sort_order),
    );
    return db_insert('c_commu_category_parent', $data);
}

function db_admin_update_c_commu_category_parent($c_commu_category_parent_id, $name, $sort_order)
{
    $data = array(
        'name' => $name,
        'sort_order' => intval($sort_order),
    );
    $where = array(
        'c_commu_category_parent_id' => intval($c_commu_category_parent_id)
    );
    db_update('c_commu_category_parent', $data, $where);
}

function db_admin_delete_c_commu_category_parent($c_commu_category_parent_id)
{
    $params = array(intval($c_commu_category_parent_id));

    // 小カテゴリを削除
    $sql = 'DELETE FROM c_commu_category WHERE c_commu_category_parent_id = ?';
    db_query($sql, $params);

    // 中カテゴリを削除
    $sql = 'DELETE FROM c_commu_category_parent WHERE c_commu_category_parent_id = ?';
    db_query($sql, $params);
}

function db_admin_insert_c_commu_category($c_commu_category_parent_id, $name, $sort_order, $is_create_commu)
{
    $data = array(
        'c_commu_category_parent_id' => intval($c_commu_category_parent_id),
        'name' => $name,
        'sort_order' => intval($sort_order),
        'is_create_commu' => intval($is_create_commu),
    );
    return db_insert('c_commu_category', $data);
}

function db_admin_update_c_commu_category($c_commu_category_id, $name, $sort_order, $is_create_commu)
{
    $data = array(
        'name' => $name,
        'sort_order' => intval($sort_order),
        'is_create_commu' => intval($is_create_commu),
    );
    $where = array('c_commu_category_id' => intval($c_commu_category_id));
    db_update('c_commu_category', $data, $where);
}

function db_admin_delete_c_commu_category($c_commu_category_id)
{
    // 小カテゴリを削除
    $sql = 'DELETE FROM c_commu_category WHERE c_commu_category_id = ?';
    $params = array(intval($c_commu_category_id));
    db_query($sql, $params);
}

function db_admin_c_admin_user_id4username($username)
{
    $sql = 'SELECT c_admin_user_id FROM c_admin_user WHERE username = ?';
    $params = array($username);
    return db_get_one($sql, $params);
}

function db_admin_authenticate_password($uid, $password)
{
    $sql = 'SELECT c_admin_user_id FROM c_admin_user WHERE c_admin_user_id = ? AND password = ?';
    $params = array(intval($uid), md5($password));
    return (bool)db_get_one($sql, $params);
}

function db_admin_update_c_admin_user_password($uid, $password)
{
    $data = array('password' => md5($password));
    $where = array('c_admin_user_id' => intval($uid));
    db_update('c_admin_user', $data, $where);
}

function db_admin_c_admin_config4name($name)
{
    $sql = 'SELECT value FROM c_admin_config WHERE name = ?';
    $params = array($name);
    return db_get_one($sql, $params);
}

function db_admin_insert_c_admin_config($name, $value)
{
    $data = array(
        'name' => $name,
        'value' => $value,
    );
    return db_insert('c_admin_config', $data);
}

function db_admin_update_c_admin_config($name, $value)
{
    $data = array('value' => $value);
    $where = array('name' => $name);
    db_update('c_admin_config', $data, $where);
}

function db_admin_replace_c_admin_config($name, $value)
{
    $sql = 'DELETE FROM c_admin_config WHERE name = ?';
    $params = array($name);
    db_query($sql, $params);

    $data = array(
        'name'  => strval($name),
        'value' => strval($value),
    );
    return db_insert('c_admin_config', $data);
}

function db_admin_c_admin_config_all()
{
    $sql = 'SELECT name, value FROM c_admin_config';
    return db_get_assoc($sql);
}

function db_admin_delete_c_image_link4image_filename($image_filename)
{
    $parts = explode('_', $image_filename);
    $prefix = $parts[0];

    switch ($prefix) {
    case 'b':
        $pkey = (int)$parts[1];

        $sql = 'DELETE FROM c_banner WHERE c_banner_id = ? AND image_filename = ?';
        $params = array($pkey, $image_filename);
        db_query($sql, $params);
        break;

    case 'c':
        $tbl = 'c_commu';
        $pkey = (int)$parts[1];

        _db_admin_empty_filename($tbl, $image_filename, 'image_filename', $pkey);

        //function cacheの削除
        cache_drop_c_commu($pkey);
        break;

    case 't':
        $tbl = 'c_commu_topic_comment';
        $pkey = (int)$parts[1];
        $number = (int)$parts[2];

        $sql = 'SELECT c_commu_topic_comment_id FROM c_commu_topic WHERE c_commu_topic_id = ? AND number = 0';
        $pkey = (int)db_get_one($sql, array($pkey));

        _db_admin_empty_filename($tbl, $image_filename, 'image_filename'.$number, $pkey);
        break;

    case 'tc':
        $tbl = 'c_commu_topic_comment';
        $pkey = (int)$parts[1];
        $number = (int)$parts[2];

        _db_admin_empty_filename($tbl, $image_filename, 'image_filename'.$number, $pkey);
        break;

    case 'd':
        $tbl = 'c_diary';
        $pkey = (int)$parts[1];
        $number = (int)$parts[2];

        _db_admin_empty_filename($tbl, $image_filename, 'image_filename_'.$number, $pkey);
        break;

    case 'dc':
        $tbl = 'c_diary_comment';
        $pkey = (int)$parts[1];
        $number = (int)$parts[2];

        _db_admin_empty_filename($tbl, $image_filename, 'image_filename_'.$number, $pkey);
        break;

    case 'm':
        $tbl = 'c_member';
        $pkey = (int)$parts[1];

        _db_admin_empty_filename($tbl, $image_filename, 'image_filename', $pkey);
        _db_admin_empty_filename($tbl, $image_filename, 'image_filename_1', $pkey);
        _db_admin_empty_filename($tbl, $image_filename, 'image_filename_2', $pkey);
        _db_admin_empty_filename($tbl, $image_filename, 'image_filename_3', $pkey);

        //function cacheの削除
        cache_drop_c_member_profile($pkey);
        break;

    case 'ms':
        $tbl = 'c_message';
        $pkey = (int)$parts[1];
        $number = (int)$parts[2];

        _db_admin_empty_filename($tbl, $image_filename, 'image_filename_'.$number, $pkey);
        break;

    case 'r':
        $tbl = 'c_rank';
        $pkey = (int)$parts[1];

        _db_admin_empty_filename($tbl, $image_filename, 'image_filename', $pkey);
        break;

    case 'a':
        $tbl = 'c_album';
        $pkey = (int)$parts[1];

        _db_admin_empty_filename($tbl, $image_filename, 'album_cover_image', $pkey);

        $sql = 'DELETE FROM c_album_image WHERE c_album_id = ? AND image_filename = ?';
        $params = array($pkey, $image_filename);
        db_query($sql, $params);
        break;

    case 'g':
        $tbl = 'biz_group';

        _db_admin_empty_filename($tbl, $image_filename);
        break;

    case 's':
        $tbl = 'biz_shisetsu';

        _db_admin_empty_filename($tbl, $image_filename);
        break;
    }
}

function _db_admin_empty_filename($tbl, $image_filename, $column = 'image_filename', $pkey = null)
{
    $data = array(
        db_escapeIdentifier($column) => '',
    );
    if ($pkey) {
        $where[$tbl . '_id'] = (int)$pkey;
    }
    $where[db_escapeIdentifier($column)] = $image_filename;

    db_update(db_escapeIdentifier($tbl), $data, $where);
}

function db_admin_c_profile_name_exists($name)
{
    $sql = 'SELECT c_profile_id FROM c_profile WHERE name = ?';
    $params = array($name);
    return db_get_one($sql, $params);
}

function db_admin_update_is_login_rejected($c_member_id)
{
    // function cacheを削除
    cache_drop_c_member_profile($c_member_id);

    $sql = 'SELECT is_login_rejected FROM c_member WHERE c_member_id = ?';
    $params = array(intval($c_member_id));
    $is_login_rejected = db_get_one($sql, $params);
    if (is_null($is_login_rejected)) {
        return false;
    }

    $data = array('is_login_rejected' => !($is_login_rejected));
    $where = array('c_member_id' => intval($c_member_id));
    return db_update('c_member', $data, $where);
}

function db_admin_c_admin_user_list()
{
    $sql = 'SELECT * FROM c_admin_user ORDER BY c_admin_user_id';
    return db_get_all($sql);
}

function db_admin_exists_c_admin_username($username)
{
    $sql = 'SELECT c_admin_user_id FROM c_admin_user WHERE username = ?';
    $params = array(strval($username));
    return (bool)db_get_one($sql, $params);
}

function db_admin_insert_c_admin_user($username, $password, $auth_type)
{
    $data = array(
        'username' => strval($username),
        'password' => md5($password),
        'auth_type' => strval($auth_type),
    );
    return db_insert('c_admin_user', $data);
}

function db_admin_delete_c_admin_user($c_admin_user_id)
{
    $sql = 'DELETE FROM c_admin_user WHERE c_admin_user_id = ?';
    $params = array(intval($c_admin_user_id));
    return db_query($sql, $params);
}

function db_admin_get_auth_type($c_admin_user_id)
{
    $sql = 'SELECT auth_type FROM c_admin_user WHERE c_admin_user_id = ?';
    $params = array(intval($c_admin_user_id));
    return db_get_one($sql, $params);
}

/**
 * c_member テーブル内データによるメンバーIDリスト取得
 *
 * @return array
 */
function db_admin_c_member_id_list4cond_c_member($cond_list, $type = array())
{
    $sql = 'SELECT c_member_id FROM c_member';
    $wheres = array();
    // ID(完全一致)
    if (!empty($cond_list['id'])) {
        $wheres[] = "c_member_id = ?";
        $params[] = $cond_list['id'];
    }

    // ニックネーム(あいまい検索)
    if (!empty($cond_list['nickname'])) {
        $wheres[] = "nickname LIKE ?";
        $params[] = '%' . $cond_list['nickname'] . '%';
    }

    // 開始年
    if (!empty($cond_list['s_year'])) {
        $wheres[] = 'birth_year >= ?';
        $params[] = $cond_list['s_year'];
    }
    // 終了年
    if (!empty($cond_list['e_year'])) {
        $wheres[] = 'birth_year <= ?';
        $params[] = $cond_list['e_year'];
    }

    // 誕生日による絞り込みの場合は、誕生年が0のメンバーを除外する
    if (!empty($cond_list['s_year']) || !empty($cond_list['e_year'])) {
        $wheres[] = 'birth_year <> 0';
    }

    //最終ログイン時間で絞り込み
    if ($GLOBALS['_OPENPNE_DSN_LIST']['main']['dsn']['phptype'] == 'mysql') {
        $no_login_param = '0000-00-00 00:00:00';
    } elseif ($GLOBALS['_OPENPNE_DSN_LIST']['main']['dsn']['phptype'] == 'pgsql') {
        $no_login_param = '0000-01-01 00:00:00';
    }
    if (isset($cond_list['last_login'])) {
        switch($cond_list['last_login']) {
        case 1 : // 3日以内
            $wheres[] = 'access_date >= ?';
            $params[] = date('Y-m-d', strtotime('-3 day'));
            break;
        case 2 : // 3～7日以内
            $wheres[] = 'access_date >= ? AND access_date < ?';
            $params[] = date('Y-m-d', strtotime('-7 day'));
            $params[] = date('Y-m-d', strtotime('-3 day'));
            break;
        case 3 : // 7～30日以内
            $wheres[] = 'access_date >= ? AND access_date < ?';
            $params[] = date('Y-m-d', strtotime('-30 day'));
            $params[] = date('Y-m-d', strtotime('-7 day'));
            break;
        case 4 : // 30日以上
            $wheres[] = 'access_date > ? AND access_date < ?';
            $params[] = $no_login_param;
            $params[] = date('Y-m-d', strtotime('-30 day'));
            break;
        case 5 : // 未ログイン
            $wheres[] = 'access_date = ?';
            $params[] = $no_login_param;
            break;
        }
    }

    if ($wheres) {
        $sql .= ' WHERE ' . implode(' AND ', $wheres);
    }

    // --- ソートオーダーここから

    // $orderの例：id_1 , id_2
    // 「-」の前が項目名であとが1なら昇順 2なら降順
    // プロフィール識別子であれば除外
    $is_order = false;
    if (!empty($type)) {
        $is_order = true;

        switch ($type[0]) {
        case "c_member_id":
            $sql .= ' ORDER BY c_member_id';
            break;
        case "nickname":
            $sql .= ' ORDER BY nickname';
            break;
        case "image_filename":
            $sql .= ' ORDER BY image_filename';
            break;
        case "c_member_id_invite":
            $sql .= ' ORDER BY c_member_id_invite';
            break;
        case "access_date":
            $sql .= ' ORDER BY access_date';
            break;
        case "r_date":
            $sql .= ' ORDER BY r_date';
            break;
        case "birth":
            // 降順指定
            if ($type[1] == "2") {
                $sql .= ' ORDER BY birth_year DESC, birth_month DESC, birth_day';
            } else {
                $sql .= ' ORDER BY birth_year, birth_month, birth_day';
            }
            break;
        default :
            $is_order = false;
        }

        // 降順指定
        if ($is_order && $type[1] == "2") {
            $sql .= ' DESC';
        }

    }

    // --- ソートオーダーここまで

    return db_get_col($sql, $params);
}

/**
 * PNE_POINT によるメンバーIDリスト絞り込み
 *
 * 渡されたメンバーIDの配列を条件に従い絞り込んだものを返す
 *
 * @return array
 */
function db_admin_c_member_id_list4cond_pne_point($ids, $cond_list)
{
    $s_point = null;
    $e_point = null;

    $sql = 'SELECT c_member_id'
         . ' FROM c_member_profile'
         . ' INNER JOIN c_profile USING (c_profile_id)'
         . ' WHERE name = ?';
    $params = array('PNE_POINT');

    if ($cond_list['s_rank']) {
        $s_point = db_point_get_rank_point4rank_id($cond_list['s_rank']);
        $sql .= ' AND value >= ?';
        $params[] = (int)$s_point;
    }

    if ($cond_list['e_rank']) {
        $e_point = db_point_get_next_rank_point4rank_id($cond_list['e_rank']);
        if (!is_null($e_point)) {
            $sql .= ' AND value < ?';
            $params[] = (int)$e_point;
        }
    }

    $point_ids = db_get_col($sql, $params);

    // s_point が 0 以下もしくは未定義であり、 e_point が未定義もしくは 0 を超過する場合、 c_member_profile に PNE_POINT が存在しないメンバーも結果に含める
    if ((is_null($s_point) || $s_point <= 0) && (is_null($e_point) || $e_point > 0)) {
        $sql = 'SELECT c_member_id FROM c_member_profile'
             . ' INNER JOIN c_profile USING (c_profile_id)'
             . ' WHERE name = ?';
        $params = array('PNE_POINT');
        $have_point_ids = db_get_col($sql, $params);

        // この関数に渡されたメンバーIDの配列と、PNE_POINTが存在するすべてのメンバーIDの配列の差分を結果に追加する
        $point_ids = array_merge($point_ids, array_diff($ids, $have_point_ids));
    }

    return array_intersect($ids, $point_ids);
}

/**
 * メールアドレスの有無によるメンバーIDリスト絞り込み
 *
 * 渡されたメンバーIDの配列を条件に従い絞り込んだものを返す
 *
 * @return array
 */
function db_admin_c_member_id_list4cond_mail_address($ids, $cond_list)
{
    $sql = 'SELECT c_member_id FROM c_member_secure';
    $wheres = array();

    // PCメールアドレスの有無で絞る
    if ($cond_list['is_pc_address'] == 1) {
        $wheres[] = "pc_address <> ''";
    } elseif ($cond_list['is_pc_address'] == 2) {
        $wheres[] = "pc_address = ''";
    }

    // 携帯メールアドレスの有無で絞る
    if ($cond_list['is_ktai_address'] == 1) {
        $wheres[] = "ktai_address <> ''";
    } elseif ($cond_list['is_ktai_address'] == 2) {
        $wheres[] = "ktai_address = ''";
    }

    if ($wheres) {
        $where = ' WHERE ' . implode(' AND ', $wheres);
    } else {
        $where = '';
    }
    $sql .= $where;

    $temp_ids = db_get_col($sql);

    return array_intersect($ids, $temp_ids);
}

/**
 * c_profile 内データによるメンバーIDリスト絞り込み
 *
 * 渡されたメンバーIDの配列を条件に従い絞り込んだものを返す
 *
 * @return array
 */
function db_admin_c_member_id_list4cond_c_profile($ids, $cond_list, $type)
{
    // ランクでソートとポイントでソートは同等
    if ($type[0] == 'RANK') {
        $type[0] = 'PNE_POINT';
    }

    // 各プロフィールごとに絞り込み
    $sql = 'SELECT name, form_type, c_profile_id FROM c_profile';
    $profile = db_get_all($sql);
    $profile_cond = $cond_list['profile'];

    if ($profile) {
        foreach ($profile as $value) {
            if(!empty($profile_cond[$value['name']]) ) {
               if ($value['form_type'] == 'radio' || $value['form_type'] == 'select') {
                    $sql = 'SELECT c_member_id FROM c_member_profile WHERE c_profile_option_id = ?';
                    $params = array($profile_cond[$value['name']]);
                } else if ($value['form_type'] == 'checkbox') {
                    $c_profile_option_id_list = implode(", ", $profile_cond[$value['name']]);
                    $sql = 'SELECT c_member_id FROM c_member_profile WHERE c_profile_option_id IN ( '. $c_profile_option_id_list .' )';
                    $params = array();
                } else {
                    $sql = 'SELECT c_member_id FROM c_member_profile WHERE c_profile_id = ? AND value LIKE ?';
                    $params = array($value['c_profile_id'],'%' . $profile_cond[$value['name']] . '%');
                } 
                $temp_ids = db_get_col($sql, $params);
                $ids = array_intersect($ids, $temp_ids);
            }

            if($value['name'] == $type[0]) {
                $sql = 'SELECT c_member_id FROM c_member_profile WHERE c_profile_id = ?';

                if ($value['form_type'] == 'radio'
                 || $value['form_type'] == 'select'
                 || $value['form_type'] == 'checkbox') {
                    $sql .= ' ORDER BY c_profile_option_id';
                } else {
                    if ($value['name'] == "PNE_POINT") {
                        if ($GLOBALS['_OPENPNE_DSN_LIST']['main']['dsn']['phptype'] == 'pgsql') {
                            $sql .= ' ORDER BY cast(value as integer)';
                        } else {
                            $sql .= ' ORDER BY cast(value as signed)';
                        }
                    } else {
                        $sql .= ' ORDER BY value';
                    }
                }

                if ($type[1] == "2") {
                    $sql .= ' DESC';
                }
                $params = array($value['c_profile_id']);
                $temp_ids = db_get_col($sql, $params);
                $ids = array_intersect($temp_ids, $ids);
            }
        }
    }

    return $ids;
}


/**
 * ログインIDによるメンバーIDリストソート
 *
 * @return array
 */
function db_admin_c_member_id_list_sort4username($ids, $type)
{
    $sql = 'SELECT c_member_id FROM c_username ORDER BY username';
    if ($type[1] == '2') {
        $sql .= ' DESC';
    }

    $temp_ids = db_get_col($sql, $params);
    $ids = array_intersect($temp_ids, $ids);

    return $ids;
}

/**
 * メールアドレスによるメンバ絞込み
 *
 */
function db_admin_c_member_id_list4cond_str_mail_address($ids, $cond_list)
{
    if ( !empty($cond_list['mail_address']) ) {
        $sql = 'SELECT c_member_id FROM c_member_secure' .
               ' WHERE pc_address = ? OR ktai_address = ? OR regist_address = ?';
        $enc_address = t_encrypt($cond_list['mail_address']);
        $params = array($enc_address, $enc_address, $enc_address);

        $ids = array_intersect($ids, db_get_col($sql, $params));
    }

    return $ids;
}

/**
 * ログインIDによるメンバ絞込み
 *
 */
function db_admin_c_member_id_list4cond_username($ids, $cond_list)
{
    if ( !empty($cond_list['username']) ) {
        $sql = 'SELECT c_member_id FROM c_username WHERE username = ?';
        $params = array($cond_list['username']);

        $ids = array_intersect($ids, db_get_col($sql, $params));
    }

    return $ids;
}

/**
 * メンバーIDリスト取得(絞り込み対応)
 */
function _db_admin_c_member_id_list($cond_list, $order = '')
{
    $type = explode('-', $order);
    $ids = db_admin_c_member_id_list4cond_c_member($cond_list, $type);

    // ポイントで絞り込み
    if ($cond_list['s_rank'] || $cond_list['e_rank']) {
        $ids = db_admin_c_member_id_list4cond_pne_point($ids, $cond_list);
    }

    // メールアドレスで絞り込み
    if (!empty($cond_list['is_pc_address']) || !empty($cond_list['is_ktai_address'])) {
        $ids = db_admin_c_member_id_list4cond_mail_address($ids, $cond_list);
    }

    // ログインIDでソート
    if ($type[0] == 'username' && OPENPNE_AUTH_MODE != 'email') {
        $ids = db_admin_c_member_id_list_sort4username($ids, $type);
    }

    // プロフィール項目で絞り込み
    $ids = db_admin_c_member_id_list4cond_c_profile($ids, $cond_list, $type);

    // 登録メールアドレスで絞込み
    $ids = db_admin_c_member_id_list4cond_str_mail_address($ids, $cond_list); 

    // ログインIDで絞込み
    $ids = db_admin_c_member_id_list4cond_username($ids, $cond_list);

    return $ids;
}

/**
 * メンバーリスト取得
 * 誕生年+プロフィール(select,radioのみ)
 */
function _db_admin_c_member_list($page, $page_size, &$pager, $cond_list, $order)
{
    $ids = _db_admin_c_member_id_list($cond_list, $order);
    $total_num = count($ids);
    $ids = array_slice($ids, ($page - 1) * $page_size, $page_size);

    $c_member_list = array();
    foreach ($ids as $id) {
        $c_member_list[] = db_member_c_member4c_member_id($id, true, true, 'private');
    }

    if ($total_num > 0) {
        $pager = util_make_pager($page, $page_size, $total_num);
    } else {
        $pager = array('page_size' => $page_size);
    }

    return $c_member_list;
}

/**
 * プロフィール識別名と c_profile_option_id より c_profile.value を返す
 */
function db_c_profile_get_profile_value4requested_profile($c_profile_name, $c_profile_option_id)
{
    $sql = "SELECT po.value FROM c_profile_option po"
         . " LEFT JOIN c_profile p ON po.c_profile_id = p.c_profile_id"
         . " WHERE p.form_type in ('select', 'checkbox', 'radio')"
         . " AND p.name = ?"
         . " AND po.c_profile_option_id = ?";
    $params = array($c_profile_name, intval($c_profile_option_id));

    return db_get_one($sql, $params);
}

/**
 * c_profile.name より c_profile.caption を返す
 */
function db_c_profile_get_caption4name($name)
{
    $sql = "SELECT caption FROM c_profile WHERE name = ?";
    $params = array($name);

    return db_get_one($sql, $params);
}

/**
 * メンバー絞込みパラメータ取得
 */
function validate_cond($requests)
{
    $cond_list = array();

    //ID
    if ( !empty($requests['id']) ) {
        $cond_list['id'] = intval($requests['id']);
    }

    //ログインID
    if (isset($requests['username']) && $requests['username'] !== '') {
        $cond_list['username'] = $requests['username'];
    }

    //ニックネーム
    if ( !empty($requests['nickname']) ) {
         $cond_list['nickname'] = $requests['nickname'];
    }

    //誕生年
    if (!empty($requests['s_year'])) {
        $cond_list['s_year'] = intval($requests['s_year']);
    }
    if (!empty($requests['e_year'])) {
        $cond_list['e_year'] = intval($requests['e_year']);
    }
    //プロフィール
    $profile_list = db_member_c_profile_list();
    $profile_req = $requests['profile'];

    if (is_array($profile_req)) {
        $profile_cond = array();
        foreach ($profile_list as $key => $value) {
           if (isset($profile_req[$key])) {
               if ($value['form_type'] == 'select' || $value['form_type'] == 'radio') {
                   $profile_cond[$key] = intval($profile_req[$key]);
               } else {
                   $profile_cond[$key] = $profile_req[$key];
               }
           }
        }
        $cond_list['profile'] = $profile_cond;
    }

    // 最終ログイン時間
    if (!empty($requests['last_login'])) {
        $cond_list['last_login'] = intval($requests['last_login']);
    }

    // メールアドレス
    if (!empty($requests['mail_address'])) {
        $cond_list['mail_address'] = $requests['mail_address'];
    }
    
    //PCメールアドレスの有無
    if (!empty($requests['is_pc_address'])) {
        $cond_list['is_pc_address'] = intval($requests['is_pc_address']);
    }
    //携帯メールアドレスの有無
    if (!empty($requests['is_ktai_address'])) {
        $cond_list['is_ktai_address'] = intval($requests['is_ktai_address']);
    }

    //ポイント
    if (isset($requests['s_rank']) && $requests['s_rank'] !== '') {
        $cond_list['s_rank'] = intval($requests['s_rank']);
    }
    if (isset($requests['e_rank']) && $requests['e_rank'] !== '') {
        $cond_list['e_rank'] = intval($requests['e_rank']);
    }

    return $cond_list;
}

/**
 * メンバー絞り込みパラメータ取得(プロフィール)
 */
function validate_profile_cond($requests)
{
    $cond_list = array(); 

    //プロフィール
    $profile_list = db_member_c_profile_list();

    foreach ($profile_list as $key => $value) {
        if (!empty($requests[$key])) {
            $cond_list[$key] = $requests[$key];
        }
    }

    return $cond_list;
}

function do_admin_send_mail($c_member_id, $subject, $body)
{
    $c_member = db_member_c_member4c_member_id($c_member_id, true);

    if ($c_member['secure']['pc_address']) {
        $send_address = $c_member['secure']['pc_address'];
    } else {
        $send_address = $c_member['secure']['ktai_address'];
    }

    if (OPENPNE_MAIL_QUEUE) {
        //メールキューに蓄積
        put_mail_queue($send_address, $subject, $body);
    } else {
        t_send_email($send_address, $subject, $body);
    }
}

//メッセージ受信メール（メール＆メッセージキュー蓄積対応）
function do_admin_send_message($c_member_id_from, $c_member_id_to, $subject, $body)
{
    //メッセージ
    if (OPENPNE_MESSAGE_QUEUE) {
        //メッセージキューに蓄積
        db_admin_insert_c_message_queue($c_member_id_from, $c_member_id_to, $subject, $body);
        return true;
    } else {
        $c_message_id = db_message_insert_c_message($c_member_id_from, $c_member_id_to, $subject, $body);
        do_admin_send_message_mail_send($c_member_id_to, $c_member_id_from, $subject, $body, $c_message_id);
        do_admin_send_message_mail_send_ktai($c_member_id_to, $c_member_id_from, $subject, $body);
        return true;
    }

    return false;
}

//メッセージ受信メール（メールキュー蓄積対応）
function do_admin_send_message_mail_send($c_member_id_to, $c_member_id_from, $subject, $body, $c_message_id)
{
    $c_member_to = db_member_c_member4c_member_id($c_member_id_to, true);
    $pc_address = $c_member_to['secure']['pc_address'];
    $is_receive_mail = $c_member_to['is_receive_mail'];

    $params = array(
        "c_member_to"   => db_member_c_member4c_member_id($c_member_id_to),
        "c_member_from" => db_member_c_member4c_member_id($c_member_id_from),
        'subject' => $subject,
        'body' => $body,
        'c_message_id' => $c_message_id,
    );
    return admin_fetch_send_mail($pc_address, 'm_pc_message_zyushin', $params, $is_receive_mail);
}

//◆メッセージ受信メール(携帯)
function do_admin_send_message_mail_send_ktai($c_member_id_to, $c_member_id_from, $subject, $body)
{
    $c_member_to = db_member_c_member4c_member_id($c_member_id_to, true);
    $ktai_address = $c_member_to['secure']['ktai_address'];
    $is_receive_ktai_mail = $c_member_to['is_receive_ktai_mail'];
    $p = array('kad' => t_encrypt(db_member_username4c_member_id($c_member_to['c_member_id'], true)));
    $login_url = openpne_gen_url('ktai', 'page_o_login', $p);

    $params = array(
        'c_member_to'   => db_member_c_member4c_member_id($c_member_id_to),
        'c_member_from' => db_member_c_member4c_member_id($c_member_id_from),
        'login_url' => $login_url,
        'subject' => $subject,
        'body' => $body,
    );
    return admin_fetch_send_mail($ktai_address, 'm_ktai_message_zyushin', $params, $is_receive_ktai_mail);
}

function admin_fetch_send_mail($address, $tpl_name, $params = array(), $force = true, $from = '')
{
    $tpl_name .= '.tpl';
    if ($tpl = fetch_mail_m_tpl($tpl_name, $params)) {
        list($subject, $body) = $tpl;
        if ($from) {
            if (OPENPNE_MAIL_QUEUE) {
                //メールキューに蓄積
                put_mail_queue($address, $subject, $body, $force, $from);
            } else {
                t_send_email($address, $subject, $body, $force, $from);
            }
        } else {
            if (OPENPNE_MAIL_QUEUE) {
                //メールキューに蓄積
                put_mail_queue($address, $subject, $body, $force);
            } else {
                t_send_email($address, $subject, $body, $force);
            }
        }
        return true;
    } else {
        return false;
    }
}

function db_access_analysis_c_admin_user_id4username($username)
{
    $sql = "SELECT c_admin_user_id FROM c_admin_user" .
        " WHERE username = ?";
    $params = array($username);
    return db_get_one($sql,$params);
}

function p_access_analysis_month_access_analysis_month($ktai_flag)
{
    if ($GLOBALS['_OPENPNE_DSN_LIST']['main']['dsn']['phptype'] == 'pgsql') {
        $sql = "SELECT to_char(r_datetime, 'YYYY-MM-01') as ym, count(*) as count" .
                " FROM c_access_log " .
                " where ktai_flag = ?" .
                " group by ym".
                " order by ym asc";
    } else {
        $sql = "SELECT date_format(r_datetime, '%Y-%m-01') as ym, count(*) as count" .
                " FROM c_access_log " .
                " where ktai_flag = ?" .
                " group by ym";
    }

    $params = array(intval($ktai_flag));
    $list = db_get_all($sql,$params);
    return $list;
}


function p_access_analysis_day_access_analysis_day($ym, $ktai_flag)
{
    if ($GLOBALS['_OPENPNE_DSN_LIST']['main']['dsn']['phptype'] == 'pgsql') {
        $sql = "SELECT to_char(r_datetime, 'YYYY-MM-DD') as ymd , count(*) as count" .
            " FROM c_access_log " .
            " where to_char(r_datetime, 'YYYY-MM') = ?" .
            " and ktai_flag = ? " .
            " group by ymd";
    } else {
        $sql = "SELECT left(r_datetime,10) as ymd , count(*) as count" .
                " FROM c_access_log " .
                " where left(r_datetime, 7) = ?" .
                " and ktai_flag = ? " .
                " group by ymd";
    }
    $params = array(substr($ym, 0, 7), intval($ktai_flag));
    $list = db_get_all($sql,$params);

    $year = substr($ym, 0, 4);
    $month = substr($ym, 5,2);

    $return = array();
    $days_num = date("t", mktime (0,0,0,$month,1,$year));
    for($i=1 ; $i<=$days_num; $i++) {
        $date = substr($ym,0,8) . substr("00".$i, -2, 2);

        $count = 0;
        foreach($list as $value) {
            if ($value['ymd'] == $date) {
                $count = $value['count'];
            }
        }
        $return[] = array("ymd"=>$date, "count"=>$count);
    }
    return $return;
}

function get_page_name($ktai_flag, $orderby=1)
{
    if ($orderby == 1) {
        $orderby_str = " order by page_name asc";
    } elseif ($orderby == -1) {
        $orderby_str = " order by page_name desc";
    }
    $sql = "select distinct page_name from c_access_log " .
            " where ktai_flag = ? " .
            $orderby_str;
    $params = array(intval($ktai_flag));
    return db_get_col($sql,$params);
}

function p_access_analysis_page_access_analysis_page4ym($ymd, $month_flag, $ktai_flag, $orderby)
{

    if ($orderby == 1) {
        $orderby_str = " order by page_name asc";
    } elseif ($orderby == -1) {
        $orderby_str = " order by page_name desc";
    } elseif ($orderby == 2) {
        $orderby_str = " order by count asc";
    } elseif ($orderby == -2) {
        $orderby_str = " order by count desc";
    }
    $sql = "select page_name , count(*) as count from c_access_log where ktai_flag = ? ";
    $params = array(intval($ktai_flag));
    if ($month_flag) {
        if ($GLOBALS['_OPENPNE_DSN_LIST']['main']['dsn']['phptype'] == 'pgsql') {
            $sql .= " and to_char(r_datetime, 'YYYY-MM') = ? ";
        } else {
            $sql .= " and left(r_datetime, 7) = ? ";
        }

        array_push($params,substr($ymd,0,7));
    } else {
        if ($GLOBALS['_OPENPNE_DSN_LIST']['main']['dsn']['phptype'] == 'pgsql') {
            $sql .= " and to_char(r_datetime, 'YYYY-MM-DD') = ? ";
        } else {
            $sql .= " and left(r_datetime,10) = ? ";
        }
        array_push($params,$ymd);
    }
    $sql .= " group by page_name ".    $orderby_str;
    $list = db_get_all($sql,$params);

    $sum = 0;
    $return = array();
    if (abs($orderby) == 1) {
        $page_name = get_page_name($ktai_flag, $orderby);
        foreach($page_name as $name) {
            $count = 0;
            foreach($list as $value) {
                if ($value['page_name'] == $name) $count = $value['count'];
            }

                list($is_target_c_member_id,$is_target_c_commu_id,$is_target_c_topic_id,$is_target_c_diary_id,$is_c_member_id) = get_is_show($name);

            $return[] = array("page_name"=>$name, "count"=> $count, "is_target_c_member_id"=> $is_target_c_member_id, "is_target_c_commu_id"=> $is_target_c_commu_id, "is_target_c_topic_id"=> $is_target_c_topic_id, "is_target_c_diary_id"=> $is_target_c_diary_id, "is_c_member_id"=> $is_c_member_id);
            $sum += $count;
        }
    } elseif (abs($orderby) == 2) {
        $page_name = get_page_name($ktai_flag);

        $t_page_name = $page_name;

        //アクセスがゼロのページを取得する
        foreach($page_name as $key=>$name) {
            foreach($list as $value) {
                if ($value['page_name'] == $name) {
                    unset($page_name[$key]);//$listに含まれるページネームを削除
                }
            }
        }

        foreach($page_name as $key=>$name) {
            $page_name[$key] = array("page_name"=>$name, "count"=>0);
        }

        if ($orderby == 2) {
            $return = array_merge($page_name , $list);
        } elseif ($orderby == -2) {
            $return = array_merge($list, $page_name);
        }
        foreach($list as $value) {
            $sum += $value['count'];
        }

        foreach($return as $value) {

            list($is_target_c_member_id,$is_target_c_commu_id,$is_target_c_topic_id,$is_target_c_diary_id,$is_c_member_id) = get_is_show($value['page_name']);

            $value['is_target_c_member_id'] = $is_target_c_member_id;
            $value['is_target_c_commu_id'] = $is_target_c_commu_id;
            $value['is_target_c_topic_id'] = $is_target_c_topic_id;
            $value['is_target_c_diary_id'] = $is_target_c_diary_id;
            $value['is_c_member_id'] = $is_c_member_id;
            $t_return[] = $value;

        }

        $return = $t_return;

    }

    return array($return, $sum);
}


/*
 * target_commu
 *
 */
function p_access_analysis_target_commu_target_commu4ym_page_name
($ymd, $month_flag, $page_name, $ktai_flag, $page, $page_size, $orderby=1)
{

    $start = ($page - 1) * $page_size;

    if ($orderby == 1) {
        $orderby_str = " order by target_c_commu_id asc";
    } elseif ($orderby == -1) {
        $orderby_str = " order by target_c_commu_id desc";
    } elseif ($orderby == 2) {
        $orderby_str = " order by count asc";
    } elseif ($orderby == -2) {
        $orderby_str = " order by count desc";
    }

    $sql = "select target_c_commu_id , count(*) as count from c_access_log  where ktai_flag = ? ";
    $params = array(intval($ktai_flag));
    if ($month_flag) {
        if ($GLOBALS['_OPENPNE_DSN_LIST']['main']['dsn']['phptype'] == 'pgsql') {
            $sql .= " and to_char(r_datetime, 'YYYY-MM') = ? ";
        } else {
            $sql .= " and left(r_datetime, 7) = ? ";
        }
        array_push($params,substr($ymd,0,7));
    } else {
        if ($GLOBALS['_OPENPNE_DSN_LIST']['main']['dsn']['phptype'] == 'pgsql') {
            $sql .= " and to_char(r_datetime, 'YYYY-MM-DD') = ? ";
        } else {
            $sql .= " and left(r_datetime,10) = ? ";
        }
        array_push($params,$ymd);
    }
    if ($page_name!="all") {
            $sql .= " and page_name = ? ";
            array_push($params,$page_name);
    }
    $sql .= " and target_c_commu_id <> 0 ";

    $sql .= " group by target_c_commu_id " .$orderby_str;
    if ($page_size != -1) {
        $list = db_get_all_limit($sql, $start, $page_size, $params);
    }
    else {
        $list = db_get_all($sql, $params);
    }

    $return = array();
    $sum = 0;
    foreach($list as $key => $value) {
        if ($c_commu = db_commu_c_commu4c_commu_id($value['target_c_commu_id'])) {
            $value['is_c_commu_exists'] = true;
            $return[] = array_merge($value, $c_commu);
        } else {
            $value['is_c_commu_exists'] = false;
            $return[] = $value;
        }
        $sum += $value['count'];
    }

    $sql =   "select count(*) from c_access_log  where ktai_flag = ? ";
    $params = array(intval($ktai_flag));
    if ($month_flag) {
        if ($GLOBALS['_OPENPNE_DSN_LIST']['main']['dsn']['phptype'] == 'pgsql') {
            $sql .= " and to_char(r_datetime, 'YYYY-MM') = ? ";
        } else {
            $sql .= " and left(r_datetime, 7) = ? ";
        }
        array_push($params,substr($ymd,0,7));
    } else {
        if ($GLOBALS['_OPENPNE_DSN_LIST']['main']['dsn']['phptype'] == 'pgsql') {
            $sql .= " and to_char(r_datetime, 'YYYY-MM-DD') = ? ";
        } else {
            $sql .= " and left(r_datetime,10) = ? ";
        }
        array_push($params,$ymd);
    }
    if ($page_name!="all") {
        $sql .= " and page_name = ? ";
        array_push($params,$page_name);
    }
    $sql .= " and target_c_commu_id <> 0 ";
    $sql .= " group by target_c_commu_id ";
    $result = db_get_all($sql,$params);
    $total_num = count($result);

    if ($total_num != 0) {
        $total_page_num =  ceil($total_num / $page_size);
        if ($page >= $total_page_num) {
            $next = false;
        }else{
            $next = true;
        }
        if ($page <= 1) {
            $prev = false;
        }else{
            $prev = true;
        }
    }
    $start_num = ($page - 1) * $page_size + 1 ;
    $end_num =   ($page - 1) * $page_size + $page_size > $total_num ? $total_num : ($page - 1) * $page_size + $page_size ;

    return array($return, $sum, $prev, $next, $total_num, $start_num, $end_num);
}

function p_access_analysis_target_topic_target_topic4ym_page_name
($ymd, $month_flag, $page_name, $ktai_flag, $page, $page_size, $orderby=1)
{
    $start = ($page - 1) * $page_size;

    if ($orderby == 1) {
        $orderby_str = " order by target_c_commu_topic_id asc";
    } elseif ($orderby == -1) {
        $orderby_str = " order by target_c_commu_topic_id desc";
    } elseif ($orderby == 2) {
        $orderby_str = " order by count asc";
    } elseif ($orderby == -2) {
        $orderby_str = " order by count desc";
    }
    $where =" where ktai_flag = ? ";
    $params = array(intval($ktai_flag));
    if ($month_flag) {
        if ($GLOBALS['_OPENPNE_DSN_LIST']['main']['dsn']['phptype'] == 'pgsql') {
            $where .= " and to_char(r_datetime, 'YYYY-MM') = ? ";
        } else {
            $where .= " and left(r_datetime, 7) = ? ";
        }
        array_push($params,substr($ymd,0,7));
    } else {
        if ($GLOBALS['_OPENPNE_DSN_LIST']['main']['dsn']['phptype'] == 'pgsql') {
            $where .= " and to_char(r_datetime, 'YYYY-MM-DD') = ? ";
        } else {
            $where .= " and left(r_datetime,10) = ? ";
        }
        array_push($params,$ymd);
    }
    if ($page_name!="all") {
            $where .= " and page_name = ? ";
            array_push($params,$page_name);
    }
    $where .= ' and target_c_commu_topic_id <> 0 ';
    $sql = "select target_c_commu_topic_id , count(*) as count from c_access_log ";
    $sql .= $where." group by target_c_commu_topic_id " .$orderby_str;
    if ($page_size != -1) {
        $list = db_get_all_limit($sql, $start, $page_size, $params);
    }
    else {
        $list = db_get_all($sql, $params);
    }
    $sql = "select count(*) from c_access_log ";
    $sql .= $where ." group by target_c_commu_topic_id ";
    $result = db_get_all($sql,$params);
    $total_num = count($result);

    $return = array();
    $sum = 0;
    foreach ($list as $key => $value) {
        if ($value['target_c_commu_topic_id']) {
            if ($c_commu_topic = db_commu_c_topic4c_commu_topic_id($value['target_c_commu_topic_id'])) {
                $c_commu_topic['topic_name'] = $c_commu_topic['name'];
                $c_commu = db_commu_c_commu4c_commu_id($c_commu_topic['c_commu_id']);
                $c_commu_topic['commu_name'] = $c_commu['name'];
                $value['is_c_commu_topic_exists'] = true;
                $return[] = array_merge($value, $c_commu_topic);
            } else {
                $value['is_c_commu_topic_exists'] = false;
                $return[] = $value;
            }
            $sum += $value['count'];
        }
    }

    if ($total_num != 0) {
        $total_page_num =  ceil($total_num / $page_size);
        if ($page >= $total_page_num) {
            $next = false;
        } else {
            $next = true;
        }
        if ($page <= 1) {
            $prev = false;
        } else {
            $prev = true;
        }
    }
    $start_num = ($page - 1) * $page_size + 1 ;
    $end_num =   ($page - 1) * $page_size + $page_size > $total_num ? $total_num : ($page - 1) * $page_size + $page_size ;

    return array($return, $sum, $prev, $next, $total_num, $start_num, $end_num);
}

function p_access_analysis_target_diary_target_diary4ym_page_name
($ymd, $month_flag, $page_name, $ktai_flag, $page, $page_size, $orderby=1)
{

    $start = ($page - 1) * $page_size;

    if ($orderby == 1) {
        $orderby_str = " order by target_c_diary_id asc";
    } elseif ($orderby == -1) {
        $orderby_str = " order by target_c_diary_id desc";
    } elseif ($orderby == 2) {
        $orderby_str = " order by count asc";
    } elseif ($orderby == -2) {
        $orderby_str = " order by count desc";
    }

    $sql = "select target_c_diary_id , count(*) as count from c_access_log where ktai_flag = ? ";
    $params = array(intval($ktai_flag));
    if ($month_flag) {
        if ($GLOBALS['_OPENPNE_DSN_LIST']['main']['dsn']['phptype'] == 'pgsql') {
            $sql .= " and to_char(r_datetime, 'YYYY-MM') = ? ";
        } else {
            $sql .= " and left(r_datetime, 7) = ? ";
        }
        array_push($params,substr($ymd,0,7));
    } else {
        if ($GLOBALS['_OPENPNE_DSN_LIST']['main']['dsn']['phptype'] == 'pgsql') {
            $sql .= " and to_char(r_datetime, 'YYYY-MM-DD') = ? ";
        } else {
            $sql .= " and left(r_datetime,10) = ? ";
        }
        array_push($params,$ymd);
    }
    if ($page_name!="all") {
        $sql .= " and page_name = ? ";
        array_push($params,$page_name);
    }
    $sql .= " and target_c_diary_id <> 0 ";
    $sql .= " group by target_c_diary_id " . $orderby_str;
    if ($page_size != -1) {
        $list = db_get_all_limit($sql, $start, $page_size, $params);
    }
    else {
        $list = db_get_all($sql, $params);
    }

    $return = array();
    $sum = 0;
    foreach ($list as $key => $value) {
        if ($c_diary = db_diary_get_c_diary4id($value['target_c_diary_id'])) {
            $c_member = db_member_c_member4c_member_id($c_diary['c_member_id']);
            $c_diary['nickname'] = $c_member['nickname'];
            $value['is_c_diary_exists'] = true;
            $return[] = array_merge($value, $c_diary);
        } else {
            $value['is_c_diary_exists'] = false;
            $return[] = $value;
        }
        $sum += $value['count'];
    }

    $sql =   "select count(*) from c_access_log where ktai_flag = ? ";
    $params = array(intval($ktai_flag));
    if ($month_flag) {
        if ($GLOBALS['_OPENPNE_DSN_LIST']['main']['dsn']['phptype'] == 'pgsql') {
            $sql .= " and to_char(r_datetime, 'YYYY-MM') = ? ";
        } else {
            $sql .= " and left(r_datetime, 7) = ? ";
        }
        array_push($params,substr($ymd,0,7));
    } else {
        if ($GLOBALS['_OPENPNE_DSN_LIST']['main']['dsn']['phptype'] == 'pgsql') {
            $sql .= " and to_char(r_datetime, 'YYYY-MM-DD') = ? ";
        } else {
            $sql .= " and left(r_datetime,10) = ? ";
        }
        array_push($params,$ymd);
    }
    $sql .= " and target_c_diary_id <> 0 ";
    $sql .= " group by target_c_diary_id ";
    $result = db_get_all($sql,$params);
    $total_num = count($result);

    if ($total_num != 0) {
        $total_page_num =  ceil($total_num / $page_size);
        if ($page >= $total_page_num) {
            $next = false;
        }else{
            $next = true;
        }
        if ($page <= 1) {
            $prev = false;
        }else{
            $prev = true;
        }
    }
    $start_num = ($page - 1) * $page_size + 1 ;
    $end_num =   ($page - 1) * $page_size + $page_size > $total_num ? $total_num : ($page - 1) * $page_size + $page_size ;

    return array($return, $sum, $prev, $next, $total_num, $start_num, $end_num);
}

function p_access_analysis_member_access_member4ym_page_name
($ymd, $month_flag, $page_name, $ktai_flag, $page, $page_size, $orderby=1)
{
    $start = ($page - 1) * $page_size;

    if ($orderby == 1) {
        $orderby_str = " order by c_member_id asc";
    } elseif ($orderby == -1) {
        $orderby_str = " order by c_member_id desc";
    } elseif ($orderby == 2) {
        $orderby_str = " order by count asc";
    } elseif ($orderby == -2) {
        $orderby_str = " order by count desc";
    }

    $where =" where ktai_flag = ? ";
    $params = array(intval($ktai_flag));
    if ($month_flag) {
        if ($GLOBALS['_OPENPNE_DSN_LIST']['main']['dsn']['phptype'] == 'pgsql') {
            $where .= " and to_char(r_datetime, 'YYYY-MM') = ? ";
        } else {
            $where .= " and left(r_datetime, 7) = ? ";
        }
        array_push($params,substr($ymd,0,7));
    } else {
        if ($GLOBALS['_OPENPNE_DSN_LIST']['main']['dsn']['phptype'] == 'pgsql') {
            $where .= " and to_char(r_datetime, 'YYYY-MM-DD') = ? ";
        } else {
            $where .= " and left(r_datetime,10) = ? ";
        }
        array_push($params,$ymd);
    }
    if ($page_name!="all") {
        $where .= " and page_name = ? ";
        array_push($params,$page_name);
    }

    $sql = "select c_member_id , count(*) as count from c_access_log";
    $sql .= $where." group by c_member_id $orderby_str";
    if ($page_size != -1) {
        $list = db_get_all_limit($sql, $start, $page_size, $params);
    }
    else {
        $list = db_get_all($sql, $params);
    }
    $sql = "select count(*) from c_access_log ";
    $sql .=    $where ." group by c_member_id ";
    $result = db_get_all($sql,$params);
    $total_num = count($result);

    $return = array();
    $sum = 0;
    foreach($list as $key => $value) {
        if ($value['c_member_id']) {
            if ($c_member = _db_c_member4c_member_id($value['c_member_id'])) {
                $value['is_c_member_exists'] = true;
                $return[] = array_merge($value, $c_member);
            } else {
                $value['is_c_member_exists'] = false;
                $return[] = $value;
            }
            $sum += $value['count'];
        }
    }


    if ($total_num != 0) {
        $total_page_num =  ceil($total_num / $page_size);
        if ($page >= $total_page_num) {
            $next = false;
        }else{
            $next = true;
        }
        if ($page <= 1) {
            $prev = false;
        }else{
            $prev = true;
        }
    }
    $start_num = ($page - 1) * $page_size + 1 ;
    $end_num =   ($page - 1) * $page_size + $page_size > $total_num ? $total_num : ($page - 1) * $page_size + $page_size ;
    return array($return, $sum, $prev, $next, $total_num, $start_num, $end_num);
}

function p_access_analysis_target_member_access_member4ym_page_name
($ymd, $month_flag, $page_name, $ktai_flag, $page, $page_size, $orderby=1)
{
    $start = ($page - 1) * $page_size;

    if ($orderby == 1) {
        $orderby_str = " order by target_c_member_id asc";
    } elseif ($orderby == -1) {
        $orderby_str = " order by target_c_member_id desc";
    } elseif ($orderby == 2) {
        $orderby_str = " order by count asc";
    } elseif ($orderby == -2) {
        $orderby_str = " order by count desc";
    }
    $where =" where ktai_flag = ? ";
    $params = array(intval($ktai_flag));
    if ($month_flag) {
        if ($GLOBALS['_OPENPNE_DSN_LIST']['main']['dsn']['phptype'] == 'pgsql') {
            $where .= " and to_char(r_datetime, 'YYYY-MM') = ? ";
        } else {
            $where .= " and left(r_datetime, 7) = ? ";
        }
        array_push($params,substr($ymd,0,7));
    } else {
        if ($GLOBALS['_OPENPNE_DSN_LIST']['main']['dsn']['phptype'] == 'pgsql') {
            $where .= " and to_char(r_datetime, 'YYYY-MM-DD') = ? ";
        } else {
            $where .= " and left(r_datetime,10) = ? ";
        }
        array_push($params,$ymd);
    }
    if ($page_name != "all") {
        $where .= " and page_name = ? ";
        array_push($params,$page_name);
    }
    $sql = "select target_c_member_id , count(*) as count from c_access_log ";
    $sql .= $where;
    $sql .= " AND target_c_member_id <> 0 ";
    $sql .= " group by target_c_member_id " . $orderby_str;

    if ($page_size != -1) {
        $list = db_get_all_limit($sql, $start, $page_size, $params);
    }
    else {
        $list = db_get_all($sql, $params);
    }

    $return = array();
    $sum = 0;
    foreach ($list as $key => $value) {
        if ($c_member = db_member_c_member4c_member_id($value['target_c_member_id'])) {
            $value['is_c_member_exists'] = true;
            $return[] = array_merge($value, $c_member);
        } else {
            $value['is_c_member_exists'] = false;
            $return[] = $value;
        }
        $sum += $value['count'];
    }

    $where =" where ktai_flag = ? ";
    $params = array(intval($ktai_flag));
    if ($month_flag) {
        if ($GLOBALS['_OPENPNE_DSN_LIST']['main']['dsn']['phptype'] == 'pgsql') {
            $where .= " and to_char(r_datetime, 'YYYY-MM') = ? ";
        } else {
            $where .= " and left(r_datetime, 7) = ? ";
        }
        array_push($params,substr($ymd,0,7));
    } else {
        if ($GLOBALS['_OPENPNE_DSN_LIST']['main']['dsn']['phptype'] == 'pgsql') {
            $where .= " and to_char(r_datetime, 'YYYY-MM-DD') = ? ";
        } else {
            $where .= " and left(r_datetime,10) = ? ";
        }
        array_push($params,$ymd);
    }
    if ($page_name != "all") {
        $where .= " and page_name = ? ";
        array_push($params,$page_name);
    }
    $sql = "select count(*) from c_access_log " ;
    $sql .= $where;
    $sql .= " AND target_c_member_id <> 0 ";
    $sql .= " group by target_c_member_id ";

    $result = db_get_all($sql,$params);
    $total_num = count($result);

    if ($total_num != 0) {
        $total_page_num =  ceil($total_num / $page_size);
        if ($page >= $total_page_num) {
            $next = false;
        } else {
            $next = true;
        }
        if ($page <= 1) {
            $prev = false;
        } else {
            $prev = true;
        }
    }
    $start_num = ($page - 1) * $page_size + 1 ;
    $end_num =   ($page - 1) * $page_size + $page_size > $total_num ? $total_num : ($page - 1) * $page_size + $page_size ;

    return array($return, $sum, $prev, $next, $total_num, $start_num, $end_num);
}

function get_is_show($name)
{

    $is_target_c_member_id = 0;
    $is_target_c_commu_id  = 0;
    $is_target_c_topic_id  = 0;
    $is_target_c_diary_id  = 0;
    $is_c_member_id        = 1;


    //必要のない詳細ボタンを消す
    $list = explode("_", $name);
    $is_c_member_id = 1;

    if (strpos($list[0], 'f') !== false) {
        $is_target_c_member_id = 1;
    }
    if (strpos($list[0], 'c') !== false) {
        $is_target_c_commu_id = 1;
    }

    if (strpos($name, 'topic') !== false || strpos($name, 'event') !== false) {
        $is_target_c_topic_id = 1;
    }
    if (strpos($name, 'diary') !== false) {
        $is_target_c_diary_id = 1;
    }


    return array($is_target_c_member_id,$is_target_c_commu_id,$is_target_c_topic_id,$is_target_c_diary_id,$is_c_member_id);

}

/**

カラムごとに条件を指定して絞ったメンバーの一覧を返す

[引数]
適時追加していく

$s_access_date    最終ログイン時刻　開始年月日
$e_access_date    最終ログイン時刻　終了年月日

[返り値]
c_member_list

*/
function p_member_edit_c_member_list($page_size, $page, $s_access_date='', $e_access_date='')
{
    $page = intval($page);
    $page_size = intval($page_size);

    $wheres = array();
    $params = array();

    //指定された条件で絞っていく
    if ($s_access_date != '') {
        $wheres[] = 'access_date >= ?';
        $params[] = $s_access_date;
    }

    if ($e_access_date != '') {
        $wheres[] = 'access_date < ?';
        $params[] = $e_access_date;
    }

    if ($wheres) {
        $where = ' WHERE ' . implode(' AND ', $wheres);
    } else {
        $where = '';
    }

    $select = "SELECT * FROM c_member";
    $order = " order by c_member_id";
    $sql = $select . $where . $order;
    if ($page_size > 0) {
        $list = db_get_all_page($sql, $page, $page_size, $params);
    } else {
        $list = db_get_all($sql, $params);
    }

    $sql = "select count(*) from c_member".$where;

    $total_num = db_get_one($sql, $params);

    if ($total_num != 0 && $page_size != 0) {
        $total_page_num =  ceil($total_num / $page_size);
        if ($page >= $total_page_num) {
            $next = false;
        } else {
            $next = true;
        }
        if ($page <= 1) {
            $prev = false;
        } else {
            $prev = true;
        }
    }

    return array($list , $prev , $next, $total_num);
}

function _db_c_member4c_member_id($c_member_id)
{
    $sql = "SELECT * FROM c_member WHERE c_member_id= ? ";
        $params = array(intval($c_member_id));
    return db_get_row($sql,$params);
}

/**
 * 男と女の人数を取得
 */
function get_analysis_sex()
{
    $sql = "select count(*) from c_member where sex = '男'";
    $analysis_sex['male'] = get_one4db($sql);
    $sql = "select count(*) from c_member where sex = '女'";
    $analysis_sex['female'] = get_one4db($sql);

    return $analysis_sex;

}

/**
 * 世代の人数を取得
 */
function get_analysis_generation()
{
    $analysis_generation = array(
            '0～9' => 0,
            '10～19' => 0,
            '20～29' => 0,
            '30～39' => 0,
            '40～49' => 0,
            '50～59' => 0,
            '60～69' => 0,
            '70～79' => 0,
            '80～' =>0
    );

    if ($GLOBALS['_OPENPNE_DSN_LIST']['main']['dsn']['phptype'] == 'pgsql') {
        $sql = "SELECT ((date_part('year', now()) - birth_year)- " .
            "cast(to_char(CURRENT_DATE, 'MMDD')<(to_char(birth_month, '00') || '-' || to_char(birth_day, '00')) as int)) " .
            "AS age FROM c_member WHERE birth_year <> 0;";
    } else {
        $today = getdate();
        $mmdd = $today['mon'] * 100 + $today['mday'];
        $sql = 'SELECT ' . $today['year'] . ' - birth_year'
             . ' - (' . $mmdd . ' < (birth_month * 100 + birth_day))'
             . ' AS age FROM c_member WHERE birth_year <> 0';
    }
    $lst = db_get_all($sql);

    $temp = array_keys($analysis_generation);
    foreach($lst as $value) {
        $key = (int)($value['age'] / 10);
        if ($key > count($analysis_generation)-1) {
            $analysis_generation[$temp[count($analysis_generation)-1]]++;
        } else {
            $analysis_generation[$temp[$key]]++;
        }
    }

    return $analysis_generation;

}

/**
 * 地域別の人数を取得
 */
function get_analysis_region()
{
    $pref = p_regist_prof_c_profile_pref_list4null();
    $sql = "select pre_addr_c_profile_pref_id as pref_id from c_member";
    $lst = get_array_list4db($sql);

    foreach($pref as $value) {
        $analysis_region[$value] = 0;
    }

    foreach ($lst as $value) {
        if ($value['pref_id'] == 0) {
            $analysis_region['その他']++;
        } else {
            $analysis_region[$pref[$value['pref_id']]]++;
        }
    }

    return $analysis_region;

}

function get_analysis_date_month($year = "", $month = "")
{
    if ($GLOBALS['_OPENPNE_DSN_LIST']['main']['dsn']['phptype'] == 'pgsql') {
        $sql = "select to_char(r_date,'YYYY-MM') from c_member order by r_date";
    } else {
        $sql = "select date_format(r_date,'%Y-%m') from c_member order by r_date";
    }
    $start_date = db_get_one($sql);

    $i = 0;
    list($y, $m) = split("-",$start_date);
    do{
        $date = date("Y-m", mktime (0,0,0,$m+$i++,1,$y));
        $analysis_date_month[$date] = 0;
    }while($date < date("Y-m"));

    if ($GLOBALS['_OPENPNE_DSN_LIST']['main']['dsn']['phptype'] == 'pgsql') {
        $sql = "select to_char(r_date,'YYYY-MM') as d from c_member";
    } else {
        $sql = "select date_format(r_date,'%Y-%m') as d from c_member";
    }
    $lst = db_get_all($sql);
    foreach ($lst as $value) {
        $analysis_date_month[$value['d']]++;
    }
    return $analysis_date_month;
}

function get_analysis_date_day_d($date="")
{
    if ($date == "") {
       $date = date("Y-m-d");
    }
    return $date;
}


function get_analysis_date_day($date="")
{
    if ($date == "") {
        $date = date("Y-m");
    }
    //一ヶ月の日数
    $day_num = date("t", strtotime($date));

    for($i=1 ; $i<=$day_num; $i++) {
        //一桁の数を二桁にする
        if ($i < 10) {
            $i = "0".$i;
        }
        $analysis_date_day[$i] = 0;
    }

    if ($GLOBALS['_OPENPNE_DSN_LIST']['main']['dsn']['phptype'] == 'pgsql') {
        $sql = "select to_char(r_date,'DD') as d from c_member where to_char(r_date,'YYYY-MM') = ?";
    } else {
        $sql = "select date_format(r_date,'%d') as d from c_member where date_format(r_date,'%Y-%m') = ?";
    }
    $params = array($date);
    $lst = db_get_all($sql,$params);

    foreach($lst as $value) {
        $analysis_date_day[$value['d']]++;
    }

    return $analysis_date_day;
}

function p_access_analysis_select_profile_list()
{
    $sql = "SELECT * " .
            " FROM c_profile " .
            " where form_type = 'select' ";

    $list = db_get_all($sql);
    return $list;
}

/**
 * 指定されたIDのプロフィールの人数別一覧を作成
 */
function get_analysis_profile($c_profile_id)
{
    $sql = "select count(*) as count,value,c_profile.caption from c_member_profile " .
        " LEFT JOIN c_profile ON c_profile.c_profile_id = c_member_profile.c_profile_id " .
        " WHERE c_member_profile.c_profile_id = ? GROUP BY value ";
    $params = array(intval($c_profile_id));
    $analysis_profile = db_get_all($sql,$params);

    return $analysis_profile;
}

function get_analysis_count_profile_all($c_profile_id)
{
    $sql = "select count(*) as count from c_member_profile " .
        " WHERE c_profile_id = ? ";
    $params = array(intval($c_profile_id));
    $analysis_profile = db_get_one($sql,$params);

    return $analysis_profile;
}

function analysis_profile4c_profile_id($c_profile_id)
{
    $sql = "SELECT * FROM c_profile" .
            " WHERE c_profile_id = ? ";
    $params = array(intval($c_profile_id));
    $profile = db_get_row($sql,$params);

    return $profile;
}

function monitor_diary_list($keyword, $page_size, $page)
{
    $page = intval($page);
    $page_size = intval($page_size);

    $wheres = array();

    if ($keyword) {
        //全角空白を半角に統一
        $keyword = str_replace('　', ' ', $keyword);
        $keyword_list = explode(' ', $keyword);

        for ($i = 0; $i < count($keyword_list); $i++) {
            $keyword = check_search_word($keyword_list[$i]);

            $wheres[] = '(subject LIKE ? OR body LIKE ?)';
            $params[] = '%' . $keyword . '%';
            $params[] = '%' . $keyword . '%';
        }
    }
    if ($wheres) {
        $where = ' WHERE ' . implode(' AND ', $wheres);
    } else {
        $where = '';
    }

    $select = "SELECT *";
    $from = " FROM c_diary";
    $order = " ORDER BY r_datetime DESC";

    $sql = $select . $from . $where . $order;
    $list = db_get_all_limit($sql,($page-1)*$page_size,$page_size,$params);
    foreach ($list as $key => $value) {
        $list[$key]['c_member'] = db_member_c_member_with_profile($value['c_member_id']);
        $list[$key]['count_comments'] = db_diary_count_c_diary_comment4c_diary_id($value['c_diary_id']);
    }

    $sql =
        "SELECT COUNT(*) "
        . $from
        . $where ;
    $total_num = db_get_one($sql, $params);

    $total_page_num =  ceil($total_num / $page_size);
    $next = ($page < $total_page_num);
    $prev = ($page > 1);

    return array($list , $prev , $next, $total_num, $total_page_num);
}

function monitor_diary_list4c_diary_id($c_diary_id, $page_size, $page)
{
    $page = intval($page);
    $page_size = intval($page_size);

    $where = " WHERE c_diary_id = ? ";
    $params[] = intval($c_diary_id);

    $select = "SELECT c_diary.*";
    $from = " FROM c_diary";
    $order = " ORDER BY r_datetime DESC";

    $sql = $select . $from . $where . $order;
    $list = db_get_all_limit($sql,($page-1)*$page_size,$page_size,$params);
    foreach ($list as $key => $value) {
        $list[$key]['c_member'] = db_member_c_member_with_profile($value['c_member_id']);
        $list[$key]['count_comments'] = db_diary_count_c_diary_comment4c_diary_id($value['c_diary_id']);
    }

    $sql =
        "SELECT COUNT(*) "
        . $from
        . $where ;
    $total_num = db_get_one($sql, $params);

    $total_page_num =  ceil($total_num / $page_size);
    $next = ($page < $total_page_num);
    $prev = ($page > 1);

    return array($list , $prev , $next, $total_num, $total_page_num);
}

function monitor_diary_comment_list($keyword, $page_size, $page)
{
    $page = intval($page);
    $page_size = intval($page_size);

    $wheres = array();

    if ($keyword) {
        //全角空白を半角に統一
        $keyword = str_replace('　', ' ', $keyword);
        $keyword_list = explode(' ', $keyword);

        for($i = 0; $i < count($keyword_list); $i++) {
            $keyword = check_search_word($keyword_list[$i]);

            $wheres[] = 'c_diary_comment.body LIKE ?';
            $params[] = '%' . $keyword . '%';
        }
    }

    if ($wheres) {
        $where = ' WHERE ' . implode(' AND ', $wheres);
    } else {
        $where = '';
    }

    $select = "SELECT c_diary_comment.*, c_diary.subject";
    $from = " FROM c_diary_comment"
        ." LEFT JOIN c_diary ON c_diary.c_diary_id = c_diary_comment.c_diary_id ";
    $order = " ORDER BY r_datetime desc";

    $sql = $select . $from . $where . $order;
    $list = db_get_all_limit($sql,($page-1)*$page_size,$page_size,$params);
    foreach ($list as $key => $value) {
        $list[$key]['c_member'] = db_member_c_member_with_profile($value['c_member_id']);
        $list[$key]['count_comments'] = db_diary_count_c_diary_comment4c_diary_id($value['c_diary_id']);
    }

    $sql =
        "SELECT COUNT(*) "
        . $from
        . $where ;
    $total_num = db_get_one($sql, $params);

    $total_page_num =  ceil($total_num / $page_size);
    $next = ($page < $total_page_num);
    $prev = ($page > 1);

    return array($list , $prev , $next, $total_num, $total_page_num);
}

function monitor_diary_comment_list4c_diary_comment_id($c_diary_comment_id, $page_size, $page)
{
    $page = intval($page);
    $page_size = intval($page_size);

    $where = " WHERE c_diary_comment.c_diary_comment_id = ? ";
    $params[] = intval($c_diary_comment_id);

    $select = "SELECT c_diary_comment.*, c_diary.subject";
    $from = " FROM c_diary_comment"
        ." LEFT JOIN c_diary ON c_diary.c_diary_id = c_diary_comment.c_diary_id ";
    $order = " ORDER BY r_datetime desc";

    $sql = $select . $from . $where . $order;
    $list = db_get_all_limit($sql,($page-1)*$page_size,$page_size,$params);

    foreach ($list as $key => $value) {
        $list[$key]['c_member'] = db_member_c_member_with_profile($value['c_member_id']);
        $list[$key]['count_comments'] = db_diary_count_c_diary_comment4c_diary_id($value['c_diary_id']);
    }

    $sql =
        "SELECT COUNT(*) "
        . $from
        . $where ;
    $total_num = db_get_one($sql, $params);

    $total_page_num =  ceil($total_num / $page_size);
    $next = ($page < $total_page_num);
    $prev = ($page > 1);

    return array($list , $prev , $next, $total_num, $total_page_num);
}

function monitor_diary_comment_list4c_diary_id($c_diary_id, $page_size, $page)
{
    $page = intval($page);
    $page_size = intval($page_size);

    $where = " WHERE c_diary_comment.c_diary_id = ? ";
    $params[] = intval($c_diary_id);

    $select = "SELECT c_diary_comment.*, c_diary.subject";
    $from = " FROM c_diary_comment"
        ." LEFT JOIN c_diary ON c_diary.c_diary_id = c_diary_comment.c_diary_id ";
    $order = " ORDER BY r_datetime desc";

    $sql = $select . $from . $where . $order;
    $list = db_get_all_limit($sql,($page-1)*$page_size,$page_size,$params);

    foreach ($list as $key => $value) {
        $list[$key]['c_member'] = db_member_c_member_with_profile($value['c_member_id']);
        $list[$key]['count_comments'] = db_diary_count_c_diary_comment4c_diary_id($value['c_diary_id']);
    }

    $sql =
        "SELECT COUNT(*) "
        . $from
        . $where ;
    $total_num = db_get_one($sql, $params);

    $total_page_num =  ceil($total_num / $page_size);
    $next = ($page < $total_page_num);
    $prev = ($page > 1);

    return array($list , $prev , $next, $total_num, $total_page_num);
}

function monitor_commu_list($keyword, $page_size, $page, $order_type)
{
    $page = intval($page);
    $page_size = intval($page_size);

    $wheres = array();

    if ($keyword) {
        $keyword = str_replace('　', ' ', $keyword);
        $keyword_list = explode(' ', $keyword);

        for($i = 0; $i < count($keyword_list); $i++) {
            $keyword = check_search_word($keyword_list[$i]);

            $wheres[] = '(name LIKE ? OR info LIKE ?)';
            $params[] = '%' . $keyword . '%';
            $params[] = '%' . $keyword . '%';
        }
    }

    if ($wheres) {
        $where = ' WHERE ' . implode(' AND ', $wheres);
    } else {
        $where = '';
    }

    $select = "SELECT * ";
    $from = " FROM c_commu";
    $order = " ORDER BY r_datetime";

        if ($order_type == 'DESC') {
            $order .= ' DESC';
        } else {
            $order .= ' ASC';
        }

    $sql = $select . $from . $where . $order;

    $list = db_get_all_limit($sql,($page-1)*$page_size,$page_size,$params);

    foreach ($list as $key => $value) {
        $list[$key]['c_member'] = db_member_c_member_with_profile($value['c_member_id_admin']);
    }

    $sql =
        "SELECT COUNT(*) "
        . $from
        . $where ;
    $total_num = db_get_one($sql, $params);

    $total_page_num =  ceil($total_num / $page_size);
    $next = ($page < $total_page_num);
    $prev = ($page > 1);

    return array($list, $prev, $next, $total_num, $total_page_num);
}

function monitor_commu_list4c_commu_id($c_commu_id, $page_size, $page, $order_type)
{
    $page = intval($page);
    $page_size = intval($page_size);

    $where = ' WHERE c_commu_id = ?';
    $params[] = intval($c_commu_id);

    $select = 'SELECT * ';
    $from = ' FROM c_commu';
    $order = ' ORDER BY r_datetime';

        if ($order_type == 'DESC') {
            $order .= ' DESC';
        } else {
            $order .= ' ASC';
        }

    $sql = $select . $from . $where . $order;

    $list = db_get_all_limit($sql,($page-1)*$page_size,$page_size,$params);

    foreach ($list as $key => $value) {
        $list[$key]['c_member'] = db_member_c_member_with_profile($value['c_member_id_admin']);
    }

    $sql =
        "SELECT COUNT(*) "
        . $from
        . $where ;
    $total_num = db_get_one($sql, $params);

    $total_page_num =  ceil($total_num / $page_size);
    $next = ($page < $total_page_num);
    $prev = ($page > 1);

    return array($list , $prev , $next, $total_num, $total_page_num);
}

function monitor_topic_comment_list($keyword, $page_size, $page)
{
    $page = intval($page);
    $page_size = intval($page_size);

    $where = " WHERE ctc.number <> 0  ";

    if ($keyword) {
        $keyword = str_replace("?@", " ", $keyword);
        $keyword_list = explode(" ", $keyword);

        for($i=0;$i < count($keyword_list);$i++) {
            $keyword = check_search_word( $keyword_list[$i] );

            $where .= " AND (ctc.body LIKE ? )";
            $params[]="%$keyword%";
        }
    }

    $select = "SELECT ctc.*,ct.name as topic_name,c.name as commu_name";
    $from = " FROM c_commu_topic_comment as ctc"
            ." LEFT JOIN c_commu_topic as ct ON ct.c_commu_topic_id = ctc.c_commu_topic_id "
            ." LEFT JOIN c_commu as c ON c.c_commu_id = ct.c_commu_id ";
    $order = " ORDER BY r_datetime desc";

    $sql = $select . $from . $where . $order;

    $list = db_get_all_limit($sql,($page-1)*$page_size,$page_size,$params);

    foreach ($list as $key => $value) {
        $list[$key]['count_comments'] = _db_count_c_commu_topic_comments4c_commu_topic_id($value['c_commu_topic_id']);
        $c_member = db_member_c_member4c_member_id_LIGHT($value['c_member_id']);
        $list[$key]['nickname'] = $c_member['nickname'];
        $list[$key]['original_filename'] = db_file_original_filename4filename($value['filename']);
    }

    $sql =
        "SELECT COUNT(*) "
        . $from
        . $where ;
    $total_num = db_get_one($sql, $params);

    $total_page_num =  ceil($total_num / $page_size);
    $next = ($page < $total_page_num);
    $prev = ($page > 1);

    return array($list , $prev , $next, $total_num, $total_page_num);
}

function monitor_topic_comment_list4c_commu_topic_comment_id($c_commu_topic_comment_id, $page_size, $page)
{
    $page = intval($page);
    $page_size = intval($page_size);

    $where = " WHERE ctc.number <> 0 AND ctc.c_commu_topic_comment_id = ? ";
    $params[] = intval($c_commu_topic_comment_id);

    $select = "SELECT ctc.*,ct.name as topic_name,c.name as commu_name";
    $from = " FROM c_commu_topic_comment as ctc"
            ." LEFT JOIN c_commu_topic as ct ON ct.c_commu_topic_id = ctc.c_commu_topic_id "
            ." LEFT JOIN c_commu as c ON c.c_commu_id = ct.c_commu_id ";
    $order = " ORDER BY r_datetime desc";

    $sql = $select . $from . $where . $order;

    $list = db_get_all_limit($sql,($page-1)*$page_size,$page_size,$params);

    foreach ($list as $key => $value) {
        $list[$key]['count_comments'] = _db_count_c_commu_topic_comments4c_commu_topic_id($value['c_commu_topic_id']);
        $c_member = db_member_c_member4c_member_id_LIGHT($value['c_member_id']);
        $list[$key]['nickname'] = $c_member['nickname'];
        $list[$key]['original_filename'] = db_file_original_filename4filename($value['filename']);
    }

    $sql =
        "SELECT COUNT(*) "
        . $from
        . $where ;
    $total_num = db_get_one($sql, $params);

    $total_page_num =  ceil($total_num / $page_size);
    $next = ($page < $total_page_num);
    $prev = ($page > 1);

    return array($list , $prev , $next, $total_num, $total_page_num);
}

function monitor_topic_list($keyword, $page_size, $page)
{
    $page = intval($page);
    $page_size = intval($page_size);

    $wheres = array();

    if ($keyword) {
        $keyword = str_replace('　', ' ', $keyword);
        $keyword_list = explode(' ', $keyword);

        for ($i = 0; $i < count($keyword_list); $i++) {
            $keyword = check_search_word($keyword_list[$i]);

            $wheres[] = '(ctc.body like ? OR ct.name like ? OR c.name like ?)';
            $params[] = '%' . $keyword . '%';
            $params[] = '%' . $keyword . '%';
            $params[] = '%' . $keyword . '%';
        }
    }

    if ($wheres) {
        $where = ' WHERE ' . implode(' AND ', $wheres);
    } else {
        $where = '';
    }

    if ($GLOBALS['_OPENPNE_DSN_LIST']['main']['dsn']['phptype'] == 'pgsql') {
        $select = "SELECT ct.*,"
                . " ct.name AS topic_name, c.name AS commu_name,"
                . " ctc.body, ctc.filename, ctc.image_filename1, ctc.image_filename2, ctc.image_filename3,"
                . " CASE WHEN ct.invite_period = '0001-01-01 BC' THEN '0000-00-00' ELSE to_char(ct.invite_period,'YYYY-MM-DD') END AS invite_period";
    } else {
        $select = "SELECT ct.*,"
                . " ct.name AS topic_name, c.name AS commu_name,"
                . " ctc.body, ctc.filename, ctc.image_filename1, ctc.image_filename2, ctc.image_filename3";
    }

    $from   = " FROM c_commu_topic AS ct"
            . " LEFT JOIN c_commu AS c ON c.c_commu_id = ct.c_commu_id"
            . " LEFT JOIN c_commu_topic_comment AS ctc ON (ctc.c_commu_topic_id = ct.c_commu_topic_id AND ctc.number = 0)";

    $order  = " ORDER BY r_datetime desc";

    $sql    = $select . $from . $where . $order;

    $list = db_get_all_limit($sql,($page-1)*$page_size,$page_size,$params);

    foreach ($list as $key => $value) {
        $list[$key]['count_comments'] = _db_count_c_commu_topic_comments4c_commu_topic_id($value['c_commu_topic_id']);
        $c_member = db_member_c_member4c_member_id_LIGHT($value['c_member_id']);
        $list[$key]['nickname'] = $c_member['nickname'];
        if (!empty($value['filename'])) {
            $list[$key]['original_filename'] = db_file_original_filename4filename($value['filename']);
        }
        if ($value['event_flag']) {
            $list[$key]['member_num'] = db_commu_count_c_event_member_list4c_commu_topic_id($value['c_commu_topic_id']);
        }
    }

    $sql =
        "SELECT COUNT(*) "
        . $from
        . $where ;
    $total_num = db_get_one($sql, $params);

    $total_page_num =  ceil($total_num / $page_size);
    $next = ($page < $total_page_num);
    $prev = ($page > 1);

    return array($list , $prev , $next, $total_num, $total_page_num);
}

function monitor_topic_list4target_c_commu_topic_id($c_commu_topic_id, $page_size, $page)
{
    $page = intval($page);
    $page_size = intval($page_size);

    $where = " where ct.c_commu_topic_id = ? ";
    $params[] = intval($c_commu_topic_id);

    if ($GLOBALS['_OPENPNE_DSN_LIST']['main']['dsn']['phptype'] == 'pgsql') {
        $select = "SELECT ct.*,"
                . " ct.name AS topic_name,c.name AS commu_name,"
                . " m.nickname,ctc.body AS body,"
                . " ctc.image_filename1 AS image_filename1,ctc.image_filename2 AS image_filename2,ctc.image_filename3 AS image_filename3,"
                . " ctc.filename AS filename,f.original_filename AS original_filename,"
                . " CASE WHEN ct.invite_period = '0001-01-01 BC' THEN '0000-00-00' ELSE to_char(ct.invite_period,'YYYY-MM-DD') END AS invite_period";
    } else {
        $select = "SELECT ct.*,"
                . " ct.name AS topic_name,c.name AS commu_name,"
                . " m.nickname,ctc.body AS body,"
                . " ctc.image_filename1 AS image_filename1,ctc.image_filename2 AS image_filename2,ctc.image_filename3 AS image_filename3,"
                . " ctc.filename AS filename,f.original_filename AS original_filename";
    }

    $from = " FROM c_commu_topic AS ct"
          . " LEFT JOIN c_member AS m ON ct.c_member_id = m.c_member_id "
          . " LEFT JOIN c_commu AS c ON c.c_commu_id = ct.c_commu_id "
          . " LEFT JOIN c_commu_topic_comment AS ctc ON (ctc.c_commu_topic_id = ct.c_commu_topic_id AND ctc.number = 0)"
          . " LEFT JOIN c_file AS f ON f.filename = ctc.filename ";

    $order = " ORDER BY r_datetime desc";

    $sql = $select . $from . $where . $order;

    $list = db_get_all_limit($sql,($page-1)*$page_size,$page_size,$params);

    foreach ($list as $key => $value) {
        $list[$key]['count_comments'] = _db_count_c_commu_topic_comments4c_commu_topic_id($value['c_commu_topic_id']);
        if ($value['event_flag']) {
            $list[$key]['member_num'] = db_commu_count_c_event_member_list4c_commu_topic_id($value['c_commu_topic_id']);
        }
    }

    $sql =
        "SELECT count(*) "
        . $from
        . $where ;
    $total_num = db_get_one($sql, $params);

    $total_page_num =  ceil($total_num / $page_size);
    $next = ($page < $total_page_num);
    $prev = ($page > 1);

    return array($list , $prev , $next, $total_num, $total_page_num);
}

function monitor_new_topic_list($limit)
{
    $limit = intval($limit);

    $select = 'SELECT c.name AS commu_name, ct.*';
    $from   = ' FROM c_commu AS c, c_commu_topic AS ct';
    $where  = ' WHERE c.c_commu_id = ct.c_commu_id';
    $group  = ' GROUP BY ct.c_commu_topic_id';
    $order  = ' ORDER BY ct.u_datetime DESC';

    $sql = $select . $from . $where . $group . $order;

    $list = db_get_all_limit($sql, 0, $limit);

    foreach ($list as $key => $value) {
        $list[$key]['count_comments'] = _db_count_c_commu_topic_comments4c_commu_topic_id($value['c_commu_topic_id']);
    }

    return $list;
}

function monitor_review_list($keyword, $page_size, $page)
{
    $page = intval($page);
    $page_size = intval($page_size);

    $wheres = array();

    if ($keyword) {
        //全角空白を半角に統一
        $keyword = str_replace('　', ' ', $keyword);
        $keyword_list = explode(' ', $keyword);

        for ($i = 0; $i < count($keyword_list); $i++) {
            $keyword = check_search_word($keyword_list[$i]);

            $wheres[] = 'c_review_comment.body like ?';
            $params[] = '%' . $keyword . '%';
        }
    }

    if ($wheres) {
        $where = ' WHERE ' . implode(' AND ', $wheres);
    } else {
        $where = '';
    }

    $select = "SELECT c_review_comment.*";
    $from = " FROM c_review_comment";
    $order = " ORDER BY r_datetime desc";

    $sql = $select . $from . $where . $order;
    $list = db_get_all_limit($sql,($page-1)*$page_size,$page_size,$params);


    foreach ($list as $key => $value) {
        $list[$key]['c_member'] = db_member_c_member4c_member_id_LIGHT($value['c_member_id']);
        $list[$key]['c_review'] = db_review_list_product_c_review4c_review_id($value['c_review_id']);
    }

    $sql =
        "SELECT COUNT(*) "
        . $from
        . $where ;
    $total_num = db_get_one($sql,$params);

    $total_page_num =  ceil($total_num / $page_size);
    $next = ($page < $total_page_num);
    $prev = ($page > 1);

    return array($list , $prev , $next, $total_num, $total_page_num);
}

function monitor_review_list4c_review_id($c_review_comment_id, $page_size, $page)
{
    $page = intval($page);
    $page_size = intval($page_size);

    $where = " WHERE c_review_comment_id = ? ";
    $params[] = intval($c_review_comment_id);

    $select = "SELECT c_review_comment.*";
    $from = " FROM c_review_comment";
    $order = " ORDER BY r_datetime desc";

    $sql = $select . $from . $where . $order;
    $list = db_get_all_limit($sql,($page-1)*$page_size,$page_size,$params);

    foreach ($list as $key => $value) {
        $list[$key]['c_member'] = db_member_c_member4c_member_id_LIGHT($value['c_member_id']);
        $list[$key]['c_review'] = db_review_list_product_c_review4c_review_id($value['c_review_id']);
    }

    $sql =
        "SELECT COUNT(*) "
        . $from
        . $where ;
    $total_num = db_get_one($sql, $params);

    $total_page_num =  ceil($total_num / $page_size);
    $next = ($page < $total_page_num);
    $prev = ($page > 1);

    return array($list , $prev , $next, $total_num, $total_page_num);
}

function _db_count_c_commu_topic_comments4c_commu_topic_id($c_commu_topic_id)
{
    $sql = "SELECT count(*) FROM c_commu_topic_comment" .
        " WHERE c_commu_topic_id = ? AND number > 0";
    $params = array($c_commu_topic_id);
    return db_get_one($sql, $params);
}
//フリーページを追加
function db_admin_insert_c_free_page($title, $body, $auth, $type)
{
    $data = array(
        'title' => strval($title),
        'body'  => strval($body),
        'auth'  => intval($auth),
        'type'  => strval($type),
    );
    return db_insert('c_free_page', $data);
}

//フリーページを編集
function db_admin_update_c_free_page($c_free_page_id, $title, $body, $auth, $type)
{
    $data = array(
        'title' => strval($title),
        'body'  => strval($body),
        'auth'  => intval($auth),
        'type'  => strval($type),
    );
    $where = array('c_free_page_id' => intval($c_free_page_id));
    return db_update('c_free_page', $data, $where);
}

//フリーページを削除
function db_admin_delete_c_free_page($c_free_page_id)
{
    $sql = "DELETE FROM c_free_page WHERE c_free_page_id = ?";
    $params = array(intval($c_free_page_id));
    return db_query($sql, $params);
}


//フリーページを全て取得(ページャー付き)
function db_admin_get_c_free_page_all($page, $page_size, &$pager)
{
    $sql = 'SELECT * FROM c_free_page ORDER BY c_free_page_id DESC';

    $list = db_get_all_page($sql, $page, $page_size, $params);

    $sql = 'SELECT count(*) FROM c_free_page';
    $total_num = db_get_one($sql, $params);
    $pager = util_make_pager($page, $page_size, $total_num);

    return $list;
}

//フリーページを一つ取得
function db_admin_get_c_free_page_one($c_free_page_id)
{
    $sql = 'SELECT * FROM c_free_page WHERE c_free_page_id = ?';
    $params = array(intval($c_free_page_id));

    return db_get_row($sql, $params);
}

//APIを全て取得(ページャー付き)
function db_admin_get_c_api_all($page, $page_size, &$pager)
{
    $sql = 'SELECT * FROM c_api ORDER BY c_api_id';

    $list = db_get_all_page($sql, $page, $page_size, $params);

    $sql = 'SELECT count(*) FROM c_api';
    $total_num = db_get_one($sql, $params);
    $pager = util_make_pager($page, $page_size, $total_num);

    return $list;
}

//APIを編集
function db_admin_update_c_api($c_api_id, $name, $ip)
{
    $data = array(
        'name' => strval($name),
        'ip' => strval($ip),
    );
    $where = array('c_api_id' => intval($c_api_id));
    return db_update('c_api', $data, $where);
}

//CMDを追加
function db_admin_insert_c_cmd($name, $permit)
{
    $data = array(
        'name' => strval($name),
        'permit' => intval($permit),
    );
    return db_insert('c_cmd', $data);
}

//CMDを編集
function db_admin_update_c_cmd($c_cmd_id, $name, $permit)
{
    $data = array(
        'name' => strval($name),
        'permit' => intval($permit),
    );
    $where = array('c_cmd_id' => intval($c_cmd_id));
    return db_update('c_cmd', $data, $where);
}

//CMDを削除
function db_admin_delete_c_cmd($c_cmd_id)
{
    $sql = "DELETE FROM c_cmd WHERE c_cmd_id = ?";
    $params = array(intval($c_cmd_id));
    return db_query($sql, $params);
}


//CMDを全て取得
function db_admin_get_c_cmd_all()
{
    $sql = 'SELECT * FROM c_cmd ORDER BY c_cmd_id';
    return db_get_all($sql);
}

//CMDを一つ取得
function db_admin_get_c_cmd_one($c_cmd_id)
{
    $sql = 'SELECT * FROM c_cmd WHERE c_cmd_id = ?';
    $params = array(intval($c_cmd_id));

    return db_get_row($sql, $params);
}

/***
 * CMD（小窓）の設定リストを取得する
 *
 * @return array 小窓の設定リスト
 */
function db_admin_get_c_cmd_list4name()
{
    $sql = 'SELECT * FROM c_cmd';
    return db_get_all($sql);
}

/**
 * 祝日のリストを取得
 */
function db_admin_c_holiday_list()
{
    $sql = 'SELECT * FROM c_holiday ORDER BY month, day';
    $holiday_list = db_get_all($sql);

    return $holiday_list;
}

/**
 * 休日を追加
 */
function db_admin_insert_c_holiday($name, $month, $day)
{
    $data = array(
        'name' => strval($name),
        'month' => intval($month),
        'day' => intval($day),
    );
    return db_insert('c_holiday', $data);
}

/**
 * 休日を編集
 */
function db_admin_update_c_holiday($c_holiday_id, $name, $month, $day)
{
    $data = array(
        'name' => strval($name),
        'month' => intval($month),
        'day' => intval($day),
    );
    $where = array('c_holiday_id' => intval($c_holiday_id));
    return db_update('c_holiday', $data, $where);
}

/**
 * 休日を削除
 */
function db_admin_delete_c_holiday($c_holiday_id)
{
    $sql = "DELETE FROM c_holiday WHERE c_holiday_id = ?";
    $params = array(intval($c_holiday_id));
    return db_query($sql, $params);
}

//メッセージ送信履歴を挿入
function db_admin_insert_c_send_messages_history($subject, $body, $send_num, $type, $c_member_ids)
{

    //配列を文字列に変換
    if($c_member_ids) {
        $c_member_ids = implode("-",$c_member_ids);
    } else {
        return;
    }

    $data = array(
        'subject'       => strval($subject),
        'body'          => strval($body),
        'send_num'      => intval($send_num),
        'type'          => strval($type),
        'c_member_ids'  => strval($c_member_ids),
        'r_datetime'    => db_now()
    );

    return db_insert('c_send_messages_history', $data);

}

//メッセージ送信履歴を全て取得(ページャー付き)
function db_admin_get_c_send_messages_history_all($page, $page_size, &$pager)
{

    $sql = 'SELECT * FROM c_send_messages_history ORDER BY c_send_messages_history_id DESC';

    $history_list = db_get_all_page($sql, $page, $page_size, $params);

    foreach ($history_list as $key => $history) {
        $history_list[$key]['c_member_ids'] = explode("-", $history['c_member_ids']);
    }

    $sql = 'SELECT count(*) FROM c_send_messages_history';
    $total_num = db_get_one($sql, $params);
    $pager = util_make_pager($page, $page_size, $total_num);

    return $history_list;
}

//メッセージ送信履歴を一つ取得
function db_admin_get_c_send_messages_history($c_send_messages_history_id)
{

    $sql = 'SELECT * FROM c_send_messages_history WHERE c_send_messages_history_id = ?';

    $params = array(intval($c_send_messages_history_id));

    $history = db_get_row($sql, $params);

    $history['c_member_ids'] = explode("-", $history['c_member_ids']);

    return $history;
}

//メッセージをキューに入れる
function db_admin_insert_c_message_queue($c_member_id_from, $c_member_id_to, $subject, $body)
{
    $data = array(
        'c_member_id_from' => intval($c_member_id_from),
        'c_member_id_to'   => intval($c_member_id_to),
        'subject'          => strval($subject),
        'body'             => strval($body),
    );
    return db_insert('c_message_queue', $data);
}

//メッセージをキューから削除
function db_admin_delete_c_message_queue($c_message_queue_id)
{

    $sql = "DELETE FROM c_message_queue WHERE c_message_queue_id = ?";
    $params = array(intval($c_message_queue_id));

    return db_query($sql, $params);
}

//ランクを追加
function db_admin_insert_c_rank($name, $image_filename, $point)
{
    $data = array(
        'name' => strval($name),
        'image_filename' => strval($image_filename),
        'point' => intval($point),
    );
    return db_insert('c_rank', $data);
}

//ランクを編集
function db_admin_update_c_rank($c_rank_id, $name, $image_filename, $point)
{
    $data = array(
        'name' => strval($name),
        'image_filename' => strval($image_filename),
        'point' => intval($point),
    );
    $where = array('c_rank_id' => intval($c_rank_id));
    return db_update('c_rank', $data, $where);
}

//ランクを削除
function db_admin_delete_c_rank($c_rank_id)
{
    $sql = "DELETE FROM c_rank WHERE c_rank_id = ?";
    $params = array(intval($c_rank_id));
    return db_query($sql, $params);
}

//ランクを全て取得
function db_admin_get_c_rank_all()
{
    $sql = 'SELECT * FROM c_rank ORDER BY point';
    return db_get_all($sql);
}

//ランクを一つ取得
function db_admin_get_c_rank_one($c_rank_id)
{
    $sql = 'SELECT * FROM c_rank WHERE c_rank_id = ?';
    $params = array(intval($c_rank_id));

    return db_get_row($sql, $params);
}

//アクションを編集
function db_admin_update_c_action($c_action_id, $point)
{
    $data = array(
        'point' => intval($point),
    );
    $where = array('c_action_id' => intval($c_action_id));
    return db_update('c_action', $data, $where);
}

//アクションを全て取得
function db_admin_get_c_action_all()
{
    $sql = 'SELECT * FROM c_action ORDER BY c_action_id';
    return db_get_all($sql);
}

/**
 * 指定したファイル名のファイルへのリンクを削除する
 *
 * @param string $filename
 */
function db_admin_delete_c_file_link4filename($filename)
{
    // c_commu_topic_comment
    $tbl = 'c_commu_topic_comment';
    _db_admin_empty_filename($tbl, $filename, 'filename');

    // h_message
    $tbl = 'c_message';
    _db_admin_empty_filename($tbl, $filename, 'filename');
}

function db_admin_get_c_member_profile_pnepoint($c_member_id)
{
    $sql = 'SELECT c_profile_id FROM c_profile where name = \'PNE_POINT\'';
    $c_profile_id =  db_get_one($sql);
    $params = array($c_member_id , $c_profile_id);
    $sql = 'SELECT * FROM c_member_profile where c_member_id = ? and c_profile_id = ?';
    $c_member_profile = db_get_row($sql, $params);

    return  $c_member_profile;
}

function db_admin_c_blacklist_list($page, $page_size)
{
    $sql = 'SELECT * FROM c_blacklist ORDER BY c_blacklist_id';
    $list = db_get_all_page($sql, $page, $page_size);

    $sql = 'SELECT c_member_id FROM c_member_secure WHERE easy_access_id = ?';
    foreach ($list as $key => $blacklist) {
        if ($blacklist['easy_access_id'] && $c_member_id = db_get_one($sql, array($blacklist['easy_access_id']))) {
            $c_member = db_member_c_member4c_member_id_LIGHT($c_member_id);

            $list[$key]['c_member_id'] = $c_member_id;
            $list[$key]['nickname'] = $c_member['nickname'];
        }
    }

    $sql = 'SELECT count(*) FROM c_blacklist';
    $total_num = db_get_one($sql);

    $total_page_num = ceil($total_num / $page_size);
    $next = ($page < $total_page_num);
    $prev = ($page > 1);

    return array($list, $prev, $next, $total_num, $total_page_num);
}

function db_admin_insert_c_blacklist($easy_access_id, $info)
{
    $data = array(
        'easy_access_id' => $easy_access_id,
        'info' => (string)$info,
    );
    return db_insert('c_blacklist', $data);
}

function db_admin_update_c_blacklist($c_blacklist_id, $easy_access_id, $info)
{
    $data = array(
        'easy_access_id' => $easy_access_id,
        'info' => (string)$info,
    );
    $where = array('c_blacklist_id' => $c_blacklist_id);
    return db_update('c_blacklist', $data, $where);
}

function db_admin_delete_c_blacklist($c_blacklist_id)
{
    $sql = 'DELETE FROM c_blacklist WHERE c_blacklist_id = ?';
    $params = array(intval($c_blacklist_id));
    db_query($sql, $params);
}

function db_admin_c_blacklist($c_blacklist_id)
{
    $sql = 'SELECT * FROM c_blacklist WHERE c_blacklist_id = ?';
    $params = array($c_blacklist_id);
    $blacklist = db_get_row($sql, $params);

    $sql = 'SELECT c_member_id FROM c_member_secure WHERE easy_access_id = ?';
    if (!empty($blacklist['easy_access_id']) && $c_member_id = db_get_one($sql, array($blacklist['easy_access_id']))) {
        $c_member = db_member_c_member4c_member_id_LIGHT($c_member_id);

        $blacklist['c_member_id'] = $c_member_id;
        $blacklist['nickname'] = $c_member['nickname'];
    }

    return $blacklist;
}

function db_admin_enabled_module_list()
{
    $sql = 'SELECT * FROM c_module WHERE is_enabled = 1';
    $module_list = db_get_all($sql);

    return $module_list;
}

function db_admin_insert_module_enabled($module, $is_enabled)
{
    $data = array(
        'name' => $module,
        'is_enabled' => $is_enabled,
    );
    return db_insert('c_module', $data);
}

function db_admin_update_module_enabled($module, $is_enabled)
{
    $data = array(
        'is_enabled' => $is_enabled,
    );
    $where = array(
        'name' => $module,
    );
    return db_update('c_module', $data, $where);
}

function db_admin_enabled_module_config_list()
{
    $enable_module_list = db_admin_enabled_module_list();
    $configs = array();
    foreach ($enable_module_list as $module) {
        $name = $module['name'];
        $configs[$name] = util_get_module_config($name);
    }

    return $configs;
}

function db_admin_c_config_decoration_list()
{
    $sql = 'SELECT * FROM c_config_decoration';
    $c_config_decoration_list = db_get_all($sql);

    return $c_config_decoration_list;
}

function db_admin_update_c_config_decoration($c_config_decoration_id, $is_enabled)
{
    $data = array(
        'is_enabled' => $is_enabled,
    );
    $where = array('c_config_decoration_id' => $c_config_decoration_id);
    return db_update('c_config_decoration', $data, $where);
}

function db_admin_album_count_c_album_image4c_album_id($c_album_id)
{
    $sql = 'SELECT COUNT(*) FROM c_album_image WHERE c_album_id = ?';
    return db_get_one($sql, array(intval($c_album_id)));
}

function db_admin_album_list($keyword, $page_size, $page)
{
    $page = intval($page);
    $page_size = intval($page_size);

    $wheres = array();

    if ($keyword) {
        //全角空白を半角に統一
        $keyword = str_replace('　', ' ', $keyword);
        $keyword_list = explode(' ', $keyword);

        for ($i = 0; $i < count($keyword_list); $i++) {
            $keyword = check_search_word($keyword_list[$i]);

            $wheres[] = '(subject LIKE ? OR description LIKE ?)';
            $params[] = '%' . $keyword . '%';
            $params[] = '%' . $keyword . '%';
        }
    }
    if ($wheres) {
        $where = ' WHERE ' . implode(' AND ', $wheres);
    } else {
        $where = '';
    }

    $select = "SELECT *";
    $from = " FROM c_album";
    $order = " ORDER BY r_datetime DESC";

    $sql = $select . $from . $where . $order;
    $list = db_get_all_limit($sql,($page-1)*$page_size,$page_size,$params);
    foreach ($list as $key => $value) {
        $list[$key]['c_member'] = db_member_c_member_with_profile($value['c_member_id']);
        $list[$key]['count_images'] = db_admin_album_count_c_album_image4c_album_id($value['c_album_id']);
    }

    $sql =
        "SELECT COUNT(*) "
        . $from
        . $where ;
    $total_num = db_get_one($sql, $params);

    $total_page_num =  ceil($total_num / $page_size);
    $next = ($page < $total_page_num);
    $prev = ($page > 1);

    return array($list , $prev , $next, $total_num, $total_page_num);
}

function db_admin_album_list4c_album_id($c_album_id, $page_size, $page)
{
    $page = intval($page);
    $page_size = intval($page_size);

    $where = " WHERE c_album_id = ? ";
    $params[] = intval($c_album_id);

    $select = "SELECT c_album.*";
    $from = " FROM c_album";
    $order = " ORDER BY r_datetime DESC";

    $sql = $select . $from . $where . $order;
    $list = db_get_all_limit($sql,($page-1)*$page_size,$page_size,$params);
    foreach ($list as $key => $value) {
        $list[$key]['c_member'] = db_member_c_member_with_profile($value['c_member_id']);
        $list[$key]['count_images'] = db_admin_album_count_c_album_image4c_album_id($value['c_album_id']);
    }

    $sql =
        "SELECT COUNT(*) "
        . $from
        . $where ;
    $total_num = db_get_one($sql, $params);

    $total_page_num =  ceil($total_num / $page_size);
    $next = ($page < $total_page_num);
    $prev = ($page > 1);

    return array($list , $prev , $next, $total_num, $total_page_num);
}

function db_admin_c_album_image_list($page, $page_size, &$pager, $c_album_id = null)
{
    $db =& db_get_instance('image');

    $params = array();
    $sql = 'SELECT cai.c_album_image_id, cai.image_filename, cai.r_datetime, cai.image_description, cai.c_album_id, ca.subject'
         . ' FROM c_album_image AS cai'
         . ' INNER JOIN c_album AS ca ON cai.c_album_id = ca.c_album_id';
    if ($c_album_id) {
        $sql .= ' WHERE ca.c_album_id = ?';
        $params[] = $c_album_id;
    }
    $sql .= ' ORDER BY cai.c_album_image_id DESC';
    $c_image_album_list = db_get_all_page($sql, $page, $page_size, $params);

    $sql = 'SELECT COUNT(*) FROM c_album_image';
    if ($c_album_id) {
        $sql .=  ' WHERE c_album_id = ?';
    }
    $total_num = $db->get_one($sql, $params);

    $pager = util_make_pager($page, $page_size, $total_num);
    return $c_image_album_list;
}

function db_admin_c_album_image_list4c_album_image_id($page, $page_size, &$pager, $c_album_image_id)
{
    $db =& db_get_instance('image');

    $sql = 'SELECT cai.c_album_image_id, cai.image_filename, cai.r_datetime, cai.image_description, cai.c_album_id, ca.subject'
         . ' FROM c_album_image AS cai'
         . ' INNER JOIN c_album AS ca ON cai.c_album_id = ca.c_album_id'
         . ' WHERE cai.c_album_image_id = ?'
         . ' ORDER BY cai.c_album_image_id DESC';
    $params = array($c_album_image_id);
    $c_image_album_list = db_get_all_page($sql, $page, $page_size, $params);

    $sql = 'SELECT COUNT(*) FROM c_album_image'
         . ' WHERE c_album_image_id = ?';
    $total_num = $db->get_one($sql, $params);

    $pager = util_make_pager($page, $page_size, $total_num);
    return $c_image_album_list;
}

function db_admin_get_c_cmd_caster_list()
{
    $sql = 'SELECT * FROM c_cmd_caster ORDER BY c_cmd_caster_id ASC';
    return db_get_all($sql);
}

function db_admin_insert_c_cmd_caster($url)
{
    $result = false;

    require_once 'OpenPNE/RSS.php';
    $rss = new OpenPNE_RSS();
    $title = $rss->get_feed_title($url);
    $description = $rss->get_feed_description($url);

    if (!$title && !$description) {
        return false;
    }

    if (!$title) {
        $title = '';
    }

    if (!$description) {
        $title = '';
    }

    $data = array(
        'title' => $title,
        'description' => $description,
        'url' => $url,
    );
    $c_cmd_caster_id = db_insert('c_cmd_caster', $data);

    if ($c_cmd_caster_id) {
        $result = (bool)db_admin_update_c_cmd4c_cmd_caster_id($c_cmd_caster_id);
        if (!$result) {
            db_admin_delete_c_cmd_caster($c_cmd_caster_id);
        }
    }

    return $result;
}

function db_admin_delete_c_cmd_caster($c_cmd_caster_id)
{
    $sql = 'DELETE FROM c_cmd_caster WHERE c_cmd_caster_id = ?';
    db_query($sql, array($c_cmd_caster_id));

    $sql = 'DELETE FROM c_cmd WHERE c_cmd_caster_id = ?';
    db_query($sql, array($c_cmd_caster_id));
}

function db_admin_update_c_cmd_caster($c_cmd_caster_id, $url)
{
    $sql = 'SELECT url FROM c_cmd_caster WHERE c_cmd_caster_id = ?';
    $old_url = db_get_one($sql, array($c_cmd_caster_id));

    // URLに変更がある場合は登録しなおす
    if ($old_url != $url) {
        db_admin_delete_c_cmd_caster($c_cmd_caster_id);
        $result = db_admin_insert_c_cmd_caster($url);

        // 正しく登録できなかった場合は、元のURLを登録しなおす
        if (!$result) {
            db_admin_insert_c_cmd_caster($old_url);
        }

        return $result;
    }

    require_once 'OpenPNE/RSS.php';
    $rss = new OpenPNE_RSS();
    $title = $rss->get_feed_title($url);
    $description = $rss->get_feed_description($url);

    if (!$title && !$description) {
        return false;
    }

    if (!$title) {
        $title = '';
    }

    if (!$description) {
        $title = '';
    }

    $data = array(
        'title' => $title,
        'description' => $description,
    );
    $where = array('c_cmd_caster_id' => $c_cmd_caster_id);
    $result = db_update('c_cmd_caster', $data, $where);

    db_admin_update_c_cmd4c_cmd_caster_id($c_cmd_caster_id);
    return $result;
}

function db_admin_update_c_cmd4c_cmd_caster_id($c_cmd_caster_id)
{
    $sql = 'SELECT url FROM c_cmd_caster WHERE c_cmd_caster_id = ?';
    $url = db_get_one($sql, array($c_cmd_caster_id));

    require_once 'OpenPNE/RSS.php';
    $rss = new OpenPNE_RSS();
    $items = $rss->fetch($url);

    $cmd_count = 0;
    $allowed_type = array('text/javascript', 'application/javascript');
    foreach ($items as $item)
    {
        $enclosure = $item['enclosure'];
        if (!in_array($enclosure->type, $allowed_type)) {
            continue;
        }

        $cmd_count++;
        $name = basename($enclosure->link, '.js');

        if ($c_cmd_id = db_admin_get_c_cmd_id4name_c_cmd_caster_id($name, $c_cmd_caster_id)) {
            if (!db_admin_is_updated_c_cmd($c_cmd_id, $item['date'])) {
                continue;
            }

            $data = array('url' => $enclosure->link, 'u_datetime' => $item['date']);
            $where = array('c_cmd_id' => $c_cmd_id);
            db_update('c_cmd', $data, $where);
        } else {
            $data = array(
                'name' => $name,
                'url' => $enclosure->link,
                'permit' => 127,
                'c_cmd_caster_id' => $c_cmd_caster_id,
                'r_datetime' => $item['date'],
                'u_datetime' => $item['date'],
            );
            db_insert('c_cmd', $data);
        }
    }

    return $cmd_count;
}

function db_admin_is_updated_c_cmd($c_cmd_id, $date)
{
    $sql = 'SELECT c_cmd_id FROM c_cmd WHERE c_cmd_id = ? AND u_datetime < ?';
    $param = array($c_cmd_id, $date);
    return (bool)db_get_one($sql, $param);
}

function db_admin_get_c_cmd_id4name_c_cmd_caster_id($name, $c_cmd_caster_id)
{
    $sql = 'SELECT c_cmd_id FROM c_cmd WHERE name = ? AND c_cmd_caster_id = ?';
    $data = array($name, $c_cmd_caster_id);
    return db_get_one($sql, $data);
}

/**
 * 指定したメンバーのメール受信設定を無効にする
 *
 * 以下の設定項目を無効にする。
 *  + メール/携帯メール/デイリーニュース受信設定
 *  + コミュニティ管理者からのメッセージ/書き込みのメッセージ受信設定
 *  + スケジュール通知メール受信設定
 *  + 日記コメントメール受信設定
 *
 * @param int $c_member_id
 */
function db_admin_stop_receive_mail4c_member_id($c_member_id)
{
    $where = array('c_member_id' => intval($c_member_id));

    // プロフィールでのメール受信設定項目
    $data = array(
        'is_receive_mail' => 0,
        'is_receive_daily_news' => 0,
        'is_receive_ktai_mail' => 0,
    );
    db_update('c_member', $data, $where);

    // コミュニティでのメール受信設定項目
    $data = array(
        'is_receive_mail' => 0,
        'is_receive_mail_pc' => 0,
        'is_receive_message' => 0
    );
    db_update('c_commu_member', $data, $where);

    // スケジュール通知メール受信設定
    $data = array(
        'is_receive_mail' => 0,
    );
    db_update('c_schedule', $data, $where);

    // 日記コメントメール受信設定
    db_member_update_c_member_config($c_member_id, 'SEND_DIARY_COMMENT_MAIL_KTAI', 0);
}

/**
 * 指定したメンバーのメール受信設定のいずれかが有効であるかどうか
 *
 * 以下のいずれかが有効であればtrueを返す
 *  + メール/携帯メール/デイリーニュース受信設定
 *  + コミュニティ管理者からのメッセージ/書き込みのメッセージ受信設定
 *  + スケジュール通知メール受信設定
 *  + 日記コメントメール受信設定
 *
 * @param  int  $c_member_id
 * @return bool メール受信設定がひとつでも有効である場合は true、すべて無効である場合は false
 */
function db_admin_is_receive_any_mail4c_member_id($c_member_id)
{
    $params = array(intval($c_member_id));

    // プロフィールでのメール受信設定項目
    $sql = 'SELECT c_member_id FROM c_member WHERE c_member_id = ? AND (is_receive_mail = 1 OR is_receive_daily_news = 1 OR is_receive_ktai_mail = 1)';
    if (db_get_one($sql, $params)) {
        return true;
    }

    // コミュニティでのメール受信設定項目
    $sql = 'SELECT c_member_id FROM c_commu_member WHERE c_member_id = ? AND (is_receive_mail = 1 OR is_receive_mail_pc = 1 OR is_receive_message = 1)';
    if (db_get_one($sql, $params)) {
        return true;
    }

    // スケジュール通知メール受信設定
    $sql = 'SELECT c_member_id FROM c_schedule WHERE c_member_id = ? AND is_receive_mail = 1';
    if (db_get_one($sql, $params)) {
        return true;
    }

    // 日記コメントメール受信設定
    $sql = 'SELECT value FROM c_member_config WHERE c_member_id = ? AND name = ?';
    $params[] = 'SEND_DIARY_COMMENT_MAIL_KTAI';
    if (db_get_one($sql, $params)) {
        return true;
    }

    return false;
}

/**
 * c_admin_userのsess_idフィールドにセッションIDを新規に追加する
 *
 * @param int $c_admin_user_id 更新する行のc_admin_user_id
 * @param string $sess_id 更新する値
 * @return bool
 */
function db_admin_update_c_admin_user_insert_sess_id($c_admin_user_id, $sess_id) {
    $data = array('sess_id' => $sess_id);
    $where = array('c_admin_user_id' => intval($c_admin_user_id));
    return db_update('c_admin_user', $data, $where);
}

/**
 * c_admin_userのsess_idの値を削除する
 *
 * @param string $sess_id 更新する行のsess_idの値
 * @return bool
 */
function db_admin_update_c_admin_user_delete_sess_id($sess_id) {
    $data = array('sess_id' => '');
    $where = array('sess_id' => $sess_id);
    return db_update('c_admin_user', $data, $where);
}

/**
 * ログイン時のセッションIDと現在のセッションIDが一致していることを確認する
 *
 * @param int $c_admin_user_id
 * @param string $now_sess_id 現在のセッションID
 * @return bool
 */
function db_admin_is_one_session_per_user($c_admin_user_id, $now_sess_id)
{
    if (OPENPNE_ONE_SESSION_PER_USER) {
        $sql = 'SELECT sess_id FROM c_admin_user '
             . ' WHERE c_admin_user_id = ?';
        $param = array($c_admin_user_id);
        $login_sess_id = db_get_one($sql, $param);
        if ($login_sess_id !== $now_sess_id) {
            return false;
        }
    }
    return true;
}

/**
 * 初期ポイント設定
 */
function db_admin_update_c_point_clear($c_member_profile_value)
{
    $sql = 'SELECT c_profile_id, public_flag_default FROM c_profile where name = ?';
    $params = array('PNE_POINT');
    $c_profile = db_get_row($sql, $params);
    $c_profile_id = $c_profile['c_profile_id'];
    $public_flag_default = $c_profile['public_flag_default'];

    $data = array('value' => $c_member_profile_value);
    $where = array('c_profile_id' => intval($c_profile_id));
    db_update('c_member_profile', $data, $where);

    // すべてのメンバーのIDを取得
    $sql = 'SELECT c_member_id FROM c_member';
    $all_member_ids = db_get_col($sql);

    // ポイント情報があるメンバーのIDを取得
    $sql = 'SELECT c_member_id FROM c_member_profile WHERE c_profile_id = ?';
    $params = array($c_profile_id);
    $has_point_member_ids = db_get_col($sql, $params);

    // 差分から、ポイント情報がないメンバーのIDを取得
    $c_member_ids = array_diff($all_member_ids, $has_point_member_ids);

    // プロフィールにポイント情報が存在しない場合はレコードを追加
    foreach ($c_member_ids as $c_member_id) {
        $data = array(
            'c_member_id' => intval($c_member_id),
            'c_profile_id' => intval($c_profile_id),
            'c_profile_option_id' => 0,
            'value' => $c_member_profile_value,
            'public_flag' => $public_flag_default,
        );
        db_insert('c_member_profile', $data);
    }
}

function db_admin_commu_c_members4c_commu_id($c_commu_id, $page_size, $page)
{
    $sql = 'SELECT c_member_id, r_datetime FROM c_commu_member WHERE c_commu_id = ? ORDER BY r_datetime';
    $params = array(intval($c_commu_id));
    $id_list = db_get_all_page($sql, $page, $page_size, $params);

    $list = array();
    foreach ($id_list as $key => $value) {
        $c_member = db_member_c_member4c_member_id_LIGHT($value['c_member_id']);
        $c_member['friend_count'] = db_friend_count_friends($value['c_member_id']);
        $c_member['r_datetime'] = $value['r_datetime'];
        $list[] = $c_member;
    }

    $sql = 'SELECT COUNT(*) FROM c_commu_member WHERE c_commu_id = ?';
    $total_num = db_get_one($sql, $params);

    if ($total_num != 0) {
        $total_page_num = ceil($total_num / $page_size);
        if ($page >= $total_page_num) {
            $next = false;
        } else {
            $next = true;
        }

        if ($page <= 1) {
            $prev = false;
        } else {
            $prev = true;
        }
    }

    $start_num = ($page - 1) * $page_size + 1 ;
    $end_num   = ($page - 1) * $page_size + $page_size > $total_num ? $total_num : ($page - 1) * $page_size + $page_size ;

    return array($list , $prev , $next, $total_num, $start_num, $end_num);
}

function db_admin_commu_c_members_all_get4c_commu_id($c_commu_id)
{
    $sql = 'SELECT c_member_id FROM c_commu_member WHERE c_commu_id = ?';
    $params = array(intval($c_commu_id));

    $id_list = db_get_all($sql, $params);

    $list = array();
    foreach ($id_list as $key => $value) {
        $list[] = db_member_c_member4c_member_id($value['c_member_id'], true);
    }

    return $list;
}

function cond_name_list($cond_list, $select_last_login)
{
    $cond_name_list = array();

    if (!is_null($cond_list['id'])) {
        // ID
        $cond_name_list['id']['name'] = 'ID(完全一致)';
        $cond_name_list['id']['value'] = $cond_list['id'];
    }

    if (!is_null($cond_list['username'])) {
        // ログインID
        $cond_name_list['username']['name'] = 'ログインID';
        $cond_name_list['username']['value'] = $cond_list['username'];   
    }

    if (!is_null($cond_list['nickname'])) {
        // ニックネーム
        $cond_name_list['nickname']['name'] = WORD_NICKNAME;
        $cond_name_list['nickname']['value'] = $cond_list['nickname'];
    }

    if (!is_null($cond_list['last_login'])){
        // 最終ログイン
        $cond_name_list['last_login']['name'] = '最終ログイン';
        $cond_name_list['last_login']['value'] = $select_last_login[$cond_list['last_login']];
    }

    if (!is_null($cond_list['s_year']) || !is_null($cond_list['e_year'] )) {
        // 生年月日
 
        $cond_name_list['year']['name'] = '生年月日';
        if ( !is_null($cond_list['s_year'] )) {
            $cond_name_list['year']['value'] = $cond_list['s_year'].'年 ～ ';
        } else {
            $cond_name_list['year']['value'] = '開始指定なし ～ ';
        }
        if ( !is_null($cond_list['e_year'])) {
            $cond_name_list['year']['value'] .= $cond_list['e_year'].'年';
        } else {
            $cond_name_list['year']['value'] .= '終了指定なし'; 
        }
    }

    //プロフィール
    $profile_list = db_member_c_profile_list();
    $profile_cond = $cond_list['profile'];
    $profile_cond_name = array();

    if ( !is_null($profile_cond) ) {
        foreach ( $profile_list as $key => $profile ) {
            if ( array_key_exists( $key, $profile_cond ) ) {
                $profile_cond_name[$key]['name'] = $profile['caption'];

                if ( $profile['form_type'] == 'checkbox' ) {
                    $profile_cond_name[$key]['value'] = array();

                    $count = 0;
                    $work_array = array();

                    foreach ( $profile['options'] as $option ) {
                        if ( in_array( $option['c_profile_option_id'], $profile_cond[$key] ) ) {
                            $profile_cond_name[$key]['value'][] = $option['value'];
                        }
                    }
                } else {
                    if ( $profile['form_type'] == 'radio' || $profile['form_type'] == 'select' ) {
                        foreach ( $profile['options'] as $option ) { 
                            if ( $option['c_profile_option_id'] == $profile_cond[$key] ) {
                                $profile_cond_name[$key]['value'] = $option['value'];
                                break;
                            }
                        }
                    } else {
                        $profile_cond_name[$key]['value'] = $profile_cond[$key];
                    }
                }
            }
        }
        $cond_name_list['profile'] = $profile_cond_name;
    }

    //メールアドレス
    if (!is_null($cond_list['mail_address'])){
       $cond_name_list['mail_address']['name'] = 'メールアドレス(完全一致)';
       $cond_name_list['mail_address']['value'] = $cond_list['mail_address'];
    }

    //PCメールアドレスの有無
    if (!is_null($cond_list['is_pc_address'])){
       $cond_name_list['is_pc_address']['name'] = 'PCメールアドレス';
       if ( $cond_list['is_pc_address'] == 1 ) {
           $cond_name_list['is_pc_address']['value'] = '登録している';
       } else {
           $cond_name_list['is_pc_address']['value'] = '登録していない';
       }
    }
    
    //携帯メールアドレスの有無
    if (!is_null($cond_list['is_ktai_address'])){
       $cond_name_list['is_ktai_address']['name'] = '携帯メールアドレス';
       if ( $cond_list['is_ktai_address'] == 1 ) {
           $cond_name_list['is_ktai_address']['value'] = '登録している';
       } else {
           $cond_name_list['is_ktai_address']['value'] = '登録していない';
       }
    }

    //ポイントランク
    if (!is_null($cond_list['s_rank']) || !is_null($cond_list['e_rank'] )) {
        $cond_name_list['rank']['name'] = 'ポイントランク';
        if ( !is_null($cond_list['s_rank'] )) {
           $rank = db_point_get_rank4rank_id($cond_list['s_rank']);
           $cond_name_list['rank']['value'] = $rank['name'].' ～ ';
        } else {
           $cond_name_list['rank']['value'] = '開始指定なし ～ ';
        }

        if ( !is_null($cond_list['e_rank'] )) {
           $rank = db_point_get_rank4rank_id($cond_list['e_rank']);
           $cond_name_list['rank']['value'] .= $rank['name'];
        } else {
           $cond_name_list['rank']['value'] .= '終了指定なし';
        }
    }

    return $cond_name_list;
}

/**
 * 申請者リスト取得
 *
 * @param  int    $page
 * @param  int    $page_size
 * @param  array  $pager
 * @param  array  $cond_list
 * @param  string $mail_address
 * @param  array  $order
 * @return array  $c_member_pre_list
 */
function _db_admin_c_member_pre_list($page, $page_size, &$pager, $cond_list, $mail_address, $order)
{
    $c_member_pre_list = _db_admin_c_member_pre_cond_list($cond_list, $mail_address, $order);

    $total_num = count($c_member_pre_list);
    $c_member_pre_list = array_slice($c_member_pre_list, ($page - 1) * $page_size, $page_size);
    if ($total_num > 0) {
        $pager = util_make_pager($page, $page_size, $total_num);
    } else {
        $pager = array('page_size' => $page_size);
    }
    return $c_member_pre_list;
}


/**
 * 承認待ちリストを取得する
 *
 * @param  array  $cond_list
 * @param  string $mail_address
 * @param  string $order
 * @return array
 */
function _db_admin_c_member_pre_cond_list($cond_list, $mail_address, $order)
{
    // ソート条件
    // ソート順
    $type = explode('-', $order);
    $orderby = '';
    if ($type[0] == "birth") {
        if ($type[1] == "2") {
            $orderby = ' birth_year DESC, birth_month DESC, birth_day DESC';
        } else {
            $orderby = ' birth_year, birth_month, birth_day';
        }
    } else {
        $orderby = $type[0];
        if ($type[1] == "2") {
            $orderby .= ' DESC';
        }
    }

    // 絞込み
    $wheres = array();
    $params = array();
    // メールアドレス
    if (!empty($mail_address)) {
        $wheres[] = 'c_member_pre.regist_address = ?';
        $params[] = $mail_address;
    }
    // PCアドレス
    if (!empty($cond_list['is_pc_address'])) {
        if($cond_list['is_pc_address'] == 1) {
            $wheres[] = "pc_address <> ''";
        } else {
            $wheres[] = "pc_address = ''";
        }
    }
    // 携帯アドレス
    if (!empty($cond_list['is_ktai_address'])) {
        if($cond_list['is_ktai_address'] == 1) {
            $wheres[] = "ktai_address <> ''";
        } else {
            $wheres[] = "ktai_address = ''";
        }
    }
    // 開始年
    if (!empty($cond_list['s_year'])) {
        $wheres[] = 'c_member_pre.birth_year >= ?';
        $params[] = $cond_list['s_year'];
    }
    // 終了年
    if (!empty($cond_list['e_year'])) {
        $wheres[] = 'c_member_pre.birth_year <= ?';
        $params[] = $cond_list['e_year'];
    }
    $sql  = 'SELECT ';
    $sql .= ' c_member_pre.*';
    $sql .= ',c_member.c_member_id';
    $sql .= ',c_member.nickname as invite_nickname ';
    $sql .= 'FROM ';
    $sql .= ' c_member_pre ';
    $sql .= 'LEFT JOIN ';
    $sql .= ' c_member ';
    $sql .= 'ON ';
    $sql .= ' c_member_pre.c_member_id_invite = c_member.c_member_id ';
    $sql .= 'WHERE ';
    $sql .= ' c_member_pre.is_sns_entry_confirm = 1 ';
    if ($wheres) {
        $sql .= ' AND ' . implode(' AND ', $wheres);
    }
    $sql .= ' ORDER BY ';
    if ($orderby) {
        $sql .= $orderby;
    } else {
        $sql .= ' c_member_pre_id';
    }
    return db_get_all($sql, $params);
}

/**
 * c_image_sizeのimage_category毎の合計と一人当たりの平均値を取得する
 */
function get_analysis_image_category()
{
    $mb = 1048576;
    $image_category = array(
            'album' => 'アルバム',
            'diary' => WORD_DIARY,
            'commu' => WORD_COMMUNITY,
            'other' => 'その他'
    );

    $sql = 'SELECT COUNT(*) FROM c_member';
    $total_member_num = db_get_one($sql);

    $sql = "SELECT SUM(filesize) FROM c_image_size WHERE image_category = ?";

    $i = 0;
    $get_analysis_image_category = array();
    foreach($image_category as $key => $value) {
        $params = array($key);
        $category_sum = db_get_one($sql, $params);
        $category_sum = $category_sum / $mb;
        $category_avg = $category_sum / $total_member_num;

        $get_analysis_image_category[$i]['category'] = $value;
        $get_analysis_image_category[$i]['sum'] = sprintf("%01.2f", $category_sum);
        $get_analysis_image_category[$i]['avg'] = sprintf("%01.2f", $category_avg);
        $i++;
    }

    return $get_analysis_image_category;
}

/**
 * c_image_sizeの合計と一人当たりの平均値を取得する
 */
function get_analysis_image_category_sum()
{
    $mb = 1048576;

    $sql = 'SELECT COUNT(*) FROM c_member';
    $total_member_num = db_get_one($sql);

    $sql = "SELECT SUM(filesize) FROM c_image_size";
    $total_image_size = db_get_one($sql);
    $total_image_size = $total_image_size / $mb;

    $get_analysis_image_category_sum['category'] = '合計';
    $get_analysis_image_category_sum['sum'] = sprintf("%01.2f", $total_image_size);
    $get_analysis_image_category_sum['avg'] = sprintf("%01.2f", $total_image_size / $total_member_num);

    return $get_analysis_image_category_sum;
}

?>
