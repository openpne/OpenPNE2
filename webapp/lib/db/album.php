<?php
/**
 * @copyright 2005-2007 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * db_album_public_flag_condition
 *
 * @param int $c_member_id target c_member_id
 * @param int $u viewer's c_member_id
 * @param string $force
 * @return string
 */
function db_album_public_flag_condition($c_member_id, $u = null, $force = null)
{
    $pf_cond = '';
    if ($force) {
        switch ($force) {
        case 'friend':
            $pf_cond = " AND c_album.public_flag <> 'private'";
            break;
        case 'private':
            $pf_cond = " AND c_album.public_flag = 'public'";
            break;
        }
    } else {
        if (!is_null($u) && $c_member_id != $u) {
            $is_friend = db_friend_is_friend($c_member_id, $u);
            if ($is_friend) {
                $pf_cond = " AND c_album.public_flag <> 'private'";
            } else {
                $pf_cond = " AND c_album.public_flag = 'public'";
            }
        }
    }
    return $pf_cond;
}

/**
 * アルバム情報を取得
 * @param int $c_album_id
 */
function db_album_get_c_album4c_album_id($c_album_id)
{
    $sql = 'SELECT * FROM c_album WHERE c_album_id = ?';
    $params = array(intval($c_album_id));

    $album = db_get_row($sql, $params);

    return $album;
}

/**
 * あるメンバーのアルバム一覧を取得
 *
 * @param int $c_member_id target_member_id
 * @param int $count
 * @param int $u viewer's member_id
 * @param string $force
 */
function db_album_get_c_album_subject_list4c_member_id($c_member_id, $count= 10, $u = null, $force = null)
{
    $pf_condition = db_album_public_flag_condition($c_member_id, $u, $force);
    $sql = 'SELECT * FROM c_album WHERE c_member_id = ? '
         . $pf_condition
         . ' ORDER BY u_datetime DESC';

    $params = array(intval($c_member_id));
    return db_get_all_limit($sql, 0, $count, $params);
}

/**
 * アルバム写真を取得
 * @param int $c_album_image_id
 */
function db_album_image_get_c_album_image4id($c_album_image_id)
{
    $sql = 'SELECT * FROM c_album_image WHERE c_album_image_id = ?';
    $params = array(intval($c_album_image_id));

    return db_get_row($sql,$params);
}

/**
 * c_album_idをキーとしてc_albumデータが存在するか判定
 * @param int $c_album_id
 * @return bool true,false
 */
function p_common_is_active_c_album_id($c_album_id)
{
    $sql = 'SELECT c_album_id FROM c_album WHERE c_album_id = ?';
    return (bool)db_get_one($sql, array(intval($c_album_id)));
}

/**
 * c_album_image_idをキーとしてc_album_imageデータが存在するか判定
 * @param int $c_album_image_id
 * @return bool true,false
 */
function p_common_is_active_c_album_image_id($c_album_image_id)
{
    $sql = 'SELECT c_album_image_id FROM c_album_image WHERE c_album_image_id = ?';
    $params = array(intval($c_album_image_id));

    return (bool)db_get_one($sql,$params);
}

/**
 * アルバムIDからアルバムに登録された写真を取得
 *
 * @param   int   $c_album_id
 * @return  array
 */
function db_album_c_album_image_list4c_album_id($c_album_id, $page = 1, $page_size = 10)
{
    $sql = 'SELECT * FROM c_album_image WHERE c_album_id = ? ORDER BY r_datetime DESC';
    $params = array(intval($c_album_id));
    $list = db_get_all_page($sql, $page, $page_size, $params);

    $sql = 'SELECT COUNT(c_album_image_id) FROM c_album_image WHERE c_album_id = ?';
    $params = array(intval($c_album_id));
    $total_num = db_get_one($sql, $params);

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
    return array($list, $prev, $next, $total_num);
}

/**
 * 指定したアルバム写真の前の写真IDを取得する
 * @param int $c_member_id
 * @param int $c_album_id
 * @param int $c_album_image_id
 * @param int $u
 */
function db_album_image_c_album_image_id_prev4c_album_id($c_member_id, $c_album_id, $c_album_image_id, $u = null)
{
    $public_flag_condition = db_album_public_flag_condition($c_member_id, $u);

    $select  = 'SELECT c_album_image.c_album_image_id ';
    $from    = ' FROM c_album_image, c_album';
    $where   = ' WHERE c_album.c_album_id = c_album_image.c_album_id' .
                ' AND c_album.c_member_id = ?' .
                ' AND c_album.c_album_id = ?' .
                ' AND c_album_image.c_album_image_id < ?'
                . $public_flag_condition;
    $orderby = ' ORDER BY c_album_image.c_album_image_id DESC';
    $sql = $select . $from . $where . $orderby;
    $params = array(intval($c_member_id),intval($c_album_id),intval($c_album_image_id));

    return db_get_one($sql, $params);
}

/**
 * 指定したアルバム写真の次の写真IDを取得する
 * @param int $c_member_id
 * @param int $c_album_id
 * @param int $c_album_image_id
 * @param int $u
 */
function db_album_image_c_album_image_id_next4c_album_id($c_member_id, $c_album_id, $c_album_image_id, $u = null)
{
    $public_flag_condition = db_album_public_flag_condition($c_member_id, $u);

    $select  = 'SELECT c_album_image.c_album_image_id ';
    $from    = ' FROM c_album_image, c_album';
    $where   = ' WHERE c_album.c_album_id = c_album_image.c_album_id' .
                ' AND c_album.c_member_id = ?' .
                ' AND c_album.c_album_id = ?' .
                ' AND c_album_image.c_album_image_id > ?'
                . $public_flag_condition;
    $orderby = ' ORDER BY c_album_image.c_album_image_id ASC';
    $sql = $select . $from . $where . $orderby;
    $params = array(intval($c_member_id),intval($c_album_id),intval($c_album_image_id));

    return db_get_one($sql, $params);
}

/**
 * c_albumの閲覧権限チェック
 * @param int $c_album_id
 * @param int $c_member_id
 */
function pne_check_album_public_flag($c_album_id, $c_member_id)
{
    $c_album = db_album_get_c_album4c_album_id($c_album_id);
    if ($c_album['c_member_id'] == $c_member_id) {
        return true;
    }

    switch ($c_album['public_flag']) {
    case 'public':
        $allowed = true;
        break;
    case 'friend':
        $allowed = db_friend_is_friend($c_album['c_member_id'], $c_member_id);
        break;
    case 'private':
    default:
        $allowed = false;
        break;
    }

    return $allowed;
}

/**
 * 特定ユーザーのアルバムリスト取得
 *
 * @param int $c_member_id target_c_member_id
 * @param int $page_size
 * @param int $page
 * @param int $u viewer's c_member_id
 */
function p_fh_album_list_fh_my_album_list4c_member_id($c_member_id, $page_size, $page, $u = null)
{
    $pf_cond = db_album_public_flag_condition($c_member_id, $u);
    $sql = 'SELECT * FROM c_album WHERE c_member_id = ?'. $pf_cond.
           ' ORDER BY r_datetime DESC';
    $params = array(intval($c_member_id));
    $list = db_get_all_page($sql,$page, $page_size,$params);

    $sql = 'SELECT COUNT(c_album_id) FROM c_album WHERE c_member_id = ?' . $pf_cond;
    $total_num = db_get_one($sql, $params);

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

    return array($list, $prev, $next, $total_num);
}

/**
 * アルバム検索
 * 検索ポイントはアルバムタイトル・アルバム説明
 * 空白（全角半角問わない）でand検索可
 */
function p_h_album_list_all_search_c_album4c_album($keyword, $page_size, $page, $c_member_id = '')
{
    $params = array();

    $select = 'SELECT *';
    $from = ' FROM c_album';

    //自分のアルバムだけを対象にする事も出来る
    if ($c_member_id) {
        $where = ' WHERE c_member_id = ?';
        $params[] = intval($c_member_id);
    } else {
        $where = " WHERE public_flag = 'public'";
    }

    //and検索を実装
    //subject,body を検索
    if ($keyword) {
        //全角空白を半角に統一
        $keyword = str_replace('　', ' ', $keyword);

        $keyword_list = explode(' ', $keyword);
        foreach ($keyword_list as $word) {
            $word = check_search_word($word);

            $where .= ' AND (subject LIKE ? OR description LIKE ?)';
            $params[] = '%'.$word.'%';
            $params[] = '%'.$word.'%';
        }
    }
    $order = " ORDER BY r_datetime DESC";

    $sql = $select . $from . $where . $order;

    $list = db_get_all_page($sql, $page, $page_size, $params);
    foreach($list as $key => $value) {
        $list[$key]['c_member'] = db_member_c_member_with_profile($value['c_member_id']);
    }


    $sql = 'SELECT COUNT(c_album_id)' . $from . $where;
    $total_num = db_get_one($sql, $params);

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
    return array($list , $prev , $next, $total_num);
}

/**
 * フレンドの最新アルバムリスト
 */
function p_h_album_list_friend_h_album_list_friend4c_member_id($c_member_id, $page_size, $page)
{
    $friends = db_friend_c_member_id_list($c_member_id, true);
    if (!$friends) {
        return array(array(), false, false, 0);
    }

    $pf_cond = db_album_public_flag_condition($c_member_id, $u);
    $from = "c_album, c_friend";
    $where = "c_friend.c_member_id_from = ?" .
            " AND c_album.c_member_id = c_friend.c_member_id_to" .
            ' AND public_flag <> \'private\'';

    $sql = "SELECT c_album.* FROM {$from} WHERE {$where}" .
            " ORDER BY c_album.r_datetime DESC";
    $params = array(intval($c_member_id));
    $lst = db_get_all_page($sql, $page, $page_size, $params);

    foreach ($lst as $key=>$value) {
        $lst[$key]['c_member'] = db_member_c_member4c_member_id($value['c_member_id']);
    }

    $sql = "SELECT count(*) FROM {$from} WHERE {$where}";
    $total_num = db_get_one($sql, $params);

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

    return array($lst, $prev, $next, $total_num);
}

/**
 * フレンド最新アルバムリスト取得
 * アルバム公開範囲を考慮
 *
 * @param   int $c_member_id
 * @param   int $limit
 * @return  array
 */
function p_h_home_c_album_friend_list4c_member_id($c_member_id, $limit)
{
    $friends = db_friend_c_member_id_list($c_member_id, true);
    if (!$friends) {
        return array();
    }
    $ids = implode(',', array_map('intval', $friends));

    $sql = 'SELECT * FROM c_album' .
            ' WHERE c_member_id IN (' . $ids . ')' .
            ' AND public_flag <> \'private\'' .
            ' ORDER BY u_datetime DESC';

    $c_album_friend_list = db_get_all_limit($sql, 0, $limit);

    foreach ($c_album_friend_list as $key => $value) {
        $c_member = db_member_c_member4c_member_id_LIGHT($value['c_member_id']);
        $c_album_friend_list[$key]['nickname'] = $c_member['nickname'];
    }

    return $c_album_friend_list;
}

/**
 * アルバムを追加
 */
function db_album_insert_c_album($c_member_id, $subject, $description,$public_flag)
{
    $data = array(
        'c_member_id' => intval($c_member_id),
        'subject' => $subject,
        'description' => $description,
        'public_flag' => $public_flag,
        'u_datetime' => db_now(),
        'r_datetime' => db_now(),
        'album_cover_image' => '',
    );
    return db_insert('c_album', $data);
}


function db_album_update_c_album($c_album_id,$subject,$description,$public_flag,$image_filename)
{
    $data = array(
        'subject' => $subject,
        'description' => $description,
        'public_flag' => $public_flag,
        'u_datetime' => db_now(),
    );
    if ($image_filename) $data['album_cover_image'] = $image_filename;

    $where = array(
        'c_album_id' => intval($c_album_id),
    );
    return db_update('c_album', $data, $where);

}

function db_album_update_c_album_image($c_album_image_id,$image_filename,$image_description,$filesize)
{
    $data = array(
        'image_description' => $image_description,
    );

     if ($image_filename) {
        $data['image_filename'] = $image_filename;
        $data['filesize'] = $filesize;
     }

    $where = array(
        'c_album_image_id' => intval($c_album_image_id),
    );

    return db_update('c_album_image', $data, $where);

}

/**
 * アルバムの情報を更新
 */
function db_album_update_c_album_cover($c_album_id,$subject,$description,$album_cover_image,$public_flag)
{
    $data = array(
        'subject' => $subject,
        'description' => $description,
        'public_flag' => $public_flag,
        'u_datetime' => db_now(),
    );
    if ($album_cover_image) $data['album_cover_image'] = $album_cover_image;

    $where = array(
        'c_album_id' => intval($c_album_id),
    );

    return db_update('c_album', $data, $where);
}

/**
 * アルバムの表紙写真の名前を更新
 */
function db_album_update_c_album_album_cover_image($c_album_id,$album_cover_image)
{
    $data = array(
        'album_cover_image' => $album_cover_image,
        'u_datetime' => db_now(),
    );

    $where = array(
        'c_album_id' => intval($c_album_id),
    );
    return db_update('c_album', $data, $where);
}

/**
 * アルバムの更新日時を更新
 * @param int $album_id
 */
function db_album_update_c_album_u_datetime($album_id)
{
    $data = array(
        'u_datetime' => db_now(),
    );

    $where =array(
        'c_album_id' => $album_id,
    );
    return db_update('c_album',$data,$where);
}

/**
 * c_album_imageの新規登録
 *
 * @param int $c_album_id
 * @param int $c_member_id
 * @param string $image_filename
 * @param string $image_description
 * @param int $filesize
 */
function db_insert_c_album_image($c_album_id, $c_member_id, $image_filename, $image_description, $filesize = 0)
{
    $data = array(
        'c_album_id' => $c_album_id,
        'c_member_id' => $c_member_id,
        'image_description' => $image_description,
        'image_filename' => $image_filename,
        'filesize' => $filesize,
        'r_datetime' => db_now(),
    );

    $insert_id = db_insert('c_album_image', $data);
    if ($insert_id) {
        db_album_update_c_album_u_datetime($c_album_id);
    }

    return $insert_id;
}

/**
 * アルバムの削除、写真も削除
 * @param int $c_album_id
 */
function db_album_delete_c_album($c_album_id)
{
    $sql = 'SELECT image_filename FROM c_album_image WHERE c_album_id = ?';
    $filename_list = db_get_col($sql, array($c_album_id));

    //アルバムに登録された写真
    foreach ($filename_list as $filename) {
        db_album_image_data_delete($filename);
    }

    // アルバムの表紙
    $c_album = db_album_get_c_album4c_album_id($c_album_id);
    if ($c_album['album_cover_image']) {
        db_album_image_data_delete($c_album['album_cover_image']);
    }

    $params = array(intval($c_album_id));

    //アルバムと写真の関連
    $sql = 'DELETE FROM c_album_image WHERE c_album_id = ?';
    db_query($sql, $params);

    // アルバム
    $sql = 'DELETE FROM c_album WHERE c_album_id = ?';
    db_query($sql, $params);

    return;
}

/**
 * c_album_image_idをキーとしてc_album_imageテーブルからデータを削除
 */
function db_album_delete_c_album_image($c_album_image_id)
{
    $sql = 'DELETE FROM c_album_image WHERE c_album_image_id = ?';
    $params = array(intval($c_album_image_id));

    return db_query($sql, $params);
}

/**
 * アルバム用の写真を登録
 */
function image_insert_c_image_album4tmp($prefix, $tmpfile)
{
    if (!$tmpfile || preg_match('/[^\.\w]/', $tmpfile)) return false;

    $path_parts = pathinfo($tmpfile);
    $ext = $path_parts['extension'];
    $ext = strtolower($ext);

    $allowed_ext = array('jpg', 'jpeg', 'gif', 'png');
    if (!in_array($ext, $allowed_ext)) {
        return false;
    }

    $filename = sprintf('%s_%s.%s', $prefix, time(), $ext);

    if (!OPENPNE_TMP_IMAGE_DB) {
        $img_tmp_dir_path = OPENPNE_VAR_DIR . '/tmp/';
        $filepath = $img_tmp_dir_path . basename($tmpfile);

        if (db_image_insert_c_image_album2($filename, $filepath)) {
            return $filename;
        }
    } else {
        $c_tmp_image = db_image_c_tmp_image4filename($tmpfile);

        $params = array(
            'filename' => $filename,
            'bin' => $c_tmp_image['bin'],
            'r_datetime' => db_now(),
            'type' => '',
        );

        $db =& db_get_instance('image');
        if ($db->insert("c_image", $params)) {
            return $filename;
        }
    }
    return false;
}

function db_image_insert_c_image_album2($filename, $filepath)
{
    if (!is_readable($filepath)) return false;

    $fp = fopen($filepath, 'rb');
    $image_data = fread($fp, filesize($filepath));
    fclose($fp);

    // 写真かどうかのチェック
    if (!@imagecreatefromstring($image_data)) return false;

    //TODO:typeフィールドを使う
    return db_image_insert_c_image_album($filename, $image_data,$size);
}

function db_image_insert_c_image_album($filename, $bin, $type = '')
{
    $db =& db_get_instance('image');

    $data = array(
        'filename'   => $filename,
        'bin'        => base64_encode($bin),
        'type'       => $type,
        'r_datetime' => db_now(),
    );
    return $db->insert('c_image', $data, 'c_image_id');
}

function db_album_image_data_delete($image_filename)
{
    if (!$image_filename) return false;

    db_album_image_delete_c_image($image_filename);

    // cacheの削除
    image_cache_delete($image_filename);
}

function db_album_image_delete_c_image($filename)
{
    $db =& db_get_instance('image');

    $sql = 'DELETE FROM c_image WHERE filename = ?';
    $params = array($filename);
    return $db->query($sql, $params);
}

function db_image_is_c_album_image4filename($filename)
{
    if (!$filename) return false;

    $db =& db_get_instance('image');

    $sql = 'SELECT c_image_id FROM c_image WHERE filename = ?';
    $params = array($filename);
    return (bool)$db->get_one($sql, $params);
}

/**
 * メンバーのすべてのアルバム写真のファイルサイズの合計を取得する
 *
 * @params int $c_member_id
 * @return int
 */
function db_album_sum_filesize4c_member_id($c_member_id)
{
    $sql = 'SELECT filesize FROM c_album_image WHERE c_member_id = ?';
    $list = db_get_col($sql, array($c_member_id));
    return array_sum($list);
}

/**
 * メンバーが写真を投稿可能かどうか
 *
 * メンバーのファイルサイズの合計が OPENPNE_ALBUM_LIMIT を超過していないかどうかを返す
 * $new_filesize を指定した場合は、メンバーのファイルサイズの合計に $new_filesize を
 * 加算したものが OPENPNE_ALBUM_LIMIT を超過していないかどうかを返す
 *
 * @params int $c_member_id
 * @params int $new_filesize
 * @return bool
 */
function db_album_is_insertable4c_member_id($c_member_id, $new_filesize = 0)
{
    if (!OPENPNE_ALBUM_LIMIT) {
        return true;
    }

    $size = db_album_sum_filesize4c_member_id($c_member_id) + $new_filesize;

    $mb = 1048576;
    if (OPENPNE_ALBUM_LIMIT * $mb < $size) {
        return false;
    }

    return true;
}

?>
