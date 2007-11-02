<?php
/**
 * @copyright 2005-2007 OpenPNE Project
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
    $pager = admin_make_pager($page, $page_size, $total_num);

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
    if (!$c_profile_option_id) return false;

    $sql = 'DELETE FROM c_member_profile WHERE c_profile_option_id = ?';
    $params = array(intval($c_profile_option_id));
    db_query($sql, $params);

    $sql = 'DELETE FROM c_profile_option WHERE c_profile_option_id = ?';
    db_query($sql, $params);

    return true;
}

function db_admin_insert_c_profile_option($c_profile_id, $value, $sort_order)
{
    $data = array(
        'c_profile_id' => intval($c_profile_id),
        'value' => $value,
        'sort_order' => intval($sort_order),
    );
    return db_insert('c_profile_option', $data);
}

function db_admin_update_c_profile_option($c_profile_option_id, $value, $sort_order)
{
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
    image_data_delete($image_filename);
}

function db_admin_insert_c_profile(
    $name
    , $caption
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
    $data = array(
        'name' => $name,
        'caption' => $caption,
        'info' => '',
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
    $data = array(
        'name' => $name,
        'caption' => $caption,
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

function db_admin_insert_c_commu_category($c_commu_category_parent_id, $name, $sort_order)
{
    $data = array(
        'c_commu_category_parent_id' => intval($c_commu_category_parent_id),
        'name' => $name,
        'sort_order' => intval($sort_order),
    );
    return db_insert('c_commu_category', $data);
}

function db_admin_update_c_commu_category($c_commu_category_id, $name, $sort_order)
{
    $data = array(
        'name' => $name,
        'sort_order' => intval($sort_order)
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
    // c_banner (削除)
    $sql = 'DELETE FROM c_banner WHERE image_filename = ?';
    $params = array($image_filename);
    db_query($sql, $params);

    // c_commu
    $tbl = 'c_commu';
    _db_admin_empty_image_filename($tbl, $image_filename);

    // c_commu_topic_comment
    $tbl = 'c_commu_topic_comment';
    _db_admin_empty_image_filename($tbl, $image_filename, 'image_filename1');
    _db_admin_empty_image_filename($tbl, $image_filename, 'image_filename2');
    _db_admin_empty_image_filename($tbl, $image_filename, 'image_filename3');

    // c_diary
    $tbl = 'c_diary';
    _db_admin_empty_image_filename($tbl, $image_filename, 'image_filename_1');
    _db_admin_empty_image_filename($tbl, $image_filename, 'image_filename_2');
    _db_admin_empty_image_filename($tbl, $image_filename, 'image_filename_3');

    // c_member
    $tbl = 'c_member';
    _db_admin_empty_image_filename($tbl, $image_filename);
    _db_admin_empty_image_filename($tbl, $image_filename, 'image_filename_1');
    _db_admin_empty_image_filename($tbl, $image_filename, 'image_filename_2');
    _db_admin_empty_image_filename($tbl, $image_filename, 'image_filename_3');
}

function _db_admin_empty_image_filename($tbl, $image_filename, $column = 'image_filename')
{
    $data = array(
        db_quote($column) => '',
    );
    $where = array(
        db_quote($column) => $image_filename,
    );
    db_update(db_quote($tbl), $data, $where);
}

function db_admin_c_profile_name_exists($name)
{
    $sql = 'SELECT c_profile_id FROM c_profile WHERE name = ?';
    $params = array($name);
    return db_get_one($sql, $params);
}

function db_admin_update_is_login_rejected($c_member_id)
{
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

?>
