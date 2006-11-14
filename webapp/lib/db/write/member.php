<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

//--- c_member

/**
 * プロフィール変更(c_memberテーブル分)
 */
function do_config_prof_new($c_member_id, $prof_list)
{
    $data = array(
        'nickname' => $prof_list['nickname'],
        'birth_year'  => intval($prof_list['birth_year']),
        'birth_month' => intval($prof_list['birth_month']),
        'birth_day'   => intval($prof_list['birth_day']),
        'public_flag_birth_year' => $prof_list['public_flag_birth_year'],
    );
    $where = array('c_member_id' => intval($c_member_id));
    return db_update('c_member', $data, $where);
}

/**
 * アクセス日時を更新
 */
function p_common_do_access($c_member_id)
{
    $data = array('access_date' => db_now());
    $where = array('c_member_id' => intval($c_member_id));
    return db_update('c_member', $data, $where);
}

//(image)

/**
 * プロフィール画像の変更
 */
function do_h_config_image_new($c_member_id, $image_filename, $img_num)
{
    $data = array('image_filename_'.intval($img_num) => $image_filename);
    $where = array('c_member_id' => intval($c_member_id));
    return db_update('c_member', $data, $where);
}

/**
 * プロフィール画像の削除
 */
function do_h_config_image_delete_c_member_image_new($c_member_id,$img_num)
{
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
function do_h_config_image_change_c_member_main_image($c_member_id, $img_num)
{
    $sql = 'UPDATE c_member SET image_filename = image_filename_'.intval($img_num).
        ' WHERE c_member_id = ?';
    $params = array(intval($c_member_id));
    return db_query($sql, $params);
}

/**
 * メイン画像を登録する
 */
function mail_update_c_member_image($c_member_id, $image_filename, $img_num)
{
    $data = array(
        'image_filename' => $image_filename,
        'image_filename_'.intval($img_num) => $image_filename,
    );
    $where = array('c_member_id' => intval($c_member_id));
    return db_update('c_member', $data, $where);
}

//--- c_member_secure

function db_member_insert_c_member($c_member, $c_member_secure)
{
    $data = array(
        'nickname'    => $c_member['nickname'],
        'birth_year'  => $c_member['birth_year'],
        'birth_month' => $c_member['birth_month'],
        'birth_day'   => $c_member['birth_day'],
        'public_flag_birth_year' => $c_member['public_flag_birth_year'],
        'c_member_id_invite'  => intval($c_member['c_member_id_invite']),
        'c_password_query_id' => intval($c_member['c_password_query_id']),
        'is_receive_mail' => (bool)$c_member['is_receive_mail'],
        'is_receive_ktai_mail'  => (bool)$c_member['is_receive_ktai_mail'],
        'is_receive_daily_news' => intval($c_member['is_receive_daily_news']),
        'r_date' => db_now(),
    );
    $c_member_id = db_insert('c_member', $data);

    $data = array(
        'c_member_id' => intval($c_member_id),
        'hashed_password' => md5($c_member_secure['password']),
        'hashed_password_query_answer' => md5($c_member_secure['password_query_answer']),
        'pc_address'     => t_encrypt($c_member_secure['pc_address']),
        'ktai_address'   => t_encrypt($c_member_secure['ktai_address']),
        'regist_address' => t_encrypt($c_member_secure['regist_address']),
    );
    db_insert('c_member_secure', $data);

    return $c_member_id;
}

function k_do_insert_c_member($profs)
{
    $data = array(
        'nickname' => $profs['nickname'],
        'birth_year' => intval($profs['birth_year']),
        'birth_month' => intval($profs['birth_month']),
        'birth_day' => intval($profs['birth_day']),
        'public_flag_birth_year' => $profs['public_flag_birth_year'],
        'r_date' => db_now(),
        'is_receive_ktai_mail' => 1,
        'c_member_id_invite' => intval($profs['c_member_id_invite']),
        'c_password_query_id' => intval($profs['c_password_query_id']),
    );
    $c_member_id_new = db_insert('c_member', $data);

    $data = array(
        'c_member_id' => intval($c_member_id_new),
        'hashed_password' => md5($profs['password']),
        'hashed_password_query_answer' => md5($profs['password_query_answer']),
        'ktai_address'     => t_encrypt($profs['ktai_address']),
        'regist_address' => t_encrypt($profs['ktai_address']),
    );
    db_insert('c_member_secure', $data);

    return $c_member_id_new;
}

function do_h_config_3(
                $c_member_id,
                $is_receive_mail,
                $rss,
                $ashiato_mail_num,
                $is_receive_daily_news,
                $c_password_query_id,
                $c_password_query_answer,
                $public_flag_diary,
                $is_shinobiashi)
{
    $data = array(
        'is_receive_mail' => (bool)$is_receive_mail,
        'is_receive_daily_news' => intval($is_receive_daily_news),
        'rss' => $rss,
        'ashiato_mail_num' => intval($ashiato_mail_num),
        'c_password_query_id' => intval($c_password_query_id),
        'public_flag_diary' => $public_flag_diary,
        'is_shinobiashi' => $is_shinobiashi,
    );
    $where = array('c_member_id' => intval($c_member_id));
    db_update('c_member', $data, $where);

    if (!empty($c_password_query_answer)) {
        $data = array(
            'hashed_password_query_answer' => md5($c_password_query_answer)
        );
        db_update('c_member_secure', $data, $where);
    }
}

function db_ktai_update_easy_access_id($c_member_id, $easy_access_id)
{
    $data = array('easy_access_id' => t_encrypt($easy_access_id));
    $where = array('c_member_id' => intval($c_member_id));
    return db_update('c_member_secure', $data, $where);
}

function db_ktai_update_password_query($c_member_id, $c_password_query_id, $password_query_answer)
{
    $data = array('c_password_query_id' => intval($c_password_query_id));
    $where = array('c_member_id' => intval($c_member_id));
    db_update('c_member', $data, $where);

    $data = array('hashed_password_query_answer' => md5($password_query_answer));
    $where = array('c_member_id' => intval($c_member_id));
    db_update('c_member_secure', $data, $where);
}

//(pc_address)

function do_common_update_c_member_pc_address4c_member_id($c_member_id, $pc_address)
{
    $data = array('pc_address' => t_encrypt($pc_address));
    $where = array('c_member_id' => intval($c_member_id));
    return db_update('c_member_secure', $data, $where);
}

//(ktai_address)

function k_do_update_ktai_address($c_member_id, $ktai_address)
{
    if ($ktai_address == ''){
        $data = array(
            'ktai_address' => t_encrypt($ktai_address),
            'easy_access_id' => t_encrypt(''),
        );
    } else {
        $data = array('ktai_address' => t_encrypt($ktai_address));
    }
    $where = array('c_member_id' => intval($c_member_id));
    return db_update('c_member_secure', $data, $where);
}

//(password)

function do_common_update_password($c_member_id, $password)
{
    $data = array('hashed_password' => md5($password));
    $where = array('c_member_id' => intval($c_member_id));
    return db_update('c_member_secure', $data, $where);
}

//--- c_pc_address_pre

function do_h_config_1(
                $c_member_id,
                $pc_address)
{
    $insert_id = 0;
    $session = create_hash();

    // 既にpreに存在するアドレスかどうか
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

function do_common_delete_c_pc_address_pre4sid($sid)
{
    $sql = 'DELETE FROM c_pc_address_pre WHERE session = ?';
    $params = array($sid);
    return db_query($sql, $params);
}

function do_change_mail($sid,$password)
{
    if (!$c_pc_address_pre = do_common_c_pc_address_pre4sid($sid)) {
        return false;
    }

    $c_member_id = $c_pc_address_pre['c_member_id'];
    $pc_address = $c_pc_address_pre['pc_address'];

    if (!db_common_authenticate_password($c_member_id, $password)) {
        return false;
    }

    do_common_update_c_member_pc_address4c_member_id($c_member_id, $pc_address);
    do_common_delete_c_pc_address_pre4sid($sid);
    return true;
}

//--- c_ktai_address_pre

/**
 * 携帯アドレス変更
 */
function k_do_insert_c_ktai_address_pre($c_member_id, $session, $ktai_address)
{
    $data = array(
        'c_member_id' => intval($c_member_id),
        'session' => $session,
        'ktai_address' => $ktai_address,
        'r_datetime' => db_now(),
    );
    return db_insert('c_ktai_address_pre', $data);
}

function k_do_delete_ktai_address_pre($c_ktai_address_pre_id)
{
    $sql = 'DELETE FROM c_ktai_address_pre WHERE c_ktai_address_pre_id = ?';
    $params = array(intval($c_ktai_address_pre_id));
    db_query($sql, $params);
}

function k_do_delete_c_ktai_address_pre4ktai_address($ktai_address)
{
    $sql = 'DELETE FROM c_ktai_address_pre WHERE ktai_address = ?';
    $params = array($ktai_address);
    db_query($sql, $params);
}

//--- c_member_pre

/**
 * 招待メール送信
 */
function do_h_invite_insert_c_invite($c_member_id_invite,$pc_address,$message,$session)
{
    $data = array(
        'pc_address' => $pc_address,
        'regist_address' => $pc_address,
        'c_member_id_invite' => intval($c_member_id_invite),
        'session' => $session,
        'r_date' => db_now(),
    );
    return db_insert('c_member_pre', $data);
}

/**
 * 招待メール送信
 */
function do_h_invite_update_c_invite($c_member_id_invite,$pc_address,$message,$session)
{
    $data = array(
        'c_member_id_invite' => intval($c_member_id_invite),
        'session' => $session,
        'regist_address' => $pc_address,
        'r_date' => db_now(),
    );
    $where = array('pc_address' => $pc_address);
    return db_update('c_member_pre', $data, $where);
}

function do_h_invite_delete_member_delete_c_member_pre($c_member_id, $delete_c_member_ids)
{
    if (!is_array($delete_c_member_ids)) {
        return false;
    }
    $ids = implode(',', array_map('intval', $delete_c_member_ids));

    $sql = 'DELETE FROM c_member_pre WHERE c_member_id_invite = ?'.
            ' AND c_member_pre_id IN ('.$ids.')';
    $params =  array(intval($c_member_id));
    db_query($sql, $params);
}

function do_common_delete_c_member_pre4sid($sid)
{
    $sql = 'DELETE FROM c_member_pre WHERE session = ?';
    $params = array($sid);
    return db_query($sql, $params);
}

//--- c_member_ktai_pre

function do_h_invite_delete_member_delete_c_member_ktai_pre($c_member_id, $delete_c_member_ids)
{
    if (!is_array($delete_c_member_ids)) {
        return false;
    }
    $ids = implode(',', array_map('intval', $delete_c_member_ids));

    $sql = 'DELETE FROM c_member_ktai_pre WHERE c_member_id_invite = ?' .
            ' AND c_member_ktai_pre_id IN ('.$ids.')';
    $params = array(intval($c_member_id));
    db_query($sql, $params);
}

function k_do_delete_c_member_ktai_pre($c_member_ktai_pre_id)
{
    $sql = 'DELETE FROM c_member_ktai_pre WHERE c_member_ktai_pre_id = ?';
    $params = array(intval($c_member_ktai_pre_id));
    db_query($sql, $params);
}

function do_insert_c_member_ktai_pre($session, $ktai_address, $c_member_id_invite)
{
    $data = array(
        'session' => $session,
        'ktai_address' => $ktai_address,
        'c_member_id_invite' => $c_member_id_invite,
        'r_datetime' => db_now(),
    );
    return db_insert('c_member_ktai_pre', $data);
}

/**
 * c_member_ktai_preを更新
 */
function do_update_c_member_ktai_pre($session, $ktai_address, $c_member_id_invite)
{
    $data = array(
        'session' => $session,
        'r_datetime' => db_now(),
        'c_member_id_invite' => intval($c_member_id_invite),
    );
    $where = array('ktai_address' => $ktai_address);
    return db_update('c_member_ktai_pre', $data, $where);
}

function k_do_delete_c_member_ktai_pre4ktai_address($ktai_address)
{
    $sql = 'DELETE FROM c_member_ktai_pre WHERE ktai_address = ?';
    $params = array($ktai_address);
    db_query($sql, $params);
}

function mail_insert_c_member_ktai_pre($session, $ktai_address, $c_member_id_invite)
{
    $data = array(
        'session' => $session,
        'ktai_address' => $ktai_address,
        'c_member_id_invite' => intval($c_member_id_invite),
        'r_datetime' => db_now(),
    );
    return db_insert('c_member_ktai_pre', $data);
}

//--- profile関連

function do_config_prof_update_c_member_profile($c_member_id, $c_member_profile_list)
{
    foreach ($c_member_profile_list as $item) {
        $sql = 'DELETE FROM c_member_profile' .
                ' WHERE c_member_id = ? AND c_profile_id = ?';
        $params = array(intval($c_member_id), intval($item['c_profile_id']));
        db_query($sql, $params);

        if ($item['value']) {
            if (is_array($item['value'])) {
                foreach ($item['value'] as $key => $value) {
                    do_config_prof_insert_c_member_profile($c_member_id, $item['c_profile_id'], $key, $value, $item['public_flag']);
                }
            } else {
                do_config_prof_insert_c_member_profile($c_member_id, $item['c_profile_id'], $item['c_profile_option_id'], $item['value'], $item['public_flag']);
            }
        }
    }
}

function do_config_prof_insert_c_member_profile($c_member_id, $c_profile_id, $c_profile_option_id, $value, $public_flag)
{
    $data = array(
        'c_member_id' => intval($c_member_id),
        'c_profile_id' => intval($c_profile_id),
        'c_profile_option_id' => intval($c_profile_option_id),
        'value' => $value,
        'public_flag' => $public_flag,
    );
    return db_insert('c_member_profile', $data);
}

//--- c_access_block

function do_h_config_3_insert_c_access_block($c_member_id, $c_member_id_block)
{
    // 存在するIDのみを抽出
    $c_member_id_block = array_unique(array_map('intval', $c_member_id_block));
    $ids = implode(',', $c_member_id_block);
    $sql = 'SELECT c_member_id FROM c_member WHERE c_member_id IN ('.$ids.')';
    $c_member_id_block = db_get_col($sql);

    $sql = 'DELETE FROM c_access_block WHERE c_member_id = ?';
    $params = array(intval($c_member_id));
    db_query($sql, $params);

    foreach ($c_member_id_block as $id) {
        if ($id == $c_member_id) continue;

        $data = array(
            'c_member_id' => intval($c_member_id),
            'c_member_id_block' => intval($id),
            'r_datetime' => db_now(),
        );
        db_insert('c_access_block', $data);
    }
}

//---

function db_ktai_update_mail_receive($c_member_id, $is_receive_ktai_mail)
{
    $data = array('is_receive_ktai_mail' => intval($is_receive_ktai_mail));
    $where = array('c_member_id' => intval($c_member_id));
    db_update('c_member', $data, $where);
}

function db_ktai_update_ashiato_mail_num($c_member_id, $ashiato_mail_num)
{
    $data = array('ashiato_mail_num' => intval($ashiato_mail_num));
    $where = array('c_member_id' => intval($c_member_id));
    db_update('c_member', $data, $where);
}

function db_ktai_update_public_flag_diary($c_member_id, $public_flag_diary)
{
    $data = array('public_flag_diary' => strval($public_flag_diary));
    $where = array('c_member_id' => intval($c_member_id));
    db_update('c_member', $data, $where);
}

?>
